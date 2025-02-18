<template>
  <div>
    <admin-menu></admin-menu>
    <!-- 主内容区域 -->
    <main class="ml-64 flex-1 p-6">
      <!-- 顶部标题栏 -->
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold text-gray-800">系统首页</h1>
        <div class="flex items-center space-x-4">
          <span class="text-gray-600">{{ this.UserInfo.role }}：{{ this.UserInfo.name }}</span>
          <button class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">
            退出登录
          </button>
        </div>
      </header>

      <!-- 统计卡片 -->
      <div class="grid grid-cols-4 gap-4 mb-6">
        <div class="bg-white p-4 rounded-lg shadow">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-gray-500">总学生数</p>
              <p class="text-2xl font-bold text-blue-600">3,245</p>
            </div>
            <i class="fas fa-users text-blue-400"></i>
          </div>
        </div>
        <div class="bg-white p-4 rounded-lg shadow">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-gray-500">已就业学生</p>
              <p class="text-2xl font-bold text-green-600">2,756</p>
            </div>
            <i class="fas fa-check-circle text-green-400"></i>
          </div>
        </div>
        <div class="bg-white p-4 rounded-lg shadow">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-gray-500">就业率</p>
              <p class="text-2xl font-bold text-yellow-600">85.2%</p>
            </div>
            <i class="fas fa-trending-up text-yellow-400"></i>
          </div>
        </div>
        <div class="bg-white p-4 rounded-lg shadow">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-gray-500">合作企业</p>
              <p class="text-2xl font-bold text-purple-600">127</p>
            </div>
            <i class="fas fa-building text-purple-400"></i>
          </div>
        </div>
      </div>

      <!-- 图表区域 -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- 专业学生数柱状图 -->
        <div class="bg-white shadow-lg rounded-lg p-4">
          <h2 class="text-lg font-semibold mb-4">各专业学生分布</h2>
          <canvas id="majorStudentsChart" width="300" height="200"></canvas>
        </div>

        <!-- 就业趋势折线图 -->
        <div class="bg-white shadow-lg rounded-lg p-4">
          <h2 class="text-lg font-semibold mb-4">学生就业趋势</h2>
          <canvas id="employmentTrendChart" width="300" height="200"></canvas>
        </div>

        <!-- 就业行业分布饼图 -->
        <div class="bg-white shadow-lg rounded-lg p-4">
          <h2 class="text-lg font-semibold mb-4">就业行业分布</h2>
          <canvas id="industryDistributionChart" width="300" height="200"></canvas>
        </div>

        <!-- 最新招聘信息 -->
        <div class="bg-white p-4 rounded-lg shadow lg:col-span-2">
          <h3 class="text-lg font-semibold mb-4">最新招聘信息</h3>
          <ul class="divide-y">
            <li class="py-2">
              <div class="flex justify-between">
                <span>阿里巴巴-软件开发工程师</span>
                <span class="text-gray-500">2024-03-15</span>
              </div>
            </li>
            <li class="py-2">
              <div class="flex justify-between">
                <span>腾讯-数据分析师</span>
                <span class="text-gray-500">2024-03-14</span>
              </div>
            </li>
            <li class="py-2">
              <div class="flex justify-between">
                <span>百度-产品经理</span>
                <span class="text-gray-500">2024-03-13</span>
              </div>
            </li>
          </ul>
        </div>

        <!-- 面试场次统计 -->
        <div class="bg-white shadow-lg rounded-lg p-4 lg:col-span-1">
          <h2 class="text-lg font-semibold mb-4">面试场次统计</h2>
          <canvas id="interviewSessionsChart" width="300" height="200"></canvas>
        </div>
      </div>
    </main>
  </div>
</template>

<script>

import AdminMenu from "@/components/admin/Admin_menu.vue"
import {Chart, registerables} from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';
// 注册 Chart.js 的所有模块和数据标签插件
Chart.register(...registerables);
Chart.register(ChartDataLabels);
import axios from 'axios';
import {EventBus} from "@/event-bus";

