<!-- DataTable.vue -->
<template>
  <div class="bg-white rounded-lg shadow p-4">
    <div class="flex items-center mb-4">
      <input
          v-model="searchQuery"
          type="text"
          placeholder="搜索数据"
          class="border px-2 py-1 rounded"
      />
    </div>


    <el-table
        ref="multipleTable"
        :data="tableData"
        tooltip-effect="dark"
        style="width: 100%"
        @selection-change="handleSelectionChange">
      <el-table-column
          type="selection"
          width="55">
      </el-table-column>
      <el-table-column
          label="日期"
          width="120">
        <template slot-scope="scope">{{ scope.row.date }}</template>
      </el-table-column>
      <el-table-column
          prop="name"
          label="姓名"
          width="120">
      </el-table-column>
      <el-table-column
          prop="address"
          label="地址"
          show-overflow-tooltip>
      </el-table-column>
    </el-table>




  </div>
</template>

<script>
export default {
  props: {
    tableData: Array,
    tableColumns: Array,
    currentPage: Number,
    itemsPerPage: Number,
    searchQuery: String,
  },
  computed: {
    filteredData() {
      return this.tableData.filter(item =>
          Object.values(item).some(value =>
              value.toString().includes(this.searchQuery)
          )
      );
    },
    paginatedData() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      return this.filteredData.slice(start, start + this.itemsPerPage);
    },
    totalPages() {
      return Math.ceil(this.filteredData.length / this.itemsPerPage);
    },
  },
  methods: {
    editData(item) {
      console.log("编辑数据:");
      console.log(item);
      this.$emit('edit-data', item);// 触发父组件的 edit-data 事件
    },
    confirmDelete(id) {
      this.$emit('confirm-delete', id);
    },
    prevPage() {
      if (this.currentPage > 1) {
        this.$emit('change-page', this.currentPage - 1);
      }
    },
    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.$emit('change-page', this.currentPage + 1);
      }
    },
    goToPage(page) {
      if (page > 0 && page <= this.totalPages) {
        this.$emit('change-page', page);
      }
    },
  },
};
</script>
