<template>
  <div class="content">
    <div>
      <AdminMenu></AdminMenu>
    </div>
    <main class="ml-64 flex-1 p-6  min-h-screen">


      <el-tabs v-model="activeTab">
        <!-- 公告发布 -->
        <el-tab-pane label="发布公告" name="publish">
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form :model="announcementForm" ref="announcementForm">
                <el-form-item label="公告标题">
                  <el-input v-model="announcementForm.title"></el-input>
                </el-form-item>
                <el-form-item>
                  <div ref="editor" style="text-align:left"></div>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="submitAnnouncement">发布公告</el-button>
                  <el-button @click="resetForm">重置</el-button>
                </el-form-item>
              </el-form>
            </el-col>
            <el-col :span="12">
              <div class="preview-panel">
                <h3>实时预览</h3>
                <h4>{{ announcementForm.title || '标题预览' }}</h4>
                <div v-html="announcementForm.content" class="preview-content"></div>
              </div>
            </el-col>
          </el-row>
        </el-tab-pane>

        <!-- 公告管理 -->
        <el-tab-pane label="公告管理" name="manage">
          <el-table :data="paginatedData" style="width: 100%">
            <el-table-column prop="title" label="标题" width="300"></el-table-column>
            <el-table-column prop="date" label="发布时间" width="200"></el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button size="mini" @click="editAnnouncement(scope.row)">编辑</el-button>
                <el-button size="mini" type="danger" @click="deleteAnnouncement(scope.row.id)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="currentPage"
              :page-sizes="[5, 10, 20, 50]"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="announcementList.length"
              style="margin-top: 20px; text-align: center;"
          ></el-pagination>

          <!-- 统计图表 -->
          <div class="chart-container">
            <h3>近7天公告统计</h3>
            <div ref="chart" style="width: 100%; height: 400px;"></div>
          </div>
        </el-tab-pane>
      </el-tabs>

    </main>
  </div>
</template>

<script>
import AdminMenu from "@/components/admin/Admin_menu.vue";
import WangEditor from "wangeditor";
import * as echarts from "echarts";

