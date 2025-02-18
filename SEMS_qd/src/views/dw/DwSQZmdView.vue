<template>
  <div class="content">
    <div>
      <dw-menu/>
    </div>


    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <!--      <header class="flex justify-between items-center mb-6">
              <div>
                <h1 class="text-3xl font-bold text-gray-800">企业招聘管理中心</h1>
                <p class="text-sm text-gray-500 mt-1">欢迎回来 </p>
              </div>
              <div class="flex items-center space-x-4">

                <el-button type="primary" icon="el-icon-plus" >发布新职位</el-button>
              </div>
            </header>-->
      <header style="background-color: steelblue;" padding="20px;">
        <div class="  mx-auto px-4">
          <div class="flex justify-between items-center h-16" style="margin-bottom: 27px;">
            <!-- 左侧品牌和导航 -->
            <div class="flex items-center space-x-8">
              <!-- 品牌Logo -->
              <div class="flex items-center">
                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                </svg>
                <span class="ml-2 text-xl font-bold text-white">招聘中心</span>
              </div>

              <!-- 导航菜单 -->
              <nav class="hidden md:flex items-center space-x-6">
                <a href="#" class="text-gray-200 hover:text-white flex items-center transition-colors">
                  <i class="el-icon-s-home mr-1"></i>
                  首页
                </a>
                <a href="#" class="text-gray-200 hover:text-white flex items-center transition-colors">
                  <i class="el-icon-s-management mr-1"></i>
                  职位管理
                </a>
                <a href="#" class="text-gray-200 hover:text-white flex items-center transition-colors">
                  <i class="el-icon-user mr-1"></i>
                  候选人
                </a>
              </nav>
            </div>

            <!-- 右侧功能区域 -->
            <div class="flex items-center space-x-6">
              <!-- 通知按钮 -->
              <button class="text-gray-200 hover:text-white relative">
                <i class="el-icon-bell text-xl"></i>
                <span class="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full"></span>
              </button>

              <!-- 用户头像和下拉菜单 -->
              <el-dropdown trigger="click">
                <div class="flex items-center cursor-pointer">
                  <el-avatar
                      src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
                      class="border-2 border-white"
                  ></el-avatar>
                  <span class="ml-2 text-gray-200 hover:text-white">{{ UserInfo.name }}</span>
                  <i class="el-icon-arrow-down el-icon--right text-gray-200"></i>
                </div>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item>
                    <i class="el-icon-user mr-2"></i>个人中心
                  </el-dropdown-item>
                  <el-dropdown-item>
                    <i class="el-icon-setting mr-2"></i>账户设置
                  </el-dropdown-item>
                  <el-dropdown-item divided>
                    <i class="el-icon-switch-button mr-2"></i>退出登录
                  </el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>

              <!-- 发布按钮 -->
              <el-button
                  type="text"
                  icon="el-icon-plus">
                发布职位
              </el-button>
            </div>
          </div>
        </div>
      </header>


      <!-- 顶部header为统计板块 -->
      <el-row :gutter="20" class="stats-panel mb-4">
        <el-col :span="6">
          <el-card shadow="hover" class="stats-card primary">
            <div class="flex items-center">
              <i class="el-icon-document stats-icon"></i>
              <div class="ml-3">
                <div class="text-sm text-gray-500">总投递数</div>
                <div class="text-2xl">{{ tableData.length }}</div>
              </div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="hover" class="stats-card warning">
            <div class="flex items-center">
              <i class="el-icon-time stats-icon"></i>
              <div class="ml-3">
                <div class="text-sm text-gray-500">待确认</div>
                <div class="text-2xl">{{ tableData.filter(item => item.QRDM === 0).length }}</div>
              </div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="hover" class="stats-card success">
            <div class="flex items-center">
              <i class="el-icon-check stats-icon"></i>
              <div class="ml-3">
                <div class="text-sm text-gray-500">已确认</div>
                <div class="text-2xl">{{ tableData.filter(item => item.QRDM === 1).length }}</div>
              </div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="hover" class="stats-card info">
            <div class="flex items-center">
              <i class="el-icon-files stats-icon"></i>
              <div class="ml-3">
                <div class="text-sm text-gray-500">岗位总数</div>
                <div class="text-2xl">22</div>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>


      <div class="app-container">
        <!-- 搜索筛选区域 -->
        <el-card shadow="never" class="search-card">
          <el-form :inline="true" :model="searchForm">
            <el-form-item label="学生姓名">
              <el-input v-model="searchForm.xsxm" placeholder="请输入姓名" clearable></el-input>
            </el-form-item>
            <el-form-item label="学号">
              <el-input v-model="searchForm.xsxh" placeholder="请输入学号" clearable></el-input>
            </el-form-item>
            <el-form-item label="投递时间">
              <el-date-picker
                  v-model="searchForm.timeRange"
                  type="daterange"
                  range-separator="至"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期">
              </el-date-picker>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="handleSearch">查询</el-button>
              <el-button @click="resetSearch">重置</el-button>
            </el-form-item>
          </el-form>
        </el-card>

        <!-- 数据表格 -->
        <el-card shadow="never" class="table-card">
          <el-table
              :data="tableData"
              stripe
              border
              highlight-current-row
              @current-change="handleSelectionChange"
              style="width: 100%"
              :row-class-name="tableRowClassName"
              v-loading="loading">
            <el-table-column type="expand">
              <template #default="{row}">
                <div class="expand-content">
                  <p><span class="label">留言内容：</span>{{ row.LYNR || '无' }}</p>
                  <p><span class="label">政治面貌：</span>{{ row.ZZMM }}</p>
                  <p><span class="label">学历：</span>{{ row.XLMC }}</p>
                  <p><span class="label">投递说明：</span>{{ row.TDSM }}</p>
                </div>
              </template>
            </el-table-column>
            <el-table-column prop="ID" label="序号" width="80" sortable></el-table-column>
            <el-table-column prop="GWMC" label="岗位名称" width="180"></el-table-column>
            <!--  单击学生姓名：查看学生信息-->
            <el-table-column prop="XSXM" label="姓名" @click="ShowStudentInfo(scope.row)" width="120"></el-table-column>
            <!-- 图片列 -->
            <el-table-column label="图片" width="120" align="center">
              <template #default="{ row }">
                <el-image
                    style="width: 80px; height: 100px"
                    :src="row.XSZP"
                    :preview-src-list="[row.XSZP]"
                    fit="cover">
                </el-image>
              </template>
            </el-table-column>
            <el-table-column prop="XSXH" label="学号" width="150"></el-table-column>
            <el-table-column prop="BJMC" label="班级" width="200"></el-table-column>
            <el-table-column prop="GSMC" label="公司名称" width="200"></el-table-column>
            <el-table-column prop="TDSJ" label="投递时间" width="180" sortable>
              <template #default="{row}">
                {{ formatDate(row.TDSJ) }}
              </template>
            </el-table-column>

            <el-table-column label="确认状态" width="120">
              <template #default="{row}">
                <el-tag :type="row.QRDM === 1 ? 'success' : 'warning'">
                  {{ row.QRDM === 1 ? '已确认' : '待确认' }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column label="回应状态" width="120">
              <template #default="{row}">
                <el-tag :type="row.HYDM === 1 ? 'success' : 'warning'">
                  {{ row.HYDM === 1 ? '已回应' : '待回应' }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="200" fixed="right">
              <template #default="{row}">
                <el-button size="mini" style="position: relative;left: 8px;" @click="handleDetail(row)"><i
                    class="el-icon-view"></i>>投递详情
                </el-button>
                <el-button size="mini" @click="ShowJobDetail(row)"><i class="el-icon-edit"></i>>岗位详情</el-button>
                <el-button
                    size="mini"
                    @click="handleConfirm(row)"
                    v-show="row.QRDM === 0">
                  <i class="el-icon-delete"></i>
                  投递确认
                </el-button>

                <el-button
                    size="mini"
                    type="danger"
                    @click="handleResponse(row)"
                    v-show="row.QYDM === 1 && row.QRDM === 1">
                  <i class="el-icon-delete"></i>
                  回应
                </el-button>


              </template>
            </el-table-column>
          </el-table>

          <!-- 分页 -->
          <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="pagination.current"
              :page-sizes="[4, 5, 6, 7, 8, 9, 10]"
              :page-size="pagination.size"
              layout="total, sizes, prev, pager, next, jumper"
              :total="pagination.total">
          </el-pagination>
        </el-card>

        <!-- 详情对话框 -->
        <el-dialog title="投递详情" :visible.sync="detailVisible" width="900px">
          <el-descriptions :column="2" border>
            <el-descriptions-item label="学生姓名">{{ currentRow.XSXM }}</el-descriptions-item>
            <el-descriptions-item label="学号">{{ currentRow.XSXH }}</el-descriptions-item>
            <el-descriptions-item label="性别">{{ currentRow.XSXB }}</el-descriptions-item>
            <el-descriptions-item label="政治面貌">{{ currentRow.ZZMM }}</el-descriptions-item>
            <el-descriptions-item label="班级">{{ currentRow.BJMC }}</el-descriptions-item>
            <el-descriptions-item label="学历">{{ currentRow.XLMC }}</el-descriptions-item>
            <el-descriptions-item label="岗位名称">{{ currentRow.GWMC }}</el-descriptions-item>
            <el-descriptions-item label="公司名称">{{ currentRow.GSMC }}</el-descriptions-item>
            <el-descriptions-item label="投递时间" :span="2">
              {{ formatDate(currentRow.TDSJ) }}
            </el-descriptions-item>
            <el-descriptions-item label="留言内容" :span="2">
              {{ currentRow.LYNR || '无' }}
            </el-descriptions-item>
          </el-descriptions>
          <div style="margin-top: 20px;" v-show="isShowTDQR">
            <el-button type="success" @click="DwConfirm(currentRow)">确认</el-button>
            <el-button type="default" @click="detailVisible = false">关闭</el-button>
          </div>
        </el-dialog>
        <el-dialog title=回应对话框 :visible.sync="isShowResponse" width="900px">
          <el-form :model="responseForm" label-width="100px" label-position="top" :rules="responseFormRules">
<!--            0 不录用，2 安排面试  3 录用 4 待定-->
            <el-form-item label="投递结果" prop="hyjg">
              <el-select v-model="responseForm.hyjg">
                <el-option label="请选择" ></el-option>
                <el-option label="安排面试" value="2"></el-option>
                <el-option label="录用"  value="3"></el-option>
                <el-option label="待定" value="4"></el-option>
                <el-option label="不录用" value="0"></el-option>
              </el-select>
            </el-form-item>
             <el-form-item label="回应内容"  prop="hynr">
              <el-input type="textarea"  rows="5" v-model="responseForm.hynr" placeholder="请输入回应内容"></el-input>
            </el-form-item>
          </el-form>
          <div style="margin-top: 20px;">
            <el-button type="success" @click="handleResponseSubmit">提交</el-button>
            <el-button type="default" @click="isShowResponse = false">关闭</el-button>
            <el-button type="danger" @click="isShowResponse = false">取消</el-button>
          </div>
        </el-dialog>

      </div>

    </main>


  </div>
</template>


<script>
import axios from 'axios'
import StudentMenu from "@/components/student/Student_menu.vue";
import {EventBus} from "@/event-bus";
import DwMenu from "@/components/dw/Dw_menu.vue";

export default {
  components: {DwMenu},
  data() {
    return {
      responseFormRules: {
        hynr: [
          { required: true, message: '请输入回应内容', trigger: 'blur' },
          { min: 5, max: 500, message: '长度在 5 到 500 个字符', trigger: 'blur' }
        ],
        hyjg: [
          { required: true, message: '请选择回应结果', trigger: 'change' }
        ]
      },
      responseForm: {
        id:null,
        hynr:null,// 回应内容
        dwyh:null, // 单位用户名
        hyjg:null,// 回应结果
      },/*回应内容*/
      isShowResponse: false,// 回应对话框是否显示
      seletectedRows: [],
      isShowTDQR: false,
      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      searchForm: {
        xsxm: '',
        xsxh: '',
        timeRange: []
      },
      tableData: [],
      loading: false,
      pagination: {
        current: 1,
        size: 5,
        total: 0
      },
      detailVisible: false,
      currentRow: {},
      allData: [],// 所有数据
    }

  },
  mounted() {
    this.pagination = {
      current: 1,
      size: 4,
      total: 0
    }
    this.getLoginUserInfo()
  },
  methods: {
    handleResponseSubmit(){
      // 当前用户名
      let ResponseForm=new FormData();
      ResponseForm.append('id',this.responseForm.id);
      ResponseForm.append('hynr',this.responseForm.hynr);
      ResponseForm.append('dwyh',this.UserInfo.username);
      ResponseForm.append('hyjg',this.responseForm.hyjg);
      console.log(ResponseForm);
    
    },
    handleResponse(row) {
      this.isShowResponse = true;
    /*  axios.get("/tdjlk/dwqr?id=" + row.ID).then(res => {
        if (res.data.result) {
          this.$message.success('回应成功！');
          // 刷新数据
          this.loadData();  // 刷新数据
        } else {
          this.$message.error('回应失败：' + res.data.msg);
        }
      }).catch(err => {
        console.log(err);
        this.$message.error('回应失败，请重试！');
      })*/
    },


// 处理选中行
    handleSelectionChange(val) {
      console.log(val);
    }
    ,
// 查看学生信息
    ShowStudentInfo(row) {
      console.log("跳转到学生信息页面:");
      console.log(row);
    }
    ,
// 查看岗位详情
    ShowJobDetail(row) {
      console.log("跳转到岗位详情页面");
      console.log(row.GWDM);
      this.$router.push({path: '/dw/jobDetail', query: {id: row.GWDM}})
    }
    ,
// 投递确认
    handleConfirm(row) {
      this.currentRow = row;
      this.isShowTDQR = true;
      this.detailVisible = true;
    }
    ,
    DwConfirm(row) {
      console.log(row);
      axios.get("/tdjlk/dwqr?id=" + row.ID).then(res => {
        if (res.data.result) {
          this.$message.success('确认成功！');
          // 刷新数据
          this.loadData();

        } else {
          this.$message.error('确认失败：' + res.data.msg);
        }
      }).catch(err => {
        console.log(err);
        this.$message.error('确认失败，请重试！');
      })

    }
    ,
    async getLoginUserInfo() {
      await axios.get('/user/checkSession').then(response => {
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({name: 'StudentLoginView'});
          }, 1000);
        } else {
          console.log('登录成功-----！');
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.loadData();// 加载数据
          console.log(this.UserInfo);
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'StudentLoginView'});
        }, 1000);
      });
    }
    ,
    formatDate(dateStr) {
      return dateStr ? new Date(dateStr).toLocaleString() : '-'
    }
    ,
    handleSearch() {
      this.loadData()
    }
    ,
    resetSearch() {
      this.searchForm = {
        xsxm: '',
        xsxh: '',
        timeRange: []
      }
      this.loadData()
    }
    ,
    handleDetail(row) {
      this.currentRow = row
      this.detailVisible = true
    }
    ,


    /*   loadData() {
         // 这里应调用API接口
         this.loading = true
         axios.get("/tdjlk/getTdjlk?Style=1&YHM=&GWDM=1").then((response) => {
           if (response.data.result) {
             this.tableData = response.data.data
             this.pagination.total = this.tableData.length
           } else {
             this.$message.error('加载失败，请重试!11')
           }
           this.loading = false
         }).catch(() => {
           this.loading = false
           this.$message.error('加载失败，请重试!')
         })
       }*/
    loadData() {
      this.loading = true
      // 通过学生用户名 获取投递数据
      axios.get(`/tdjlk/getTdjlk?Style=4&YHM=${this.UserInfo.username}&GWDM=1`).then((response) => {
        if (response.data.result) {
          // 假设接口返回数据结构为 { records: [], total: 100 }
          this.allData = response.data.data;  // 获取所有数据
          this.pagination.total = this.allData.length;  // 更新总记录数

          // 计算当前页的数据
          const start = (this.pagination.current - 1) * this.pagination.size;
          const end = start + this.pagination.size;
          this.tableData = this.allData.slice(start, end);  // 切片获取当前页数据
        } else {
          this.$message.error('加载失败，请重试!')
        }
        this.loading = false
      }).catch(() => {
        this.loading = false
        this.$message.error('加载失败，请重试!')
      })
    }
    ,
