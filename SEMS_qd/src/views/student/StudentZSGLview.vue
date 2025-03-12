<template>
  <div class="content">
    <div>
      <student-menu></student-menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">我的证书管理</h1>
      </header>

      <el-tabs v-model="activeTab">
        <!-- 证书列表页 -->
        <el-tab-pane label="证书列表" name="list">
          <!-- 搜索栏 -->
          <el-form ref="searchForm" :model="searchForm" class="mb-4 bg-white p-4 rounded" inline>
            <el-form-item label="证书名称">
              <el-input v-model="searchForm.ZSMC" placeholder="请输入证书名称"></el-input>
            </el-form-item>
            <el-form-item label="颁发机构">
              <el-input v-model="searchForm.BFJG" placeholder="请输入颁发机构"></el-input>
            </el-form-item>
            <el-form-item label="颁发时间">
              <el-date-picker
                  v-model="searchForm.BFSJRange"
                  end-placeholder="结束日期"
                  range-separator="至"
                  start-placeholder="开始日期"
                  type="daterange">
              </el-date-picker>
            </el-form-item>
            <el-form-item label="学生ID">
              <el-input v-model="searchForm.STUID" placeholder="请输入学生ID"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="handleSearch">搜索</el-button>
              <el-button @click="resetSearch">重置</el-button>
            </el-form-item>
          </el-form>

          <!-- 数据表格 -->
          <el-table
              :data="certificateList"
              border
              class="bg-white rounded"
              style="width: 100%">
            <el-table-column label="编号" prop="ID" width="80"></el-table-column>
            <el-table-column label="证书名称" prop="ZSMC" width="180"></el-table-column>
            <el-table-column label="证书照片" prop="ZSMC" width="180">
              <template slot-scope="scope">
                <el-image v-if="scope.row.ZSZP"  :preview-src-list="[scope.row.ZSZP]" :src="scope.row.ZSZP" fit="cover" class="w-16 h-20 object-cover border rounded"></el-image>
                <div v-else style="color: red;font-size: 14px;text-align: left;">暂无照片</div>
              </template>
            </el-table-column>
            <el-table-column label="科目" prop="ZSKM" width="120"></el-table-column>
            <el-table-column label="成绩" prop="ZSCJ" width="100"></el-table-column>
            <el-table-column label="有效期" prop="ZSYXQ" width="120">
              <template slot-scope="scope">
                {{ formatDate(scope.row.ZSYXQ) }}
              </template>
            </el-table-column>
            <el-table-column label="颁发机构" prop="BFJG"></el-table-column>
            <el-table-column label="颁发时间" prop="BFSJ" width="160">
              <template slot-scope="scope">
                {{ formatDate(scope.row.BFSJ) }}
              </template>
            </el-table-column>
            <el-table-column label="附件" width="100">
              <template slot-scope="scope">
                <el-link v-if="scope.row.ZSFJ" :href="ServerIP()+scope.row.ZSFJ" target="_blank" type="primary">查看</el-link>
                <div v-else style="color: red;font-size: 14px;text-align: left;">暂无附件</div>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="150">
              <template slot-scope="scope">
                <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
                <el-button v-show="scope.row.QYDM === 1" size="mini" type="danger" @click="handleDisable(scope.row.ID)">
                  停用
                </el-button>
                <el-button v-show="scope.row.QYDM === 0" size="mini" type="success" @click="handleEnable(scope.row.ID)">
                  启用
                </el-button>
              </template>
            </el-table-column>
          </el-table>

          <!-- 分页 -->
          <el-pagination
              :current-page="pagination.current"
              :page-size="pagination.size"
              :page-sizes="[10, 20, 50]"
              :total="pagination.total"
              class="mt-4"
              layout="total, sizes, prev, pager, next, jumper"
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange">
          </el-pagination>
        </el-tab-pane>

        <!-- 新增证书页 -->
        <el-tab-pane label="新增证书" name="add">
          <div class="bg-white p-6 rounded ">
            <el-form ref="form" :model="form" :rules="rules" label-width="120px">
              <el-form-item label="证书名称" prop="ZSMC">
                <el-input v-model="form.ZSMC" placeholder="请输入证书名称"></el-input>
              </el-form-item>
              <el-form-item label="证书科目" prop="ZSKM">
                <el-input v-model="form.ZSKM" placeholder="请输入证书科目"></el-input>
              </el-form-item>
              <el-form-item label="证书成绩" prop="ZSCJ">
                <el-input v-model="form.ZSCJ" placeholder="请输入成绩">
                  <template slot="append">分</template>
                </el-input>
              </el-form-item>
              <el-form-item label="证书照片">
                <el-upload
                    :limit="1"
                    :before-upload="beforeAvatarUpload"
                    :on-change="handleAvatarChange"
                    :show-file-list="false"
                    :auto-upload="false"
                >
                  <img v-if="form.ZSZP" :src="form.ZSZP" class="w-32 h-40 object-cover border rounded">
                  <el-button v-else size="small" type="primary">上传照片</el-button>
                </el-upload>
              </el-form-item>
              <el-form-item label="有效期" prop="ZSYXQ">
                <el-date-picker
                    v-model="form.ZSYXQ"
                    placeholder="选择有效期"
                    type="date"
                    value-format="yyyy-MM-dd">
                </el-date-picker>
              </el-form-item>
              <el-form-item label="颁发机构" prop="BFJG">
                <el-input v-model="form.BFJG" placeholder="请输入颁发机构"></el-input>
              </el-form-item>
              <el-form-item label="颁发时间">
                <el-date-picker
                    v-model="form.BFSJ"
                    placeholder="选择颁发时间"
                    type="datetime"
                    value-format="yyyy-MM-dd HH:mm:ss">
                </el-date-picker>
              </el-form-item>
              <el-form-item label="证书附件">
                <el-upload
                    :limit="1"
                    :before-upload="beforeUpload"
                    :on-change="handZsFjChange"
                    :auto-upload="false"
                  >
                  <el-button size="small" type="primary">点击上传</el-button>
                  <div slot="tip" class="el-upload__tip">支持各种文件，大小不超过10MB</div>
                </el-upload>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="submitForm">立即创建</el-button>
                <el-button @click="resetForm">重置</el-button>
              </el-form-item>
            </el-form>
          </div>
        </el-tab-pane>
      </el-tabs>

      <!-- 编辑对话框 -->
      <el-dialog :visible.sync="editDialogVisible" title="编辑证书" width="600px">
        <el-form ref="editForm" :model="editForm" :rules="rules" label-width="100px">
          <el-form-item label="证书名称" prop="ZSMC">
            <el-input v-model="editForm.ZSMC"></el-input>
          </el-form-item>
          <el-form-item label="证书科目" prop="ZSKM">
            <el-input v-model="editForm.ZSKM"></el-input>
          </el-form-item>
          <el-form-item label="证书成绩" prop="ZSCJ">
            <el-input v-model="editForm.ZSCJ"></el-input>
          </el-form-item>
          <el-form-item label="有效期" prop="ZSYXQ">
            <el-date-picker
                v-model="editForm.ZSYXQ"
                placeholder="选择日期"
                type="date"
                value-format="yyyy-MM-dd">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="颁发机构" prop="BFJG">
            <el-input v-model="editForm.BFJG"></el-input>
          </el-form-item>
          <el-form-item label="颁发时间">
            <el-date-picker
                v-model="editForm.BFSJ"
                placeholder="选择日期时间"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm:ss">
            </el-date-picker>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="editDialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="submitEdit">确 定</el-button>
        </span>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";
