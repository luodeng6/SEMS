<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold text-gray-800">就业指导中心</h1>
        <el-input
            placeholder="搜索职位/公司"
            class="w-64"
            v-model="searchKey"
            @keyup.enter.native="handleSearch"
        >
          <el-button slot="append" icon="el-icon-search"></el-button>
        </el-input>
      </header>

      <!-- 就业公告 -->
      <el-card class="mb-6">
        <div slot="header" class="clearfix">
          <span class="font-semibold">就业公告</span>
          <el-button
              v-if="hasNewNotice"
              type="text"
              class="float-right text-red-500"
              @click="markAllAsRead"
          >
            标记全部已读
          </el-button>
        </div>
        <el-collapse v-model="activeNotice" accordion>
          <el-collapse-item
              v-for="notice in notices"
              :key="notice.id"
              :name="notice.id"
              class="notice-item"
          >
            <template slot="title">
              <div class="flex items-center w-full">
                <el-badge
                    is-dot
                    class="mr-3"
                    :hidden="notice.isRead || !hasNewNotice"
                ></el-badge>
                <span class="flex-1 font-medium">{{ notice.title }}</span>
                <div class="flex items-center text-sm text-gray-500">
                  <span class="mr-4">{{ notice.date }}</span>
                  <el-tag
                      size="mini"
                      :type="notice.tagType"
                      effect="plain"
                  >
                    {{ notice.tag }}
                  </el-tag>
                </div>
              </div>
            </template>
            <div class="px-8 pb-4">
              <div class="text-gray-600 whitespace-pre-line mb-2">{{ notice.content }}</div>
              <div v-if="notice.attachments" class="mt-3">
                <el-link
                    v-for="(file, fIndex) in notice.attachments"
                    :key="fIndex"
                    type="primary"
                    :href="file.url"
                    class="mr-4"
                    target="_blank"
                >
                  <i class="el-icon-paperclip"></i>
                  {{ file.name }}
                </el-link>
              </div>
            </div>
          </el-collapse-item>
        </el-collapse>
      </el-card>

      <!-- 岗位推荐 -->
      <el-row :gutter="16" class="mb-6">
        <el-col :span="24">
          <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-semibold">推荐岗位</h2>
            <el-link type="primary" :underline="false">查看更多 ></el-link>
          </div>
        </el-col>
        <el-col :sm="12" :md="8" v-for="job in jobs" :key="job.id">
          <el-card class="mb-4 hover:shadow-lg transition-shadow">
            <div class="flex justify-between items-start">
              <div>
                <h3 class="font-medium text-lg">{{ job.position }}</h3>
                <p class="text-gray-500">{{ job.company }}</p>
              </div>
              <el-tag :type="job.type === '校招' ? 'success' : 'warning'">
                {{ job.type }}
              </el-tag>
            </div>
            <div class="mt-4 text-gray-600">
              <p class="mb-2"><i class="el-icon-location-outline"></i> {{ job.location }}</p>
              <p class="text-red-500 font-medium">{{ job.salary }}</p>
            </div>
            <div class="mt-4 flex justify-between items-center">
              <span class="text-sm text-gray-400">{{ job.date }}</span>
              <el-button type="primary" size="small" @click="handleApply(job)">立即申请</el-button>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <!-- 指导服务 -->
      <el-row :gutter="16">
        <!-- 就业指导课程 -->
        <el-col :span="12">
          <el-card>
            <div slot="header" class="clearfix">
              <span class="font-semibold">就业指导课程</span>
            </div>
            <el-list>
              <el-list-item v-for="course in courses" :key="course.id">
                <div class="flex justify-between items-center w-full">
                  <div>
                    <h4 class="font-medium">{{ course.name }}</h4>
                    <p class="text-sm text-gray-500">{{ course.time }}</p>
                  </div>
                  <el-button
                      :type="course.registered ? 'info' : 'primary'"
                      size="small"
                      @click="handleRegister(course)"
                  >
                    {{ course.registered ? '已报名' : '立即报名' }}
                  </el-button>
                </div>
              </el-list-item>
            </el-list>
          </el-card>
        </el-col>

        <!-- 简历工具 -->
        <el-col :span="12">
          <el-card>
            <div slot="header" class="clearfix">
              <span class="font-semibold">简历服务中心</span>
            </div>
            <div class="text-center">
              <el-upload
                  class="mb-4"
                  action="/api/upload"
                  :show-file-list="false"
                  @success="handleUploadSuccess"
              >
                <el-button type="primary" icon="el-icon-upload">上传简历</el-button>
              </el-upload>
              <p class="text-gray-500 text-sm mb-4">支持格式：PDF/DOCX，最大5M</p>
              <el-button
                  type="success"
                  icon="el-icon-document-checked"
                  @click="generateTemplate"
              >
                生成标准模板
              </el-button>
            </div>
          </el-card>

          <!-- 进度跟踪 -->
          <el-card class="mt-4">
            <div slot="header" class="clearfix">
              <span class="font-semibold">就业进度跟踪</span>
            </div>
            <el-timeline>
              <el-timeline-item
                  v-for="(step, index) in progress"
                  :key="index"
                  :type="step.status"
                  :timestamp="step.time"
              >
                {{ step.content }}
              </el-timeline-item>
            </el-timeline>
          </el-card>
        </el-col>
      </el-row>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import axios from "axios";

