<template>
  <div class="content">
    <StudentMenu />
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold text-gray-800">简历管理</h1>
      </header>

      <el-tabs v-model="activeTab" type="card">
        <!-- 管理标签页 -->
        <el-tab-pane label="简历管理" name="manage">
          <el-table
              :data="resumes"
              border
              stripe
              class="w-full"
              @row-dblclick="previewResume"
          >
            <el-table-column prop="JLDM" label="简历代码" width="100"></el-table-column>
            <el-table-column prop="JLMC" label="简历名称" width="150"></el-table-column>
            <el-table-column prop="FBSJ" label="发布时间" width="180">
              <template #default="{ row }">
                {{ row.FBSJ | dateFormat }}
              </template>
            </el-table-column>
            <el-table-column prop="FBBZ" label="状态" width="100">
              <template #default="{ row }">
                <el-tag :type="row.FBBZ === '1' ? 'success' : 'info'">
                  {{ row.FBBZ === '1' ? '已发布' : '草稿' }}
                </el-tag>
              </template>
            </el-table-column>
            <!-- 附件上传在表格中完成 -->
            <el-table-column label="附件" width="150">
              <template #default="{ row }">
                <el-upload
                    class="upload-demo"
                    action="/api/upload"
                    :limit="1"
                    :on-success="res => handleRowUploadSuccess(row, res)"
                    :file-list="row.uploadList"
                    list-type="text"
                    auto-upload
                >
                  <el-button size="mini" type="primary">上传附件</el-button>
                </el-upload>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="220">
              <template #default="{ row }">
                <el-button size="mini" @click="editResume(row)">编辑</el-button>
                <el-button
                    size="mini"
                    :type="row.FBBZ === '1' ? 'danger' : 'success'"
                    @click="togglePublish(row)"
                >
                  {{ row.FBBZ === '1' ? '取消发布' : '发布' }}
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>

        <!-- 编辑标签页 -->
        <el-tab-pane label="简历编辑" name="edit">
          <el-form ref="form" :model="form" :rules="rules" label-width="100px">
            <el-form-item label="简历名称" prop="JLMC">
              <el-input v-model="form.JLMC"></el-input>
            </el-form-item>
            <el-form-item label="简历内容">
              <div ref="editor" class="editor-container"></div>
            </el-form-item>
            <el-form-item class="mt-6">
              <el-button type="primary" @click="submitForm">保存</el-button>
              <el-button @click="resetForm">重置</el-button>
            </el-form-item>
          </el-form>
        </el-tab-pane>
      </el-tabs>

      <!-- 简历预览对话框 -->
      <el-dialog :visible.sync="previewVisible" title="简历预览" width="50%">
        <div v-html="previewContent"></div>
        <span slot="footer" class="dialog-footer">
          <el-button @click="previewVisible = false">关闭</el-button>
        </span>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import E from 'wangeditor';
import dayjs from 'dayjs';

export default {
  name: 'StudentResume',
  components: { StudentMenu },
  filters: {
    dateFormat(val) {
      return val ? dayjs(val).format('YYYY-MM-DD HH:mm') : '--';
    }
  },
  data() {
    return {
      activeTab: 'manage',
      // 模拟后端数据，初始化几条简历记录
      resumes: [
        {
          JLDM: '001',
          JLMC: '简历样本1',
          FBSJ: new Date().toISOString(),
          FBBZ: '0',
          HTML: '<p>这是简历样本1的内容</p>',
          uploadList: []
        },
        {
          JLDM: '002',
          JLMC: '简历样本2',
          FBSJ: new Date().toISOString(),
          FBBZ: '1',
          HTML: '<p>这是简历样本2的内容</p>',
          uploadList: []
        }
      ],
      form: {
        JLDM: null,
        JLMC: '',
        HTML: ''
      },
      rules: {
        JLMC: [
          { required: true, message: '请输入简历名称', trigger: 'blur' }
        ]
      },
      editor: null,
      previewVisible: false,
      previewContent: ''
    };
  },
  mounted() {
    this.initEditor();
    // 此处也可以从后端加载数据
    // this.loadResumes();
  },
  beforeDestroy() {
    if (this.editor) {
      this.editor.destroy();
      this.editor = null;
    }
  },
  methods: {
    initEditor() {
      this.editor = new E(this.$refs.editor);
      this.editor.config.onchange = (html) => {
        this.form.HTML = html;
      };
      this.editor.create();
    },

    // 模拟编辑操作：将行数据加载到编辑表单中
    editResume(row) {
      this.form = { ...row };
      this.editor.txt.html(row.HTML);
      this.activeTab = 'edit';
    },

    // 模拟表格中上传附件成功后，将附件地址更新到当前行数据中
    handleRowUploadSuccess(row, res) {
      // 假设返回结果中包含 url 字段
      this.$set(row, 'JLFJ', res.url);
      // 更新 fileList 信息
      row.uploadList = [{ name: '附件', url: res.url }];
      this.$message.success('附件上传成功');
    },

    // 保存编辑内容（模拟后端数据保存）
    submitForm() {
      this.$refs.form.validate(valid => {
        if (valid) {
          // 若JLDM存在，说明是编辑，否则为新增
          if (this.form.JLDM) {
            const index = this.resumes.findIndex(item => item.JLDM === this.form.JLDM);
            if (index !== -1) {
              // 更新最后修改时间
              this.form.FBSJ = new Date().toISOString();
              this.$set(this.resumes, index, { ...this.form, uploadList: this.resumes[index].uploadList || [] });
              this.$message.success('保存成功');
            }
          } else {
            // 新增一条记录
            this.form.JLDM = Date.now().toString();
            this.form.FBSJ = new Date().toISOString();
            this.form.FBBZ = '0';
            this.resumes.push({ ...this.form, uploadList: [] });
            this.$message.success('新增成功');
          }
          this.activeTab = 'manage';
        }
      });
    },

    resetForm() {
      this.$refs.form.resetFields();
      this.editor.txt.clear();
    },

    togglePublish(row) {
      row.FBBZ = row.FBBZ === '1' ? '0' : '1';
      this.$message.success('操作成功');
    },

    // 双击表格行时预览简历内容
    previewResume(row) {
      this.previewContent = row.HTML;
      this.previewVisible = true;
    }
  },
  computed: {
    studentId() {
      return this.$store.state.user.id;
    }
  }
};
</script>

<style scoped>
.editor-container {
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  padding: 10px;
  /* 设置编辑器高度 */
  min-height: 300px;
}
.w-e-toolbar {
  border-bottom: 1px solid #dcdfe6 !important;
}
.w-e-text-container {
  height: 300px !important;
}
</style>