// 分页事件处理
    handleSizeChange(newSize) {
      this.pagination.size = newSize
      this.pagination.current = 1 // 切换每页大小时回到第一页
      this.loadData()
    }
    ,
    handleCurrentChange(newPage) {
      this.pagination.current = newPage
      this.loadData()
    }
    ,
    tableRowClassName(row, rowIndex) {
      /* if (rowIndex === 0) {
         return 'warning-row';
       } else if (rowIndex === 3) {
         return 'success-row';
       }
       return '';*/
      return 'warning-row';
    }
  }
}
</script>

<style scoped>
.app-container {
  padding: 10px;
}

.p-6 {
  padding: 0 !important;
}

.mb-4 {
  margin-bottom: -0.5rem !important;
}

.search-card {
  margin-bottom: 20px;
}

.table-card {
  margin-bottom: 20px;
}

.expand-content {
  padding: 0 20px;
}

.expand-content p {
  margin: 5px 0;
}

.label {
  color: #99a9bf;
  margin-right: 10px;
}

.el-pagination {
  margin-top: 20px;
  text-align: right;
}


.stats-panel {
  margin: -20px; /* 抵消el-row的默认边距 */
  padding: 10px;
}

.stats-card {
  border-radius: 8px;
  border-left: 4px solid;
}

.stats-card.primary {
  border-color: #409EFF;
}

.stats-card.warning {
  border-color: #E6A23C;
}

.stats-card.success {
  border-color: #67C23A;
}

.stats-card.info {
  border-color: #909399;
}

.stats-icon {
  font-size: 32px;
  padding: 12px;
  background: rgba(64, 158, 255, .1);
  border-radius: 50%;
}

.stats-card.primary .stats-icon {
  color: #409EFF;
  background: rgba(64, 158, 255, .1);
}

.stats-card.warning .stats-icon {
  color: #E6A23C;
  background: rgba(230, 162, 60, .1);
}

.stats-card.success .stats-icon {
  color: #67C23A;
  background: rgba(103, 194, 58, .1);
}

.stats-card.info .stats-icon {
  color: #909399;
  background: rgba(144, 147, 153, .1);
}

.el-table .warning-row {
  background: oldlace;
}

.el-table .success-row {
  background: #f0f9eb;
}
</style>