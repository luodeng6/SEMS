<template>
  <div class="content">
    <dw-menu/>
    <main class="ml-64 flex-1 p-6 bg-gray-100 min-h-screen">
      <el-card style="margin-bottom: 10px">
        <header class="flex justify-between items-center mb-6">
          <div>
            <h1 class="text-3xl font-bold text-gray-800">岗位管理中心</h1>
            <p class="text-sm text-gray-500 mt-1">当前有效岗位
              {{ filteredPositions.filter(item => item.qydm === 1).length }} 个</p>
          </div>
          <div class="flex items-center space-x-4">
            <el-button type="text" icon="el-icon-plus" @click="addGw">发布新岗位</el-button>
            <el-button type="text" icon="el-icon-edit" @click="eiditGw">编辑岗位</el-button>
            <el-button type="text" icon="el-icon-search" @click="lookGw">查看岗位详情</el-button>
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
      </el-card>
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
              <el-progress type="dashboard" :percentage="76" :width="100" color="#67C23A">
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
                    {{ item.name }}
                    <el-tag size="mini">{{ item.count }}</el-tag>
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
              <el-progress type="circle" :percentage="85" :width="80" color="#E6A23C"></el-progress>
            </div>
          </el-card>
        </el-col>
      </el-row>

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
                <i slot="prefix" class="el-input__icon el-icon-search"></i>
              </el-input>
              <el-select
                  v-model="filterStatus"
                  placeholder="状态筛选"
                  clearable
                  style="width: 120px">
                <i slot="prefix" class="el-input__icon el-icon-refresh"></i>
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
        </template>

        <el-table
            ref="multipleTable"
            :data="paginatedPositions"
            highlight-current-row
            stripe
            border
            style="width: 100%"
            tooltip-effect="dark"
            @current-change="handleCurrentChangeTable"
            :row-class-name="tableRowClassName"
            @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55"></el-table-column>
          <el-table-column prop="id" label="岗位ID" width="100"></el-table-column>
          <el-table-column prop="gwmc" label="岗位名称" width="120" :formatter="formatText"></el-table-column>
          <el-table-column prop="gwms" label="岗位描述" width="180" :formatter="formatText"></el-table-column>
          <el-table-column prop="gwyq" label="岗位要求" width="180" :formatter="formatText"></el-table-column>
          <el-table-column prop="gwfl" label="岗位分类" width="100"
                           :formatter="(row) => getCategoryName(row)"></el-table-column>
          <el-table-column prop="fbsj" :width="180" sortable label="岗位发布时间">
            <template #default="scope">
              {{ fbsjToDate(scope.row.fbsj) }}
            </template>
          </el-table-column>
          <el-table-column prop="tdsm" label="投递说明" :formatter="formatText"></el-table-column>
          <el-table-column prop="zgxz" sortable label="最高薪资" width="100"
                           :formatter="(row) => row.zgxz + '元/月'"></el-table-column>
          <el-table-column prop="zdxz" sortable label="最低薪资" width="100"
                           :formatter="(row) => row.zdxz + '元/月'"></el-table-column>
          <el-table-column prop="zdxlyq" label="最低学历要求">
            <template #default="scope">
              {{ XLTTK.find((xl) => xl.id === scope.row.zdxlyq)?.xlmc || '无' }}
            </template>
          </el-table-column>
          <el-table-column prop="gzdd" label="工作地点" :formatter="formatText"></el-table-column>
          <el-table-column prop="gzsf" label="工作省份">
            <template #default="scope">
              {{ SFDMK.find((sf) => sf.sfdm === scope.row.gzsf)?.sfmc || '无' }}
            </template>
          </el-table-column>
          <el-table-column prop="sxbz" label="实习标志">
            <template #default="scope">
              {{ scope.row.sxbz === 1 ? "实习岗位" : "正式岗位" }}
            </template>
          </el-table-column>
          <el-table-column prop="zyxz" label="专业限制" :formatter="formatText"></el-table-column>
          <el-table-column prop="dwmc" label="单位名称" :formatter="formatText"></el-table-column>
          <el-table-column prop="tdcs" label="投递次数" :formatter="formatText"></el-table-column>
          <el-table-column prop="zprs" label="招聘人数" :formatter="formatText"></el-table-column>
          <el-table-column prop="qydm" label="启用状态" fixed="left">
            <template #default="scope">
                <span>
                  <i :class="scope.row.qydm === 1 ? 'el-icon-check' : 'el-icon-close'"
                     :style="{ color: scope.row.qydm === 1 ? 'green' : 'red', marginRight: '5px' }"></i>
                  {{ scope.row.qydm === 1 ? "启用" : "关闭" }}
                </span>
            </template>
          </el-table-column>
          <el-table-column label="操作" width="150" align="right" fixed="right">
            <template #default="scope">
              <el-button size="mini" @click="ShowJobDetail(scope.row)">岗位详情</el-button>
              <el-button size="mini" type="danger">下线岗位</el-button>
            </template>
          </el-table-column>
        </el-table>

        <div class="flex justify-between items-center mt-4">
          <div>
            <el-button size="mini"     @click="batchOffline">批量下线</el-button>
            <el-button size="mini"    >批量启用</el-button>
          </div>

          <el-pagination
              background
              layout="total, sizes, prev, pager, next"
              :total="total"
              :page-sizes="[ 5, 8,10 , 13]"
              :current-page.sync="currentPage"
              :page-size.sync="pageSize"
              @current-change="handleCurrentChange"
              @size-change="handleSizeChange">
          </el-pagination>
        </div>

      </el-card>


    </main>
  </div>
