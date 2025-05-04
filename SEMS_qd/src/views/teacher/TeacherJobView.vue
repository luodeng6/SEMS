<template>
  <div class="content">
    <teacher_menu />
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <!-- 标题和操作按钮 -->
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold text-gray-800">岗位信息管理（前端分页）</h1>
        <div class="flex items-center space-x-4">
          <el-button icon="el-icon-shopping-cart-full" type="default" size="mini" @click="handleFldy">福利待遇</el-button>
          <el-button icon="el-icon-refresh" type="default" size="mini" @click="handleRefresh">刷新数据</el-button>
          <el-button icon="el-icon-plus" type="default" size="mini" @click="handleAdd">新增岗位</el-button>
          <el-button type="default" size="mini" icon="el-icon-download">导出数据</el-button>
        </div>
      </header>

      <!-- 筛选条件 -->
      <el-card class="mb-6" shadow="never">
        <el-form inline>
          <!-- 岗位名称筛选 -->
          <el-form-item label="岗位名称">
            <el-input clearable placeholder="请输入岗位名称" v-model="filterParams.GWMC" />
          </el-form-item>
          <!-- 发布日期范围筛选 -->
          <el-form-item label="发布时间">
            <el-date-picker
                v-model="filterParams.FBSJ"
                type="daterange"
                range-separator="至"
                start-placeholder="开始日期"
                end-placeholder="结束日期" />
          </el-form-item>
          <!-- 推荐岗位筛选 -->
          <el-form-item>
            <el-checkbox v-model="filterParams.SFTJ" label="推荐岗位" @change="applyFilters" />
          </el-form-item>
          <!-- 岗位分类筛选 -->
          <el-form-item label="岗位分类">
            <el-select v-model="filterParams.GWFL" @change="applyFilters">
              <el-option label="全部" value="" />
              <el-option
                  v-for="item in GWFL_OPTIONS"
                  :key="item.DM"
                  :label="item.MC"
                  :value="item.DM" />
            </el-select>
          </el-form-item>
          <!-- 查询和重置按钮 -->
          <el-form-item>
            <el-button type="primary" @click="applyFilters">查询</el-button>
            <el-button @click="resetFilters">重置</el-button>
          </el-form-item>
        </el-form>
      </el-card>

      <!-- 数据表格 -->
      <el-table
          :data="paginatedData"
          border
          stripe
          @current-change="handleCurrentChange"
          highlight-current-row
          style="width: 100%"
          v-loading="loading"
          element-loading-background="rgba(255, 255, 255, 0.8)"
          element-loading-spinner="el-icon-loading"
      >
        <!-- 可展开行，展示更多详情 -->
        <el-table-column type="expand">
          <template #default="{ row }">
            <div class="expand-content p-4">
              <p><strong>岗位描述：</strong>{{ row.GWMS }}</p>
              <p><strong>岗位要求：</strong>{{ row.GWYQ }}</p>
              <p><strong>专业限制：</strong>{{ row.ZYXZ }}</p>
              <p><strong>福利待遇：</strong>{{ row.FLDY }}</p>
            </div>
          </template>
        </el-table-column>
        <!-- 普通列定义 -->
