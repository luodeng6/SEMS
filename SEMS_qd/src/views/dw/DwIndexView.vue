<template>
  <div class="content">
    <dw-menu />
    <main class="ml-64 flex-1 p-6 bg-gray-100 min-h-screen">
      <header class="flex items-center mb-6" style="justify-content: end">
        <div style="width: 64%;">
          <h1 class="text-3xl font-bold text-gray-800">企业招聘管理中心</h1>
          <p class="text-sm text-gray-500 mt-1">欢迎回来，{{ DATADWDMK.dwmc + '-' + loginUser.name }}</p>
        </div>
        <div class="mx-auto px-4">
          <div class="flex justify-between items-center h-16" style="margin-bottom: 27px;">
            <!-- 右侧功能区域 -->
            <div class="flex items-center space-x-6">

              <!-- 通知按钮和弹窗 -->
              <el-popover
                  placement="bottom-end"
                  width="400"
                  trigger="click"
                  popper-class="notification-popover">
                <div class="notification-container">
                  <div class="message-list">
                    <div
                        v-for="(message, index) in currentPageMessages"
                        :key="index"
                        class="message-card"
                        @click="markAsRead(message)"
                    >
                      <!--                 "CFZ": "20213260024",
                                          "CFZXM": "陈兴远",
                                          "CFZXW": "学生确认了面试",
                                          "JSZ": "msk",
                                          "JSZXM": "Elon Reeve Musk",
                                          "DZNR": "学生:陈兴远,确认了面试:“特斯拉销售代表”",
                                          "YDBZ": 0,
                                          "DZLX": 10,
                                          "CFSJ": "2025-02-28T06:44:33.453+00:00"
                                          },-->

                      <!-- 用户头像 -->
                      <el-avatar :size="40" :src="message.YHZP" class="mr-3"></el-avatar>
                      <div class="message-content">
                        <div class="message-header">
                          <span class="sender">{{ message.CFZXM }}</span>
                          <span class="time">{{formatDate(message.CFSJ)  }}</span>
                        </div>
                        <p>{{ message.DZNR }}</p>
                      </div>

                      <!-- 未读红点 -->
                      <div v-if="!message.YDBZ" class="unread-dot"></div>
                    </div>
                  </div>
                  <!-- 分页 -->
                  <el-pagination
                      :current-page.sync="currentPage"
                      :page-size="pageSize"
                      :total="messages.length"
                      layout="prev, pager, next"
                      class="pagination"
                      @current-change="handlePageChange"
                  />
                </div>
                <!-- 触发按钮 -->
                <button slot="reference" class="hover:text-slate-600 relative">
                  <i class="el-icon-bell text-xl"></i>
                  <span v-show="(messages.filter(message => message.YDBZ===0).length)!== 0" class="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full"></span>
                </button>
              </el-popover>

              <!-- 用户头像和下拉菜单 -->
              <el-dropdown trigger="click">
                <div class="flex items-center cursor-pointer">
                  <el-avatar
                      src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
                      class="border-2 hover:text-slate-600"
                  ></el-avatar>
                  <span class="ml-2 hover:text-slate-600">{{ loginUser.name }}</span>
                  <i class="el-icon-arrow-down el-icon--right"></i>
                </div>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item><i class="el-icon-user mr-2"></i>个人中心</el-dropdown-item>
                  <el-dropdown-item><i class="el-icon-setting mr-2"></i>账户设置</el-dropdown-item>
                  <el-dropdown-item divided><i class="el-icon-switch-button mr-2"></i>退出登录</el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>

              <!-- 原消息按钮 -->
              <button class="hover:text-slate-600 relative" style="display: flex; color: #606266; align-items: center;">
                <i class="el-icon-message text-xl"></i> 消息
              </button>
            </div>
          </div>
        </div>
      </header>

      <!-- 招聘数据概览 -->
      <el-row :gutter="20" class="mb-6">
        <el-col :span="6" v-for="(item, index) in stats" :key="index">
          <el-card shadow="hover" class="stat-card">
            <div class="flex items-center">
              <div :class="`icon-box bg-${item.color}-100`">
                <i :class="`el-icon-${item.icon} text-${item.color}-600`"></i>
              </div>
              <div class="ml-4">
                <div class="text-sm text-gray-500">{{ item.label }}</div>
                <div class="text-2xl font-bold">{{ item.value }}</div>
                <div class="text-xs mt-1" :class="`text-${item.color}-600`">
                  <i :class="item.trend === 'up' ? 'el-icon-top' : 'el-icon-bottom'"></i>
                  {{ item.change }}%
                </div>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <!-- 数据可视化区域 -->
      <el-row :gutter="20" class="mb-6">
        <el-col :span="16">
          <el-card shadow="never" class="chart-card">
            <template #header>
              <div class="flex justify-between items-center">
                <span class="card-title">职位申请趋势</span>
                <el-select v-model="timeRange" size="small" class="w-40">
                  <el-option label="最近7天" value="7d"></el-option>
                  <el-option label="最近30天" value="30d"></el-option>
                </el-select>
              </div>
            </template>
            <div id="main" style="width: 100%; height: 300px;"></div>
          </el-card>
        </el-col>
        <el-col :span="8">
          <el-card shadow="never" class="chart-card">
            <template #header>
              <span class="card-title">职位来源</span>
            </template>
          </el-card>
        </el-col>
      </el-row>

      <!-- 最新投递和系统公告 -->
      <el-row :gutter="20">
        <el-col :span="12">
          <el-card shadow="never" class="mb-6">
            <template #header>
              <div class="flex justify-between items-center">
                <span class="card-title">最新投递</span>
                <el-button @click="goToPageViewAllTdData" type="text">查看全部</el-button>
              </div>
            </template>
            <el-table :data="applications" style="width: 100%" :loading="loading">
              <el-table-column prop="XSXM" label="学生" width="120">
                <template #default="{ row }">
                  <div class="flex items-center">
                    <el-avatar :size="30" :src="row.XSZP" class="mr-2"></el-avatar>
                    {{ row.XSXM }}
                  </div>
                </template>
              </el-table-column>
              <el-table-column prop="GWMC" label="应聘职位" />
              <el-table-column prop="TDSJ" label="投递时间" width="180" sortable>
                <template #default="{row}">
                  {{ formatDate(row.TDSJ) }}
                </template>
              </el-table-column>
              <el-table-column label="状态" width="100">
                <template #default="{ row }">
                  <el-tag :type="statusType[getTdzt(row)]" size="small">
                    {{ getTdzt(row) }}
                  </el-tag>
                </template>
              </el-table-column>
              <el-table-column label="操作" width="120">
                <template #default="{ row }">
                  <el-button type="text" @click="viewResume(row)">查看简历</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-card>
        </el-col>

        <el-col :span="12">
          <el-card shadow="never">
            <template #header>
              <span class="card-title">系统公告</span>
            </template>
            <el-timeline>
              <el-timeline-item
                  v-for="(notice, index) in notices"
                  :key="index"
                  :timestamp="notice.time"
                  placement="top"
              >
                <div class="notice-item">
                  <div class="font-medium">{{ notice.title }}</div>
                  <div class="text-gray-600 text-sm mt-1">{{ notice.content }}</div>
                  <el-tag size="mini" class="mt-2" :type="notice.type">{{ notice.tag }}</el-tag>
                </div>
              </el-timeline-item>
            </el-timeline>
          </el-card>
        </el-col>
      </el-row>
    </main>
  </div>
