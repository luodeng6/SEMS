<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold text-gray-800">面试复盘系统</h1>
        <el-button type="primary" @click="showHistory">查看历史复盘</el-button>
      </header>

      <!-- 面试记录表单 -->
      <el-card class="mb-6">
        <div slot="header" class="clearfix">
          <span class="font-semibold">面试记录</span>
        </div>
        <el-form :model="interviewForm" label-width="100px" ref="interviewForm">
          <el-row :gutter="24">
            <el-col :span="8">
              <el-form-item label="公司名称" prop="company" required>
                <el-input v-model="interviewForm.company"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="面试岗位" prop="position" required>
                <el-input v-model="interviewForm.position"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="面试时间" prop="date" required>
                <el-date-picker
                    v-model="interviewForm.date"
                    type="datetime"
                    style="width: 100%"
                ></el-date-picker>
              </el-form-item>
            </el-col>
          </el-row>

          <el-row :gutter="24">
            <el-col :span="8">
              <el-form-item label="面试形式" prop="type">
                <el-select v-model="interviewForm.type" style="width: 100%">
                  <el-option label="现场面试" value="现场"></el-option>
                  <el-option label="视频面试" value="视频"></el-option>
                  <el-option label="电话面试" value="电话"></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="面试结果" prop="result">
                <el-select v-model="interviewForm.result" style="width: 100%">
                  <el-option label="通过" value="success"></el-option>
                  <el-option label="待定" value="pending"></el-option>
                  <el-option label="未通过" value="fail"></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="难度评级" prop="difficulty">
                <el-rate
                    v-model="interviewForm.difficulty"
                    :max="5"
                    :colors="['#99A9BF', '#F7BA2A', '#FF9900']"
                ></el-rate>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
      </el-card>

      <!-- 面试问题复盘 -->
      <el-card class="mb-6">
        <div slot="header" class="clearfix">
          <span class="font-semibold">问题复盘</span>
          <el-button
              class="float-right"
              type="primary"
              icon="el-icon-plus"
              @click="addQuestion"
          >
            添加问题
          </el-button>
        </div>

        <div v-for="(question, index) in interviewForm.questions" :key="index" class="mb-6">
          <el-divider v-if="index > 0"></el-divider>
          <div class="flex justify-between items-start mb-2">
            <h3 class="font-medium">问题 {{ index + 1 }}</h3>
            <el-button
                type="danger"
                icon="el-icon-delete"
                circle
                size="mini"
                @click="removeQuestion(index)"
            ></el-button>
          </div>

          <el-form :model="question" label-width="80px">
            <el-form-item label="问题描述" required>
              <el-input
                  type="textarea"
                  :rows="2"
                  v-model="question.description"
                  placeholder="记录面试官提出的问题"
              ></el-input>
            </el-form-item>

            <el-row :gutter="20">
              <el-col :span="12">
                <el-form-item label="我的回答">
                  <el-input
                      type="textarea"
                      :rows="3"
                      v-model="question.answer"
                      placeholder="记录你的回答内容"
                  ></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="改进回答">
                  <el-input
                      type="textarea"
                      :rows="3"
                      v-model="question.improvement"
                      placeholder="写下优化后的回答"
                  ></el-input>
                </el-form-item>
              </el-col>
            </el-row>

            <el-form-item label="知识点">
              <el-tag
                  v-for="tag in question.tags"
                  :key="tag"
                  closable
                  class="mr-2"
                  @close="removeTag(index, tag)"
              >
                {{ tag }}
              </el-tag>
              <el-input
                  class="input-new-tag"
                  v-if="question.tagInputVisible"
                  v-model="question.tagInputValue"
                  size="small"
                  @keyup.enter.native="addTag(index)"
                  @blur="addTag(index)"
              ></el-input>
              <el-button v-else size="small" @click="showTagInput(index)">
                + 添加标签
              </el-button>
            </el-form-item>

            <el-form-item label="自我评分">
              <el-slider
                  v-model="question.score"
                  :step="10"
                  show-stops
                  :marks="{
                  0: '0',
                  50: '50',
                  100: '100'
                }"
              ></el-slider>
            </el-form-item>
          </el-form>
        </div>
      </el-card>

      <!-- 总结与附件 -->
      <el-card>
        <div slot="header" class="clearfix">
          <span class="font-semibold">总结与资料</span>
        </div>

        <el-form label-width="100px">
          <el-form-item label="整体反思">
            <el-input
                type="textarea"
                :rows="4"
                v-model="interviewForm.summary"
                placeholder="总结本次面试的得失，记录需要改进的地方"
            ></el-input>
          </el-form-item>

          <el-form-item label="相关资料">
            <el-upload
                action="/api/upload"
                multiple
                :file-list="interviewForm.attachments"
                list-type="text"
            >
              <el-button size="small" type="primary">点击上传</el-button>
              <div slot="tip" class="el-upload__tip">
                可上传面试题目、代码题等资料（支持PDF/Word/图片格式，单个文件不超过10M）
              </div>
            </el-upload>
          </el-form-item>
        </el-form>

        <div class="text-center mt-6">
          <el-button type="primary" size="large" @click="submitForm">提交复盘</el-button>
        </div>
      </el-card>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";

export default {
  name: 'InterviewReview',
  components: { StudentMenu },
  data() {
    return {
      interviewForm: {
        company: '',
        position: '',
        date: '',
        type: '现场',
        result: 'pending',
        difficulty: 3,
        questions: [this.newQuestion()],
        summary: '',
        attachments: []
      }
    }
  },
  methods: {
    newQuestion() {
      return {
        description: '',
        answer: '',
        improvement: '',
        tags: [],
        score: 50,
        tagInputVisible: false,
        tagInputValue: ''
      }
    },

    addQuestion() {
      this.interviewForm.questions.push(this.newQuestion())
    },

    removeQuestion(index) {
      this.interviewForm.questions.splice(index, 1)
    },

    showTagInput(index) {
      const q = this.interviewForm.questions[index]
      q.tagInputVisible = true
      this.$nextTick(() => {
        this.$refs[`tagInput${index}`][0].focus()
      })
    },

    addTag(index) {
      const q = this.interviewForm.questions[index]
      if (q.tagInputValue) {
        q.tags.push(q.tagInputValue)
        q.tagInputValue = ''
      }
      q.tagInputVisible = false
    },

    removeTag(index, tag) {
      const q = this.interviewForm.questions[index]
      q.tags = q.tags.filter(t => t !== tag)
    },

    submitForm() {
      this.$refs.interviewForm.validate(valid => {
        if (valid) {
          this.$confirm('确定提交面试复盘吗？', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消'
          }).then(() => {
            // 这里添加实际提交逻辑
            console.log('提交数据：', this.interviewForm)
            this.$message.success('复盘记录已保存')
          })
        }
      })
    },

    showHistory() {
      // 查看历史记录的实现
    }
  }
}
</script>

<style scoped>
.el-divider--horizontal {
  margin: 20px 0;
}

.input-new-tag {
  width: 100px;
  margin-left: 10px;
}

::v-deep .el-upload-list__item {
  transition: all 0.3s;
}
</style>