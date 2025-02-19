<template>
  <div class="content">
    <DwMenu/>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">面试管理系统</h1>
        <div>
          <el-button type="primary" icon="el-icon-plus" @click="openAddInterviewDialog">安排面试</el-button>
        </div>
      </header>

      <div class="interview-management">
        <el-tabs v-model="activeTab">
          <!-- 面试管理 -->
          <el-tab-pane label="面试管理" name="management">
            <div class="operation-bar">
              <el-button type="primary" @click="showDialog">发布新面试</el-button>
              <el-input
                  v-model="searchKeyword"
                  placeholder="搜索学生/岗位"
                  style="width: 300px; margin-left: 20px"></el-input>
            </div>

            <el-table :data="filteredInterviews" border height="500">
              <el-table-column prop="jobTitle" label="岗位" width="180"></el-table-column>
              <el-table-column prop="time" label="时间" width="180"></el-table-column>
              <el-table-column prop="student" label="学生"></el-table-column>
              <el-table-column prop="location" label="地点"></el-table-column>
              <el-table-column prop="status" label="状态" width="120">
                <template slot-scope="{ row }">
                  <el-tag :type="statusType[row.status]">{{ row.status }}</el-tag>
                </template>
              </el-table-column>
              <el-table-column label="操作" width="150">
                <template slot-scope="{ row }">
                  <el-button size="mini" @click="editInterview(row)">编辑</el-button>
                  <el-button size="mini" type="danger" @click="deleteInterview(row.id)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-tab-pane>
          <!-- 面试统计 -->
          <el-tab-pane label="面试统计" name="statistics">
            <div class="chart-container">
              <div class="chart-item">
                <h3>最近一周面试数量</h3>
                <div ref="barChart" style="width: 600px; height: 400px"></div>
              </div>
              <div class="chart-item">
                <h3>面试结果分布</h3>
                <div ref="pieChart" style="width: 600px; height: 400px"></div>
              </div>
            </div>
          </el-tab-pane>
          <!-- 面试日历 -->
          <el-tab-pane label="面试日历" name="calendar">
            <div class="calendar-container">
              <div class="calendar-header">
                <h2>{{ currentMonth }}</h2>
                <div class="legend">
                  <span class="dot has-interview"></span> 有面试
                </div>
              </div>
              <div class="calendar-grid">
                <div
                    v-for="(day, index) in calendarDays"
                    :key="index"
                    class="calendar-day"
                    :class="{ 'has-interview': day.count > 0 }"
                    @click="showDayInterviews(day)">
                  <div class="day-number">{{ day.date }}</div>
                  <div v-if="day.count > 0" class="interview-count">{{ day.count }}</div>
                </div>
              </div>
            </div>
          </el-tab-pane>
          <!-- 面试日历 -->
          <el-tab-pane label="录入结果" name="calendar">

          </el-tab-pane>
        </el-tabs>
        <!-- 面试表单对话框 -->
        <el-dialog :title="formTitle" :visible.sync="dialogVisible">
          <el-form :model="formData" label-width="80px">
            <el-form-item label="岗位">
              <el-input v-model="formData.jobTitle"></el-input>
            </el-form-item>
            <el-form-item label="时间">
              <el-date-picker
                  v-model="formData.time"
                  type="datetime"
                  placeholder="选择日期时间"
              ></el-date-picker>
            </el-form-item>
            <el-form-item label="学生">
              <el-input v-model="formData.student"></el-input>
            </el-form-item>
            <el-form-item label="地点">
              <el-input v-model="formData.location"></el-input>
            </el-form-item>
            <el-form-item label="状态">
              <el-select v-model="formData.status">
                <el-option
                    v-for="item in statusOptions"
                    :key="item"
                    :label="item"
                    :value="item"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-form>
          <span slot="footer">
        <el-button @click="dialogVisible = false">取消</el-button>
              <el-button type="primary" @click="saveInterview">保存</el-button>
              </span>
        </el-dialog>
      </div>


    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";
import * as echarts from 'echarts'

