<!-- BasicDataManagement.vue -->
<template>
  <div>
    <admin-menu></admin-menu>
    <main class="ml-64 flex-1 p-6">
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold text-gray-800">基础数据管理</h1>
        <div class="flex items-center space-x-4">
          <button
              class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600"
              @click="showAddDataPopup"
          >
            <i class="fas fa-plus"></i> 新增数据
          </button>
        </div>
      </header>

      <div class="bg-gray-100 p-4 rounded mb-4">
        <h2 class="text-lg font-semibold">您当前选择了=> <span style="color: #da1010">{{ selectedTable.label }}</span>
          操作</h2>
      </div>

      <div class="flex space-x-4 mb-6">
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
      </div>

      <DataTable
          :tableData="filteredData"
          :tableColumns="tableColumns"
          :currentPage="currentPage"
          :itemsPerPage="itemsPerPage"
          :searchQuery="searchQuery"
          @edit-data="editData"
          @confirm-delete="confirmDelete"
          @change-page="goToPage"
      />

      <!-- 添加数据弹窗 -->
      <transition name="fade">
        <div v-if="isPopupVisible" class="popup-overlay" @click="closePopup">
          <div class="popup" @click.stop>
            <h2 class="popup-title">{{ isEditMode ? '修改数据' : '新增数据' }}</h2>
            <label class="block" v-for="(col, index) in tableColumns" :key="index">
              {{ col }}：
              <input
                  v-model="dataForm[col]"
                  type="text"
                  class="border p-2 rounded"
              />
            </label>
            <div class="flex justify-end space-x-2">
              <button
                  class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600"
                  @click="saveData"
              >
                {{ isEditMode ? '保存' : '新增' }}
              </button>
              <button
                  class="bg-gray-500 text-white px-3 py-1 rounded hover:bg-gray-600"
                  @click="closePopup"
              >
                取消
              </button>
            </div>
          </div>
        </div>
      </transition>

      <!-- 删除确认弹窗 -->
      <transition name="fade">
        <div v-if="isConfirmDeleteVisible" class="popup-overlay" @click="closeDeleteConfirm">
          <div class="popup" @click.stop>
            <h2 class="popup-title">确认删除</h2>
            <p>您确定要删除这条数据吗？</p>
            <div class="flex justify-end space-x-2">
              <button
                  class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600"
                  @click="deleteData(confirmDeleteId)"
              >
                删除
              </button>
              <button
                  class="bg-gray-500 text-white px-3 py-1 rounded hover:bg-gray-600"
                  @click="closeDeleteConfirm"
              >
                取消
              </button>
            </div>
          </div>
        </div>
      </transition>
    </main>
  </div>
</template>

<script>
import AdminMenu from "@/components/admin/Admin_menu.vue"; // 导入管理菜单组件
import DataTable from "@/components/admin/JCSJ/JCSJ_Table.vue"; // 导入数据表格组件
import axios from "axios";

export default {
  name: "BasicDataManagement", // 组件名称
  components: { AdminMenu, DataTable }, // 注册组件
  data() {
    return {
      tables: [
        { name: "DWHYDMK", label: "单位行业代码库" },
        { name: "DWXZK", label: "单位性质库" },
        { name: "SFDMK", label: "省份代码库" },
        { name: "XLTTK", label: "学历天梯库" },
        { name: "DWGMK", label: "单位规模库" },
      ],
      selectedTable: {}, // 当前选中的表
      dataForm: { id: "", key: "" }, // 表单数据
      isPopupVisible: false, // 控制弹窗显示状态
      isEditMode: false, // 控制是否为编辑模式
      searchQuery: "", // 搜索查询字符串
      isConfirmDeleteVisible: false, // 控制删除确认弹窗显示状态
      confirmDeleteId: null, // 确认删除的 ID
      currentPage: 1, // 当前页码
      itemsPerPage: 5, // 每页显示的项目数量
      SFDMK: [],
      XLTTK: [],
      DWXZK: [],
      DWGMK: [],
      DWHYDMK: [],
    };
  },
  created() {
    this.get_ALl_JCSJ(); // 获取所有数据
    this.selectTable(this.tables[0]); // 组件创建时默认选中第一个表
  },
  computed: {
    filteredData() {
      return this[this.selectedTable.name] || []; // 获取当前选中表的数据
    },
    tableColumns() {
      const tableData = this.filteredData; // 获取当前选中表的数据
      return tableData.length > 0 ? Object.keys(tableData[0]) : []; // 提取列名
    },
  },
  methods: {
    get_ALl_JCSJ() {
      axios.get("/data/getAllJCSJ1").then((response) => {
        if (response.data.result) {
          this.SFDMK = response.data.data.SFDMK;
          this.XLTTK = response.data.data.XLTTK;
          this.DWXZK = response.data.data.DWXZK;
          this.DWGMK = response.data.data.DWGMK;
          this.DWHYDMK = response.data.data.DWHYDMK;
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
    selectTable(table) {
      this.selectedTable = table; // 设置当前选中表
      this.currentPage = 1; // 每次选择新表时重置为第一页
    },
    showAddDataPopup() {
      this.isEditMode = false; // 设置为新增模式
      this.dataForm = { id: "", key: "" }; // 重置表单数据
      this.isPopupVisible = true; // 显示弹窗
    },
    editData(item) {
      this.isEditMode = true; // 设置为编辑模式
      this.dataForm = { ...item }; // 将选中项的数据填入表单
      this.isPopupVisible = true; // 显示弹窗
    },
    closePopup() {
      this.isPopupVisible = false; // 隐藏弹窗
    },
    confirmDelete(id) {
      this.isConfirmDeleteVisible = true; // 显示删除确认弹窗
      this.confirmDeleteId = id; // 设置待删除的 ID
    },
    closeDeleteConfirm() {
      this.isConfirmDeleteVisible = false; // 隐藏删除确认弹窗
      this.confirmDeleteId = null; // 重置待删除 ID
    },
    deleteData(id) {
      if (id) {
        const tableData = this[this.selectedTable.name]; // 获取当前选中表的数据
        this[this.selectedTable.name] = tableData.filter(item => item.id !== id); // 过滤掉待删除项
      }
      this.closeDeleteConfirm(); // 关闭删除确认弹窗
    },
    saveData() {
      const tableData = this[this.selectedTable.name]; // 获取当前选中表的数据
      if (this.isEditMode) {
        const index = tableData.findIndex(item => item.id === this.dataForm.id); // 查找要编辑的项
        if (index !== -1) {
          tableData[index] = { ...this.dataForm }; // 更新数据
        }
      } else {
        const newId = (tableData.length ? Math.max(...tableData.map(item => item.id)) : 0) + 1; // 生成新的 ID
        this[this.selectedTable.name].push({ ...this.dataForm, id: newId }); // 添加新数据
      }
      this.closePopup(); // 关闭弹窗
      this.currentPage = 1; // 保存数据后重置为第一页
    },
    goToPage(page) {
      if (page > 0 && page <= this.totalPages) {
        this.currentPage = page; // 设置当前页码
      }
    },
  },
};
</script>
