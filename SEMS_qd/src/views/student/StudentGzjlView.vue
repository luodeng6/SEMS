<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>  <stu_-d-h-l></stu_-d-h-l>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">


      <el-card class="flex justify-between items-center mb-4" shadow="never">
        <h2 class="text-2xl font-semibold">工作经历管理</h2>
        <el-button type="text" @click="handleAdd">新增经历</el-button>
        <el-button type="text" @click="ViewGzjlXq">查看经历详情</el-button>
        <el-button type="text" @click="handleAddGzjlXq">新增经历详情</el-button>
      </el-card>

      <!-- 工作经历表格 -->
      <el-table highlight-current-row   @current-change="handleCurrentChange" :data="workExperiences" border height="600"  class="w-full" v-loading="loading"
                element-loading-text="加载中..."
                element-loading-spinner="el-icon-loading"
                element-loading-background="rgba(255, 255, 255, 0.8)"
      >
        <el-table-column label="编号" prop="ID" width="180"></el-table-column>
        <el-table-column label="单位名称" prop="DWMC" width="280"></el-table-column>
        <el-table-column label="岗位名称" prop="GWMC" width="250"></el-table-column>
        <el-table-column label="开始时间" prop="KSSJ" width="220">
            <template slot-scope="scope">
             {{ formatDate1(scope.row.KSSJ) }}
            </template>
        </el-table-column>
        <el-table-column  label="结束时间" prop="JSSJ" width="220">
          <template slot-scope="scope">
            {{ formatDate1(scope.row.JSSJ) }}
          </template>
        </el-table-column>
        <el-table-column label="经历描述" prop="JLMS">
          <template slot-scope="scope">
            {{ scope.row.JLMS ? scope.row.JLMS.slice(0, 15) + (scope.row.JLMS.length > 15 ? "..." : "") : "" }}
          </template>
        </el-table-column>
        <el-table-column label="操作" width="150">
          <template slot-scope="scope">
            <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button size="mini" type="danger" @click="handleDelete(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <!-- 编辑对话框 -->
      <el-dialog :title="editMode ? '编辑经历' : '新增经历'" :visible.sync="dialogVisible" width="600px">
        <el-form :model="formModel" label-width="80px">
          <el-form-item label="单位名称">
            <el-input v-model="formModel.DWMC" placeholder="请输入单位名称"></el-input>
          </el-form-item>
          <el-form-item label="岗位名称">
            <el-input v-model="formModel.GWMC" placeholder="请输入岗位名称"></el-input>
          </el-form-item>
          <el-form-item label="开始时间">
            <el-date-picker
                v-model="formModel.KSSJ"
                placeholder="选择开始日期"
                type="date"
                value-format="yyyy-MM-dd">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="结束时间">
            <el-date-picker
                v-model="formModel.JSSJ"
                :picker-options="endDatePickerOptions"
                placeholder="选择结束日期"
                type="date"
                value-format="yyyy-MM-dd">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="启用状态">
            <el-select v-model="formModel.QYDM" placeholder="请选择">
              <el-option label="启用" value="1"></el-option>
              <el-option label="停用" value="0"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="经历描述">
            <el-input
                v-model="formModel.JLMS"
                :rows="3"
                placeholder="请描述工作内容及成果"
                type="textarea">
            </el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="handleSubmit">确 定</el-button>
        </span>
      </el-dialog>
      <!-- 新增工作经历详情对话框 -->
      <el-dialog   :visible.sync="dialogVisibleGzjlXq" width="600px">
        <el-form :model="formModelGzjlXq" label-width="80px">
          <el-form-item label="工作经历事项"   >
            <el-input
                v-model="formModelGzjlXq.gzjlsx"
                :rows="4"
                placeholder="请描述工作内容及成果"
                type="textarea">
            </el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisibleGzjlXq = false">取 消</el-button>
          <el-button type="primary" @click="handleSubmitGzjlXq">确 定</el-button>
        </span>
      </el-dialog>
        <!-- 工作经历详情表格 -->
      <el-dialog :visible.sync="isShowGzjlXq" width="800px" title="工作事项列表">
        <el-table :data="gzjlsxk" border style="width: 100%">
          <el-table-column prop="ID" label="编号" width="80"></el-table-column>
          <el-table-column prop="GZJLSX" label="事项内容" width="350"></el-table-column>

         <el-table-column label="创建时间" prop="CJSJ" width="200">
            <template slot-scope="scope">
              {{ formatDate1(scope.row.CJSJ) }}
            </template>
          </el-table-column>
          <el-table-column label="操作" width="120">
            <template slot-scope="scope">
              <el-button type="text" @click="editItem(scope.row)">编辑</el-button>
              <el-button type="text" style="color: red" @click="deleteItem(scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>

        <span slot="footer" class="dialog-footer">
    <el-button @click="isShowGzjlXq = false">取 消</el-button>
    <el-button type="primary" @click="handleSubmitGzjlXq">确 定</el-button>
  </span>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";
