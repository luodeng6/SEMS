
<template>
  <div class="content">
    <div>
      <teacher_menu></teacher_menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        招聘会审核
      </header>

      <!-- 数据统计 -->
      <div class="stats-container mb-4 "  >
        <el-row :gutter="20">
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">总记录数</div>
              <div class="stat-value">{{ total }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">通过率</div>
              <div class="stat-value">{{ passRate }}%</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">待处理</div>
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

      <!-- 表格 -->
      <el-table
          :data="tableData"
          v-loading="loading"
          style="width: 100%"
      >
        <el-table-column prop="ID" label="招聘会代码" width="100"></el-table-column>
        <el-table-column prop="ZPHBT" label="标题" width="300"></el-table-column>
        <el-table-column prop="WZBZ" label="位置" width="100">
          <template slot-scope="{row}">
            {{ row.WZBZ === 1 ? '校内' : '校外' }}
          </template>
        </el-table-column>
        <el-table-column prop="DWMC" label="单位名称" width="160"></el-table-column>
        <el-table-column prop="GSMC" label="公司名称" width="160"></el-table-column>
        <el-table-column prop="JBSJ" label="举办时间" width="160">
          <template slot-scope="{row}">
            {{ formatDate(row.JBSJ) }}
          </template>
        </el-table-column>
        <el-table-column prop="SZXX" label="所在学校" width="200"></el-table-column>
        <el-table-column prop="YYRS" label="预约人数" width="100" sortable></el-table-column>
        <el-table-column prop="SHDM" label="状态" width="120">
          <template slot-scope="{row}">
            <el-tag :type="statusTagType(row.SHDM)">
              {{ statusMap[row.SHDM] }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="FBZMC" label="发起者" width="100" ></el-table-column>
        <el-table-column prop="FBZSFDM" label="发起者身份" width="100" >
          <template slot-scope="{row}">
            {{ getRoleName(row.FBZSFDM) }}
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180">
          <template slot-scope="{row}">
            <el-button
                v-if="row.SHDM === 0"
                type="primary"
                size="mini"
                @click="handleAudit(row, 1)"
            >通过</el-button>
            <el-button
                v-if="row.SHDM === 0"
                type="danger"
                size="mini"
                @click="handleAudit(row, 2)"
            >拒绝</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <el-pagination
          class="mt-4"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[10, 20, 50]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
      ></el-pagination>
    </main>
  </div>
</template>

<script>
import teacher_menu from "@/components/teacher/Teacher_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";

export default {
  name: 'JobFairAudit',
  components: {teacher_menu},
  data() {
    return {
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
      tableData: [],
      statusMap: {
        0: '待审核',
        1: '已通过',
        2: '已拒绝'
      }
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
      }, {pending: 0, passed: 0, rejected: 0});
    },
    passRate() {
      if (this.total === 0) return 0;
      return ((this.stats.passed / this.total) * 100).toFixed(2);
    }
  },
  created() {
    this.getLoginUserInfo();

  },
  methods: {
    getRoleName(sfdm){
      if (sfdm === 1){
        return '管理员';
      }
      if (sfdm === 2){
        return '教师';
      }
      if (sfdm === 3){
        return 'HR';
      }
    },
    formatDate (input) {
      const date = new Date(input);

      const year = date.getFullYear();
      const month = date.getMonth() + 1; // 月份从 0 开始
      const day = date.getDate();
      const hour = date.getHours();
      const minute = date.getMinutes();

      return `${year}-${month}-${day} ${hour}:${minute}`;
    },
    statusTagType(status) {
      return {
        0: 'warning',
        1: 'success',
        2: 'danger'
      }[status];
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
    // 获取带分页的列表数据
    fetchTableData() {
      this.isLoading = true;
      axios.get("/datazphjlk/getDataZphjlk", {
        params: {
          QYDM: 1,
          ISJUSTONE: 0,
          ZPHID: -1,
          ISJUSTONEYH: 0,
          YHM: '-1',
          YHSFDM: 2,
          getBySHR:1,
          SHR: this.UserInfo.username,
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
    handleAudit(row, result) {
      row.SHDM = result;
      row.SHR = '当前教师';
      row.SHSJ = new Date().toLocaleString();
      console.log(row);
      let dataform = new FormData();
      dataform.append("id", row.ID);
      dataform.append("shdm", result);

      axios.post("/datazphjlk/updateDataZphjlk", dataform).then(res => {
        if (res.data.result) {
          this.$message({
            message: '操作成功',
            type: 'info'
          });
          this.fetchTableData();
        } else {
          this.$message({
            message: '操作失败：' + res.data.msg,
            type: 'error'
          });
        }
      }).catch(error => {
        console.error("操作失败", error);
        this.$message({
          message: '操作失败：' + error.message,
          type: 'error'
        });
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
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, .1);
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