export default {
  name: 'CareerGuidance',
  components: { StudentMenu },
  data() {
    return {
      searchKey: '',
      activeNotice: null,
      notices: [
        {
          id: 1,
          title: '2023秋季校园招聘会通知',
          content: '时间：2023年10月20日 9:00-17:00\n地点：学校体育馆\n参与企业：包含腾讯、阿里、字节跳动等50余家知名企业...',
          date: '2023-09-15',
          tag: '最新',
          tagType: 'danger',
          attachments: [
            { name: '参会企业名单.pdf', url: '#' },
            { name: '招聘会地图.jpg', url: '#' }
          ],
          isRead: false
        },
        {
          id: 2,
          title: '简历制作专题讲座通知',
          content: '主讲人：知名HR总监 张老师\n时间：2023年9月25日 14:00\n地点：第三教学楼201室\n内容包含：简历制作技巧、常见错误分析、优秀案例分享...',
          date: '2023-09-12',
          tag: '进行中',
          tagType: 'success',
          isRead: true
        }
      ],
      jobs: [
        { id: 1, position: '前端开发工程师', company: 'XX科技', type: '校招',
          location: '北京', salary: '15-25K', date: '3天前' },
        { id: 2, position: 'Java开发工程师', company: 'YY集团', type: '社招',
          location: '上海', salary: '20-30K', date: '1天前' }
      ],
      courses: [
        { id: 1, name: '面试技巧提升课', time: '每周三 14:00', registered: false },
        { id: 2, name: '职业规划讲座', time: '10月25日 15:30', registered: true }
      ],
      progress: [
        { content: '已提交就业意向调查', time: '2023-09-01', status: 'success' },
        { content: '简历审核中', time: '2023-09-05', status: 'primary' },
        { content: '等待面试安排', time: '2023-09-10', status: 'warning' }
      ]
    }
  },
  computed: {
    hasNewNotice() {
      return this.notices.some(notice => !notice.isRead)
    }
  },
  methods: {
    // 获取面试信息
    getInterviewInfo() {
    },
    handleSearch() {
      // 实现搜索逻辑
      console.log('Search key:', this.searchKey);
    },
    handleApply(job) {
      this.$confirm(`确定申请 ${job.position} 岗位吗？`, '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消'
      }).then(() => {
        this.$message.success('申请已提交');
      });
    },
    handleRegister(course) {
      if (!course.registered) {
        course.registered = true;
        this.$message.success('报名成功');
      }
    },
    handleUploadSuccess() {
      this.$message.success('简历上传成功');
    },
    generateTemplate() {
      this.$prompt('请输入姓名', '生成简历模板', {
        inputPattern: /\S+/,
        inputErrorMessage: '姓名不能为空'
      }).then(({ value }) => {
        this.$message.success('模板生成成功');
      });
    },
    markAllAsRead() {
      this.notices.forEach(notice => notice.isRead = true)
      this.$message.success('已标记全部公告为已读')
    }
  }
}
</script>

<style scoped>
.notice-item {
  transition: all 0.3s;
  border-bottom: 1px solid #ebeef5;
}

.notice-item:last-child {
  border-bottom: none;
}

::v-deep .el-collapse-item__header {
  padding: 12px 20px;
  font-size: 15px;
  background-color: #f8f9fc;
}

::v-deep .el-collapse-item__content {
  background-color: #fafafa;
  border-top: 1px dashed #e4e7ed;
}

.el-timeline {
  padding-left: 20px;
}

.hover\:shadow-lg:hover {
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
}

.transition-shadow {
  transition: box-shadow 0.3s ease-in-out;
}
</style>