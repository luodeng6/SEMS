<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h2 class="text-2xl font-semibold">项目成果管理</h2>
        <el-button type="success" @click="handleAdd">新增项目</el-button>
      </header>
      <!-- 项目成果表格 -->
      <el-table :data="projectList" border class="w-full">
        <el-table-column prop="XMMC" label="项目名称" width="200"></el-table-column>
        <el-table-column prop="XMLX" label="项目类型" width="150">
          <template slot-scope="scope">
            {{ formatProjectType(scope.row.XMLX) }}
          </template>
        </el-table-column>
        <el-table-column prop="XMNR" label="项目内容" show-overflow-tooltip></el-table-column>
        <el-table-column prop="CJSJ" label="创建时间" :formatter="formatDate" width="150"></el-table-column>
        <el-table-column prop="QYDM" label="状态" width="100">
          <template slot-scope="scope">
            <el-tag :type="scope.row.QYDM === '1' ? 'success' : 'danger'">
              {{ scope.row.QYDM === '1' ? '启用' : '停用' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="150">
          <template slot-scope="scope">
            <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button size="mini" type="danger" @click="handleDelete(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <!-- 项目编辑对话框 -->
      <el-dialog :title="editMode ? '编辑项目' : '新增项目'" :visible.sync="dialogVisible" width="700px">
        <el-form :model="formModel" label-width="100px">
          <el-form-item label="项目名称" required>
            <el-input v-model="formModel.XMMC" placeholder="请输入项目名称"></el-input>
          </el-form-item>
          <el-form-item label="项目类型" required>
            <el-select v-model="formModel.XMLX" placeholder="请选择项目类型">
              <el-option
                  v-for="item in projectTypes"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="项目内容" required>
            <el-input
                type="textarea"
                :rows="4"
                v-model="formModel.XMNR"
                placeholder="请输入项目详细内容及成果">
            </el-input>
          </el-form-item>
          <el-form-item label="状态">
            <el-switch
                v-model="formModel.QYDM"
                active-value="1"
                inactive-value="0"
                active-text="启用"
                inactive-text="停用">
            </el-switch>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="handleSubmit">确 定</el-button>
        </span>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";

export default {
  name: 'StudentXmcgView',
  components: { StudentMenu },
  data() {
    return {
      projectList: [],       // 项目数据列表
      dialogVisible: false, // 对话框显示
      editMode: false,      // 编辑模式
      projectTypes: [       // 项目类型选项
        { value: '1', label: '科研项目' },
        { value: '2', label: '竞赛项目' },
        { value: '3', label: '社会实践' },
        { value: '4', label: '课程设计' }
      ],
      formModel: {
        ID: '',
        XMMC: '',
        XMNR: '',
        XMLX: '',
        QYDM: '1',
        STUID: '123' // 实际应从登录信息获取
      }
    };
  },
  methods: {
    // 日期格式化
    formatDate(row, column, cellValue) {
      return cellValue ? this.$moment(cellValue).format('YYYY-MM-DD') : '-';
    },

    // 项目类型格式化
    formatProjectType(type) {
      const item = this.projectTypes.find(t => t.value === type);
      return item ? item.label : '未知类型';
    },

    // 新增项目
    handleAdd() {
      this.editMode = false;
      this.formModel = {
        ID: '',
        XMMC: '',
        XMNR: '',
        XMLX: '',
        QYDM: '1',
        STUID: '123'
      };
      this.dialogVisible = true;
    },

    // 编辑项目
    handleEdit(row) {
      this.editMode = true;
      this.formModel = { ...row };
      this.dialogVisible = true;
    },

    // 删除项目
    handleDelete(row) {
      this.$confirm('确定要删除该项目吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.projectList = this.projectList.filter(item => item.ID !== row.ID);
      });
    },

    // 提交表单
    handleSubmit() {
      // 这里应添加表单验证
      if (!this.formModel.XMMC || !this.formModel.XMNR || !this.formModel.XMLX) {
        this.$message.error('请填写完整信息');
        return;
      }

      if (this.editMode) {
        // 更新逻辑
        const index = this.projectList.findIndex(item => item.ID === this.formModel.ID);
        this.projectList.splice(index, 1, {
          ...this.formModel,
          CJSJ: new Date().toISOString() // 更新修改时间
        });
      } else {
        // 新增逻辑
        this.projectList.push({
          ...this.formModel,
          ID: Date.now(),
          CJSJ: new Date().toISOString()
        });
      }
      this.dialogVisible = false;
    }
  }
};
</script>

<style scoped>
.el-form-item__content {
  line-height: 40px;
}
.el-select {
  width: 100%;
}
.el-textarea__inner {
  resize: vertical;
}
</style>