</template>

<script>
import ECharts from 'vue-echarts';
import 'echarts/lib/chart/bar';
import 'echarts/lib/chart/pie';
import 'echarts/lib/component/tooltip';
import 'echarts/lib/component/legend';
import DwMenu from "@/components/dw/Dw_menu.vue";
import axios from "axios";

export default {
  components: {DwMenu, ECharts},
  name: 'DwJob',
  data() {
    return {
      hotPositions: [
        {name: '高级前端工程师', count: 235},
        {name: '产品经理', count: 189},
        {name: 'UI设计师', count: 156}
      ],
      searchKey: '',
      filterStatus: null, // 状态筛选
      dateRange: [],
      advancedSearch: false,
      selectedPosition: null,
      drawerVisible: false,
      currentPage: 1,
      pageSize: 8, // 更新每页显示条数为 5
      total: 0,
      paginatedData: [],
      statusOptions: [
        {value: 1, label: '启用'},
        {value: 0, label: '禁用/下线'},
        {value: 3, label: '已投递满'}
      ],
      XLTTK: [], // 学历数据
      SFDMK: [],// 省份数据
      gwflList: [],// 岗位分类列表
      DATADWDMK: [],//单位数据
      fbzyhm: "",
      loading: false,
      // 当前选中岗位数据
      currentJobSelectRow: null,
    };
  },
  computed: {
    filteredPositions() {
      return this.paginatedData.filter(item => {
        return (
            (!this.searchKey || item.gwmc.includes(this.searchKey)) &&
            (!this.filterStatus || (item.qydm === this.filterStatus))
        );
      });
    },
    paginatedPositions() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.filteredPositions.slice(start, end);
    }
  },
  mounted() {
    this.getLoginUser();// 获取登录用户信息
    this.getXueLiData();// 获取学历数据
    this.GetAllSfdmk(); // 获取省份数据
    this.getAllGwflList(); // 获取岗位分类数据
  },
  methods: {

    fbsjToDate(fbsj) {
      return new Date(fbsj).toLocaleDateString()
    },
    // 查看岗位详情
    lookGw() {
      // 获取当前行数据
      if (this.currentJobSelectRow === null) {
        //使用 Jquery confirm 弹窗提示
        this.currentJobSelectRow = null;
        this.$confirm('请选择需要查看的岗位！', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          console.log('确定');
        }).catch(() => {
          console.log('取消');
        });
      } else {
        console.log("跳转到岗位详情页面");
        console.log(this.currentJobSelectRow.id);
        this.$router.push({path: '/dw/jobDetail', query: {id: this.currentJobSelectRow.id}})
      }

    },
    // 编辑岗位
    eiditGw() {

    },
    // 高级筛选
    toggleAdvancedSearch() {
    },
    // 前往编辑岗位页面
    addGw() {
      this.$router.push('/dw/addJob');
    },
    tableRowClassName({row, rowIndex}) {
      // console.log("渲染行样式");
      //console.log(row);
      //  console.log(rowIndex);
      if (rowIndex === 1) {
        // console.log("渲染第一行样式！！！");
        return 'warning-row';
      } else if (rowIndex === 3) {
        return 'success-row';
      }
      return '';
    },
    getLoginUser() {
      axios.get('/user/checkSession').then(response => {
        if (response.data.result) {
          this.fbzyhm = response.data.username;
          this.getAllJob(this.fbzyhm);
        } else {
          this.$message.error("当前用户未登录，请先登录！");
          this.$router.push('/dw/login');
        }
      }).catch(error => {
        console.log(error);
      });
    },
    getAllJob(fbzyhm) {
      this.loading = true;
      axios.get(`/dataGwdmk/getGwdmkDataByFbz?fbzyhm=${fbzyhm}`).then(res => {
        this.loading = false;
        if (res.data.result) {
          this.paginatedData = res.data.data;
          this.total = this.filteredPositions.length; // 设置总数
        } else {
          this.$message.error("获取岗位数据失败！，后台错误");
        }
      }).catch(err => {
        this.loading = false;
        this.$message.error("获取岗位数据失败！，网络错误");
      });
    },
    getAllGwflList() {
      axios.get("/gwflk/getAllGwflList").then(response => {
        if (response.data.result) {
          this.gwflList = response.data.data;
        } else {
          this.$message.error("获取岗位分类数据失败！，后台错误");
        }
      }).catch(error => {
        console.log(error);
      });
    },
    openPositionDialog() {
      // 打开新建岗位对话框
    },
    GetAllSfdmk() {
      axios.get("/sfdmk/getAllSfdmks").then(response => {
        if (response.data.result) {
          this.SFDMK = response.data.data;
        } else {
          this.$message.error("操作失败！，后台错误");
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("操作失败，网络错误");
      });
    },
    getXueLiData() {
      axios.get("/xlttk/getAllXlttkData").then(response => {
        if (response.data.result) {
          this.XLTTK = response.data.data;
        } else {
          this.$message.error("获取学历数据失败！，后台错误");
        }
      }).catch(error => {
        console.log(error);
      });
    },
    batchOffline() {
      // 批量下线逻辑
    },
    // 选中行修改事件
    handleCurrentChangeTable(currentRow) {
      /*  console.log("当前选中行：", currentRow);*/
      this.currentJobSelectRow = currentRow;
    },
    formatText(row, column, cellValue) {
      return cellValue.length > 25 ? cellValue.slice(0, 10) + '...' : cellValue;
    },
    // 获取岗位分类名称
    getCategoryName(row) {
      if (this.gwflList.length === 0) {
        this.getAllGwflList(); // 获取岗位分类数据
      } else {
        //  console.log("岗位分类：");
        // console.log(row.gwfl);
        // console.log(this.gwflList);
        let category = this.gwflList.find(item => Number(item.id) === Number(row.gwfl));
        //console.log(category);
        return category ? category.flmc : '未知分类';
      }
    },
    ShowJobDetail(row) {
      // 查看岗位详情逻辑
      console.log("跳转到岗位详情页面");
      this.$router.push({path: '/dw/jobDetail', query: {id: row.id}})
    },
    handleCurrentChange(newPage) {
      this.currentPage = newPage;
    },
    handleSizeChange(newSize) {
      this.pageSize = newSize;
      this.currentPage = 1; // 重置到第一页
    },
  }
}
</script>

<style scoped>

.el-table .warning-row {
  background: oldlace;
}

.el-table .success-row {
  background: #f0f9eb;
}

.p-6 {
  padding: 10px !important;
}

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