<template>
  <div class="content">
    <dw-menu />
    <main class="ml-64 flex-1 p-6 bg-gray-100 min-h-screen">
      <header class="flex justify-between items-center mb-6">
        <div>
          <h1 class="text-3xl font-bold text-gray-800">企业招聘管理中心</h1>
          <p class="text-sm text-gray-500 mt-1">欢迎回来，{{ DATADWDMK.dwmc+'-'+loginUser.name }}</p>
        </div>
        <div class="flex items-center space-x-4">
          <notification-bell />
          <el-button type="primary" icon="el-icon-plus" @click="postNewJob">发布新职位</el-button>
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
            <echarts :options="applicationChart" auto-resize style="height: 400px"/>
          </el-card>
        </el-col>

        <el-col :span="8">
          <el-card shadow="never" class="chart-card">
            <template #header>
              <span class="card-title">简历来源分析</span>
            </template>
            <echarts :options="sourceChart" auto-resize style="height: 400px"/>
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
                <el-button type="text">查看全部</el-button>
              </div>
            </template>
            <el-table :data="applications" style="width: 100%">
              <el-table-column prop="name" label="候选人" width="120">
                <template #default="{ row }">
                  <div class="flex items-center">
                    <el-avatar :size="30" :src="row.avatar" class="mr-2"></el-avatar>
                    {{ row.name }}
                  </div>
                </template>
              </el-table-column>
              <el-table-column prop="position" label="应聘职位" />
              <el-table-column prop="time" label="投递时间" width="140" />
              <el-table-column label="状态" width="100">
                <template #default="{ row }">
                  <el-tag :type="statusType[row.status]" size="small">
                    {{ row.status }}
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
import 'echarts/lib/chart/line'
import 'echarts/lib/chart/bar'
import 'echarts/lib/chart/pie'
import 'echarts/lib/component/tooltip'
import 'echarts/lib/component/legend'
import 'echarts/lib/component/title'
import DwMenu from "@/components/dw/Dw_menu.vue";
import axios from "axios";

export default {
  components: {DwMenu, ECharts},
  data() {
    return {
      companyName: "XX科技有限公司",
      timeRange: '7d',
      stats: [
        {label: '发布职位', value: 15, icon: 'suitcase', color: 'blue', trend: 'up', change: 12},
        {label: '收到简历', value: 234, icon: 'document', color: 'green', trend: 'up', change: 8},
        {label: '待处理简历', value: 42, icon: 'files', color: 'orange', trend: 'down', change: 5},
        {label: '安排面试', value: 68, icon: 'date', color: 'purple', trend: 'up', change: 20}
      ],
      applicationChart: {
        tooltip: {trigger: 'axis'},
        xAxis: {
          type: 'category',
          data: ['02-10', '02-11', '02-12', '02-13', '02-14', '02-15', '02-16'],
          axisLine: {lineStyle: {color: '#999'}}
        },
        yAxis: {type: 'value', axisLine: {show: false}},
        series: [{
          name: '简历投递量',
          type: 'line',
          smooth: true,
          itemStyle: {color: '#67C23A'},
          areaStyle: {color: 'rgba(103, 194, 58, 0.1)'},
          data: [45, 52, 38, 65, 49, 72, 60]
        }]
      },
      sourceChart: {
        tooltip: {trigger: 'item'},
        legend: {orient: 'vertical', right: 10},
        series: [{
          type: 'pie',
          radius: ['40%', '70%'],
          center: ['35%', '50%'],
          itemStyle: {borderRadius: 6},
          data: [
            {value: 156, name: '招聘平台', itemStyle: {color: '#409EFF'}},
            {value: 89, name: '企业官网', itemStyle: {color: '#67C23A'}},
            {value: 45, name: '校园宣讲', itemStyle: {color: '#E6A23C'}},
            {value: 34, name: '内推渠道', itemStyle: {color: '#F56C6C'}}
          ]
        }]
      },
      applications: [
        {
          name: '王小明',
          avatar: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',
          position: '前端开发工程师',
          time: '2024-02-16 14:30',
          status: '待处理'
        },{
          name: '王小明',
          avatar: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',
          position: '前端开发工程师',
          time: '2024-02-16 14:30',
          status: '待处理'
        },{
          name: '王小明',
          avatar: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',
          position: '前端开发工程师',
          time: '2024-02-16 14:30',
          status: '待处理'
        },{
          name: '王小明',
          avatar: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',
          position: '前端开发工程师',
          time: '2024-02-16 14:30',
          status: '待处理'
        },

      ],
      statusType: {
        '待处理': 'warning',
        '已查看': 'info',
        '已安排面试': 'success',
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
      loginUser: {
        username: null,  // 登录用户名
        name: null,  // 登录用户姓名
      },
      DATADWDMK: null,  // 所属单位信息
    }
  },
  mounted() {
    this.getLoginUser();
  },
  methods: {
    // 获取登录信息
    getLoginUser() {
      axios.get('/user/checkSession').then(response => {
        if (response.data.result) {
          this.loginUser.username = response.data.username;
          this.loginUser.name= response.data.name;
          console.log("单位用户："+this.loginUser.username);
          this.getDwYhmDyDw(this.loginUser.username);
        } else {
          this.$message.error("当前用户未登录，请先登录！");
          this.$router.push('/dw/login');
        }
      }).catch(error => {
        console.log(error);
      });
    },
    // 获取所属单位信息
    getDwYhmDyDw(yhm) {
      axios.get('/dw/getDwDataByDwUserName?dwUserName=' + yhm).then(response => {
        if (response.data.result) {
          this.DATADWDMK = response.data.data;
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
      // 发布新职位逻辑
      this.$router.push('/dw/addJob');
    },
    viewResume(row) {
      // 查看简历逻辑
    }
  }
}
</script>

<style scoped>
.icon-box {
  @apply w-12 h-12 rounded-lg flex items-center justify-center;
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
</style>