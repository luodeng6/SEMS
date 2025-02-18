<template>
  <div class="content">
    <DwMenu />
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">面试管理系统</h1>
        <div>
          <el-button type="primary" icon="el-icon-plus" @click="openAddInterviewDialog">新增面试</el-button>
        </div>
      </header>

      <!-- 高级搜索 -->
      <div class="mb-4">
        <el-row>
          <el-col :span="6">
            <el-input v-model="filters.name" placeholder="姓名" clearable />
          </el-col>
          <el-col :span="6">
            <el-input v-model="filters.position" placeholder="职位" clearable />
          </el-col>
          <el-col :span="6">
            <el-date-picker v-model="filters.dateRange" type="daterange" placeholder="选择面试日期" />
          </el-col>
          <el-col :span="6">
            <el-button type="primary" @click="searchInterviews">搜索</el-button>
          </el-col>
        </el-row>
      </div>

      <!-- 面试列表 -->
      <el-table :data="interviewList" style="width: 100%" stripe>
        <el-table-column label="姓名" prop="name" width="150" />
        <el-table-column label="职位" prop="position" width="200" />
        <el-table-column label="面试时间" prop="interviewTime" width="180" />
        <el-table-column label="面试结果" prop="interviewResult" width="150" />
        <el-table-column label="操作" width="180">
          <template slot-scope="scope">
            <el-button @click="openEditInterviewDialog(scope.row)" size="small" type="primary">编辑</el-button>
            <el-button @click="deleteInterview(scope.row.id)" size="small" type="danger">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <div class="mt-4">
        <el-pagination
            @current-change="handlePageChange"
            :current-page="currentPage"
            :page-size="pageSize"
            :total="totalInterviews"
            layout="prev, pager, next, jumper"
        />
      </div>

      <!-- 新增/编辑面试对话框 -->
      <el-dialog :visible.sync="dialogVisible" title="新增/编辑面试">
        <el-form :model="currentInterview" ref="interviewForm" label-width="100px">
          <el-form-item label="姓名" :rules="[{ required: true, message: '请输入姓名', trigger: 'blur' }]">
            <el-input v-model="currentInterview.name" />
          </el-form-item>
          <el-form-item label="职位" :rules="[{ required: true, message: '请输入职位', trigger: 'blur' }]">
            <el-input v-model="currentInterview.position" />
          </el-form-item>
          <el-form-item label="面试时间" :rules="[{ required: true, message: '请选择面试时间', trigger: 'change' }]">
            <el-date-picker v-model="currentInterview.interviewTime" type="datetime" placeholder="选择面试时间" />
          </el-form-item>
          <el-form-item label="面试结果">
            <el-select v-model="currentInterview.interviewResult" placeholder="请选择面试结果">
              <el-option label="通过" value="通过" />
              <el-option label="未通过" value="未通过" />
              <el-option label="待定" value="待定" />
            </el-select>
          </el-form-item>
          <el-form-item label="面试评分">
            <el-rate v-model="currentInterview.interviewScore" />
          </el-form-item>
          <el-form-item label="反馈">
            <el-input type="textarea" v-model="currentInterview.feedback" placeholder="请输入面试反馈" />
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="saveInterview">保存</el-button>
        </span>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";

export default {
  name: 'DwMsApView',
  components: { DwMenu},
  data() {
    return {
      interviewList: [
        { id: 1, name: '张三', position: '前端开发', interviewTime: '2025-02-20 14:00', interviewResult: '待定', interviewScore: 3, feedback: '面试表现一般' },
        { id: 2, name: '李四', position: '后端开发', interviewTime: '2025-02-21 09:00', interviewResult: '通过', interviewScore: 4, feedback: '面试表现优秀' },
        // 更多面试数据...
      ],
      currentPage: 1,
      pageSize: 10,
      totalInterviews: 100,
      filters: {
        name: '',
        position: '',
        dateRange: []
      },
      dialogVisible: false,
      currentInterview: {
        id: null,
        name: '',
        position: '',
        interviewTime: '',
        interviewResult: '',
        interviewScore: 0,
        feedback: ''
      }
    };
  },
  methods: {
    handlePageChange(page) {
      this.currentPage = page;
      this.fetchInterviewList(page);
    },

    fetchInterviewList(page) {
      // 假设从后端获取分页数据
      console.log(`Fetching interviews for page ${page}`);
      // 示例代码，实际需要通过 API 请求来获取数据
    },

    searchInterviews() {
      // 使用 filters 搜索面试记录
      console.log('Search interviews with filters:', this.filters);
      this.fetchInterviewList(1);  // 默认跳转到第一页
    },

    openAddInterviewDialog() {
      this.currentInterview = { id: null, name: '', position: '', interviewTime: '', interviewResult: '', interviewScore: 0, feedback: '' };
      this.dialogVisible = true;
    },

    openEditInterviewDialog(interview) {
      this.currentInterview = { ...interview };
      this.dialogVisible = true;
    },

    deleteInterview(id) {
      // 删除操作
      console.log(`Deleting interview with id ${id}`);
      this.fetchInterviewList(this.currentPage);
    },

    saveInterview() {
      this.$refs.interviewForm.validate(valid => {
        if (valid) {
          if (this.currentInterview.id) {
            // 编辑面试
            console.log('Saving edited interview:', this.currentInterview);
          } else {
            // 新增面试
            console.log('Saving new interview:', this.currentInterview);
          }
          this.dialogVisible = false;
          this.fetchInterviewList(this.currentPage);
        } else {
          console.log('Form validation failed!');
        }
      });
    }
  }
};
</script>

<style scoped>
.content {
  display: flex;
  min-height: 100vh;
  background-color: #f9fafb;
}

.ml-64 {
  margin-left: 256px;
}

.flex-1 {
  flex: 1;
}

.bg-gray-50 {
  background-color: #f9fafb;
}

.mt-4 {
  margin-top: 16px;
}
</style>