export default {
  name: 'Admin',
  components: {AdminMenu},
  data() {
    return {
      activeTab: 'publish',
      editor: null,
      announcementForm: {
        title: '',
        content: ''
      },
      announcementList: [
        {id: 1, title: '系统升级通知', content: '<p>系统将于本周五升级</p>', date: '2025-02-18'},
        {id: 2, title: '节假日安排', content: '<p>春节放假通知</p>', date: '2025-02-17'},
        {id: 3, title: '测试公告1', content: '<p>测试内容1</p>', date: '2025-02-16'},
        {id: 4, title: '测试公告2', content: '<p>测试内容2</p>', date: '2025-02-15'},
        {id: 5, title: '测试公告3', content: '<p>测试内容3</p>', date: '2025-02-14'},
        {id: 6, title: '测试公告4', content: '<p>测试内容4</p>', date: '2025-02-13'}
      ],
      currentPage: 1,
      pageSize: 5,
      chart: null
    };
  },
  computed: {
    paginatedData() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.announcementList.slice(start, end);
    }
  },
  mounted() {
    this.initEditor();
    this.initChart();
  },
  methods: {
    initEditor() {
      this.editor = new WangEditor(this.$refs.editor);
      this.editor.customConfig = {
        onchange: (html) => {
          this.announcementForm.content = html || '';
        },
        menus: [
          'head', 'bold', 'fontSize', 'fontName', 'italic', 'underline', 'strikeThrough',
          'foreColor', 'backColor', 'link', 'list', 'justify', 'quote', 'emoticon',
          'image', 'table', 'undo', 'redo'
        ],
        zIndex: 100,
        // 自定义处理拖放图片
        customUploadImg: (files, insert) => {
          files.forEach(file => {
            const reader = new FileReader();
            reader.onload = (e) => {
              const base64 = e.target.result;
              // 将图片插入编辑器
              insert(base64);
            };
            reader.readAsDataURL(file);
          });
        },
        // 启用拖放上传
        pasteFilterStyle: true,
        pasteIgnoreImg: false
      };

      // 监听拖放事件
      this.editor.customConfig.onDrop = (event) => {
        event.preventDefault();
        const files = event.dataTransfer.files;
        if (files.length > 0) {
          this.editor.customConfig.customUploadImg(files, (img) => {
            this.editor.cmd.do('insertHTML', `<img src="${img}" style="max-width:100%;"/>`);
          });
        }
      };

      this.editor.create();

      // 手动添加拖放事件监听器到编辑器区域
      const editorElem = this.$refs.editor;
      editorElem.addEventListener('dragover', (e) => e.preventDefault());
      editorElem.addEventListener('drop', (e) => {
        e.preventDefault();
        const files = e.dataTransfer.files;
        if (files.length > 0) {
          this.editor.customConfig.customUploadImg(files, (img) => {
            this.editor.cmd.do('insertHTML', `<img src="${img}" style="max-width:100%;"/>`);
          });
        }
      });
    },
    initChart() {
      this.chart = echarts.init(this.$refs.chart);
      const option = {
        xAxis: {
          type: 'category',
          data: ['02-13', '02-14', '02-15', '02-16', '02-17', '02-18', '02-19']
        },
        yAxis: {
          type: 'value'
        },
        series: [{
          data: [1, 0, 2, 1, 1, 2, 0],
          type: 'line',
          smooth: true,
          areaStyle: {}
        }],
        tooltip: {
          trigger: 'axis'
        }
      };
      this.chart.setOption(option);
    },
    submitAnnouncement() {
      if (!this.announcementForm.title || !this.announcementForm.content) {
        this.$message.error('请填写完整信息');
        return;
      }
      const newAnnouncement = {
        id: this.announcementList.length + 1,
        title: this.announcementForm.title,
        content: this.announcementForm.content,
        date: new Date().toLocaleDateString()
      };
      this.announcementList.unshift(newAnnouncement);
      this.$message.success('发布成功');
      this.resetForm();
    },
    resetForm() {
      this.announcementForm.title = '';
      this.announcementForm.content = '';
      this.editor.txt.html('');
    },
    editAnnouncement(row) {
      this.activeTab = 'publish';
      this.announcementForm.title = row.title;
      this.announcementForm.content = row.content;
      this.editor.txt.html(row.content);
    },
    deleteAnnouncement(id) {
      this.$confirm('确认删除该公告?', '提示', {
        type: 'warning'
      }).then(() => {
        this.announcementList = this.announcementList.filter(item => item.id !== id);
        this.$message.success('删除成功');
        if (this.paginatedData.length === 0 && this.currentPage > 1) {
          this.currentPage--;
        }
      });
    },
    handleSizeChange(val) {
      this.pageSize = val;
    },
    handleCurrentChange(val) {
      this.currentPage = val;
    }
  }
};
</script>

<style>
.p-6 {
  /*  */
  padding: 2rem !important;
}
.w-e-text-container{
  min-height: 600px !important;
}

.min-h-screen {
  /* min-height: 100vh; */
}

.preview-panel {
  border: 1px solid #EBEEF5;
  padding: 20px;
  min-height: 740px !important;
  background: #fff;
  position: relative;
  top: 41px;
}

.p-6 {
  /* padding: 1.5rem; */
}
.flex-1 {
  flex: 1 1 0%;
}

.min-h-screen {
  /* min-height: 100vh; */
}

.preview-panel {
  border: 1px solid #EBEEF5;
  padding: 20px;
  min-height: 400px;
  background: #fff;
}

.preview-content {
  margin-top: 10px;
  min-height: 300px;
}

.chart-container {
  margin-top: 20px;
  padding: 20px;
  background: #fff;
  border: 1px solid #EBEEF5;
}
</style>