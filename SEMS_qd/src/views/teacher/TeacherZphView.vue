<template>
  <div class="content">
    <div>
      <teacher-menu></teacher-menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex  items-center mb-4" style="justify-content: end;">
        <el-button style="margin-right: 40px;" type="text" icon="el-icon-upload" @click="OpenFbPage">
          发布新招聘会
        </el-button>

        <el-button type="text" icon="el-icon-edit" @click="OpenFbPage">
          编辑参会单位
        </el-button>
      </header>

      <el-tabs v-model="activeTab" type="card">
        <!-- 列表页 -->
        <el-tab-pane label="列表" name="list">
          <el-table v-loading="isLoading" :data="tableData" border
                    highlight-current-row
                    @current-change="handleCurrentChange"
                    class="w-full rounded-lg overflow-hidden"
                    element-loading-background="rgba(255, 255, 255, 0.8)"
                    element-loading-spinner="el-icon-loading"
                    element-loading-text="加载中..."
                    style="width: 100%">
            <el-table-column label="代码" prop="ID"></el-table-column>
            <el-table-column label="招聘会标题" prop="ZPHBT" width="200"></el-table-column>
            <el-table-column label="单位名称" prop="DWMC" width="130"></el-table-column>
            <el-table-column label="公司名称" prop="GSMC" width="130"></el-table-column>
            <el-table-column label="位置" prop="WZBZ" width="90">
              <template slot-scope="scope">
                <span v-if="scope.row.WZBZ === 1">校内</span>
                <span v-else-if="scope.row.WZBZ === 2">校外</span>
                <span v-else>未知</span>
              </template>
            </el-table-column>
            <el-table-column label="举办时间" prop="JBSJ" width="140">
              <template slot-scope="scope">
                {{ formatDate(scope.row.JBSJ) }}
              </template>
            </el-table-column>
            <el-table-column label="招聘岗位" prop="DYGWDM"></el-table-column>
            <el-table-column label="所在学校" prop="SZXX"></el-table-column>
            <el-table-column label="举办地点" prop="JBDD"></el-table-column>
            <el-table-column label="发布者" prop="FBZMC"></el-table-column>
            <el-table-column label="发布者身份" prop="FBZSFDM">
              <template slot-scope="scope">
                <span v-if="scope.row.FBZSFDM === 1">管理员</span>
                <span v-else-if="scope.row.FBZSFDM === 2">教师</span>
                <span v-else-if="scope.row.FBZSFDM === 3">HR</span>
              </template>
            </el-table-column>
            <el-table-column label="专业" prop="ZY"></el-table-column>
            <el-table-column label="预约人数" prop="YYRS"></el-table-column>
            <el-table-column label="状态" prop="QYDM">
              <template slot-scope="scope">
                <span v-if="scope.row.QYDM === 1" style="color: green;">启用</span>
                <span v-else-if="scope.row.QYDM === 0" style="color: red;">停用</span>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="120">
              <template slot-scope="scope">
                <el-button size="small" type="text" @click="edit(scope.row)">编辑</el-button>
                <el-button v-show="scope.row.QYDM===1" size="small" style="color: red;" type="text"
                           @click="updateQYDM(scope.row,0)">停用
                </el-button>
                <el-button v-show="scope.row.QYDM===0" size="small" style="color: green;" type="text"
                           @click="updateQYDM(scope.row,1)">启用
                </el-button>
                <el-button size="small" style="color: red" type="text" @click="deleteRow(scope.row)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <!-- 分页 -->
          <div class="pagination mt-4 text-center">
            <el-pagination
                :current-page="currentPage"
                :page-size="pageSize"
                :total="total"
                background
                layout="prev, pager, next"
                @current-change="handlePageChange">
            </el-pagination>
          </div>
        </el-tab-pane>
        <el-tab-pane label="编辑/新增" name="edit">
          <div class="edit-form-container">
            <el-form
                ref="form"
                :model="form"
                :rules="rules"
                label-width="100px">
              <el-row :gutter="20">
                <el-col :span="12">
                  <el-form-item label="招聘会标题" prop="ZPHBT">
                    <el-input v-model="form.ZPHBT" maxlength="50"></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="单位代码" prop="DWDM">
                    <el-select v-model="form.DWDM" clearable filterable placeholder="请选择">
                      <el-option v-for="item in DATADWDMK" :key="item.dwdm"
                                 :label="item.dwdm+'-'+item.dwmc+'-'+item.gsmc" :value="item.dwdm"></el-option>
                    </el-select>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="位置" prop="WZBZ">
                    <el-select v-model="form.WZBZ" placeholder="请选择">
                      <el-option :value="1" label="校内"></el-option>
                      <el-option :value="2" label="校外"></el-option>
                    </el-select>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="举办时间" prop="JBSJ">
                    <el-date-picker
                        v-model="form.JBSJ"
                        :picker-options="MSSJPickerOptions"
                        placeholder="选择日期时间"
                        style="width: 100%;"
                        type="datetime"
                    ></el-date-picker>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="对应岗位" prop="DYGWDM">
                    <el-input
                        v-model="form.DYGWDM"
                        placeholder="多个岗位代码用+链接"
                    ></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="所在学校" prop="SZXX">
                    <el-input v-model="form.SZXX"></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="举办地点" prop="JBDD">
                    <el-input v-model="form.JBDD"></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="预约人数" prop="YYRS">
                    <el-input-number
                        v-model="form.YYRS"
                        :min="0"
                        style="width: 100%;"
                    ></el-input-number>
                  </el-form-item>
                </el-col>
                <el-col :span="24">
                  <el-form-item label="专业" prop="ZY">
                    <el-input
                        v-model="form.ZY"
                        placeholder="多个专业请用逗号分隔"
                    ></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="24" class="form-buttons">
                  <el-button type="success" @click="handleSave">保存</el-button>
                  <el-button type="danger" @click="handleReset">重置</el-button>
                </el-col>
              </el-row>
            </el-form>
          </div>
        </el-tab-pane>
      </el-tabs>
    </main>
  </div>
