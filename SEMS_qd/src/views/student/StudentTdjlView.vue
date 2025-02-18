<template>
  <div class="content">
    <div>
      <StudentMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">

      <header class="flex justify-between items-center mb-4" style="padding: 27px 0;">
        <h1 class="text-2xl font-semibold">{{ UserInfo.username + '-' + UserInfo.name }} 的投递记录</h1>
      </header>
      <!-- 顶部header为统计板块 -->
      <el-row :gutter="20" class="stats-panel mb-4">
        <el-col :span="6">
          <el-card shadow="hover" class="stats-card primary">
            <div class="flex items-center">
              <i class="el-icon-document stats-icon"></i>
              <div class="ml-3">
                <div class="text-sm text-gray-500">总投递数</div>
                <div class="text-2xl">45</div>
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
                <div class="text-2xl">23</div>
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
                <div class="text-2xl">11</div>
              </div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="hover" class="stats-card info">
            <div class="flex items-center">
              <i class="el-icon-files stats-icon"></i>
              <div class="ml-3">
                <div class="text-sm text-gray-500">简历总数</div>
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
              style="width: 100%"
              :row-class-name="tableRowClassName"
              @sort-change="handleSortChange"
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
            <el-table-column prop="YHXM" label="发布者" width="180"></el-table-column>
            <el-table-column prop="GSMC" label="公司名称" width="200"></el-table-column>
            <el-table-column prop="TDSJ" label="投递时间" width="180" sortable>
              <template #default="{row}">
                {{ formatDate(row.TDSJ) }}
              </template>
            </el-table-column>

            <el-table-column prop="XSXM" label="姓名" width="120"></el-table-column>
            <el-table-column prop="XSXH" label="学号" width="150"></el-table-column>
            <el-table-column prop="BJMC" label="班级" width="200"></el-table-column>

            <el-table-column label="状态" width="120" fixed="left">
              <template #default="{row}">
                <el-tag :type="row.QRDM === 1 ? 'success' : 'warning'">
                  {{ row.QRDM === 1 ? '已确认' : '待确认' }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="200" fixed="right">
              <template #default="{row}">
                <el-button size="mini" @click="handleDetail(row)"><i class="el-icon-view"></i>>详情</el-button>
                <el-button size="mini" @click="ShowJobDetail(row)"><i class="el-icon-edit"></i>>岗位详情</el-button>
                <el-button
                    size="mini"
                    type="danger"
                    @click="handleDelete(row)"
                    v-show="row.QYDM === 1">
                  <i class="el-icon-delete"></i>
                  撤销投递
                </el-button>

                <el-button
                    size="mini"
                    type="success"
                    @click="QyTd(row)"
                    v-show="row.QYDM === 0">
                  <i class="el-icon-check"></i>
                  继续投递
                </el-button>
                <el-button
                    size="mini"
                    type="danger"
                    @click="deleteTdjl(row)"
                    v-show="row.QYDM === 0">
                  <i class="el-icon-delete"></i>
                  删除投递
                </el-button>
              </template>
            </el-table-column>
          </el-table>

          <!-- 分页
          size-change：每页条数变化时触发
          current-change：当前页变化时触发
          prev-click：上一页按钮被点击时触发
          next-click：下一页按钮被点击时触发
          page-size-change：每页条数变化时触发
          -->
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
        </el-dialog>
      </div>
    </main>
  </div>
</template>


<script>
import axios from 'axios'
import StudentMenu from "@/components/student/Student_menu.vue";
import {EventBus} from "@/event-bus";
export default {
  components: {StudentMenu},
  data() {
    return {
      allData: [],// 所有数据
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
      currentRow: {}
    }

  },
  mounted() {
    this.pagination = {
      current: 1,
      size: 5,
      total: 0
    }
    this.getLoginUserInfo()
  },
  methods: {
    // 删除投递记录
    deleteTdjl(row) {
      this.$confirm('确定删除该投递记录吗？', '提示', {
        type: 'warning'
      }).then(() => {
        let postData = new FormData();
        postData.append('id', row.ID);
        axios.post('/tdjlk/deleteTdjlkById', postData).then((response) => {
          if (response.data.result) {
            this.$message.success('删除投递记录成功!')
            this.loadData()
          } else {
            this.$message.error('删除失败：' + response.data.msg)
          }
        }).catch((error) => {
          this.$message.error('删除失败：' + error.message);
        })

      }).catch(() => {
        this.$message.info('已取消操作')
      })
    },
    // 监听列排序修改
    handleSortChange({ column, property, order }) {
      // column: 被排序的列对象
      // property: 列的字段名称
      // order: 当前排序方法，例如 'ascending' 或 'descending'

      if (order === 'ascending') {
        this.tableData.sort((a, b) => a[property] - b[property]); // 假设是数字排序
      } else if (order === 'descending') {
        this.tableData.sort((a, b) => b[property] - a[property]); // 假设是数字排序
      }
      // 如果是字符串，则可以使用 localeCompare 进行排序
    },
    // 查看岗位详情
    ShowJobDetail(row) {
      console.log("跳转到岗位详情页面");
      console.log(row.GWDM);
      this.$router.push({path: '/stu/jobDetail', query: {id: row.GWDM, title: '我的投递记录', from: '/stu/tdjl'}})
    },

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
          /*  // 获取学生id
            this.getStudentDataByUsername(this.UserInfo.username);*/
          console.log(this.UserInfo);
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'StudentLoginView'});
        }, 1000);
      });
    },
    formatDate(dateStr) {
      return dateStr ? new Date(dateStr).toLocaleString() : '-'
    },
    handleSearch() {
      this.loadData()
    },
    resetSearch() {
      this.searchForm = {
        xsxm: '',
        xsxh: '',
        timeRange: []
      }
      this.loadData()
    },
    handleDetail(row) {
      this.currentRow = row
      this.detailVisible = true
    },
    // 继续投递
    QyTd(row) {
      this.$confirm('确定继续投递该岗位吗？', '提示', {
        type: 'warning'
      }).then(() => {
        let postData = new FormData();
        postData.append('id', row.ID);
        postData.append('qyzt', 1);
        axios.post('/tdjlk/UpdateTdjlkQyztById', postData).then((response) => {
          if (response.data.result) {
            this.$message.success('继续投递成功!')
            this.loadData()
          } else {
            this.$message.error('继续投递失败：' + response.data.msg)
          }
        }).catch((error) => {
          this.$message.info('继续投递失败：' + error.message);
        })

      }).catch(() => {
        this.$message.info('已取消操作')
      })
    },
    // 撤销投递
    handleDelete(row) {
      console.log(row.QRDM)
      if (row.QRDM === 1) {
        this.$message.warning('该投递记录已被单位确认，不能撤销！')
      } else {
        this.$confirm('确定撤销该投递记录吗？', '提示', {
          type: 'warning'
        }).then(() => {
          let postData = new FormData();
          postData.append('id', row.ID);
          postData.append('qyzt', 0);
          axios.post('/tdjlk/UpdateTdjlkQyztById', postData).then((response) => {
            if (response.data.result) {
              this.$message.success('撤销成功!')
              this.loadData()
            } else {
              this.$message.error('撤销失败：' + response.data.msg)
            }
          }).catch((error) => {
            this.$message.info('撤销失败：' + error.message);
          })

        }).catch(() => {
          this.$message.info('已取消操作')
        })
      }
    },
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
      this.loading = true;
      axios.get(`/tdjlk/getTdjlk?Style=2&YHM=${this.UserInfo.username}&GWDM=1`).then((response) => {
        if (response.data.result) {
          // 假设接口返回数据结构为 { records: [], total: 100 }
          this.allData = response.data.data;  // 获取所有数据
          this.pagination.total = this.allData.length;  // 更新总记录数

          // 计算当前页的数据
          const start = (this.pagination.current - 1) * this.pagination.size;
          const end = start + this.pagination.size;
          this.tableData = this.allData.slice(start, end);  // 切片获取当前页数据
        } else {
          this.$message.error('加载失败，请重试!');
        }
        this.loading = false;
      }).catch(() => {
        this.loading = false;
        this.$message.error('加载失败，请重试!');
      });
    }
    ,
    // 分页事件处理：每页条数变化时触发
    handleSizeChange(newSize) {
      this.pagination.size = newSize
      this.pagination.current = 1 // 切换每页大小时回到第一页
    //  this.loadData()
    }
    ,
    // 触发时机：分页组件的当前页发生变化时
    handleCurrentChange(newPage) {
      this.pagination.current = newPage
      // 计算当前页的数据
      const start = (this.pagination.current - 1) * this.pagination.size;
      const end = start + this.pagination.size;
      this.tableData = this.allData.slice(start, end);  // 切片获取当前页数据
    },
    tableRowClassName({row, rowIndex}) {
      if (rowIndex === 0) {
        return 'warning-row';
      } else if (rowIndex === 3) {
        return 'success-row';
      }
      return '';
    }
  }
}
</script>

<style scoped>
.app-container {
  /*padding: 20px;*/
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