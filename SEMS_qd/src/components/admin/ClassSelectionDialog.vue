<template>
  <el-dialog title="班级信息" :visible.sync="dialogVisible" width="45%">
    <el-input v-model="searchText" placeholder="请输入班级名称或代码" style="margin-bottom: 10px;"></el-input>
    <el-table
        :data="pagedData"
        style="width: 100%"
        ref="table">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="班级代码" width="180"></el-table-column>
      <el-table-column prop="bjmc" label="班级名称" width="280"></el-table-column>
      <el-table-column prop="dyzy" label="所属专业"></el-table-column>
      <el-table-column prop="bzrdm" label="班主任代码"></el-table-column>
    </el-table>
    <el-pagination
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-size="pageSize"
        :total="filteredList.length"
        layout="total, prev, pager, next, jumper"
    >
    </el-pagination>

    <span slot="footer" class="dialog-footer">
      <el-button @click="closeDialog">取 消</el-button>
      <el-button type="primary" @click="saveSelection">保 存</el-button>
    </span>
  </el-dialog>
</template>

<script>
export default {
  props: {
    dialogVisible: {
      type: Boolean,
      required: true
    },
    pageSize: {
      type: Number,
      required: false,
      default: 6
    },
    classList: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      currentPage: 1,
      searchText: '' // 新增搜索文本
    }
  },
  watch: {
    // 当搜索内容变化时重置到第一页
    searchText() {
      this.currentPage = 1
    }
  },
  computed: {
    // 过滤后的数据列表
    filteredList() {
      const search = this.searchText.toLowerCase()
      return this.classList.filter(item => {
        return (
            item.id.toString().toLowerCase().includes(search) ||
            (item.bjmc && item.bjmc.toLowerCase().includes(search))
      )})
    },
    // 分页数据
    pagedData() {
      const start = (this.currentPage - 1) * this.pageSize
      return this.filteredList.slice(start, start + this.pageSize)
    }
  },
  methods: {
    closeDialog() {
      this.$emit('update:dialogVisible', false)
    },
    handleCurrentChange(page) {
      this.currentPage = page
    },
    saveSelection() {
      const selected = this.$refs.table.selection
      this.$emit('selection-saved', selected)
      this.closeDialog()
    }
  }
}
</script>