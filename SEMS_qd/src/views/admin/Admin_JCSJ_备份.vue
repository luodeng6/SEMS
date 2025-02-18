<!-- BasicDataManagement.vue -->
<template>
  <div>
    <admin-menu></admin-menu>
    <main class="ml-64 flex-1 p-6">

      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold text-gray-800">基础数据管理</h1>
        <div class="flex items-center space-x-4">
          <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600" @click="add_JCSJ()">
            <i class="fas fa-plus"></i> 新增数据
          </button>
        </div>
      </header>

      <div class="bg-gray-100 p-4 rounded mb-4">
        <h2 class="text-lg font-semibold">此界面用于管理基础数据！</h2>
      </div>

      <!--      <div class="flex space-x-4 mb-6">
              <button
                  v-for="table in tables"
                  :key="table.name"
                  @click="selectTable(table)"
                  :class="[
                  selectedTable.name === table.name
                    ? 'bg-blue-500 text-white' : 'bg-gray-300 text-gray-700',
                  'px-4 py-2 rounded hover:bg-gray-400']"
              >
                {{ table.label }}
              </button>
            </div>-->

      <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
        <el-tab-pane label="单位行业代码" name="first">
          <!--          <DataTable
                        :tableData="filteredData"
                        :columns="tableColumns"
                        :searchQuery="searchQuery"/>-->

          <el-table
              ref="multipleTable"
              :data="paginatedDataDWHYDMK"
              tooltip-effect="dark"
              style="width: 100%">

            <el-table-column
                type="selection"
                width="55">
            </el-table-column>

            <el-table-column
                prop="hydm"
                label="行业代码"
                width="120">
            </el-table-column>

            <el-table-column
                prop="hymc"
                label="行业名称"
                width="120">
            </el-table-column>

            <el-table-column
                prop="hyms"
                label="行业描述"
                show-overflow-tooltip>
            </el-table-column>
          </el-table>
          <!-- 分页组件 -->
          <el-pagination
              @current-change="handleCurrentChangeDWHYDMK"
              :current-page="currentPageDWHYDMK"
              :page-size="pageSizeDWHYDMK"
              :total="DWHYDMK.length"
              layout="total, prev, pager, next, jumper"
              class="mt-4">
          </el-pagination>
        </el-tab-pane>
        <el-tab-pane label="单位性质" name="second">配置管理</el-tab-pane>
        <el-tab-pane label="省份代码库" name="third">角色管理</el-tab-pane>
        <el-tab-pane label="学历天梯库" name="fourth">定时任务补偿</el-tab-pane>
        <el-tab-pane label="单位规模库" name="fifth">定时任务补偿</el-tab-pane>
        <el-tab-pane label="岗位分类" name="sixth">定时任务补偿</el-tab-pane>
      </el-tabs>


    </main>
  </div>
</template>

<script>
import AdminMenu from "@/components/admin/Admin_menu.vue"; // 导入管理菜单组件
import DataTable from "@/components/admin/JCSJ/JCSJ_Table.vue"; // 导入数据表格组件
import axios from "axios";

export default {
  name: "BasicDataManagement", // 组件名称
  components: {AdminMenu, DataTable}, // 注册组件
  data() {
    return {
      activeName: "first", // 选项卡激活状态,默认第一个

      pageSizeDWHYDMK: 10, // 单位行业代码分页大小
      currentPageDWHYDMK: 1, // 单位行业代码当前页数


      // 配置按钮显示
      tables: [
        {name: "DWHYDMK", label: "单位行业代码库"},
        {name: "DWXZK", label: "单位性质库"},
        {name: "SFDMK", label: "省份代码库"},
        {name: "XLTTK", label: "学历天梯库"},
        {name: "DWGMK", label: "单位规模库"},
      ],
      selectedTable: {}, // 当前选中的表
      searchQuery: "", // 搜索查询字符串

      SFDMK: [],
      XLTTK: [],
      DWXZK: [],
      DWGMK: [],
      DWHYDMK: [],
      // 数据使用的是映射,注意配置
      AllTableColumnData: {
        SFDMK: [{label: '省份代码', prop: 'sfdm'}, {label: '省份名称', prop: 'sfmc'}],
        XLTTK: [{label: '学历代码', prop: 'id'}, {label: '学历名称', prop: 'xlmc'}, {label: '学历描述', prop: 'xlms'}],
        DWXZK: [{label: '单位性质代码', prop: 'dwxzdm'}, {label: '单位性质名称', prop: 'dwxz'}, {
          label: '单位性质描述',
          prop: 'xzms'
        }],
        DWGMK: [{label: '单位规模代码', prop: 'gmdm'}, {label: '规模详情', prop: 'gmxq'}],
        DWHYDMK: [{label: '单位行业代码', prop: 'hydm'}, {label: '行业名称', prop: 'hymc'}, {
          label: '行业描述',
          prop: 'hyms'
        }],
      }


    };
  },
  created() {
    this.get_ALl_JCSJ(); // 获取所有数据
    this.selectTable(this.tables[0]); // 组件创建时默认选中第一个表
  },
  computed: {
    //这是返回的表格数据，给到子组件DataTable
    filteredData() {
      console.log("数据如下:");
      console.log(this[this.selectedTable.name] || []);
      // name来自： { name: "DWHYDMK", label: "单位行业代码库" },
      return this[this.selectedTable.name] || []; // 获取当前选中表的数据
    },
    tableColumns() {
      console.log("列名如下:");
      console.log(this.AllTableColumnData[this.selectedTable.name] || []);
      return this.AllTableColumnData[this.selectedTable.name] || []; // 获取当前选中表的列名
    },
    // 计算属性：获取分页后的数据
    paginatedDataDWHYDMK() {
      const start = (this.currentPageDWHYDMK - 1) * this.pageSizeDWHYDMK; // 计算起始索引
      return this.DWHYDMK.slice(start, start + this.pageSize); // 返回当前页的数据
    }
  },
  methods: {
    // 单位行业代码分页
    handleCurrentChangeDWHYDMK(page) {
      this.currentPageDWHYDMK = page;
    },

    get_ALl_JCSJ() {
      axios.get("/data/getAllJCSJ2").then((response) => {
        if (response.data.result) {
          this.SFDMK = response.data.data.SFDMK.data;
          this.XLTTK = response.data.data.XLTTK.data;
          this.DWXZK = response.data.data.DWXZK.data;
          this.DWGMK = response.data.data.DWGMK.data;
          this.DWHYDMK = response.data.data.DWHYDMK.data;
        } else {
          this.$message({
            showClose: true,
            message: '后台错误',
            type: 'error'
          });
        }
      }).catch((error) => {
        this.$message({
          showClose: true,
          message: '网络错误',
          type: 'error'
        });
        console.log(error);
      });
    },

    //新增数据
    add_JCSJ() {
      console.log("当前选中表：");
      console.log(this.selectedTable);
    },


    //默认：{ name: "DWHYDMK", label: "单位行业代码库" },
    selectTable(table) {
      this.selectedTable = table; // 设置当前选中表
    },
  },
};
</script>