export default {
  components: {
    AdminMenu
  },
  name: "AdminIndex",
  data() {
    return {
      UserInfo: {
        name: '',
        role: '',
        username: '',
      }
    }
  },
  mounted() {

    this.getLoginUserInfo();

    // 专业学生数柱状图
    const majorCtx = document.getElementById('majorStudentsChart').getContext('2d');
    new Chart(majorCtx, {
      type: 'bar',
      data: {
        labels: ['计算机', '电子工程', '机械', '经济', '外语', '艺术'],
        datasets: [{
          label: '学生人数',
          data: [320, 250, 180, 220, 150, 100],
          backgroundColor: [
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 99, 132, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(153, 102, 255, 0.6)',
            'rgba(255, 159, 64, 0.6)'
          ]
        }]
      },
      options: {
        responsive: true,
        plugins: {
          datalabels: {
            color: 'black',
            anchor: 'end',
            align: 'top',
            formatter: Math.round
          }
        }
      },
      plugins: [ChartDataLabels]
    });

    // 就业趋势折线图
    const trendCtx = document.getElementById('employmentTrendChart').getContext('2d');
    new Chart(trendCtx, {
      type: 'line',
      data: {
        labels: ['2023-6', '2023-7', '2023-8', '2023-9', '2023-10', '2023-11', '2023-12'],
        datasets: [{
          label: '就业人数',
          data: [50, 75, 120, 180, 220, 280, 320],
          borderColor: 'rgba(75, 192, 192, 1)',
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          tension: 0.4
        }]
      },
      options: {
        responsive: true,
        plugins: {
          datalabels: {
            color: 'black',
            anchor: 'end',
            align: 'top',
            formatter: Math.round
          }
        }
      },
      plugins: [ChartDataLabels]
    });

    // 就业行业分布饼图
    const industryCtx = document.getElementById('industryDistributionChart').getContext('2d');
    new Chart(industryCtx, {
      type: 'pie',
      data: {
        labels: ['IT/互联网', '金融', '制造业', '教育', '医疗', '其他'],
        datasets: [{
          data: [35, 20, 15, 10, 8, 12],
          backgroundColor: [
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 99, 132, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(153, 102, 255, 0.6)',
            'rgba(255, 159, 64, 0.6)'
          ]
        }]
      },
      options: {
        responsive: true,
        plugins: {
          datalabels: {
            color: 'white',
            formatter: function (value, context) {
              return context.chart.data.labels[context.dataIndex] + '\n' + value + '%';
            }
          }
        }
      },
      plugins: [ChartDataLabels]
    });

    // 面试场次统计
    const interviewCtx = document.getElementById('interviewSessionsChart').getContext('2d');
    new Chart(interviewCtx, {
      type: 'bar',
      data: {
        labels: ['1月', '2月', '3月', '4月', '5月', '6月'],
        datasets: [
          {
            label: '线下面试',
            data: [20, 15, 25, 30, 35, 40],
            backgroundColor: 'rgba(54, 162, 235, 0.6)'
          },
          {
            label: '线上面试',
            data: [10, 8, 12, 15, 18, 22],
            backgroundColor: 'rgba(255, 99, 132, 0.6)'
          }
        ]
      },
      options: {
        responsive: true,
        plugins: {
          datalabels: {
            color: 'black',
            anchor: 'end',
            align: 'top',
            formatter: Math.round
          }
        },
        scales: {
          x: {
            stacked: true
          },
          y: {
            stacked: true
          }
        }
      },
      plugins: [ChartDataLabels]
    });

  },
  methods: {
    getLoginUserInfo() {
      axios.get('/user/checkSession').then(response => {
            if (!response.data.result) {
              // 触发弹窗显示事件/ 触发主组件的弹窗显示
              EventBus.$emit('show-auth-popup');

              setTimeout(() => {
                // 登录界面超时，自动跳转到登录页面
                this.$router.push({name: 'Login'});
              }, 1000);
            } else {
              console.log('登录成功-----！');
              /*获取用户信息*/
              this.UserInfo.name = response.data.name;
              this.UserInfo.role = response.data.role;
              this.UserInfo.username = response.data.username;
              console.log(this.UserInfo);
            }
          }
      ).catch(error => {
        // 触发弹窗显示事件/ 触发主组件的弹窗显示
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          // 登录成功，重定向到管理页面
          this.$router.push({name: 'Login'});
        }, 1000);


      });
    },
  }
}
</script>

<style scoped>

</style>
