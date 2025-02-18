<template>
  <div>
    <div>
      <AdminMenu></AdminMenu>
    </div>

    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">就业信息系统</h1>
      </header>


      <div class="bg-blue-10 text-white flex items-center p-4 shadow">
        <div class="flex-1">
          <el-page-header content="详情页面"></el-page-header>
        </div>
        <div>
          <el-button type="primary" @click="showAddDialog">新增招聘会</el-button>
        </div>
      </div>

      <div class="container mx-auto p-6 flex">
        <div class="flex-1">
          <h1 class="text-2xl font-semibold text-gray-800 mb-4">招聘会列表</h1>

          <!-- 搜索框 -->
          <el-input
              v-model="searchQuery"
              placeholder="搜索招聘会标题或单位代码"
              prefix-icon="el-icon-search"
              style="margin-bottom: 20px; width: 300px;"
          ></el-input>

          <!-- 招聘会列表 -->
          <el-table :data="paginatedJobFairs" style="width: 100%">
            <el-table-column label="招聘会代码" prop="code"></el-table-column>
            <el-table-column label="招聘会标题" prop="title"></el-table-column>
            <el-table-column label="单位代码" prop="unitCode"></el-table-column>
            <el-table-column label="位置标志" prop="locationFlag"></el-table-column>
            <el-table-column label="举办时间" prop="startTime" :sortable="true"></el-table-column>
            <el-table-column label="对应岗位代码" prop="jobCode"></el-table-column>
            <el-table-column label="所在学校" prop="school"></el-table-column>
            <el-table-column label="举办地点" prop="venue"></el-table-column>
            <el-table-column label="状态" prop="status"></el-table-column>
            <el-table-column label="操作" align="right">
              <template slot-scope="scope">
                <el-button size="mini" @click="editJobFair(scope.row)">编辑</el-button>
                <el-button size="mini" type="danger" @click="deleteJobFair(scope.row)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>

          <!-- 分页组件 -->
          <el-pagination
              @current-change="handlePageChange"
              :current-page="currentPage"
              :page-size="pageSize"
              :total="filteredJobFairs.length"
              layout="total, prev, pager, next"
              style="text-align: right; margin-top: 10px;"
          />

          <!-- 编辑/新增招聘会的弹窗 -->
          <el-dialog :visible.sync="dialogVisible" title="招聘会信息" :modal="true" width="500px">
            <el-form :model="currentJobFair" ref="jobFairForm" label-width="100px" class="text-sm">
              <el-form-item label="招聘会代码">
                <el-input v-model="currentJobFair.code"></el-input>
              </el-form-item>
              <el-form-item label="招聘会标题">
                <el-input v-model="currentJobFair.title"></el-input>
              </el-form-item>
              <el-form-item label="单位代码">
                <el-input v-model="currentJobFair.unitCode"></el-input>
              </el-form-item>
              <el-form-item label="位置标志">
                <el-input v-model="currentJobFair.locationFlag"></el-input>
              </el-form-item>
              <el-form-item label="举办时间">
                <el-date-picker v-model="currentJobFair.startTime" type="datetime" placeholder="选择时间"></el-date-picker>
              </el-form-item>
              <el-form-item label="对应岗位代码">
                <el-input v-model="currentJobFair.jobCode"></el-input>
              </el-form-item>
              <el-form-item label="所在学校">
                <el-input v-model="currentJobFair.school"></el-input>
              </el-form-item>
              <el-form-item label="举办地点">
                <el-input v-model="currentJobFair.venue"></el-input>
              </el-form-item>
              <el-form-item label="状态">
                <el-select v-model="currentJobFair.status" placeholder="选择状态">
                  <el-option label="进行中" value="进行中"></el-option>
                  <el-option label="已结束" value="已结束"></el-option>
                </el-select>
              </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="saveJobFair">确 定</el-button>
          </span>
          </el-dialog>
        </div>

        <!-- 图表容器 -->
        <div class="charts-container" style="width: 600px; margin-left: 20px;">
          <!-- 下拉选择框，用于选择图表类型 -->
          <el-select v-model="selectedChart" @change="renderCharts" placeholder="选择图表类型" size="small" style="margin-bottom: 20px; width: 150px;">
            <el-option label="折线图" value="line"></el-option>
            <el-option label="柱状图" value="bar"></el-option>
            <el-option label="饼图" value="pie"></el-option>
          </el-select>
          <!-- 根据选择的图表类型动态显示相应的图表 -->
          <div id="lineChart" v-if="selectedChart === 'line'" style="height: 400px;"></div>
          <div id="barChart" v-if="selectedChart === 'bar'" style="height: 400px; margin-top: 20px;"></div>
          <div id="pieChart" v-if="selectedChart === 'pie'" style="height: 300px; margin-top: 20px;"></div>
        </div>
      </div>
    </main>


  </div>