import Stu_DHL from "@/components/student/Stu_DHL.vue";


export default {
  name: 'StudentInfo',
  components: {Stu_DHL, StudentMenu},
  data() {
    return {
      isShowGzjlXq: false,
      loading:false,//表格加载特效
      workExperiences: [], // 工作经历数据
      dialogVisible: false,
      editMode: false,
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      formModelGzjlXq: {
        gzjlsx:"",
        gzjldm:""
      },// 新增工作经历详情数据
      dialogVisibleGzjlXq: false,
      allgzjlsxk:[],
      gzjlsxk:[],
      formModel: {
        ID: '',
        STUID: '',
        DWMC: '',
        GWMC: '',
        KSSJ: '',
        JSSJ: '',
        JLMS: '',
        QYDM: '1'
      },
      currentRow:null,
      endDatePickerOptions: {
        disabledDate: (time) => {
          return this.formModel.KSSJ &&
              time.getTime() < new Date(this.formModel.KSSJ).getTime();
        }
      }
    };
  },
  mounted() {
    this.getLoginUserInfo();
  },
  methods: {
    deleteItem(row){
      $.confirm({
        title: '提示',
        content: '确认删除该记录吗？',
        type: 'orange',
        buttons: {
          confirm: {
            text: '确定',
            btnClass: 'btn-red',
            action: () => {
              axios.get("/gzjlk/deleteGzjlsxK?id="+row.ID).then(response => {
                if (response.data.result) {
                  this.$message.success("删除成功！");
                  this.getGzjlData();
                }else{
                  $.confirm({
                    title: '提示',
                    content: '删除失败：' + response.data.msg,
                    type: 'red', // warning 样式
                    buttons: {
                      重试: {
                        btnClass: 'btn-orange',
                        action: () => {
                          this.deleteItem(row);
                        }
                      },
                      取消: () => {
                        this.$message('已取消删除操作');
                      }
                    }
                  });
                }
              }).catch(error=>{
                console.log(error)
                $.confirm({
                  title: '提示',
                  content: '删除失败：' + error.message,
                  type: 'red', // warning 样式
                  buttons: {
                    重试: {
                      btnClass: 'btn-orange',
                      action: () => {
                        this.deleteItem(row);
                      }
                    },
                    取消: () => {
                      this.$message('已取消删除操作');
                    }
                  }
                });
              })
            }
          },
          cancel: {
            text: '取消',
            action: ()=>{
              // 取消逻辑（如果有）
            }
          }
        }
      });

    },
    ViewGzjlXq(){
      if(this.currentRow==null){
        $.confirm({
          title: '提示',
          content: '请先选择一条记录',
          type: 'orange',
          buttons: {
            确定: {
              btnClass: 'btn-orange',
            },
          }
        });
      }else{
        this.gzjlsxk=this.allgzjlsxk.filter(item=>item.GZJLDM==this.currentRow.ID);
        this.isShowGzjlXq = true;
      }
    } ,
    handleCurrentChange(val){
      this.currentRow = val;
      console.log(val);

    },
    handleSubmitGzjlXq(){
      let formData = new FormData();
      formData.append("gzjldm", this.formModelGzjlXq.gzjldm);
      formData.append("gzjlsx", this.formModelGzjlXq.gzjlsx);
      axios.post("/gzjlk/addGzjlsxK",formData).then(response => {
        if (response.data.result) {
          this.dialogVisibleGzjlXq = false;
          this.$message.success("新增成功！");
        } else {
          $.confirm({
            title: '提示',
            content: '新增失败：' + response.data.msg,
            type: 'red', // warning 样式
            buttons: {
              重试: {
                btnClass: 'btn-orange',
                action: () => {
                  this.handleSubmitGzjlXq();
                }
              },
              取消: () => {
                this.$message('已取消新增操作');
              }
            }
          });
        }
      }).catch(error => {
        console.log(error);
        $.confirm({
          title: '提示',
          content: '新增失败：' + error.message,
          type: 'red', // warning 样式
          buttons: {
            重试: {
              btnClass: 'btn-orange',
              action: () => {
                this.handleSubmitGzjlXq();
              }
            },
            取消: () => {
              this.$message('已取消新增操作');
            }
          }
        });
      });
    },
    // 获取学生信息
    getStudentDataByUsername(yhm) {

      axios.get(`/student/getStudentByUsernameOrId?usernameOrId=${yhm}&type=username`).then(response => {
        if (response.data.result) {
          this.UserInfo.id = response.data.data.id;
        } else {
          this.$message.error("获取学生信息失败:" + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取学生信息失败，网络错误！");
      });
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
          this.getGzjlData();
        }
      } catch (error) {
        console.error('获取用户信息失败，网络错误！', error);
        this.handleAuthFailure();
      }
    },
    handleAuthFailure() {
      EventBus.$emit('show-auth-popup');
      setTimeout(() => {
        this.$router.push({name: 'StudentLoginView'});
      }, 1000);
    },
    confirmGetData(msg) {
      $.confirm({
        title: '提示',
        content: '获取工作经历数据失败：' + msg,
        type: 'red', // 错误提示用红色
        buttons: {
          重试: {
            btnClass: 'btn-red',
            action: () => {
              this.getGzjlData();
            }
          }
        }
      });
    },
    handleAddGzjlXq(){
      if(this.currentRow==null){
        $.confirm({
          title: '提示',
          content: '请先选择一条记录',
          type: 'orange',
          buttons: {
            确定: {
              btnClass: 'btn-orange',
            },
          }
        });
      }else{
        this.dialogVisibleGzjlXq = true;
        this.formModelGzjlXq.gzjldm=this.currentRow.ID;
      }
    },
    // 获取工作经历数据
    async getGzjlData() {
      this.loading = true;
      try {
        /* [
           {
             "ID": 1,
             "STUID": 1214,
             "TJSJ": "2025-03-09T17:00:35.260+00:00",
             "DWMC": "11",
             "GWMC": "11",
             "KSSJ": "2025-03-11T00:00:00.000+00:00",
             "JSSJ": "2025-03-21T00:00:00.000+00:00",
             "JLMS": "11",
             "QYDM": 1,
             "XSXM": "李家辉",
             "XSXB": "男",
             "SSBJ": 1292,
             "ZYDM": 1085,
             "SFZH": "450703200302201551",
             "ZZMM": "共青团员",
             "SSNJ": "2021",
             "JYZT": 1000,
             "XSZP": "/img/upload/Userpofile/20213260030_1740397262501_.jpeg",
             "FZJS": 0
           }
         ]*/
        this.workExperiences=[];
        const response = await axios.get('/gzjlk/getAllGzjlk?YHM=' + this.UserInfo.username);
        if (!response.data.result) {
          this.confirmGetData();
        } else {
          console.log(response.data.data);
          let ResultData = response.data.data.gzjlk;
          this.allgzjlsxk=response.data.data.gzjlsxk;
          let ItemData;
          for (let i = 0; i < ResultData.length; i++) {
            ItemData = {};
            //ItemData.ID = ResultData[i].ID;
            //ItemData.STUID = ResultData[i].STUID;
            ItemData.ID=ResultData[i].ID;
            ItemData.DWMC = ResultData[i].DWMC;
            ItemData.GWMC = ResultData[i].GWMC;
            ItemData.KSSJ = ResultData[i].KSSJ;
            ItemData.JSSJ = ResultData[i].JSSJ;
            ItemData.JLMS = ResultData[i].JLMS;
            ItemData.QYDM = ResultData[i].QYDM;
            this.workExperiences.push(ItemData);
          }
          this.loading = false;
        }
      } catch (error) {
        console.error('获取工作经历数据失败:', error);
        this.confirmGetData();
      }
    },
    formatDate1(isoInput) {
      const isoString = String(isoInput); // 确保转换为字符串
      return isoString.split("T")[0];
    },
    handleAdd() {
      this.editMode = false;
      this.formModel = {
        ID: '',
        STUID: '123', // 实际应获取当前学生ID
        DWMC: '',
        GWMC: '',
        KSSJ: '',
        JSSJ: '',
        JLMS: '',
        QYDM: '1'
      };
      this.dialogVisible = true;
    },
    handleEdit(row) {
      this.editMode = true;
      this.formModel = {...row};
      this.dialogVisible = true;
    },
    handleDelete(row) {

      $.confirm({
        title: '提示',
        content: '确认删除该记录吗？',
        type: 'orange',
        buttons: {
          confirm: {
            text: '确定',
            btnClass: 'btn-red',
            action: () => {
             axios.get("/gzjlk/deleteGzjlk?id="+row.ID).then(response => {
               if (response.data.result) {
                 this.$message.success("删除成功！");
                 this.getGzjlData();
               }else{
                 $.confirm({
                   title: '提示',
                   content: '删除失败：' + response.data.msg,
                   type: 'red', // warning 样式
                   buttons: {
                     重试: {
                       btnClass: 'btn-orange',
                       action: () => {
                         this.handleDelete(row);
                       }
                     },
                     取消: () => {
                       this.$message('已取消删除操作');
                     }
                   }
                 });
               }
             }).catch(error=>{
               console.log(error)
               $.confirm({
                 title: '提示',
                 content: '删除失败：' + error.message,
                 type: 'red', // warning 样式
                 buttons: {
                   重试: {
                     btnClass: 'btn-orange',
                     action: () => {
                       this.handleDelete(row);
                     }
                   },
                   取消: () => {
                     this.$message('已取消删除操作');
                   }
                 }
               });
             })
            }
          },
          cancel: {
            text: '取消',
            action: ()=>{
              // 取消逻辑（如果有）
            }
          }
        }
      });

    },
    async handleSubmit() {
      // 这里应调用API保存数据
      if (this.editMode) {
        console.log(this.formModel);
        try {
          console.log(this.formModel);
          let formData = new FormData();
          formData.append("id", this.formModel.ID);
          formData.append("stuid", this.UserInfo.id);
          formData.append("dwmc", this.formModel.DWMC);
          formData.append("gwmc", this.formModel.GWMC);
          formData.append("kssj", new Date(this.formModel.KSSJ));
          formData.append("jssj", new Date(this.formModel.JSSJ));
          formData.append("jlms", this.formModel.JLMS);
          formData.append("qydm", this.formModel.QYDM);
          const response = await axios.post("/gzjlk/updateGzjlk", formData);
          if (response.data.result) {
            this.dialogVisible = false;
            this.$message.success("更新成功！");
            this.getGzjlData();
          } else {
            $.confirm({
              title: '提示',
              content: '更新失败：' + response.data.msg,
              type: 'red', // warning 样式
              buttons: {
                重试: {
                  btnClass: 'btn-orange',
                  action: () => {
                    this.handleSubmit();
                  }
                },
                取消: () => {
                  this.dialogVisible = false;
                }
              }
            });
          }
        } catch (error) {
          console.error('失败:！', error);
          $.confirm({
            title: '提示',
            content: '更新失败：' + error.message,
            type: 'red', // warning 样式
            buttons: {
              重试: {
                btnClass: 'btn-orange',
                action: () => {
                  this.handleSubmit();
                }
              },
              取消: () => {
                this.dialogVisible = false;
              }
            }
          });
        }
      } else {
        try {
          console.log(this.formModel);
          let formData = new FormData();
          formData.append("stuid", this.UserInfo.id);
          formData.append("dwmc", this.formModel.DWMC);
          formData.append("gwmc", this.formModel.GWMC);
          formData.append("kssj", new Date(this.formModel.KSSJ));
          formData.append("jssj", new Date(this.formModel.JSSJ));
          formData.append("jlms", this.formModel.JLMS);
          formData.append("qydm", this.formModel.QYDM);
          const response = await axios.post("/gzjlk/addGzjlk", formData);
          if (response.data.result) {
            this.dialogVisible = false;
            this.$message.success("新增成功！");
            this.getGzjlData();
          } else {
            $.confirm({
              title: '提示',
              content: '新增失败：' + response.data.msg,
              type: 'red', // warning 样式
              buttons: {
                重试: {
                  btnClass: 'btn-orange',
                  action: () => {
                    this.handleSubmit();
                  }
                },
                取消: () => {
                  this.dialogVisible = false;
                }
              }
            });
          }
        } catch (error) {
          console.error('获取用户信息失败:！', error);
          $.confirm({
            title: '提示',
            content: '新增失败：' + error.message,
            type: 'red', // warning 样式
            buttons: {
              重试: {
                btnClass: 'btn-orange',
                action: () => {
                  this.handleSubmit();
                }
              },
              取消: () => {
                this.dialogVisible = false;
              }
            }
          });
        }
      }

    }
  }
};
</script>

<style scoped>
.el-form-item__content {
  line-height: 40px;
}

.el-date-editor.el-input {
  width: 100%;
}
</style>