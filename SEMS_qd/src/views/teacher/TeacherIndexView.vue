<template>
  <div class="content">
    <div>
      <teacher-menu></teacher-menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold text-gray-800">教师工作台</h1>
        <div class="flex items-center">
          <el-badge :value="messageCount" class="mr-4">
            <el-button icon="el-icon-message" circle></el-button>
          </el-badge>
          <el-dropdown>
            <span class="el-dropdown-link">
              {{ teacherName }}<i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>个人中心</el-dropdown-item>
              <el-dropdown-item>退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </header>

      <!-- 数据概览 -->
      <el-row :gutter="20" class="mb-6">
        <el-col :xs="24" :sm="12" :md="6" :lg="6" v-for="(item, index) in statistics" :key="index">
          <el-card shadow="hover">
            <div class="flex items-center">
              <div :class="`icon-container bg-${item.color}-100 p-3 rounded-full mr-4`">
                <i :class="`el-icon-${item.icon} text-${item.color}-500 text-xl`"></i>
              </div>
              <div>
                <div class="text-gray-500 text-sm">{{ item.title }}</div>
                <div class="text-2xl font-bold">{{ item.value }}</div>
              </div>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <!-- 主要区域 -->
      <el-row :gutter="20">
        <!-- 就业数据图表 -->
        <el-col :span="16">
          <el-card class="mb-6" shadow="never">
            <div slot="header" class="clearfix">
              <span class="font-semibold">就业数据统计</span>
            </div>
            <div id="employmentChart" style="height: 300px;"></div>
          </el-card>
        </el-col>

        <!-- 待办事项 -->
        <el-col :span="8">
          <el-card shadow="never">
            <div slot="header" class="clearfix">
              <span class="font-semibold">待办事项</span>
              <el-button style="float: right; padding: 3px 0" type="text">更多</el-button>
            </div>
            <el-table :data="todoList" style="width: 100%">
              <el-table-column prop="content" label="内容"></el-table-column>
              <el-table-column prop="type" label="类型" width="80">
                <template slot-scope="scope">
                  <el-tag :type="scope.row.type | statusType" size="mini">{{ scope.row.type }}</el-tag>
                </template>
              </el-table-column>
              <el-table-column label="操作" width="80">
                <template slot-scope="scope">
                  <el-button @click="handleTodo(scope.row)" type="text" size="small">处理</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-card>
        </el-col>
      </el-row>

      <!-- 最新就业信息 -->
      <el-card class="mt-6" shadow="never">
        <div slot="header" class="clearfix">
          <span class="font-semibold">最新就业信息</span>
          <el-button style="float: right; padding: 3px 0" type="text">查看更多</el-button>
        </div>
        <el-table :data="recentJobs" style="width: 100%">
          <el-table-column prop="company" label="企业名称"></el-table-column>
          <el-table-column prop="position" label="职位"></el-table-column>
          <el-table-column prop="student" label="学生姓名"></el-table-column>
          <el-table-column prop="date" label="签约日期"></el-table-column>
          <el-table-column label="状态">
            <template slot-scope="scope">
              <el-tag :type="scope.row.status | statusType" size="mini">
                {{ scope.row.status }}
              </el-tag>
            </template>
          </el-table-column>
        </el-table>
      </el-card>
    </main>
  </div>
</template>

<script>
import TeacherMenu from "@/components/teacher/Teacher_menu.vue";
import * as echarts from 'echarts';

export default {
  name: 'TeacherDashboard',
  components: {TeacherMenu},
  data() {
    return {
      teacherName: '张老师',
      messageCount: 3,
      statistics: [
        {title: '已审核企业', icon: 'office-building', value: 25, color: 'blue'},
        {title: '待处理岗位', icon: 'postcard', value: 8, color: 'orange'},
        {title: '未读消息', icon: 'message', value: 3, color: 'green'},
        {title: '负责学生数', icon: 'user', value: 86, color: 'purple'}
      ],
      todoList: [
        {id: 1, content: 'XX公司岗位审核', type: '紧急'},
        {id: 2, content: '就业协议确认', type: '普通'},
        {id: 3, content: '学生就业咨询', type: '普通'}
      ],
      recentJobs: [
        {company: '腾讯科技', position: '前端开发', student: '张三', date: '2023-05-20', status: '已确认'},
        {company: '华为技术', position: '软件工程师', student: '李四', date: '2023-05-18', status: '待审核'}
      ],
      chartInstance: null
    }
  },
  filters: {
    statusType(status) {
      const typeMap = {
        '已确认': 'success',
        '待审核': 'warning',
        '紧急': 'danger',
        '普通': 'info'
      }
      return typeMap[status] || 'info'
    }
  },
  mounted() {
    this.initChart()
  },
  beforeDestroy() {
    if (this.chartInstance) {
      this.chartInstance.dispose()
    }
  },
  methods: {
    initChart() {
      this.chartInstance = echarts.init(document.getElementById('employmentChart'))
      const option = {
        tooltip: {
          trigger: 'axis'
        },
        xAxis: {
          type: 'category',
          data: ['1月', '2月', '3月', '4月', '5月', '6月']
        },
        yAxis: {
          type: 'value'
        },
        series: [{
          data: [15, 23, 45, 56, 78, 95],
          type: 'line',
          smooth: true,
          areaStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              {offset: 0, color: 'rgba(64, 158, 255, 0.6)'},
              {offset: 1, color: 'rgba(64, 158, 255, 0.01)'}
            ])
          }
        }]
      }
      this.chartInstance.setOption(option)
    },
    handleTodo(item) {
      this.$confirm(`确定处理该事项：${item.content}？`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.todoList = this.todoList.filter(t => t.id !== item.id)
        this.$message.success('处理成功')
      })
    }
  }
}
</script>

<style scoped>
.icon-container {
  transition: all 0.3s;
}

.el-card:hover .icon-container {
  transform: scale(1.1);
}

.el-dropdown-link {
  cursor: pointer;
  color: #409EFF;
}
</style>