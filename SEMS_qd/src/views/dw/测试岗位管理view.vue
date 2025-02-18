<template>
  <div class="content">
    <dw-menu />
    <main class="ml-64 flex-1 p-6 bg-gray-100 min-h-screen">
      <header class="flex justify-between items-center mb-6">
        <div>
          <h1 class="text-3xl font-bold text-gray-800">岗位管理中心</h1>
          <p class="text-sm text-gray-500 mt-1">当前有效岗位 {{ activePositions }} 个</p>
        </div>
        <div class="flex items-center space-x-4">
          <el-button type="primary" icon="el-icon-plus" @click="openPositionDialog">
            发布新岗位
          </el-button>
          <el-dropdown trigger="click">
            <el-button icon="el-icon-download"></el-button>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item>导出当前列表</el-dropdown-item>
                <el-dropdown-item>导出全部数据</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </div>
      </header>

      <!-- 数据概览 -->
      <el-row :gutter="20" class="mb-6">
        <el-col :span="8">
          <el-card class="stat-card hover-effect">
            <div class="flex justify-between items-center">
              <div>
                <div class="text-gray-500 text-sm">总申请数</div>
                <div class="text-3xl font-bold mt-2">2,345</div>
                <div class="text-green-500 text-sm mt-1">
                  <i class="el-icon-top"></i> 12% 周环比增长
                </div>
              </div>
              <el-progress
                  type="dashboard"
                  :percentage="76"
                  :width="100"
                  color="#67C23A">
                <span class="text-gray-500">转化率</span>
              </el-progress>
            </div>
          </el-card>
        </el-col>
        <el-col :span="8">
          <el-card class="stat-card hover-effect">
            <div class="flex justify-between items-center">
              <div>
                <div class="text-gray-500 text-sm">热门岗位 TOP3</div>
                <div class="mt-3">
                  <div v-for="(item, index) in hotPositions" :key="index" class="text-sm">
                    <span class="mr-2">#{{ index + 1 }}</span>
                    {{ item.name }} <el-tag size="mini">{{ item.count }}</el-tag>
                  </div>
                </div>
              </div>
              <i class="el-icon-trophy text-4xl text-yellow-500"></i>
            </div>
          </el-card>
        </el-col>
        <el-col :span="8">
          <el-card class="stat-card hover-effect">
            <div class="flex justify-between items-center h-full">
              <div>
                <div class="text-gray-500 text-sm">平均处理时效</div>
                <div class="text-3xl font-bold mt-2">2.3天</div>
                <div class="text-sm text-gray-500 mt-1">行业平均 3.1天</div>
              </div>
              <el-progress
                  type="circle"
                  :percentage="85"
                  :width="80"
                  color="#E6A23C">
              </el-progress>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <!-- 数据可视化 -->
      <!--      <el-row :gutter="20" class="mb-6">
        <el-col :span="12">
          <el-card class="chart-card">
            <template #header>
              <div class="flex justify-between items-center">
                <span class="card-title">岗位类型分布</span>
                <el-radio-group v-model="chartType" size="small">
                  <el-radio-button label="pie">饼图</el-radio-button>
                  <el-radio-button label="bar">柱状图</el-radio-button>
                </el-radio-group>
              </div>
            </template>
            <echarts
                :options="positionChart"
                style="height: 300px"
                @click="handleChartClick"/>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card class="chart-card">
            <template #header>
              <span class="card-title">申请趋势分析</span>
            </template>
            <echarts
                :options="trendChart"
                style="height: 300px"/>
          </el-card>
        </el-col>
      </el-row>-->

      <!-- 岗位管理表格 -->
      <el-card class="main-table">
        <template #header>
          <div class="flex justify-between items-center">
            <div class="flex items-center space-x-4">
              <el-input
                  v-model="searchKey"
                  placeholder="搜索岗位名称/编号"
                  style="width: 240px"
                  clearable>
                <template #prefix>
                  <i class="el-icon-search"></i>
                </template>
              </el-input>
              <el-select
                  v-model="filterStatus"
                  placeholder="状态筛选"
                  clearable
                  style="width: 120px">
                <el-option
                    v-for="item in statusOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                </el-option>
              </el-select>
              <el-date-picker
                  v-model="dateRange"
                  type="daterange"
                  range-separator="至"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期">
              </el-date-picker>
            </div>
            <div class="flex items-center space-x-2">
              <el-button type="text" @click="toggleAdvancedSearch">
                高级筛选 <i :class="advancedSearch ? 'el-icon-arrow-up' : 'el-icon-arrow-down'"></i>
              </el-button>
              <el-button icon="el-icon-refresh"></el-button>
            </div>
          </div>

          <!-- 高级筛选 -->
          <transition name="el-zoom-in-top">
            <div v-show="advancedSearch" class="advanced-search mt-4">
              <el-row :gutter="20">
                <el-col :span="6">
                  <el-input-number
                      v-model="minSalary"
                      placeholder="最低薪资"
                      :precision="0"
                      :min="0"
                      controls-position="right"/>
                </el-col>
                <el-col :span="6">
                  <el-input-number
                      v-model="maxSalary"
                      placeholder="最高薪资"
                      :precision="0"
                      :min="0"
                      controls-position="right"/>
                </el-col>
                <el-col :span="6">
                  <el-select
                      v-model="workType"
                      placeholder="工作类型"
                      clearable>
                    <el-option
                        v-for="item in workTypeOptions"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                    </el-option>
                  </el-select>
                </el-col>
                <el-col :span="6">
                  <el-cascader
                      v-model="selectedLocation"
                      :options="cityOptions"
                      placeholder="工作地点"
                      clearable>
                  </el-cascader>
                </el-col>
              </el-row>
            </div>
          </transition>
        </template>

        <el-table
            :data="filteredPositions"
            style="width: 100%"
            @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55"></el-table-column>
          <el-table-column label="岗位名称" min-width="200">
            <template #default="{row}">
              <div class="flex items-center">
                <el-tag
                    size="small"
                    :type="row.urgent ? 'danger' : 'info'"
                    effect="dark"
                    class="mr-2">
                  {{ row.urgent ? '急聘' : '常规' }}
                </el-tag>
                <el-link type="primary" @click="viewDetail(row)">
                  {{ row.title }}
                </el-link>
              </div>
            </template>
          </el-table-column>
          <el-table-column prop="department" label="所属部门" width="120"></el-table-column>
          <el-table-column label="申请进度" width="180">
            <template #default="{row}">
              <div class="flex items-center">
                <el-progress
                    :percentage="row.progress"
                    :color="customColors"
                    :show-text="false"
                    style="width: 100px"/>
                <span class="ml-2 text-sm">{{ row.applicants }}人</span>
              </div>
            </template>
          </el-table-column>
          <el-table-column label="状态" width="120">
            <template #default="{row}">
              <el-tag
                  :type="statusMap[row.status].type"
                  effect="plain"
                  class="status-tag">
                {{ statusMap[row.status].label }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="publishDate" label="发布日期" width="120"></el-table-column>
          <el-table-column label="操作" width="180" fixed="right">
            <template #default="{row}">
              <el-button
                  size="small"
                  icon="el-icon-edit"
                  @click="editPosition(row)">
              </el-button>
              <el-button
                  size="small"
                  :type="row.status === 'online' ? 'danger' : 'success'"
                  :icon="row.status === 'online' ? 'el-icon-close' : 'el-icon-check'"
                  @click="toggleStatus(row)">
              </el-button>
              <el-dropdown trigger="click">
                <el-button size="small" icon="el-icon-more"></el-button>
                <template #dropdown>
                  <el-dropdown-menu>
                    <el-dropdown-item @click="viewApplications(row)">查看申请</el-dropdown-item>
                    <el-dropdown-item @click="copyPosition(row)">复制岗位</el-dropdown-item>
                    <el-dropdown-item divided>数据分析</el-dropdown-item>
                    <el-dropdown-item>生成报告</el-dropdown-item>
                  </el-dropdown-menu>
                </template>
              </el-dropdown>
            </template>
          </el-table-column>
        </el-table>

        <div class="flex justify-between items-center mt-4">
          <el-button size="small" @click="batchOffline">批量下线</el-button>
          <el-pagination
              background
              layout="total, sizes, prev, pager, next"
              :total="total"
              :page-sizes="[10, 20, 50]"
              v-model:current-page="currentPage"
              v-model:page-size="pageSize">
          </el-pagination>
        </div>
      </el-card>

      <!-- 岗位详情抽屉 -->
      <el-drawer
          v-model="drawerVisible"
          title="岗位详情"
          size="40%"
          :before-close="handleClose">
        <position-detail :position="selectedPosition"/>
      </el-drawer>
    </main>
  </div>
</template>

<script>
import ECharts from 'vue-echarts'
import 'echarts/lib/chart/bar'
import 'echarts/lib/chart/pie'
import 'echarts/lib/component/tooltip'
import 'echarts/lib/component/legend'

export default {
  components: { ECharts },
  data() {
    return {
      activePositions: 15,
      searchKey: '',
      filterStatus: null,
      dateRange: [],
      advancedSearch: false,
      selectedPosition: null,
      drawerVisible: false,
      currentPage: 1,
      pageSize: 10,
      total: 100,
      statusOptions: [
        { value: 'online', label: '招聘中' },
        { value: 'offline', label: '已下线' },
        { value: 'draft', label: '草稿' }
      ],
      statusMap: {
        online: { label: '招聘中', type: 'success' },
        offline: { label: '已下线', type: 'info' },
        draft: { label: '草稿', type: 'warning' }
      },
      positionChart: {
        tooltip: { trigger: 'item' },
        series: [{
          type: 'pie',
          radius: '70%',
          itemStyle: { borderRadius: 8 },
          data: [
            { value: 335, name: '技术类' },
            { value: 310, name: '产品类' },
            { value: 234, name: '设计类' },
            { value: 135, name: '运营类' }
          ]
        }]
      },
      trendChart: {
        tooltip: { trigger: 'axis' },
        xAxis: {
          type: 'category',
          data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
        },
        yAxis: { type: 'value' },
        series: [{
          data: [120, 200, 150, 80, 70, 110, 130],
          type: 'bar',
          itemStyle: { color: '#409EFF' }
        }]
      },
      customColors: [
        { color: '#F56C6C', percentage: 20 },
        { color: '#E6A23C', percentage: 40 },
        { color: '#67C23A', percentage: 60 },
        { color: '#409EFF', percentage: 80 }
      ],
      hotPositions: [
        { name: '高级前端工程师', count: 235 },
        { name: '产品经理', count: 189 },
        { name: 'UI设计师', count: 156 }
      ]
    }
  },
  computed: {
    filteredPositions() {
      // 实际应实现过滤逻辑
      return []
    }
  },
  methods: {
    openPositionDialog() {
      // 打开新建岗位对话框
    },
    handleSelectionChange(selection) {
      // 处理多选
    },
    viewDetail(row) {
      this.selectedPosition = row
      this.drawerVisible = true
    },
    editPosition(row) {
      // 编辑岗位逻辑
    },
    toggleStatus(row) {
      // 切换状态逻辑
    },
    batchOffline() {
      // 批量下线逻辑
    },
    handleChartClick(params) {
      // 处理图表点击事件
    }
  }
}
</script>

<style scoped>
.hover-effect {
  @apply transition-all duration-300 hover:shadow-lg hover:-translate-y-1;
}

.stat-card {
  @apply h-40 flex flex-col justify-between;
}

.chart-card {
  @apply border-0 bg-white rounded-lg shadow-sm;
}

.card-title {
  @apply text-lg font-semibold text-gray-800;
}

.status-tag {
  @apply px-3 py-1 rounded-full;
}

.advanced-search {
  @apply bg-gray-50 p-4 rounded;
}

.main-table {
  @apply border-0 shadow-lg;
}

:deep(.el-card__header) {
  @apply border-b-0 bg-gray-50;
}
</style>