</template>

<script>
import * as echarts from 'echarts';
import AdminMenu from "@/components/admin/Admin_menu.vue";

export default {
  name: "AdminZph",
  components: { AdminMenu },
  data() {
    return {
      // 招聘会数据
      jobFairs: [
        // 示例招聘会数据
        {
          code: "ZPH001",
          title: "春季校园招聘会",
          unitCode: "DW001",
          locationFlag: "A",
          startTime: "2024-03-20T09:00:00",
          jobCode: "GW001",
          school: "北京大学",
          venue: "体育馆",
          status: "进行中"
        },
        {
          code: "ZPH002",
          title: "秋季校园招聘会",
          unitCode: "DW002",
          locationFlag: "B",
          startTime: "2024-03-21T09:00:00",
          jobCode: "GW002",
          school: "清华大学",
          venue: "会议中心",
          status: "进行中"
        },
        // 可以添加更多招聘会数据
      ],
      // 当前编辑/新增的招聘会信息
      currentJobFair: {
        code: '',
        title: '',
        unitCode: '',
        locationFlag: '',
        startTime: '',
        jobCode: '',
        school: '',
        venue: '',
        status: '进行中'
      },
      // 分页相关的参数
      currentPage: 1,
      pageSize: 5,
      dialogVisible: false,
      isEditing: false,
      searchQuery: '',
      selectedChart: 'line', // 默认选择的图表类型
    };
  },
  computed: {
    // 过滤招聘会列表以进行搜索
    filteredJobFairs() {
      return this.jobFairs.filter(jobFair => {
        const query = this.searchQuery.toLowerCase();
        return (
            jobFair.title.toLowerCase().includes(query) ||
            jobFair.unitCode.toLowerCase().includes(query)
        );
      });
    },
    // 分页后的招聘会数据
    paginatedJobFairs() {
      const start = (this.currentPage - 1) * this.pageSize;
      return this.filteredJobFairs.slice(start, start + this.pageSize);
    },
  },
  methods: {
    // 显示添加招聘会的弹窗
    showAddDialog() {
      this.isEditing = false;
      this.currentJobFair = {
        code: '',
        title: '',
        unitCode: '',
        locationFlag: '',
        startTime: '',
        jobCode: '',
        school: '',
        venue: '',
        status: '进行中'
      };
      this.dialogVisible = true;
    },
    // 编辑现有招聘会信息
    editJobFair(jobFair) {
      this.isEditing = true;
      this.currentJobFair = { ...jobFair };
      this.dialogVisible = true;
    },
    // 删除招聘会
    deleteJobFair(jobFair) {
      this.jobFairs = this.jobFairs.filter(jf => jf.code !== jobFair.code);
      this.$message.success('招聘会已删除');
      this.renderCharts(); // 删除后重新渲染图表
    },
    // 处理分页变化
    handlePageChange(newPage) {
      this.currentPage = newPage;
    },
    // 保存招聘会信息
    saveJobFair() {
      if (this.isEditing) {
        const index = this.jobFairs.findIndex(jf => jf.code === this.currentJobFair.code);
        if (index !== -1) {
          this.jobFairs.splice(index, 1, this.currentJobFair);
          this.$message.success('招聘会信息已更新');
        }
      } else {
        this.jobFairs.push({ ...this.currentJobFair });
        this.$message.success('招聘会已添加');
      }
      this.dialogVisible = false;
      this.currentJobFair = {
        code: '',
        title: '',
        unitCode: '',
        locationFlag: '',
        startTime: '',
        jobCode: '',
        school: '',
        venue: '',
        status: '进行中'
      };
      this.renderCharts(); // 保存后重新渲染图表
    },
    // 根据选择的图表类型渲染相应的图表
    renderCharts() {
      // 清除之前的图表
      const lineChart = document.getElementById('lineChart');
      const barChart = document.getElementById('barChart');
      const pieChart = document.getElementById('pieChart');

      if (this.selectedChart === 'line') {
        lineChart.style.display = 'block';
        barChart.style.display = 'none';
        pieChart.style.display = 'none';
        this.renderLineChart();
      } else if (this.selectedChart === 'bar') {
        lineChart.style.display = 'none';
        barChart.style.display = 'block';
        pieChart.style.display = 'none';
        this.renderBarChart();
      } else if (this.selectedChart === 'pie') {
        lineChart.style.display = 'none';
        barChart.style.display = 'none';
        pieChart.style.display = 'block';
        this.renderPieChart();
      }
    },
    // 渲染折线图
    renderLineChart() {
      const chart = echarts.init(document.getElementById('lineChart'));
      const data = this.getRecentWeekData();

      const option = {
        title: {
          text: '过去一周招聘会发布趋势',
        },
        tooltip: {
          trigger: 'axis',
        },
        xAxis: {
          type: 'category',
          data: data.dates,
        },
        yAxis: {
          type: 'value',
          name: '招聘会数量',
        },
        series: [{
          name: '招聘会数量',
          type: 'line',
          data: data.counts,
          smooth: true,
          itemStyle: {
            color: '#67C23A', // 线条颜色
          }
        }],
      };

      chart.setOption(option);
    },
    // 渲染柱状图
    renderBarChart() {
      const chart = echarts.init(document.getElementById('barChart'));
      const data = this.getUnitDistributionData();

      const option = {
        title: {
          text: '单位分布',
        },
        tooltip: {
          trigger: 'axis',
        },
        xAxis: {
          type: 'category',
          data: data.labels,
        },
        yAxis: {
          type: 'value',
          name: '单位数量',
        },
        series: [{
          name: '单位数量',
          type: 'bar',
          data: data.values,
          itemStyle: {
            color: '#409EFF', // 柱状图颜色
          }
        }],
      };

      chart.setOption(option);
    },
    // 渲染饼图
    renderPieChart() {
      const chart = echarts.init(document.getElementById('pieChart'));
      const data = this.getOnCampusOffCampusData();

      const option = {
        title: {
          text: '校内与校外招聘会分布',
          subtext: '按比例',
          left: 'center'
        },
        series: [{
          name: '招聘会分布',
          type: 'pie',
          radius: '50%',
          data: data.map(item => ({ value: item.count, name: item.label })),
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        }]
      };

      chart.setOption(option);
    },
    // 获取过去一周发布的招聘会数据
    getRecentWeekData() {
      const now = new Date();
      const lastWeekCounts = {};
      const dates = [];

      // 循环获取过去一周的日期
      for (let i = 6; i >= 0; i--) {
        const date = new Date(now);
        date.setDate(now.getDate() - i);
        const dateString = date.toISOString().slice(0, 10);
        dates.push(dateString);
        lastWeekCounts[dateString] = 0; // 初始化日期计数
      }

      // 统计每一天发布的招聘会数量
      this.jobFairs.forEach(jobFair => {
        const publishDate = new Date(jobFair.startTime).toISOString().slice(0, 10);
        if (lastWeekCounts.hasOwnProperty(publishDate)) {
          lastWeekCounts[publishDate]++;
        }
      });

      return {
        dates: dates,
        counts: dates.map(date => lastWeekCounts[date]),
      };
    },
    // 获取单位分布数据
    getUnitDistributionData() {
      const unitCounts = {};
      this.jobFairs.forEach(jobFair => {
        unitCounts[jobFair.unitCode] = (unitCounts[jobFair.unitCode] || 0) + 1;
      });

      return {
        labels: Object.keys(unitCounts),
        values: Object.values(unitCounts),
      };
    },
    // 获取校内与校外招聘会数据
    getOnCampusOffCampusData() {
      const onCampusCount = this.jobFairs.filter(jf => jf.locationFlag === 'A').length; // 假设 'A' 表示校内
      const offCampusCount = this.jobFairs.length - onCampusCount;

      return [
        { label: '校内', count: onCampusCount },
        { label: '校外', count: offCampusCount },
      ];
    }
  },

  mounted() {
    this.renderCharts(); // 组件挂载时渲染默认图表
  }
}
</script>

<style scoped>
.container {
  max-width: 1200px;
  margin: auto;
  display: flex;
}

.charts-container {
  max-width: 600px;
  margin-left: 20px;
  display: flex;
  flex-direction: column;
}
</style>