<!--        <el-table-column label="岗位ID" prop="GWDM" width="80" sortable />-->
        <el-table-column label="岗位名称" prop="GWMC" width="180" />
        <el-table-column label="单位名称" prop="DWMC" width="150" />
        <el-table-column label="薪资范围" width="110">
          <template #default="{ row }">￥{{ row.ZDXZ }}-{{ row.ZGXZ }}</template>
        </el-table-column>
        <el-table-column label="工作地点" prop="GZDD" width="120" />
        <el-table-column label="学历要求" prop="XLMC" width="120"/>
        <el-table-column label="专业要求" prop="ZYXZ" width="120"/>
        <el-table-column label="发布时间" prop="FBSJ" width="180">
          <template #default="{ row }">{{ formatDate(row.FBSJ) }}</template>
        </el-table-column>
        <el-table-column label="推荐指数" width="160">
          <template #default="{ row }">
            <el-rate v-model="row.TJDJ" disabled :colors="['#99A9BF', '#F7BA2A', '#FF9900']" />
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180">
          <template #default="{ row }">
            <el-button size="mini" @click="handleEdit(row)">编辑</el-button>
            <el-button
                size="mini"
                :type="row.SFTJ ? 'success' : 'warning'"
                @click="toggleRecommend(row)">
              {{ row.SFTJ ? '取消推荐' : '设为推荐' }}
            </el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 前端分页组件 -->
      <div class="mt-4 flex justify-end">
        <el-pagination
            :current-page="currentPage"
            :page-size="pageSize"
            :total="filteredData.length"
        layout="total, prev, pager, next"
        @current-change="handlePageChange" />
      </div>

      <!-- 编辑对话框 -->
      <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="600px">
        <el-form
            :model="form"
            :rules="rules"
            ref="formRef"
            label-width="100px">

          <el-form-item label="推荐岗位">
            <el-select
                v-model="SeletGWDM"
                multiple
                clearable
                filterable
                placeholder="请选择岗位"
                style="width: 100%;">
              <el-option
                  v-for="item in GWDMK"
                  :key="item.ID"
                  :label="item.GWMC+'-'+item.DWMC+'-'+item.GSMC"
                  :value="item.ID"/>
            </el-select>
          </el-form-item>

          <!-- 选择推荐类型（班级或学生） -->
          <el-form-item label="推荐对象">
            <el-checkbox v-model="recommendToClass" @change="onTypeChange">
              推荐到班级
            </el-checkbox>
            <el-checkbox v-model="recommendToStudent" @change="onTypeChange">
              推荐到学生
            </el-checkbox>
          </el-form-item>

          <!-- 班级下拉（仅在勾选推荐到班级时显示）
                {
                  "id": 1307,
                  "bjmc": "2022信息管理与信息系统",
                  "bzrdm": 1002,
                  "zydm": 1085,
                  "dyzy": "信息管理与信息系统"
              }
           -->
          <el-form-item label="选择班级"  v-if="recommendToClass">
            <el-select
                v-model="selectClassList"
                multiple
                clearable
                filterable
                placeholder="请选择班级"
                style="width: 100%;"
            >
              <el-option
                  v-for="cls in classList"
                  :key="cls.id"
                  :label="cls.id + '-' + cls.bjmc"
                  :value="cls.id"
              />
            </el-select>
          </el-form-item>

          <!-- 学生下拉（仅在勾选推荐到学生时显示）
              {
              "ID": 1235,
              "XSXM": "程星洪",
              "XSXB": "男",
              "BIRTH": "2003-07-14",
              "NL": 22,
              "YHM": "20213260038",
              "ZYMC": "信息管理与信息系统",
              "SFZH": "452428200307141212",
              "ZZMM": "共青团员",
              "SSNJ": "2021",
              "XZ": "四年制",
              "MZ": "瑶族",
              "XSXH": "20213260038",
              "BJMC": "2021级信息管理与信息系统",
              "SSBJ": 1292,
              "XLMC": "本科",
              "JYZT": "未就业",
              "XSZP": null,
              "FZJS": null,
              "JSMC": null
          },
           -->
          <el-form-item label="选择学生"  v-if="recommendToStudent">
            <el-select
                v-model="selectStudentList"
                multiple
                clearable
                filterable
                placeholder="请选择学生"
                style="width: 100%;"
            >
              <el-option
                  v-for="stu in studentList"
                  :key="stu.ID"
                  :label="stu.YHM + '-' + stu.XSXM+'-' + stu.BJMC"
                  :value="stu.ID"
              />
            </el-select>
          </el-form-item>


          <!-- 推荐原因 -->
          <el-form-item label="推荐原因" prop="reason">
            <el-input type="textarea" v-model="form.reason" :rows="3" />
          </el-form-item>

          <!-- 推荐星数 -->
          <el-form-item label="推荐星级" prop="stars">
            <el-rate
                v-model="form.stars"
                :max="5"
                show-text
                :texts="['很差', '较差', '一般', '较好', '非常推荐']"
            />
          </el-form-item>
        </el-form>

        <!-- 底部按钮 -->
        <template #footer>
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitForm">确定</el-button>
        </template>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import teacher_menu from '@/components/teacher/Teacher_menu.vue'
