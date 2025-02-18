<template>
  <div class="bg-white rounded-lg shadow p-4">
    <!-- 搜索框 -->
    <div class="flex items-center mb-4">
      <input
          v-model="searchQuery"
          type="text"
          placeholder="搜索数据"
          class="border px-2 py-1 rounded"
      />
    </div>

    <!-- 表格组件 -->
    <el-table
        ref="multipleTable"
        :data="paginatedData"
    tooltip-effect="dark"
    style="width: 100%"
    @selection-change="handleSelectionChange"
    border>
    <!-- 选择列 -->
    <el-table-column
        type="selection"
        width="55"></el-table-column>

    <!-- 动态列 -->
    <el-table-column
        v-for="column in columns"
        :key="column.prop"
        :prop="column.prop"
        :label="column.label"
        :min-width="column.minWidth || 100"
        :show-overflow-tooltip="true">
    </el-table-column>
    </el-table>

    <!-- 分页组件 -->
    <el-pagination
        @current-change="handleCurrentChange"
    :current-page="currentPage"
    :page-size="pageSize"
    :total="filteredData.length"
    layout="total, prev, pager, next, jumper"
    class="mt-4">
    </el-pagination>
  </div>
</template>

<script>
/*
* 此为 JCSJ_Table.vue 组件的脚本代码
* 主要功能： 1. 实现表格的分页、搜索、排序功能；
*          2. 实现动态列的渲染；
*          3. 实现选择列的功能；
*          4. 实现分页组件的功能；
*          5. 实现数据过滤功能；
*          6. 实现 mounted 钩子函数，打印测试数据；
*          7. element-ui 实现修改查询删除
* */

export default {
  name: "DataTable",
  props: {
    tableData: Array, // 表格数据
    columns: Array, // 表格列配置
    searchQuery: String, // 搜索查询字符串
  },
  data() {
    return {
      currentPage: 1, // 当前页
      pageSize: 7, // 每页显示的条目数，默认设置为 5
    };
  },
  computed: {
    // 计算属性：获取过滤后的数据
    filteredData() {
      // 根据搜索查询过滤数据
      return this.tableData.filter(item => {
        return Object.values(item).some(value =>
            String(value).toLowerCase().includes(this.searchQuery.toLowerCase())
        );
      });
    },
    // 计算属性：获取分页后的数据
    paginatedData() {
      const start = (this.currentPage - 1) * this.pageSize; // 计算起始索引
      return this.filteredData.slice(start, start + this.pageSize); // 返回当前页的数据
    }
  }  ,
  mounted() {
    console.log("mounted数据：：：：");
    console.log(this.tableData);
    console.log(this.columns);
    this.columns.forEach(column => {
      console.log(column.prop); // 正确访问
      console.log(column.label); // 正确访问
    });
  },
  methods: {
    handleSelectionChange(val) {
      this.multipleSelection = val; // 处理选择变化
    },
    handleCurrentChange(page) {
      this.currentPage = page; // 更新当前页
    }
  },
};
</script>

<style scoped>
/* 可根据需要添加样式 */
</style>