import StudentMenu from "@/components/student/Student_menu.vue";
import axios from 'axios'
import {EventBus} from "@/event-bus";
import {ServerIP} from "@/SystemConfig";
export default {
  name: 'DwMsApView',
  components: {StudentMenu, DwMenu},
  data() {
    return {
      activeTab: 'list',
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      searchForm: {
        ZSMC: '',
        BFJG: '',
        BFSJRange: [],
        STUID: ''
      },
      isEidt: false,
      allCertificateList: [],
      certificateList: [],
      pagination: {
        current: 1,
        size: 10,
        total: 0
      },
      ZSZPFile: null,
      ZSFJFile: null,
      form: {
        ZSMC: '',
        ZSKM: '',
        ZSCJ: '',
        ZSXP: null,
        ZSYXQ: '',
        BFJG: '',
        BFSJ: '',
        ZSFJ: ''
      },
      editForm: {},
      editDialogVisible: false,
      rules: {
        ZSMC: [{required: true, message: '请输入证书名称', trigger: 'blur'}],
        ZSKM: [{required: true, message: '请输入证书科目', trigger: 'blur'}],
        ZSCJ: [
          {required: true, message: '请输入证书成绩', trigger: 'blur'},
          {pattern: /^[0-9]{1,3}$/, message: '请输入有效成绩（0-999）', trigger: 'blur'}
        ],
        ZSYXQ: [{required: true, message: '请选择有效期', trigger: 'change'}],
        BFJG: [{required: true, message: '请输入颁发机构', trigger: 'blur'}]
      }
    }
  },
  created() {
    this.getLoginUserInfo()
  },
  methods: {
    ServerIP() {
      return ServerIP
    },
    beforeAvatarUpload(file) {
      const isImage = file.type.startsWith('image/');
      const isLt5M = file.size / 1024 / 1024 < 5;

      if (!isImage) {
        this.$message.error('只能上传图片文件');
      }
      if (!isLt5M) {
        this.$message.error('图片大小不能超过5MB');
      }
      return isImage && isLt5M;
    },
    handleAvatarChange(file) {
      this.ZSZPFile = file.raw;
      this.form.ZSZP = URL.createObjectURL(file.raw);
    },
    handZsFjChange(file){
      this.ZSFJFile = file.raw;
      this.form.ZSFJ = URL.createObjectURL(file.raw);
    },
    handleAuthFailure() {
      EventBus.$emit('show-auth-popup');
      setTimeout(() => {
        this.$router.push({name: 'StudentLoginView'});
      }, 1000);
    },
    async getLoginUserInfo() {
      try {
        this.loading = true;
        const response = await axios.get('/user/checkSession');
        if (!response.data.result) {
          this.handleAuthFailure(response.data.msg);
        } else {
          this.UserInfo = {
            name: response.data.name,
            role: response.data.role,
            username: response.data.username
          };
          this.getStudentDataByUsername(this.UserInfo.username);
        }
      } catch (error) {
        console.error('获取用户信息失败，网络错误！', error);
        this.handleAuthFailure();
      }
    },
    // 获取学生信息
    getStudentDataByUsername(yhm) {
      axios.get(`/student/getStudentByUsernameOrId?usernameOrId=${yhm}&type=username`).then(response => {
        if (response.data.result) {
          this.UserInfo.id = response.data.data.id;
          this.mockData();
        } else {
          this.$message.error("获取学生信息失败:" + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取学生信息失败，网络错误！");
      });
    },
    async mockData() {
      try {
        //Integer QYDM,Integer ISGETALL,Integer STUID
        const res = await axios.get(`/xszsk/getXszsk?QYDM=2&ISGETALL=0&STUID=${this.UserInfo.id}`);
        if (res.data.result) {
          this.allCertificateList = res.data.data;
          this.pagination.total = this.allCertificateList.length
          this.updateCertificateList();
        } else {
          $.confirm({
            title: '提示',
            content: '获取数据失败：' + res.data.msg,
            type: 'red', // warning 样式
            buttons: {
              重试: {
                btnClass: 'btn-orange',
                action: () => {
                  this.mockData();
                }
              },
              取消: () => {
                this.$message('取消');
              }
            }
          });
        }
      } catch (error) {
        $.confirm({
          title: '提示',
          content: '新增失败：' + error.message,
          type: 'red', // warning 样式
          buttons: {
            重试: {
              btnClass: 'btn-orange',
              action: () => {
                this.mockData();
              }
            },
            取消: () => {
              this.$message('取消');
            }
          }
        });
      }
      ;
    },
    updateCertificateList() {
      const start = (this.pagination.current - 1) * this.pagination.size
      const end = start + this.pagination.size
      this.certificateList = this.allCertificateList.slice(start, end)
    },
    handleSizeChange(size) {
      this.pagination.size = size
      this.pagination.current = 1
      this.updateCertificateList()
    },

    handleCurrentChange(current) {
      this.pagination.current = current
      this.updateCertificateList()
    },

    formatDate(date) {
      return date ? new Date(date).toLocaleDateString() : '-'
    },

    formatDateTime(date) {
      return date ? new Date(date).toLocaleString() : '-'
    },

    handleSearch() {
      console.log('search:', this.searchForm)
    },

    resetSearch() {
      this.$refs.searchForm.resetFields()
    },

    handleEdit(row) {
      this.isEidt = true;
      this.editForm = {...row}
      console.log(this.editForm);
      this.form=this.editForm;
      this.activeTab = 'add';
      /*this.editDialogVisible = true*/
    },

    handleDisable(ID) {
      $.confirm({
        title: '提示',
        content: '确认停用该证书？',
        type: 'warning',
        buttons: {
          确认: {
            btnClass: 'btn-orange',
            action: () => {
              let formData = new FormData();
              formData.append('id', ID);
              formData.append('qydm', 0);
              axios.post('/xszsk/updateXszsk', formData).then(response => {
                if (response.data.result) {
                  this.$message.success('停用成功');
                  this.mockData();
                } else {
                  this.$message.error('停用失败：' + response.data.msg);
                }
              }).catch(error => {
                console.log(error);
                this.$message.error('停用失败，网络错误！');
              });
            }
          },
          取消: () => {
            this.$message('取消');
          }
        }
      });
    },
    handleEnable(ID) {

      let formData = new FormData();
      formData.append('id', ID);
      formData.append('qydm', 1);
      axios.post('/xszsk/updateXszsk', formData).then(response => {
        if (response.data.result) {
          this.$message.success('启用成功');
          this.mockData();
        } else {
          this.$message.error('启用失败：' + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error('启用失败，网络错误！');
      });
    },
    submitForm() {
      this.$refs.form.validate(valid => {
        if (valid) {
          let formData = new FormData();
          formData.append('zsmc', this.form.ZSMC); // 证书名称
          formData.append('zskm', this.form.ZSKM);// 证书科目
          formData.append('zscj', this.form.ZSCJ);// 证书成绩
          formData.append('zsyxq', new Date(this.form.ZSYXQ));// 有效期
          formData.append('bfjg', this.form.BFJG);// 颁发机构
          formData.append('bfsj', new Date(this.form.BFSJ));//另一个接口实现
          //formData.append('zsfj', file);//附件文件
          formData.append('stuid', this.UserInfo.id);// 学生ID

          if (this.isEidt){
            //进行编辑
            formData.append('id', this.form.ID);// 学生ID
            axios.post("/xszsk/updateXszsk", formData).then(response => {
              if (response.data.result) {
                this.$message.success('证书修改成功');
                this.resetForm();
                this.activeTab = 'list';
              } else {
                this.$message.error('证书修改失败：' + response.data.msg);
              }
            }).catch(error => {
              console.log(error);
              this.$message.error('证书修改失败，网络错误！');
            });

          }else{
            // 进行新增
            console.log(this.form);
            // 获取文件信息
            const file = this.form.ZSFJ;
            console.log(formData);
            axios.post('/xszsk/addXszsk', formData).then(response => {
              if (response.data.result) {
                this.$message.success('证书添加成功');
                this.resetForm();
                this.activeTab = 'list';
                // 进行附件和照片上传
                const formData = new FormData();
                formData.append('zsfj',  this.ZSFJFile );
                formData.append('zszp', this.ZSZPFile);
                formData.append('id', response.data.data.id);
                axios.post('/xszsk/uploadFile', formData).then(response => {
                  if (response.data.result) {
                    this.$message.success('证书附件上传成功');
                    } else {
                      this.$message.error('证书附件上传失败：' + response.data.msg);
                    }
                }).catch(error => {
                  console.log(error);
                  this.$message.error('证书附件上传失败，网络错误！');
                });

              } else {
                this.$message.error('证书添加失败：' + response.data.msg);
              }
            }).catch(error => {
              console.log(error);
              this.$message.error('证书添加失败，网络错误！');
            });
          }

        }
      })
    },
    submitEdit() {
      this.$refs.editForm.validate(valid => {
        if (valid) {
          const index = this.allCertificateList.findIndex(item => item.ID === this.editForm.ID)
          if (index !== -1) {
            this.allCertificateList.splice(index, 1, this.editForm)
            this.updateCertificateList()
            this.editDialogVisible = false
            this.$message.success('修改成功')
          }
        }
      })
    },
    resetForm() {
      this.$refs.form.resetFields()
      this.form.ZSFJ = ''
    },
    handleUploadSuccess(res, file) {
      this.form.ZSFJ = URL.createObjectURL(file.raw)
    },

    beforeUpload(file) {
      const isLt10M = file.size / 1024 / 1024 < 10
      if (!isLt10M) {
        this.$message.error('上传文件大小不能超过 10MB!')
      }
      return isLt10M
    }
  }
};
</script>

<style scoped>
.el-form--inline .el-form-item {
  margin-right: 20px;
  margin-bottom: 0;
}

.el-tabs {
  background: white;
  border-radius: 4px;
}

.el-tab-pane {
  padding: 20px;
}

.el-upload__tip {
  margin-left: 10px;
  color: #999;
}

.bg-gray-50 {
  background-color: #f9fafb;
}

.ml-64 {
  margin-left: 16rem;
}

.flex-1 {
  flex: 1 1 0%;
}

.min-h-screen {
  min-height: 100vh;
}

.rounded {
  border-radius: 0.375rem;
}

.shadow {
  box-shadow: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
}
</style>