</template>

<script>
import ECharts from 'vue-echarts'
import * as echarts from 'echarts';
import DwMenu from "@/components/dw/Dw_menu.vue";
import axios from "axios";

export default {
  components: { DwMenu, ECharts },
  data() {
    return {
      isTongZhiShow: false,
      loading: false,
      companyName: "XX科技有限公司",
      timeRange: '7d',
      stats: [
        { label: '发布职位', value: 15, icon: 'suitcase', color: 'blue', trend: 'up', change: 12 },
        { label: '收到简历', value: 234, icon: 'document', color: 'green', trend: 'up', change: 8 },
        { label: '待处理简历', value: 42, icon: 'files', color: 'orange', trend: 'down', change: 5 },
        { label: '安排面试', value: 68, icon: 'date', color: 'purple', trend: 'up', change: 20 }
      ],
      applicationChart: {
        tooltip: { trigger: 'axis' },
        xAxis: {
          type: 'category',
          data: ['02-10', '02-11', '02-12', '02-13', '02-14', '02-15', '02-16'],
          axisLine: { lineStyle: { color: '#999' } }
        },
        yAxis: { type: 'value', axisLine: { show: false } },
        series: [{
          name: '简历投递量',
          type: 'line',
          smooth: true,
          itemStyle: { color: '#67C23A' },
          areaStyle: { color: 'rgba(103, 194, 58, 0.1)' },
          data: [45, 52, 38, 65, 49, 72, 60]
        }]
      },
      sourceChart: {
        tooltip: { trigger: 'item' },
        legend: { orient: 'vertical', right: 10 },
        series: [{
          type: 'pie',
          radius: ['40%', '70%'],
          center: ['35%', '50%'],
          itemStyle: { borderRadius: 6 },
          data: [
            { value: 156, name: '招聘平台', itemStyle: { color: '#409EFF' } },
            { value: 89, name: '企业官网', itemStyle: { color: '#67C23A' } },
            { value: 45, name: '校园宣讲', itemStyle: { color: '#E6A23C' } },
            { value: 34, name: '内推渠道', itemStyle: { color: '#F56C6C' } }
          ]
        }]
      },
      applications: null,
      statusType: {
        '待处理': 'warning',
        '待回应': 'warning',
        '待录入': 'warning',
        '待安排面试': 'warning',
        '已录用': 'primary',
        '待定': 'info',
        '已拒绝': 'danger'
      },
      notices: [
        {
          time: '2024-02-16',
          title: '系统升级通知',
          content: '2月20日0:00-6:00进行系统维护升级',
          type: 'info',
          tag: '系统通知'
        },
        {
          time: '2024-02-15',
          title: '新功能上线',
          content: '简历智能筛选功能已上线，欢迎使用',
          type: 'success',
          tag: '功能更新'
        }
      ],
      loginUser: { username: null, name: null },
      DATADWDMK: null,
      // 消息通知数据
      messages: [],
      currentPage: 1,
      pageSize: 5
    }
  },
  computed: {
    currentPageMessages() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.messages.slice(start, end);
    }
  },
  mounted() {
    this.getLoginUser();
    this.showTjtData();
  },
  methods: {
    getXxdm(){
      /*{
      "CFZ": "20213260024",
          "CFZXM": "陈兴远",
          "CFZXW": "学生确认了面试",
          "JSZ": "msk",
          "JSZXM": "Elon Reeve Musk",
          "DZNR": "学生:陈兴远,确认了面试:“特斯拉销售代表”",
          "YDBZ": 0,
          "DZLX": 10,
          "CFSJ": "2025-02-28T06:44:33.453+00:00"
    },*/
      axios.get(`/xxdmk/getXxdmk?YHM=${this.loginUser.username}&YHSFDM=3`).then(response => {
        if (response.data.result){
          this.messages = response.data.data;
          // 不看自己发起的消息
          this.messages = this.messages.filter(message => message.CFZ !== this.loginUser.username);
        }else{
          console.error('获取消息信息失败,网络错误：'+ response.data.msg);
          this.$message.error('获取消息信息失败:'+response.data.msg);
        }
      }).catch(error => {
        console.error('获取消息信息失败,网络错误！', error);
        this.$message.error('获取消息信息失败:'+error.message);
      });
    },
    showTjtData() {
      var chartDom = document.getElementById('main');
      var myChart = echarts.init(chartDom, 'dark');
      var option = {
        xAxis: { type: 'category', data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'] },
        yAxis: { type: 'value' },
        series: [{ data: [820, 932, 901, 934, 1290, 1330, 1320], type: 'line', smooth: true }]
      };
      option && myChart.setOption(option);
    },
    formatDate(dateStr) {
      return dateStr ? new Date(dateStr).toLocaleString() : '-';
    },
    getTdzt(row) {
      if (row.QRDM === 0) return '待处理';
      else if (row.HYDM === 0) return '待回应';
      else if (row.TDJG === null) return '待录入';
      else {
        switch (row.TDJG) {
          case 0: return '不录用';
          case 1: return '已录用';
          case 2: return '待安排面试';
          case 3: return '待定';
        }
      }
    },
    getLoginUser() {
      axios.get('/user/checkSession').then(response => {
        if (response.data.result) {
          this.loginUser.username = response.data.username;
          this.loginUser.name = response.data.name;
          console.log("单位用户：" + this.loginUser.username);
          this.getDwYhmDyDw(this.loginUser.username);
          this.getTdData();
          this.getXxdm();
        } else {
          this.$message.error("当前用户未登录，请先登录！");
          this.$router.push('/dw/login');
        }
      }).catch(error => {
        console.log(error);
      });
    },
    getTdData() {
      this.loading = true;
      axios.get(`/tdjlk/getTdjlk?Style=4&YHM=${this.loginUser.username}&GWDM=1`).then((response) => {
        if (response.data.result) {
          this.applications = response.data.data;
        } else {
          this.$message.error('加载投递数据库失败:' + response.data.msg);
        }
        this.loading = false;
      }).catch((error) => {
        this.loading = false;
        this.$message.error('加载投递数据库失败:' + error.message);
      });
    },
    getDwYhmDyDw(yhm) {
      axios.get('/dw/getDwDataByDwUserName?dwUserName=' + yhm).then(response => {
        if (response.data.result) {
          this.DATADWDMK = response.data.data;
          this.showTjtData();
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
    postNewJob() {
      this.$router.push('/dw/addJob');
    },
    viewResume(row) {
      // 查看简历逻辑
    },
    goToPageViewAllTdData() {
      this.$router.push('/dw/sqzmd');
    },
    handlePageChange(page) {
      this.currentPage = page;
    },
    markAsRead(message) {
      message.isRead = true; // 标记消息为已读
    }
  }
}
</script>

<style scoped>
.icon-box {
  @apply w-12 h-12 rounded-lg flex items-center justify-center;
}
.px-4 {
  padding-left: 0px !important;
}
.stat-card {
  @apply transition-all duration-300 hover:transform hover:scale-105;
}
.chart-card {
  @apply border-0 bg-white rounded-lg shadow-sm;
}
.card-title {
  @apply text-lg font-semibold text-gray-800;
}
.notice-item {
  @apply p-3 bg-gray-50 rounded-lg hover:bg-blue-50 transition-colors;
}
:deep(.el-card__header) {
  @apply border-b-0;
}

/* 消息通知样式 */
.notification-popover {
  padding: 0 !important;
}
.notification-container {
  max-height: 400px;
  overflow-y: auto;
  padding: 10px;
}
.message-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.message-card {
  position: relative;
  display: flex;
  align-items: center;
  padding: 10px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  transition: all 0.3s ease;
}
.message-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}
.message-content {
  flex: 1;
}
.message-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 5px;
  font-size: 0.9em;
  color: #909399;
}
.sender {
  font-weight: bold;
  color: #303133;
}
.time {
  color: #909399;
}
.message-content p {
  margin: 0;
  font-size: 1em;
  color: #606266;
}
.unread-dot {
  position: absolute;
  top: 10px;
  right: 10px;
  width: 8px;
  height: 8px;
  background-color: red;
  border-radius: 50%;
}
.pagination {
  display: flex;
  justify-content: center;
  margin-top: 10px;
}
.el-pager li {
  border-radius: 4px;
  transition: background-color 0.2s;
}
.el-pager li:hover {
  background-color: #ecf5ff;
}
.el-pager li.active {
  background-color: #409eff;
  color: #fff;
}
</style>