</template>

<script>
import teacher_menu from "@/components/teacher/Teacher_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";
import TeacherMenu from "@/components/teacher/Teacher_menu.vue";

export default {
  name: "RecruitmentFairManage",
  components: {TeacherMenu, teacher_menu},
  data() {
    return {
      // 时间选择器配置
      MSSJPickerOptions: {
        disabledDate(time) {
          return time.getTime() <= Date.now(); // 禁用之前的时间
        },
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            picker.$emit('pick', new Date());
          }
        }, {
          text: '后天',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 2);
            picker.$emit('pick', date);
          }
        }, {
          text: '下周',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
            picker.$emit('pick', date);
          }

        }]
      },
      isLoading: false,
      activeTab: "list", // 当前激活的 tab，默认为列表
      tableData: [],     // 表格数据
      currentPage: 1,    // 当前页码
      pageSize: 10,      // 每页条数
      total: 0,          // 数据总条数
      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      form: {
        ID: "",
        ZPHDM: "",
        ZPHBT: "",
        DWDM: "",
        WZBZ: "",
        JBSJ: "",
        DYGWDM: "",
        SZXX: "",
        JBDD: "",
        FBZ: "",
        FBZSFDM: "",
        QYDM: "",
        ZY: "",
        YYRS: null
      },
      DATADWDMK: [], // 单位代码选项列表
      currentRow: {}, // 当前选中行
      // 新增：验证规则
      rules: {
        ZPHDM: [
          {required: true, message: "请输入招聘会代码", trigger: "blur"}
        ],
        ZPHBT: [
          {required: true, message: "请输入招聘会标题", trigger: "blur"}
        ],
        DWDM: [
          {required: true, message: "请输入单位代码", trigger: "blur"}
        ],
        WZBZ: [
          {required: true, message: "请选择位置标志", trigger: "change"}
        ],
        JBSJ: [
          {type: "date", required: true, message: "请选择举办时间", trigger: "change"}
        ],
        SZXX: [
          {required: true, message: "请输入所在学校", trigger: "blur"}
        ],
        JBDD: [
          {required: true, message: "请输入举办地点", trigger: "blur"}
        ],
        FBZ: [
          {required: true, message: "请输入发布者", trigger: "blur"}
        ],
        QYDM: [
          {required: true, message: "请输入启用代码", trigger: "blur"}
        ],
        YYRS: [
          {type: "number", required: true, message: "请输入预约人数", trigger: "change"}
        ],
        ZY: [
          {required: true, message: "请输入专业", trigger: "blur"}
        ]
      }
    };
  },
  created() {
    this.getLoginUserInfo();
    this.getDwList();
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
    updateQYDM(row, QYDM) {
      let text = '启用'
      if (QYDM === 0) {
        text = '停用'
      }

      $.confirm({
        title: '提示',
        content: `确认${text}招聘会：${row.ZPHBT}?`,
        type: 'red',
        buttons: {
          确定: {
            btnClass: 'btn-orange',
            action: () => {
              let dataform = new FormData();
              dataform.append("id", row.ID);
              dataform.append("qydm", QYDM);
              axios.post("/datazphjlk/updateDataZphjlk", dataform).then(res => {
                if (res.data.result) {
                  this.$message({type: "success", message: text + "成功!"});
                  this.fetchTableData();
                } else {
                  this.$message({type: "error", message: text + "失败：" + res.data.msg});
                }

              }).catch(error => {
                console.error(text + "招聘会失败", error);
                this.$message({type: "error", message: text + "失败：" + error.message});
              });
            }
          },
          取消: () => {
            this.$message('已取消操作');
          }
        }
      });
    },
    handleCurrentChange(val) {
      this.currentRow = val;
      console.log(this.currentRow)
    },
    async getLoginUserInfo() {
      this.isLoading = true;
      try {
        const response = await axios.get('/user/checkSession');
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({name: 'TeacherLoginView'});
          }, 1000);
        } else {
          console.log('登录成功-----！');
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.fetchTableData();
        }
      } catch (error) {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'TeacherLoginView'});
        }, 1000);
      }
    },
    getDwList() {
      axios.get("/dw/getAllDw").then(res => {
        this.DATADWDMK = res.data.data;
      });
    },
    handleSave() {
      console.log(this.form);
      this.$refs.form.validate((valid) => {
        if (!valid) {
          return;
        }
        let formData = new FormData();
        formData.append("zphbt", this.form.ZPHBT);
        formData.append("dwdm", this.form.DWDM);
        formData.append("wzbz", this.form.WZBZ);

        formData.append("jbsj", new Date(this.form.JBSJ));

        formData.append("dygwdm", this.form.DYGWDM);
        formData.append("szxx", this.form.SZXX);
        formData.append("jbdd", this.form.JBDD);
        formData.append("fbz", this.UserInfo.username);
        formData.append("fbzsfdm", 2);
        formData.append("zy", this.form.ZY);
        formData.append("yyrs", this.form.YYRS);
        if (this.form.ID) {
          console.log("编辑接口");
          formData.append("id", this.form.ID);
          console.log(this.form);

          axios.post("/datazphjlk/updateDataZphjlk", formData).then(res => {
            if (res.data.result) {
              this.$message({type: "success", message: "保存成功!"});
            } else {
              $.confirm({
                title: '提示',
                content: '保存失败：' + res.data.msg,
                type: 'red',
                buttons: {
                  重试: {
                    btnClass: 'btn-orange',
                    action: () => {
                      this.handleSave();
                    }
                  },
                  取消: () => {
                    this.$message('已取消操作');
                  }
                }
              });
            }
          }).catch(error => {
            console.error("编辑招聘会失败", error);
            $.confirm({
              title: '提示',
              content: '保存失败：' + error.message,
              type: 'red',
              buttons: {
                重试: {
                  btnClass: 'btn-orange',
                  action: () => {
                    this.handleSave();
                  }
                },
                取消: () => {
                  this.$message('已取消操作');
                }
              }
            });
          });

        } else {
          console.log("新增接口");
          console.log(this.form);
          // 教师发布的招聘会，默认自动审核
          formData.append("shryhm", this.UserInfo.username);
          formData.append("shrsfdm", 2);
          formData.append("shsj", new Date());
          axios.post("/datazphjlk/addDataZphjlk", formData).then(res => {
            if (res.data.result) {
              this.$message({type: "success", message: "保存成功!"});
            } else {
              $.confirm({
                title: '提示',
                content: '保存失败：' + res.data.msg,
                type: 'red',
                buttons: {
                  重试: {
                    btnClass: 'btn-orange',
                    action: () => {
                      this.handleSave();
                    }
                  },
                  取消: () => {
                    this.$message('已取消操作');
                  }
                }
              });
            }
          }).catch(error => {
            console.error("新增招聘会失败", error);
            $.confirm({
              title: '提示',
              content: '保存失败：' + error.message,
              type: 'red',
              buttons: {
                重试: {
                  btnClass: 'btn-orange',
                  action: () => {
                    this.handleSave();
                  }
                },
                取消: () => {
                  this.$message('已取消操作');
                }
              }
            });
          });
        }

        this.activeTab = "list";
        this.fetchTableData();// 保存成功后刷新列表数据
      });
    },
    // 获取带分页的列表数据
    fetchTableData() {
      this.isLoading = true;
      axios.get("/datazphjlk/getDataZphjlk", {
        params: {
          QYDM: 2,
          ISJUSTONE: 0,
          ZPHID: -1,
          ISJUSTONEYH: 1,
          YHM: this.UserInfo.username,
          YHSFDM: 2,
          getBySHR: 0,
          SHR: -1,
          SHRSFDM: -1
        }
      }).then(res => {
        if (res.data.result) {
          this.tableData = res.data.data;
          this.total = res.data.total;
          this.isLoading = false;
        } else {
          $.confirm({
            title: '提示',
            content: '获取招聘会列表失败：' + res.data.msg,
            type: 'red',
            buttons: {
              重试: {
                btnClass: 'btn-orange',
                action: () => {
                  this.fetchTableData();
                }
              },
              取消: () => {
                this.$message('已取消操作');
              }
            }
          });
        }
      }).catch(error => {
        console.error("获取招聘会列表失败", error);
        $.confirm({
          title: '提示',
          content: '获取招聘会列表失败：' + error.message,
          type: 'red',
          buttons: {
            重试: {
              btnClass: 'btn-orange',
              action: () => {
                this.fetchTableData();
              }
            },
            取消: () => {
              this.$message('已取消操作');
            }
          }
        });
      });
    },
    // 分页切换事件
    handlePageChange(page) {
      this.currentPage = page;
      this.fetchTableData();
    },
    edit(row) {
      this.form = {...row};
      console.log(this.form);
      this.activeTab = "edit";
    },
    deleteRow(row) {
      this.$confirm("确定删除该招聘会吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.$message({type: "success", message: "删除成功!"});
        this.fetchTableData();
      }).catch(() => {
      });
    },
    handleReset() {
      if (this.$refs.form) {
        this.$refs.form.resetFields();
      }
    }
  }
};
</script>


<style scoped>

.ml-64 {
  margin-left: 16rem; /* 根据实际项目调整 */
}


.pagination {
  margin-top: 20px;
  text-align: right;
}

.edit-form-container {
  max-width: 800px;
  margin: 50px 0;
}

.form-buttons {
  text-align: left;
  margin-top: 20px;
}
.mb-4{
  margin:0 !important;
}

</style>