import dayjs from 'dayjs'
import axios from "axios";
import {EventBus} from "@/event-bus";
export default {
  components: { teacher_menu },
  data() {
    return {
      form: {
        reason: '',
        stars: 0
      },
      recommendToClass: false,// 推荐到班级
      recommendToStudent: true,// 推荐到学生
      rules: {
        reason: [{ required: true, message: '请输入推荐原因', trigger: 'blur' }],
        stars: [{ required: true, message: '请评分', trigger: 'change' }]
      },
      // 原始数据列表，前端分页基于此
      allData: [],
      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      // 过滤条件
      filterParams: { GWMC: '', FBSJ: [], GWFL: '', SFTJ: false },
      GWFL_OPTIONS: [],
      XL_OPTIONS: [],
      CITY_OPTIONS: [],

      GWDMK:[],// 所有可选岗位代码
      SeletGWDM:[],// 选中的岗位代码列表

      selectStudentList: [], // 选中的学生列表
      selectClassList: [], // 选中的班级列表

      classList: [], // 班级列表
      studentList: [], // 学生列表

      loading: false,
      currentPage: 1,
      pageSize: 10,
      dialogVisible: false,
      dialogTitle: '新增岗位',
      currentPost: this.emptyPost(),
      JSDMK:{},
      selectRow:null,
    }
  },
  computed: {
    // 根据 filterParams 计算过滤后的数据
    filteredData() {
      return this.allData.filter(item => {
        // 岗位名称模糊匹配
        const matchName = this.filterParams.GWMC === '' || item.GWMC.includes(this.filterParams.GWMC)
        // 推荐岗位过滤
        const matchRec = !this.filterParams.SFTJ || item.SFTJ === true
        // 分类过滤
        const matchCat = this.filterParams.GWFL === '' || item.GWFL === this.filterParams.GWFL
        // 日期范围过滤
        let matchDate = true
        if (this.filterParams.FBSJ.length === 2) {
          const start = dayjs(this.filterParams.FBSJ[0])
          const end = dayjs(this.filterParams.FBSJ[1])
          const date = dayjs(item.FBSJ)
          matchDate = date.isAfter(start) && date.isBefore(end)
        }
        return matchName && matchRec && matchCat && matchDate
      })
    },
    // 当前页要展示的数据
    paginatedData() {
      const start = (this.currentPage - 1) * this.pageSize
      return this.filteredData.slice(start, start + this.pageSize)
    }
  },
  methods: {
    //查看福利待遇
    handleFldy(){
      if (this.selectRow){
        console.log(this.selectRow);
      }else{
        this.$message.warning('请先选择一条数据!');
      }
    },
    handleCurrentChange(val) {
      this.selectRow = val;
    },
    handleRefresh(){
      this.getLoginUserInfo();
      this.$message.success('刷新成功');
    },
    submitForm() {
      this.$refs.formRef.validate((valid) => {
        if (valid) {
          // 可提交 this.form
          console.log(this.form);
          console.log(this.SeletGWDM);
          console.log(this.selectClassList);
          console.log(this.selectStudentList);
          // 有多少岗位就有多少TJGWK
          for (let i = 0; i < this.SeletGWDM.length; i++){
            let TJGWK =new FormData();
            TJGWK.append("gwdm", this.SeletGWDM[i]);
            TJGWK.append("tjr", this.UserInfo.username);
            TJGWK.append("tjrsfdm", 2);
            TJGWK.append("yjlb", this.recommendToClass ? 2: 1);//1班级 2学生
            TJGWK.append("tjdj", this.form.stars);//推荐星级
            TJGWK.append("tjms", this.form.reason);//推荐原因
            axios.post("/tjgwk/insertTjgwk", TJGWK).then(response => {
              if (response.data.result) {
                this.$message.success('推荐成功:' + i);
                console.log(response.data.data);
                // 插入推荐到的对象
                if (this.recommendToClass) {
                 // 推荐到班级,从选中班级列表中取出班级ID
                  for (let j = 0; j < this.selectClassList.length; j++) {
                    let TJDXK = new FormData();
                    /*
                    * ID
                      DXLX	对象类型，1学生，2班级
                      DXDM	对象代码，学生：学生代码，班级：班级代码
                      TJDM	推荐代码，对应TJGWK的ID
                    * */
                    TJDXK.append("dxlx", 2);
                    TJDXK.append("dxdm", this.selectClassList[j]);
                    TJDXK.append("tjdm", response.data.data.id);

                    axios.post("/tjgwk/insertTjdxk", TJDXK).then(response2 => {
                      if (response2.data.result) {
                        this.$message.success('对象推荐成功:' + i + '-' + j);
                      } else {
                        this.$message.error('对象推荐失败:' + response2.data.msg);
                      }
                    }).catch(error => {
                      this.$message.error('对象推荐失败:' + error.message);
                    });
                  }

                } else if (this.recommendToStudent) {
                  for (let j = 0; j < this.selectStudentList.length; j++) {
                    let TJDXK = new FormData();
                    TJDXK.append("dxlx", 1);
                    TJDXK.append("dxdm", this.selectStudentList[j]);
                    TJDXK.append("tjdm", response.data.data.id);

                    axios.post("/tjgwk/insertTjdxk", TJDXK).then(response2 => {
                      if (response2.data.result) {
                        this.$message.success('对象推荐成功:' + i + '-' + j);
                      } else {
                        this.$message.error('对象推荐失败:' + response2.data.msg);
                      }
                    }).catch(error => {
                      this.$message.error('对象推荐失败:' + error.message);
                    });
                  }}
              } else {
                this.$message.error('推荐失败:' + response.data.msg);
              }
            } ).catch(error => {
              this.$message.error('推荐失败:' + error.message);
            });

          }


        } else {
          console.warn('表单校验未通过');
        }
      });
    },
    onTypeChange() {
      // 确保只能勾选一个
      if (this.recommendToClass && this.recommendToStudent) {
        this.recommendToClass = false;
        this.recommendToStudent = true;
      }

      // 清空不需要的字段
      if (!this.recommendToClass) this.form.classId = '';
      if (!this.recommendToStudent) this.form.studentId = '';
    },
    // 格式化日期
    formatDate(date) {
      return dayjs(date).format('YYYY-MM-DD HH:mm')
    },
    // 加载推荐岗位数据
     loadPosts() {
      this.loading = true
      axios.get("/tjgwk/gettjgwk",{params: {YHM: this.UserInfo.username, YHSFDM: 2}}).then(response => {
        if (response.data.result){
          this.allData = response.data.data
        }else{
          $.confirm({
            title: '<span style="color:red;font-weight:bold;">⚠ 错误</span>',
            content: `<div style="color:#b71c1c;font-size:16px;"><strong>${response.data.msg}</strong></div>`,
            type: 'red',
            backgroundDismiss: false, // 禁止点击空白关闭
            escapeKey: false,          // 禁止 ESC 关闭
            closeIcon: false,          // 关闭按钮隐藏
            theme: 'modern',           // 可选: 'material', 'modern', 'bootstrap'
            boxWidth: '400px',
            useBootstrap: false,       // 如果你不用 bootstrap 可禁用
            buttons: {
              confirm: {
                text: '我知道了',
                btnClass: 'btn-red',   // 使用内置红色按钮样式
              }
            }
          });

        }
        this.loading = false
      }).catch(error => {
        $.confirm({
          title: '<span style="color:red;font-weight:bold;">⚠ 错误</span>',
          content: `<div style="color:#b71c1c;font-size:16px;"><strong>${error.message}</strong></div>`,
          type: 'red',
          backgroundDismiss: false, // 禁止点击空白关闭
          escapeKey: false,          // 禁止 ESC 关闭
          closeIcon: false,          // 关闭按钮隐藏
          theme: 'modern',           // 可选: 'material', 'modern', 'bootstrap'
          boxWidth: '400px',
          useBootstrap: false,       // 如果你不用 bootstrap 可禁用
          buttons: {
            confirm: {
              text: '我知道了',
              btnClass: 'btn-red',   // 使用内置红色按钮样式
            }
          }
        });

      })

    },
    // 获取当前用户发布的岗位--启用的
    getJobData() {
      axios.get("/dataGwdmk/getGwdmkDataToInterface", {
        params: {
          IsJustOne: 0,
          gwdm: 0,
          QYDM: 1,
          IsByFBZ: 0,
          FBZ: -1,
          SXBZ: 2
        }
      }).then(res => {
        if (res.data.result) {
          this.GWDMK = res.data.data;
          // 重新根据发布时间排序
          this.GWDMK.sort((a, b) => new Date(b.FBSJ) - new Date(a.FBSJ));
        } else {
          this.$message.error('获取职位信息失败:' + res.data.msg);
        }
      }).catch(error => {
        this.$message.error('获取职位信息失败:' + error.message);
      });
    },
    // 获取班级代码
    getClass(){
      axios.get("/class/getAllBjdmkByTeacher?jsid="+this.UserInfo.id).then(response => {
        if (response.data.result){
          this.classList = response.data.data
        }else{
          this.$message.error('获取班级信息失败:' + response.data.msg);
        }
      }).catch(error => {
        this.$message.error('获取班级信息失败:' + error.message);
      });
    },
    getJsdmkData(){
      axios.get("/teacher/getTeacherByUsername?username="+this.UserInfo.username).then(response => {
        if (response.data.result){
          this.JSDMK = response.data.data
          this.UserInfo.id = this.JSDMK.id;
        }else{
          $.confirm({
            title: '<span style="color:red;font-weight:bold;">⚠ 错误</span>',
            content: `<div style="color:#b71c1c;font-size:16px;"><strong>${response.data.msg}</strong></div>`,
            type: 'red',
            backgroundDismiss: false, // 禁止点击空白关闭
            escapeKey: false,          // 禁止 ESC 关闭
            closeIcon: false,          // 关闭按钮隐藏
            theme: 'modern',           // 可选: 'material', 'modern', 'bootstrap'
            boxWidth: '400px',
            useBootstrap: false,       // 如果你不用 bootstrap 可禁用
            buttons: {
              confirm: {
                text: '我知道了',
                btnClass: 'btn-red',   // 使用内置红色按钮样式
              }
            }
          });
        }
      }).catch(error => {
        $.confirm({
          title: '<span style="color:red;font-weight:bold;">⚠ 错误</span>',
          content: `<div style="color:#b71c1c;font-size:16px;"><strong>${error.message}</strong></div>`,
          type: 'red',
          backgroundDismiss: false, // 禁止点击空白关闭
          escapeKey: false,          // 禁止 ESC 关闭
          closeIcon: false,          // 关闭按钮隐藏
          theme: 'modern',           // 可选: 'material', 'modern', 'bootstrap'
          boxWidth: '400px',
          useBootstrap: false,       // 如果你不用 bootstrap 可禁用
          buttons: {
            confirm: {
              text: '我知道了',
              btnClass: 'btn-red',   // 使用内置红色按钮样式
            }
          }
        });
      })
    },
    getLoginUserInfo() {
      axios.get('/user/checkSession').then(response => {
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
          this.getJsdmkData();
          this.loadPosts();
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'Login'});
        }, 1000);
      });
    },
    // 应用筛选条件，重置到第一页
    applyFilters() {
      this.currentPage = 1
    },
    // 重置筛选条件
    resetFilters() {
      this.filterParams = { GWMC: '', FBSJ: [], GWFL: '', SFTJ: false }
      this.applyFilters()
    },
    // 页码改变时触发
    handlePageChange(page) {
      this.currentPage = page
    },
    // 切换推荐状态
    toggleRecommend(row) {
      row.SFTJ = !row.SFTJ
    },
    loadStudents() {
      axios.get(`/student/getStudentDataNewInterface?YHM=${this.UserInfo.username}&YHSFDM=3&QYDM=2`).then(response => {
            this.studentList = response.data.data;
          })
          .catch(error => {
            console.error('加载学生数据失败', error);
            this.$message.error('加载学生数据失败:' + error.message);
          });
    },
    // 新增岗位
    handleAdd() {
      //this.currentPost = this.emptyPost()
      console.log("新增岗位")
      this.dialogVisible = true
      console.log(this.dialogVisible)
      this.dialogTitle = '新增岗位'
      if (this.GWDMK.length === 0){
        this.getJobData();
      }
      if (this.studentList.length === 0){
          this.loadStudents();
      }

      if (this.classList.length === 0){
        this.getClass();
      }
    },
    // 编辑岗位
    handleEdit(row) {
      this.currentPost = { ...row }
      this.dialogTitle = '编辑岗位'
      this.dialogVisible = true
    },
    // 返回一个空的岗位对象
    emptyPost() {
      return { GWID: '', GWMC: '', ZDXX: 0, ZGXZ: 0, GZDD: [], SFTJ: false }
    }
  },
  mounted() {
    this.getLoginUserInfo()
  }
}
</script>

<style scoped>
.expand-content p {
  margin-bottom: 0.5rem;
  color: #4a5568;
}
</style>