export default {
  name: 'DwMsApView',
  components: {DwMenu},
  data() {
    return {
      activeTab: 'management',
      searchKeyword: '',
      statusType: {
        '待面试': 'warning',
        '已通过': 'success',
        '未通过': 'danger'
      },
      statusOptions: ['待面试', '已通过', '未通过'],
      interviews: [
        // 假数据示例
        {
          id: 1, jobTitle: '前端开发', time: '2023-07-20 14:00', student: '张三',
          location: '第一会议室', status: '待面试'
        },
        {
          id: 2, jobTitle: 'Java开发', time: '2023-07-21 10:30', student: '李四',
          location: '线上会议', status: '已通过'
        }
      ],
      dialogVisible: false,
      formData: this.emptyForm(),
      currentEditingId: null,
      calendarDays: []
    }
  },
  computed: {
    filteredInterviews() {
      return this.interviews.filter(item =>
          item.jobTitle.includes(this.searchKeyword) ||
          item.student.includes(this.searchKeyword)
      )
    },
    formTitle() {
      return this.currentEditingId ? '编辑面试' : '发布新面试'
    },
    currentMonth() {
      const date = new Date()
      return `${date.getFullYear()}年${date.getMonth() + 1}月`
    }
  },
  mounted() {
    this.initCharts()
    this.generateCalendar()
  },
  methods: {
    // 初始化图表
    initCharts() {
      const barChart = echarts.init(this.$refs.barChart)
      const pieChart = echarts.init(this.$refs.pieChart)

      // 柱状图配置
      barChart.setOption({
        xAxis: {type: 'category', data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']},
        yAxis: {type: 'value'},
        series: [{data: [5, 8, 6, 7, 4, 2, 3], type: 'bar', color: '#409EFF'}]
      })

      // 饼图配置
      pieChart.setOption({
        tooltip: {trigger: 'item'},
        series: [{
          type: 'pie',
          data: [
            {value: 12, name: '待面试'},
            {value: 8, name: '已通过'},
            {value: 5, name: '未通过'}
          ],
          itemStyle: {
            colors: ['#E6A23C', '#67C23A', '#F56C6C']
          }
        }]
      })
    },

    // 生成日历数据
    generateCalendar() {
      const days = []
      const daysInMonth = new Date().getDate()
      for (let i = 1; i <= daysInMonth; i++) {
        days.push({
          date: i,
          count: Math.random() > 0.7 ? Math.floor(Math.random() * 5) : 0
        })
      }
      this.calendarDays = days
    },

    showDialog() {
      this.dialogVisible = true
      this.formData = this.emptyForm()
      this.currentEditingId = null
    },

    emptyForm() {
      return {jobTitle: '', time: '', student: '', location: '', status: '待面试'}
    },

    editInterview(row) {
      this.formData = {...row}
      this.currentEditingId = row.id
      this.dialogVisible = true
    },

    saveInterview() {
      if (this.currentEditingId) {
        const index = this.interviews.findIndex(item => item.id === this.currentEditingId)
        this.interviews.splice(index, 1, {...this.formData})
      } else {
        this.interviews.push({...this.formData, id: Date.now()})
      }
      this.dialogVisible = false
    },

    deleteInterview(id) {
      this.$confirm('确定删除该面试记录吗？', '提示', {type: 'warning'})
          .then(() => {
            this.interviews = this.interviews.filter(item => item.id !== id)
          })
    },

    showDayInterviews(day) {
      if (day.count > 0) {
        // 这里可以显示当天的面试列表
      }
    }
  }
}
</script>

<style scoped>
.interview-management {
  padding: 20px;
}

.operation-bar {
  margin-bottom: 20px;
}

.chart-container {
  display: flex;
  justify-content: space-around;
}

.calendar-container {
  max-width: 1000px;
  margin: 0 auto;
}

.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.calendar-grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 10px;
}

.calendar-day {
  border: 1px solid #ebeef5;
  border-radius: 4px;
  height: 100px;
  padding: 8px;
  position: relative;
  cursor: pointer;
  transition: all 0.3s;
}

.calendar-day:hover {
  background-color: #f5f7fa;
}

.has-interview {
  background-color: #f0f9eb;
}

.day-number {
  font-weight: bold;
  margin-bottom: 5px;
}

.interview-count {
  background-color: #409EFF;
  color: white;
  border-radius: 50%;
  width: 24px;
  height: 24px;
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  bottom: 8px;
  right: 8px;
}

.legend .dot {
  display: inline-block;
  width: 12px;
  height: 12px;
  border-radius: 50%;
  margin-right: 5px;
}

.has-interview.legend .dot {
  background-color: #409EFF;
}
</style>