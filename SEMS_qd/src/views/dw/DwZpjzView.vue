<template>
  <div class="content">
    <div>
      <DwMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">招聘简章管理</h1>
      </header>

      <el-tabs v-model="activeTab">
        <!-- 列表页 -->
        <el-tab-pane label="招聘简章列表" name="list">
          <el-button class="mb-4" size="mini" type="primary" @click="handleCreate">新增简章</el-button>

          <el-table v-loading="loading"
                    :data="recruitList"
                    @row-dblclick="ShowZpjzDetail"
                    border
                    element-loading-background="rgba(255, 255, 255, 0.8)"
                    element-loading-spinner="el-icon-loading"
                    element-loading-text="加载中..."
                    stripe
                    style="width: 100%">
            <el-table-column label="简章代码" prop="ID" width="70"></el-table-column>
            <el-table-column label="单位名称" prop="DWMC"></el-table-column>
            <el-table-column label="公司名称" prop="GSMC"></el-table-column>

            <el-table-column label="创建人" prop="CJZMC"></el-table-column>
            <el-table-column label="创建时间" prop="CJSJ" width="180">
              <template #default="{row}">
                <span>{{ formatDate(row.CJSJ) }}</span>
              </template>
            </el-table-column>
            <el-table-column label="发布者" prop="FBZMC">
              <template #default="{row}">
                <span>{{ row.FBBZ === 0 ? "暂未发布" : row.FBZMC }}</span>
              </template>
            </el-table-column>
            <el-table-column label="发布时间" prop="FBSJ" width="180">
              <template #default="{row}">
                <span>{{ formatDate(row.FBSJ) }}</span>
              </template>
            </el-table-column>
            <el-table-column label="附件" prop="JZFJ" width="180">
              <template #default="{row}">
                <a href="javascript:;" @click="handleDownload(row.JZFJ)">{{ row.JZFJ === "" ? "无附件" : "下载" }}</a>
              </template>
            </el-table-column>
            <el-table-column label="发布状态" width="120">
              <template #default="{row}">
                <el-tag :type="row.FBBZ === 1 ? 'success' : 'info'">
                  {{ row.FBBZ === 1 ? '已发布' : '未发布' }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="280">
              <template #default="{row}">
                <el-button size="mini" @click="handleEdit(row)">编辑</el-button>
                <el-button size="mini" type="danger" @click="handleDelete(row)">删除</el-button>
                <el-button
                    :type="row.FBBZ === 0? 'success' : 'warning'"
                    size="mini"
                    @click="togglePublish(row)"
                >
                  {{ row.FBBZ === 0 ? '发布' : '取消' }}
                </el-button>
                <el-upload
                    :before-upload="beforeUpload"
                    :show-file-list="false"
                    class="inline-block ml-2"
                    @change="handleUpload(row)"
                >
                  <el-button size="mini" type="text">上传附件</el-button>
                </el-upload>
                <el-button
                    v-if="row.JZFJ"
                    size="mini"
                    type="text"
                    @click="handleDownload(row)"
                >
                  下载
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>

        <!-- 编辑/新增页 -->
        <el-tab-pane :label="isEdit ? '编辑简章' : '新增简章'" name="edit">
          <div class="row">
            <div class="col-md-7">
              <el-form ref="form" :model="form" label-width="120px">

                <el-form-item label="简章内容" prop="WBNR">
                  <div id="editor-container" style="border: 1px solid #ccc; z-index: 100;"></div>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="submitForm">保存</el-button>
                  <el-button @click="activeTab = 'list'">取消</el-button>
                </el-form-item>
              </el-form>
            </div>
            <div class="col-md-5">
              <div style="max-width: 600px; margin: 3px auto; font-family: 'Segoe UI', sans-serif; overflow: hidden; ">
                <div style="background: linear-gradient(to right, #4e54c8, #8f94fb); color: white; padding: 10px;">
                  <img :src="DWDMK.logo" alt="单位Logo"
                       style="width: 60px; height: 60px; border-radius: 50%; border: 2px solid white; object-fit: cover;">
                  <h2 style="margin: 10px 0 0;">{{ DWDMK.gsmc }}</h2>
                  <p style="margin: 5px 0 0; font-size: 14px;">所在地区：{{ DWDMK.szdq }}</p>
                </div>
                <div class="luodeng" style="padding: 17px; background: #fff;">
                  <p><strong>单位部门：</strong>{{ DWDMK.dwmc }}</p>
                  <p><strong>单位性质：</strong>{{ DWDMK.dwxz }}</p>
                  <p><strong>所属行业：</strong>{{ DWDMK.dwhy }}</p>
                  <p><strong>单位规模：</strong>1000-5000人</p>
                  <p><strong>区域代码：</strong>1</p>
                </div>
              </div>

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
  name: 'DwZpjzManage',
  components: {DwMenu},
  data() {
    return {
      loading: false,
      activeTab: 'list',
      isEdit: false,
      editor: null,
      DWDMK: {},
      form: {
        ZPJZDM: '',
        DWDM: '',
        WBNR: '',
        HTML: '',
      },
      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      recruitList: [
        // Mock数据
        {
          ID: 1,
          ZPJZDM: '2023001',
          DWDM: '1001',
          WBNR: '内容文本',
          HTML: '<p>HTML内容</p>',
          FBZ: '管理员',
          CJSJ: '2023-08-01 10:00',
          FBBZ: '1',
          FBSJ: '2023-08-01 11:00',
          JZFJ: 'file1.pdf'
        }
      ],
      dwOptions: [
        {value: '1001', label: '单位1'},
        {value: '1002', label: '单位2'}
      ]
    };
  },
  mounted() {
    this.initEditor();
    this.getLoginUserInfo();
  },
  beforeDestroy() {
    if (this.editor) {
      this.editor.destroy();
      this.editor = null;
    }
  },
  methods: {
    formatDate(input) {
      const date = new Date(input);
      const year = date.getFullYear();
      const month = date.getMonth() + 1; // 月份从 0 开始
      const day = date.getDate();
      const hour = date.getHours();
      const minute = date.getMinutes();

      return `${year}-${month}-${day} ${hour}:${minute}`;
    },
    async getLoginUserInfo() {
      this.loading = true;
      await axios.get('/user/checkSession').then(response => {
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
          this.getDwYhmDyDw(this.UserInfo.username);
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      });
    },
    // 获取招聘简章数据
    getZpjzData() {
      this.loading = true;
      axios.get("/datazpjzk/getZpjzk", {
        params: {
          fbbz: 2,
          isjustone: 0,
          zpjzid: -1,
          isjustoneyh: 0,
          yhm: '-1',
          yhsfdm: -1,
          isjustonedw: 1,
          dwdm: this.DWDMK.dwdm
        }
      }).then(response => {
        if (response.data.result) {
          this.recruitList = response.data.data;
        } else {
          this.$message.error("获取招聘简章数据失败！");
        }
        this.loading = false;
      }).catch(error => {
        console.error(error);
        this.$message.error("获取招聘简章数据失败！");
      });
    },
    // 获取单位信息
    getDwYhmDyDw(yhm) {
      axios.get('/dw/getDwDataByDwUserName?dwUserName=' + yhm).then(response => {
        if (response.data.result) {
          this.DWDMK = response.data.data
          this.getZpjzData();
        } else {
          this.$message.error("获取单位信息失败！");
          setTimeout(() => {
            this.$router.push('/dw/login');
          }, 3000);
        }
      }).catch(error => {
        console.log(error);
      });
    },
    initEditor() {
      this.editor = new E('#editor-container');
      this.editor.config.height = 600
      // 基础配置
      this.editor.config.zIndex = 100

      this.editor.config.onchange = (html) => {
        this.form.HTML = html;
        this.form.WBNR = this.editor.txt.text();
      };
      // 配置行高
      this.editor.config.lineHeights = ['1', '1.15', '1.6', '2', '2.5', '3']

      // 图片上传配置
      this.editor.config.uploadImgServer = '/datazpjzk/uploadImg'
      this.editor.config.uploadFileName = 'file'
      this.editor.config.uploadImgMaxSize = 100 * 1024 * 1024 // 100MB
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
    },
    ShowZpjzDetail(row){
      this.$router.push({path: '/dw/zpjzDetail', query: {id: row.ID}})
    },
    handleCreate() {
      this.isEdit = false;
      this.form = {
        ZPJZDM: '',
        DWDM: '',
        WBNR: '',
        HTML: ''
      };
      this.activeTab = 'edit';
      this.editor.txt.html('');
    },
    handleEdit(row) {
      this.isEdit = true;
      this.form = {...row};
      this.activeTab = 'edit';
      this.$nextTick(() => {
        this.editor.txt.html(row.HTML);
      });
    },
    submitForm() {
      this.$refs.form.validate(valid => {
        if (valid) {
          let dataZpjzk = new FormData();
          dataZpjzk.append("wbnr", this.form.WBNR);
          dataZpjzk.append("html", this.form.HTML);
          if (this.isEdit) {
            dataZpjzk.append("id", this.form.ID);
            // 更新逻辑
            axios.post("/datazpjzk/updateZpjzk", dataZpjzk).then(response => {
              console.log(response);
              if (response.data.result) {
                this.$message.success('更新成功！');
                this.getZpjzData();
                this.activeTab = 'list';
              } else {
                this.$message.error('更新失败:' + response.data.msg);
              }
            }).catch(error => {
              console.error(error);

              this.$confirm('出了点问题，是否重试？<br><strong>' + error.message + '</strong>', '操作失败', {
                dangerouslyUseHTMLString: true,
                confirmButtonText: '重试',
                cancelButtonText: '取消',
                type: 'error',
                center: true,
                roundButton: true,
              }).then(() => {
                  this.submitForm();
              }).catch(() => {
                this.$message.info('已取消操作');
              });
            });
          } else {
            dataZpjzk.append("dwdm", this.DWDMK.dwdm);
            dataZpjzk.append("cjz", this.UserInfo.username);
            dataZpjzk.append("cjzsfdm", 3);
            axios.post("/datazpjzk/saveZpjzk", dataZpjzk).then(response => {
              console.log(response);
              if (response.data.result) {
                this.$message.success('保存成功！');
                this.getZpjzData();
                this.activeTab = 'list';
              } else {
                this.$message.error('保存失败:' + response.data.msg);
              }
            }).catch(error => {
              console.error(error);
              this.$message.error('保存失败:' + error.message);
            });
          }
        }
      });
    },
    togglePublish(row) {
      console.log("111");
      let fbbz = row.FBBZ === 1 ? 0 : 1;
      let dataZpjzk = new FormData();
      dataZpjzk.append("id", row.ID);
      dataZpjzk.append("fbbz", fbbz);

      if(fbbz === 1){
        dataZpjzk.append("fbz", this.UserInfo.username);
        dataZpjzk.append("fbzsfdm",3);
      }else{
        dataZpjzk.append("fbz", '');
        dataZpjzk.append("fbzsfdm",-1 );
      }

      //dataZpjzk.append("fbsj", new Date().toLocaleString());//后台自动更新
      axios.post("/datazpjzk/updateZpjzk", dataZpjzk).then(response => {
        if (response.data.result) {
          this.$message.success('发布成功！');
          this.getZpjzData();// 刷新列表
        } else {
          this.$message.error('发布失败:' + response.data.msg);
        }
      }).catch(error => {
        console.error(error);
        this.$message.error('发布失败:' + error.message);
      });

    },
    handleDelete(row) {

      $.confirm({
        title: '⚠️ 温馨提醒',
        content: '<div style="font-size: 16px; color: #FFFFFF;">您确定要<strong style="color:red;">删除</strong>该简章吗？此操作<strong>不可恢复</strong>！</div>',
        icon: 'fa fa-exclamation-triangle',
        theme: 'supervan', // 可选 theme: modern, material, bootstrap, light, dark, etc.
        type: 'red',
        typeAnimated: true,
        buttons: {
          确定删除: {
            text: '🗑️ 删除',
            btnClass: 'btn-red',
            action: () => {
              // 实际删除逻辑
              console.log(row);
              axios.get("/datazpjzk/deleteZpjzk?id=" + row.ID).then(response => {
                console.log(response);
                if (response.data.result) {
                  this.getZpjzData();
                  $.alert({
                    title: '✅ 删除成功',
                    content: '该简章已被永久移除。',
                    type: 'green',
                    icon: 'fa fa-check-circle'
                  });
                } else {
                  $.alert({
                    title: '❌ 删除失败',
                    content: '删除过程中发生错误：' + response.data.msg,
                    type: 'red', // 红色主题代表错误
                    icon: 'fa fa-times-circle'
                  });
                }
              }).catch(error => {
                console.error(error);
                $.alert({
                  title: '❌ 删除失败',
                  content: '出现错误：' + error.message,
                  type: 'red', // 红色主题代表错误
                  icon: 'fa fa-times-circle'
                });
              });
            }
          },
          取消操作: {
            text: '❌ 取消',
            btnClass: 'btn-default',
            action: function () {
              $.alert({
                title: '已取消',
                content: '您的简章依然健在 😌',
                type: 'blue',
                icon: 'fa fa-info-circle'
              });
            }
          }
        }
      });


    },
    beforeUpload(file) {
      const isPDF = file.type === 'application/pdf';
      if (!isPDF) {
        this.$message.error('只能上传PDF文件');
      }
      return isPDF;
    },
    handleUpload(row) {
      // 实际文件上传逻辑
      row.JZFJ = 'new_file.pdf'; // Mock上传结果
    },
    handleDownload(row) {
      // Mock下载逻辑
      const link = document.createElement('a');
      link.href = '/path/to/file.pdf';
      link.download = row.JZFJ;
      link.click();
    }
  }
};
</script>
<style scoped>
/*#editor-container{
  width: 60% !important;
}*/
.p-6 {
  padding: 1.5rem 1.5rem !important;
}

.luodeng p {
  padding: 20px;
}
</style>