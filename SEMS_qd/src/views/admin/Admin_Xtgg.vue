<template>
  <div class="content">
    <div>
      <DwMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">系统公告管理</h1>
      </header>

      <el-tabs v-model="activeTab" @tab-click="handleTabChange">
        <!-- 公告列表页 -->
        <el-tab-pane label="公告列表" name="list">
          <el-table   @row-dblclick="handleRowDblClick" :data="paginatedData" v-loading="isLoading"  element-loading-text="加载中..."
                      element-loading-spinner="el-icon-loading"
                      element-loading-background="rgba(255, 255, 255, 0.8)" border style="width: 100%">
            <el-table-column label="ID" prop="ID" width="80"></el-table-column>
            <el-table-column label="标题" prop="GGBT"></el-table-column>
            <el-table-column label="发布者" prop="FBZ"></el-table-column>
            <el-table-column label="姓名" prop="FBZXM"></el-table-column>
            <el-table-column label="身份" prop="FBZSF"></el-table-column>
            <el-table-column label="创建时间" prop="CJSJ" width="180">
              <template #default="scope">
                <span>{{ formatDate(scope.row.CJSJ)}}</span>
              </template>

            </el-table-column>
            <el-table-column label="浏览量" prop="LLL" width="100"></el-table-column>
            <el-table-column label="状态" width="100">
              <template #default="scope">
                <el-tag :type="scope.row.QYDM ? 'success' : 'danger'">
                  {{ scope.row.QYDM ? '启用' : '停用' }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="200">
              <template #default="scope">
                <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
                <el-button
                    :type="scope.row.QYDM===1 ? 'danger' : 'success'"
                    size="mini"
                    @click="toggleStatus(scope.row)"
                >
                  {{ scope.row.QYDM===1 ? '停用' : '启用' }}
                </el-button>
              </template>
            </el-table-column>
          </el-table>

          <el-pagination
              :current-page="currentPage"
              :page-size="pageSize"
              :page-sizes="[5, 10, 20]"
              :total="tableData.length"
              class="mt-4"
              layout="total, sizes, prev, pager, next, jumper"
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
          ></el-pagination>
        </el-tab-pane>

        <!-- 发布/编辑页 -->
        <el-tab-pane label="发布公告" name="publish">
          <div class="row">
            <div class="col-md-8">
              <el-form ref="formRef" :model="form" :rules="rules" class="form-container">
                <el-form-item label="公告标题" label-width="80px" prop="GGBT" style="position: relative;left: 100px;">
                  <el-input
                      v-model="form.GGBT"
                      placeholder="请输入公告标题"
                      style="width: 300px"
                  ></el-input>
                  <el-button size="mini" style="margin-left: 30px" type="primary" @click="submitForm">
                    {{ isEditMode ? '保存修改' : '立即发布' }}
                  </el-button>
                  <el-button size="mini" type="warning" @click="resetForm">重置内容</el-button>
                  <el-button v-if="isEditMode" size="mini" @click="cancelEdit">取消编辑</el-button>
                  <router-link to="/dw/ggzs">
                    <el-button  >新增公告</el-button>
                  </router-link>

                </el-form-item>

                <el-form-item label-width="80px" prop="GGNR">
                  <div id="editor-container" style="border: 1px solid #ccc; min-height: 600px;max-width: 1024px"></div>
                </el-form-item>
              </el-form>
            </div>
            <div class="col-md-4">

              <el-card shadow="never">
                <div>
                  <h5 class="card-title">公告设置</h5>
                  <el-form :model="form" label-width="80px">
                    <el-form-item label="公告类型">
                      <el-input v-model="form.GGLX" placeholder="请输入公告类型"></el-input>
                    </el-form-item>

                    <el-form-item label="创建时间">
                      <el-date-picker
                          v-model="form.CJSJ"
                          type="datetime"
                          placeholder="选择日期时间"
                          style="width: 100%"
                      ></el-date-picker>
                    </el-form-item>

                    <el-form-item label="立即发布">
                      <el-switch
                          v-model="form.QYDM"
                          active-color="#13ce66"
                          inactive-color="#ff4949"
                      ></el-switch>
                    </el-form-item>
                    <el-form-item>
                      <el-button type="default" @click="handleSave">保存</el-button>
                      <el-button type="default" @click="handleCancel">取消</el-button>
                      <el-button type="default" @click="handlePublish">立即发布</el-button>
                    </el-form-item>
                  </el-form>
                </div>
              </el-card>


            </div>
          </div>
        </el-tab-pane>
      </el-tabs>
    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";
import E from 'wangeditor';
import axios from "axios";
import {EventBus} from "@/event-bus";

export default {
  name: 'NoticeManagement',
  components: {DwMenu},
  data() {
    return {
      isLoading:false,
      activeTab: 'list',
      currentPage: 1,
      pageSize: 5,
      isEditMode: false,
      tableData: [
        /* {
           ID: 1,
           GGBT: '系统维护通知',
           FBZ: '管理员',
           CJSJ: '2023-08-20 10:00:00',
           LLL: 150,
           QYDM: 1,
           GGNR: '系统将于今晚进行维护升级',
           GGNRHTML: '<p>系统将于今晚<strong>00:00-06:00</strong>进行维护升级</p>'
         }*/
      ],
      form: {
        ID: null,
        GGBT: '',
        GGNR: '',
        GGNRHTML: '',
        QYDM: 1,
        GGLX: '',
      },
      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      editor: null,
      rules: {
        GGBT: [{required: true, message: '标题不能为空', trigger: 'blur'}]
      },
      nextId: 2
    };
  },
  computed: {
    paginatedData() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.tableData.slice(start, end);
    }
  },
  mounted() {
    this.getLoginUserInfo();
    this.initEditor();
  },
  methods: {
    handleRowDblClick(row){
      console.log(row);
      this.$router.push({path: '/admin/ggzs', query: {id: row.ID}})
    },
    formatDate(dateStr) {
      return dateStr ? new Date(dateStr).toLocaleString() : '-'
    },
    async getLoginUserInfo() {
      this.isLoading=true;
      try {
        const response = await axios.get('/user/checkSession');
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({name: 'DwLoginView'});
          }, 1000);
        } else {
          console.log('登录成功-----！');
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.getGongGaoList();
        }
      } catch (error) {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      }
    },
    // 加载公告列表
    getGongGaoList() {
     /* Integer QYDM, Integer JUSTONE, Integer GGID*/
      axios.get(`/xtggk/getXtggk?QYDM=-1&JUSTONE=-1&GGID=-1`).then(res => {
        if (res.data.result) {
          this.tableData = res.data.data;
          this.isLoading=false;
        } else {
          this.$message.error(res.data.msg);
        }
      }).catch(error => {
        console.error('获取公告列表失败,网络错误！', error);
        this.$message.error('获取公告列表失败,网络错误！');
      });
    },
    /*initEditor() {
      this.editor = new E(this.$refs.editorElem)

      // 基础配置
      this.editor.config.zIndex = 100
      this.editor.config.placeholder = '请输入公司简介...'

      // 配置双向同步
      this.editor.config.onchange = html => {
        this.isEditorUpdating = true
        this.$set(this.form, 'gsjjhtml', html)
        this.$set(this.form, 'gsjj', this.editor.txt.text())
        this.$nextTick(() => {
          this.isEditorUpdating = false
        })

        // 触发表单验证
        this.$refs.form.validateField('gsjjhtml')
      }

      // 图片上传配置
      this.editor.config.uploadImgServer = '/dw/uploadGsjjImg'
      this.editor.config.uploadFileName = 'file'
      this.editor.config.uploadImgMaxSize = 5 * 1024 * 1024 // 5MB
      this.editor.config.uploadImgHooks = {
        customInsert: (insertImg, result) => {
          if (result.result) {
            insertImg(result.data)
          }
        }
      }

      // 视频上传配置
      this.editor.config.uploadVideoServer = '/dw/uploadVideo'
      this.editor.config.uploadVideoName = 'videoFile'
      this.editor.config.uploadVideoMaxSize = 100 * 1024 * 1024 // 100MB
      this.editor.config.uploadVideoHooks = {
        before: (video) => {
          this.$message.info('视频上传中...')
          return true
        },
        success: (file, res) => {
          this.$message.success('视频上传成功')
        },
        fail: (file, err, res) => {
          this.$message.error(`视频上传失败: ${err.message || err}`)
        },
        error: (file, err, res) => {
          this.$message.error(`上传错误: ${err.message || err}`)
        },
        customInsert: (insertVideo, res) => {
          if (res.code === 200) {
            insertVideo(res.data)
          } else {
            this.$message.error(res.message || '视频插入失败')
          }
        }
      }
      // 配置行高
      this.editor.config.lineHeights = ['1', '1.15', '1.6', '2', '2.5', '3']

      // 菜单栏配置
      this.editor.config.menus = [
        'head',
        'bold',
        'fontSize',
        'fontName',
        'italic',
        'underline',
        'strikeThrough',
        'indent',
        'lineHeight',
        'foreColor',
        'backColor',
        'link',
        'list',
        'todo',
        'justify',
        'quote',
        'emoticon',
        'image',
        'video',
        'table',
        'code',
        'splitLine',
        'undo',
        'redo',
      ]

      // 支持视频格式
      this.editor.config.videoAccept = '.mp4,.avi,.mov,.wmv,.flv,.mkv'

      // 创建编辑器
      this.editor.create()

      // 初始化内容
      this.$nextTick(() => {
        if (this.form.gsjjhtml) {
          this.editor.txt.html(this.form.gsjjhtml)
        } else {
          this.editor.txt.html('<p>请输入公司简介...</p>')
        }
      })
    },*/
    initEditor() {
      this.editor = new E('#editor-container');
      this.editor.config.height = 600
      // 基础配置
      this.editor.config.zIndex = 100
      /*  this.editor.config.placeholder = '请输入公告内容...'*/

      this.editor.config.onchange = html => {
        this.form.GGNR = this.editor.txt.text();
        this.form.GGNRHTML = html;
      };
      // 配置行高
      this.editor.config.lineHeights = ['1', '1.15', '1.6', '2', '2.5', '3']

      // 图片上传配置
      this.editor.config.uploadImgServer = '/dwzpggk/uploaddwzpggkimg'
      this.editor.config.uploadFileName = 'file'
      this.editor.config.uploadImgMaxSize = 100 * 1024 * 1024 // 100MB
      this.editor.config.uploadImgHooks = {
        customInsert: (insertImg, result) => {
          if (result.result) {
            insertImg(result.data)
          }
        }
      }
      // 菜单栏配置
      this.editor.config.menus = [
        'head',
        'bold',
        'fontSize',
        'fontName',
        'italic',
        'underline',
        'strikeThrough',
        'indent',
        'lineHeight',
        'foreColor',
        'backColor',
        'link',
        'list',
        'todo',
        'justify',
        'quote',
        'emoticon',
        'image',
        'video',
        'table',
        'code',
        'splitLine',
        'undo',
        'redo',
      ]
      this.editor.create();
      // 初始化内容
      this.$nextTick(() => {
        this.editor.txt.html('<p>请输入公告内容...</p>')

      })
    },

    handleEdit(notice) {
      this.form = {...notice};
      this.isEditMode = true; // 进入编辑模式
      this.editor.txt.html(notice.GGNRHTML);// 初始化编辑器内容
      this.activeTab = 'publish'; // 切换到发布/编辑页
    },

    submitForm() {
      this.$refs.formRef.validate(valid => {
        if (valid) {
          if (this.isEditMode) {
            console.log(this.form)
            let dataForm = new FormData();
            dataForm.append('id', this.form.ID);
            dataForm.append('ggbt', this.form.GGBT);
            dataForm.append('ggnr', this.form.GGNR);
            dataForm.append('fbz', this.UserInfo.username);
            dataForm.append("fbzsfdm",3);//单位用户
            dataForm.append('ggnrhtml', this.form.GGNRHTML);
            axios.post("/xtggk/updateXtggk", dataForm).then(res => {
              if (res.data.result) {
                this.$message.success('修改成功');
                this.getGongGaoList();
              } else {
                $.confirm({
                  title: '提示',
                  content: '发布失败：' + res.data.msg,
                  type: 'red', // warning 样式
                  buttons: {
                    重试: {
                      btnClass: 'btn-orange',
                      action: () => {
                        this.submitForm();
                      }
                    },
                    取消: () => {
                      this.$message('已取消发布');
                    }
                  }
                });
              }
            }).catch(err => {
              console.log(err);
              $.confirm({
                title: '提示',
                content: '修改失败：' + err.message,
                type: 'red', // warning 样式
                buttons: {
                  重试: {
                    btnClass: 'btn-orange',
                    action: () => {
                      this.submitForm();
                    }
                  },
                  取消: () => {
                    this.$message('已取消发布');
                  }
                }
              });
            });
          } else {
            console.log(this.form)
            let dataForm = new FormData();
            dataForm.append('ggbt', this.form.GGBT);
            dataForm.append('ggnr', this.form.GGNR);
            dataForm.append('fbz', this.UserInfo.username);
            dataForm.append("fbzsfdm",1);
            dataForm.append('ggnrhtml', this.form.GGNRHTML);
            dataForm.append("gglx",this.form.GGLX);
            axios.post("/xtggk/insertXtggk", dataForm).then(res => {
              if (res.data.result) {
                this.$message.success('发布成功');
                this.getGongGaoList();
              } else {
                $.confirm({
                  title: '提示',
                  content: '发布失败：' + res.data.msg,
                  type: 'red', // warning 样式
                  buttons: {
                    重试: {
                      btnClass: 'btn-orange',
                      action: () => {
                        this.submitForm();
                      }
                    },
                    取消: () => {
                      this.$message('已取消发布');
                    }
                  }
                });
              }
            }).catch(err => {
              console.log(err);
              $.confirm({
                title: '提示',
                content: '发布失败：' + err.message,
                type: 'red', // warning 样式
                buttons: {
                  重试: {
                    btnClass: 'btn-orange',
                    action: () => {
                      this.submitForm();
                    }
                  },
                  取消: () => {
                    this.$message('已取消发布');
                  }
                }
              });
            });
          }

          this.activeTab = 'list';
        }
      });
    },

    resetForm() {
      this.$refs.formRef.resetFields();
      this.editor.txt.clear();
      this.isEditMode = false;
      this.form = {
        ID: null,
        GGBT: '',
        GGNR: '',
        GGNRHTML: '',
        QYDM: 1
      };
    },

    cancelEdit() {
      this.resetForm();
      this.activeTab = 'list';
    },

    toggleStatus(notice) {
      notice.QYDM = notice.QYDM ? 0 : 1;

      let dataForm = new FormData();
      dataForm.append('id', notice.ID);
      dataForm.append('qydm', notice.QYDM);
      axios.post("/dwzpggk/updatedwzpggk", dataForm).then(res => {
        if (res.data.result) {
          this.$message.success('状态已更新');
        } else {
          $.confirm({
            title: '提示',
            content: ' 更新失败：' + res.data.msg,
            type: 'red', // warning 样式
            buttons: {
              重试: {
                btnClass: 'btn-orange',
                action: () => {
                  this.submitForm();
                }
              },
              取消: () => {
                this.$message('已取消操作');
              }
            }
          });
        }
      }).catch(err => {
        console.log(err);
        $.confirm({
          title: '提示',
          content: ' 更新失败：' + err.message,
          type: 'red', // warning 样式
          buttons: {
            重试: {
              btnClass: 'btn-orange',
              action: () => {
                this.submitForm();
              }
            },
            取消: () => {
              this.$message('已取消更新');
            }
          }
        });
      });

    },

    handleSizeChange(val) {
      this.pageSize = val;
      this.currentPage = 1;
    },

    handleCurrentChange(val) {
      this.currentPage = val;
    },

    handleTabChange(tab) {

    }
  }
}
;
</script>

<style scoped>
.form-container {
  padding: 2px;
  background: #ffffff;
  border-radius: 0px;
  /*  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, .1);*/
}

.el-pagination {
  padding: 20px 0;
  background: #fff;
  border-radius: 4px;
}

</style>