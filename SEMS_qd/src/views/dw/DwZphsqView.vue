<template>
  <div class="content">
    <div>
      <dw-menu></dw-menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        招聘会申请
        <el-button type="text" @click="OpenFbPage">发布新招聘会</el-button>

      </header>

      <!-- 数据统计 -->
      <div class="stats-container mb-4">
        <el-row :gutter="20">
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">总发布数</div>
              <div class="stat-value">{{ total }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">通过数</div>
              <div class="stat-value">{{ stats.passed }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">待审核</div>
              <div class="stat-value">{{ stats.pending }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">已拒绝</div>
              <div class="stat-value">{{ stats.rejected }}</div>
            </div>
          </el-col>
        </el-row>
      </div>

      <!-- 数据表格
       {
            "ID": 9,
            "ZPHBT": "“百万英才汇南粤”广东阳江湖南引才专场活动",
            "DWDM": 60,
            "WZBZ": 1,
            "JBSJ": "2025-04-25T07:57:00.000+00:00",
            "DYGWDM": null,
            "SZXX": "广东大学",
            "JBDD": "教学楼2楼11",
            "FBZ": "ozf",
            "FBZSFDM": 3,
            "QYDM": 1,
            "ZY": "信息管理与信息系统",
            "YYRS": 0,
            "CJSJ": "2025-04-17T16:58:16.877+00:00",
            "SHDM": 0,
            "SHRYHM": null,
            "SHRSFDM": null,
            "SHSJ": null,
            "FBZMC": null,
            "DWMC": "信息科",
            "GSMC": "北海市中医医院"
        }
      -->
      <el-table
          :data="pagedData"
          v-loading="loading"
          border
          style="width: 100%"
         element-loading-text="加载中..."
          element-loading-spinner="el-icon-loading"
          element-loading-background="rgba(255, 255, 255, 0.8)" >

        <el-table-column prop="ID" label="代码" width="100"></el-table-column>
        <el-table-column prop="ZPHBT" label="招聘会标题" width="300"></el-table-column>
        <el-table-column prop="DYGWDM" label="岗位" width="300"></el-table-column>
        <el-table-column prop="WZBZ" label="位置类型" width="120">
          <template slot-scope="{row}">
            {{ row.WZBZ === 1 ? '校内' : '校外' }}
          </template>
        </el-table-column>
        <el-table-column prop="JBSJ" label="举办时间" width="260">
          <template slot-scope="{row}">
            {{ formatDate( row.JBSJ )}}
          </template>
        </el-table-column>
        <el-table-column prop="SHDM" label="审核状态" width="120">
          <template slot-scope="{row}">
            <el-tag :type="statusTagType(row.SHDM)">
              {{ statusMap[row.SHDM] }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="YYRS" label="预约人数" width="120" sortable></el-table-column>
        <el-table-column prop="ZY" label="专业" width="300" sortable></el-table-column>
        <el-table-column prop="SZXX" label="所在学校" width="160"></el-table-column>
        <el-table-column label="操作" width="180">
          <template slot-scope="{row}">
            <el-button
                v-if="row.SHDM === 0"
                type="text"
                @click="handleEdit(row)"
            >编辑</el-button>
            <el-button
                v-if="row.SHDM === 0"
                type="text"
                style="color: #f56c6c;"
                @click="handleDelete(row)"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <el-pagination
          class="mt-4"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
      ></el-pagination>

      <!-- 发布对话框 -->
      <el-dialog
          :title="formType === 'add' ? '发布招聘会' : '编辑招聘会'"
          :visible.sync="dialogVisible"
          width="800px"
      >
        <el-form :model="form" :rules="rules" ref="form">
          <el-form-item label="招聘会标题" prop="ZPHBT">
            <el-input v-model="form.ZPHBT"></el-input>
          </el-form-item>

          <el-form-item label="位置类型" prop="WZBZ">
            <el-radio-group v-model="form.WZBZ">
              <el-radio :label="1">校内</el-radio>
              <el-radio :label="2">校外</el-radio>
            </el-radio-group>
          </el-form-item>


          <div style="display: flex;justify-content: space-between;align-items: center;margin-bottom: 16px;">
            <el-form-item label="举办时间" prop="JBSJ" style="margin-right: 16px;">
              <el-date-picker
                  v-model="form.JBSJ"
                  type="datetime"
                  value-format="yyyy-MM-dd HH:mm"
                  :picker-options="MSSJPickerOptions"
                  placeholder="选择日期时间"
              ></el-date-picker>
            </el-form-item>

            <el-form-item label="关联岗位">
              <el-select
                  v-model="form.DYGWDM"
                  multiple
                  placeholder="请选择岗位"
              >
                <el-option
                    v-for="item in options.posts"
                    :key="item.ID"
                    :label="item.ID+'-'+item.GWMC"
                    :value="item.ID"
                ></el-option>
              </el-select>
            </el-form-item>
          </div>



          <el-form-item label="所在学校">
            <el-input v-model="form.SZXX"></el-input>
          </el-form-item>

          <el-form-item label="举办地点">
            <el-input v-model="form.JBDD"></el-input>
          </el-form-item>
          <el-form-item label="审核教师">
            <!--"id": 1000,
            "jsmc": "罗老湿",
            "sex": "男",
            "dlzh": "lls",
            "dlmm": "123",
            "qydm": 1,-->
            <el-select
              v-model="form.SHR" clearable filterable>
              <el-option v-for="(item,index) in JSDMK" :key="index" :label="item.id+'-'+item.jsmc+'-'+item.dlzh" :value="item.dlzh"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="相关专业">
<!--            "id": 1078,
            "zymc": "中医学农村订单定向医学生",
            "zylb": null-->
            <el-select
                clearable
                filterable
                v-model="form.ZY"
                multiple
                placeholder="请选择专业"
            >
              <el-option
                  v-for="item in options.majors"
                  :key="item.id"
                  :label="item.zymc"
                  :value="item.zymc"
              ></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="预约人数">
            <el-input type="number" v-model="form.YYRS"></el-input>
          </el-form-item>
        </el-form>

        <span slot="footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitForm">确 定</el-button>
        </span>
      </el-dialog>
    </main>
  </div>
</template>

<script>

import DwMenu from "@/components/dw/Dw_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";

export default {
  name: 'TeacherZphshView',
  components: {DwMenu },
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
      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      loading: false,
      currentPage: 1,
      pageSize: 10,
      dialogVisible: false,
      formType: 'add',
      form: {
        ZPHBT: '',
        WZBZ: 1,
        JBSJ: '',
        DYGWDM: [],
        SZXX: '',
        JBDD: '',
        ZY: []
      },
      rules: {
        ZPHBT: [{ required: true, message: '请输入标题', trigger: 'blur' }],
        WZBZ: [{ required: true, message: '请选择位置类型', trigger: 'change' }],
        JBSJ: [{ required: true, message: '请选择时间', trigger: 'change' }]
      },
      options: {
        posts: [],
        majors: [
         /* "id": 1078,
        "zymc": "中医学农村订单定向医学生",
        "zylb": null*/
        ]
      },
      DWDMK:{},
      JSDMK:[],
      tableData: []
    };
  },
  computed: {
    total() {
      return this.tableData.length;
    },
    stats() {
      return this.tableData.reduce((acc, cur) => {
        acc[cur.SHDM === 0 ? 'pending' : cur.SHDM === 1 ? 'passed' : 'rejected']++;
        return acc;
      }, { pending: 0, passed: 0, rejected: 0 });
    },
    pagedData() {
      return this.tableData.slice(
          (this.currentPage - 1) * this.pageSize,
          this.currentPage * this.pageSize
      );
    },
    statusMap() {
      return {
        0: '待审核',
        1: '已通过',
        2: '已拒绝'
      };
    }
  },
  created() {
    this.getLoginUserInfo();
  },
  methods: {
    formatDate (input) {
      const date = new Date(input);

      const year = date.getFullYear();
      const month = date.getMonth() + 1; // 月份从 0 开始
      const day = date.getDate();
      const hour = date.getHours();
      const minute = date.getMinutes();

      return `${year}-${month}-${day} ${hour}:${minute}`;
    },
    // 获取当前用户发布的岗位--启用的
    getJobData() {
      axios.get("/dataGwdmk/getGwdmkDataToInterface", {
        params: {
          IsJustOne: 0,
          gwdm: 0,
          QYDM: 1,
          IsByFBZ: 1,
          FBZ: this.UserInfo.username,
          SXBZ: 2
        }
      }).then(res => {
        if (res.data.result) {
          this.options.posts = res.data.data;
          // 重新根据发布时间排序
          this.options.posts.sort((a, b) => new Date(b.FBSJ) - new Date(a.FBSJ));
        } else {
          console.error('获取职位信息失败,网络错误：' + res.data.msg);
          this.$message.error('获取职位信息失败:' + res.data.msg);
        }
      }).catch(error => {
        console.error('获取职位信息失败,网络错误！', error);
        this.$message.error('获取职位信息失败:' + error.message);
      });

    },

    // 获取当前用户所属单位信息
    getDWinfo(){
      axios.get("/dw/getDwDataByDwUserName?dwUserName="+this.UserInfo.username).then((response) => {
        if (response.data.result) {
          this.DWDMK=response.data.data;
        }else{
          this.$message.error("获取单位信息失败，后台错误");
        }
      }).catch((error) => {
        this.$message.error("获取单位信息失败,网络错误");
      });
    },

    // 加载专业数据
    getAllZydmk(){
      axios.get("/zydmk/getAllZydmk").then((response) => {
        if (response.data.result) {
          this.options.majors = response.data.data;
        }else{
          this.$message.error("获取专业信息失败，后台错误");
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error("获取专业信息失败,网络错误");
      });
    },

    getAllTeachers() {
      axios.get("/teacher/getAllTeachers").then((response) => {
        if (response.data.result) {
          this.JSDMK = response.data.data;
        } else {
          this.$message.error("获取教师信息失败，后台错误");
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error("获取教师信息失败,网络错误");
      });

    },
    loadData(){
      if (this.JSDMK.length === 0){
        // 加载教师数据
        this.getAllTeachers();
      }
      if (this.options.majors.length === 0){
        // 加载专业数据
        this.getAllZydmk();
      }
      if (this.options.posts.length === 0){
        // 加载岗位数据
        this.getJobData();
      }
    },
    OpenFbPage(){
      this.dialogVisible = true;
      console.log(this.options.posts)
     this.loadData();
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
          this.getDWinfo();
        }
      } catch (error) {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'TeacherLoginView'});
        }, 1000);
      }
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
          YHSFDM: 3,
          getBySHR:0,
          SHR: '-1',
          SHRSFDM: 2
        }
      }).then(res => {
        if (res.data.result) {
          this.isLoading = false;
          this.tableData = res.data.data;
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
    statusTagType(status) {
      return {
        0: 'warning',
        1: 'success',
        2: 'danger'
      }[status];
    },
    submitForm() {
      this.$refs.form.validate(valid => {
        if (valid) {
          const newData = {
            ...this.form,
            DWDM: 'DW1001', // 当前单位代码
            DYGWDM: this.form.DYGWDM.join('+'),
            ZY: this.form.ZY.join('+'),
            YYRS: this.form.YYRS , // 初始预约人数
          };
          console.log(newData);
          console.log("关联的岗位：");
          console.log(this.form.DYGWDM);
          // 新增逻辑
          let  dataForm=new FormData();
          dataForm.append('fbz', this.UserInfo.username);
          dataForm.append("fbzsfdm", 3);
          dataForm.append("dygwdm",newData.DYGWDM);
          dataForm.append("zphbt", newData.ZPHBT);// 招聘会标题
          dataForm.append("wzbz", newData.WZBZ);// 位置类型
          dataForm.append("jbsj", new Date(this.form.JBSJ) );// 举办时间
          dataForm.append("szxx", newData.SZXX);// 所在学校
          dataForm.append("jbdd", newData.JBDD);// 举办地点
          dataForm.append("zy", newData.ZY);// 相关专业
          dataForm.append("shryhm", newData.SHR);// 审核教师
          dataForm.append("shrsfdm", 2);// 审核人身份
          dataForm.append("yyrs", newData.YYRS);// 预约人数
          dataForm.append("dwdm",  this.DWDMK.dwdm);// 单位代码

          if (this.formType === 'add') {
            axios.post("/datazphjlk/addDataZphjlk", dataForm).then((response) => {
              if (response.data.result) {
                this.$message.success("新增招聘会成功");
                this.fetchTableData();
              /*  this.resetForm();*/
              } else {
                this.$message.error("新增招聘会失败：" + response.data.msg);
              }
            }).catch((error) => {
              console.log(error);
              this.$message.error("新增招聘会失败：" + error.message);
            });
          } else {
            dataForm.append("id", this.form.ID);
            // 编辑逻辑
            console.log("编辑数据：");
              console.log(this.form);
              axios.post("/datazphjlk/updateDataZphjlk", dataForm).then((response) => {
                if (response.data.result) {
                  this.$message.success("更新招聘会成功");
                  this.fetchTableData();
                } else {
                  this.$message.error("更新招聘会失败：" + response.data.msg);
                }
              }).catch((error) => {
                console.log(error);
                this.$message.error(" 更新招聘会失败：" + error.message);
              });
          }
          this.dialogVisible = false;
        }
      });
    },
    resetForm() {
      this.form = {
        ZPHBT: '',
        WZBZ: 1,
        JBSJ: '',
        DYGWDM: [],
        SZXX: '',
        JBDD: '',
        ZY: []
      };
    },
    handleEdit(row) {
      this.loadData();

      this.formType = 'edit';
      this.form.ZPHBT = row.ZPHBT;
      this.form.WZBZ = row.WZBZ;
      this.form.JBSJ = this.formatDate(row.JBSJ);

      this.form.SZXX = row.SZXX;
      this.form.JBDD = row.JBDD;
      this.form.YYRS = row.YYRS;
      this.form.ID = row.ID;

      console.log(row);
      this.form.SHR =row.SHRYHM;

      this.dialogVisible = true;
    },
    handleDelete(row) {
      this.$confirm('确定删除该招聘会吗？', '提示', {
        type: 'warning'
      }).then(() => {
        this.tableData = this.tableData.filter(item => item !== row);
      });
    },
    handleSizeChange(val) {
      this.pageSize = val;
    },
    handleCurrentChange(val) {
      this.currentPage = val;
    }
  }
};
</script>

<style scoped>
.content {
  padding: 20px;
}

.stat-card {
  background: #fff;
  padding: 20px;
  border-radius: 4px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
}

.stat-title {
  color: #909399;
  font-size: 14px;
  margin-bottom: 8px;
}

.stat-value {
  font-size: 24px;
  color: #303133;
}

.el-pagination {
  justify-content: flex-end;
}
</style>