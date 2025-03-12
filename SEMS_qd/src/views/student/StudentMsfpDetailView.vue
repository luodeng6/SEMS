<template>
  <div class="content">
    <StudentMenu />
    <main class="main-content">
      <div class="interview-container">
        <!-- 每个面试场次 -->
        <div v-for="(sessionData, sIndex) in interviewSessions" :key="sIndex" class="session-container">
          <!-- 场次卡片 -->
          <el-card class="session-card gradient-card" style="padding: 0 !important;" shadow="never">
            <div class="session-header">
              <h2 class="company-name">{{ sessionData.session.gsmc }}</h2>
              <div class="position-tag">
                {{ sessionData.session.gwmc }}
                <span class="result-badge" :class="sessionData.session.msjg === '通过' ? 'success' : 'danger'">
                  {{ sessionData.session.msjg }}
                </span>
              </div>
            </div>

            <el-descriptions class="session-details" :column="2" direction="vertical">
              <el-descriptions-item label="面试时间" icon="el-icon-time">
                <span class="detail-value">{{ sessionData.session.mssj }}</span>
              </el-descriptions-item>
              <el-descriptions-item label="面试官" icon="el-icon-user">
                <span class="detail-value">{{ sessionData.session.mshr }}</span>
              </el-descriptions-item>
              <el-descriptions-item label="地点" icon="el-icon-location">
                <span class="detail-value">{{ sessionData.session.msdd }}</span>
              </el-descriptions-item>
              <el-descriptions-item label="整体评分" icon="el-icon-data-line">
                <div class="session-score">
                  <el-progress
                      type="dashboard"
                      :percentage="calculateSessionScore(sessionData)"
                      :color="getProgressColor(calculateSessionScore(sessionData))"
                      :width="80"
                  />
                </div>
              </el-descriptions-item>
            </el-descriptions>
          </el-card>

          <!-- 问题列表 -->
          <div class="questions-grid">
            <transition-group name="flip-list">
              <el-card

                  v-for="(question, index) in sessionData.questions"
                  :key="index"
                  class="question-card hover-transform"
                  shadow="never"
              >
                <div class="question-header">
                  <div class="question-meta">
                    <span class="question-index">Q{{ index + 1 }}</span>
                    <div class="question-tags">
                      <el-tag
                          v-for="(tag, tagIndex) in question.tags"
                          :key="tagIndex"
                          effect="dark"
                          :color="tagColors[tagIndex % tagColors.length]"
                          closable
                          @close="removeTag(sIndex, index, tag)"
                      >
                        {{ tag }}
                      </el-tag>
                    </div>
                  </div>
                  <el-button
                      type="danger"
                      icon="el-icon-delete"
                      circle
                      class="delete-btn"
                      @click="removeQuestion(sIndex, index)"
                  />
                </div>

                <div class="question-content">
                  <div class="section">
                    <label class="section-label">问题描述</label>
                    <p class="section-text">{{ question.description || "暂无描述" }}</p>
                  </div>

                  <el-divider class="divider" />

                  <div class="section">
                    <label class="section-label">我的回答</label>
                    <p class="section-text highlight-box" >{{ question.answer || "未填写" }}</p>
                  </div>

                  <el-divider class="divider" />

                  <div class="section">
                    <label class="section-label">优化建议</label>
                    <p class="section-text improvement-text" v-html="question.improvement? question.improvement.replace(/\n/g, '<br>') : '暂无改进建议'"></p>
                  </div>
                </div>

                <div class="question-footer">
                  <div class="score-section">
                    <el-progress
                        :percentage="question.score"
                        :stroke-width="12"
                        :color="getProgressColor(question.score)"
                        :show-text="false"
                    />
                    <span class="score-text">{{ question.score }}分</span>
                  </div>
                  <el-button
                      v-if="!question.tagInputVisible"
                      type="text"
                      icon="el-icon-price-tag"
                      class="add-tag-btn"
                      @click="showTagInput(sIndex, index)"
                  >
                    添加知识点
                  </el-button>
                  <el-input
                      v-else
                      v-model="question.tagInputValue"
                      class="tag-input"
                      size="mini"
                      placeholder="输入后按回车"
                      @keyup.enter.native="addTag(sIndex, index)"
                      @blur="addTag(sIndex, index)"
                  />
                </div>
              </el-card>
            </transition-group>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import axios   from "axios";
export default {
  name: "StudentMsfpDetailView",
  components: { StudentMenu },
  data() {
    return {
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      tagColors: ['#409EFF', '#67C23A', '#E6A23C', '#F56C6C', '#909399'],
      interviewSessions: [],
      /*interviewSessions: [
        {
          session: {
            mssj: "2025-03-03 14:00",
            gwmc: "前端开发工程师",
            gsmc: "阿里巴巴",
            msjg: "通过",
            mshr: "张经理",
            msdd: "杭州市西湖区"
          },
          questions: [
            {
              description: "介绍一下 Vue 的生命周期。",
              answer: "Vue 生命周期包含创建、挂载、更新和销毁等阶段，每个阶段都有相应的钩子函数。",
              improvement: "可以补充各个生命周期钩子函数的具体作用。",
              tags: ["Vue", "生命周期"],
              score: 80,
              tagInputVisible: false,
              tagInputValue: ""
            }
          ]
        },
        {
          session: {
            mssj: "2025-03-05 10:00",
            gwmc: "Java 后端开发",
            gsmc: "腾讯",
            msjg: "未通过",
            mshr: "李主管",
            msdd: "深圳市南山区"
          },
          questions: [
            {
              description: "谈谈 Java 线程池的作用。",
              answer: "线程池用于管理线程，避免频繁创建和销毁，提高效率。",
              improvement: "可以补充线程池的不同策略。",
              tags: ["Java", "线程池"],
              score: 75,
              tagInputVisible: false,
              tagInputValue: ""
            }
          ]
        }
      ]*/
    };
  },
  mounted() {
    this.getLoginUserInfo();

  },
  methods: {
    // 获取学生信息
    getStudentDataByUsername(yhm) {
      axios.get(`/student/getStudentByUsernameOrId?usernameOrId=${yhm}&type=username`).then(response => {
        if (response.data.result) {
          this.UserInfo.id = response.data.data.id;
          console.log(this.UserInfo);
        } else {
          this.$message.error("获取学生信息失败:" + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取学生信息失败，网络错误！");
      });
    },
    getLoginUserInfo() {
      axios.get('/user/checkSession').then(response => {
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({name: 'DwLoginView'});
          }, 1000);
        } else {
          console.log('登录成功-----！');
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.UserInfo.id = response.data.id;
          this.getStudentDataByUsername(this.UserInfo.username);
          this.loaddData();
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      });
    },
    loaddData() {
      axios.get("/msfpk/getMsfpkList?YHM="+this.UserInfo.username).then(response => {
        if (response.data.result) {
         // this.interviewSessions = response.data.data;
          let responseData=response.data.data;
          // 遍历面试复盘
          for (let i = 0; i < responseData.msfpk.length; i++){
              let MSFPK= {};

              let sessionData={};
            /*session: {
                mssj: "2025-03-03 14:00",
                    gwmc: "前端开发工程师",
                    gsmc: "阿里巴巴",
                    msjg: "通过",
                    mshr: "张经理",
                    msdd: "杭州市西湖区"
              },*/
            sessionData.mssj=responseData.msfpk[i].MSSJ;
            sessionData.gwmc=responseData.msfpk[i].GWMC;
            //sessionData.msjg=responseData.fpwtbqk[i].MSJG;
            sessionData.msjg="通过"
            sessionData.mshr=responseData.msfpk[i].HRXM;
            sessionData.msdd=responseData.msfpk[i].MSDD;

            MSFPK.session=sessionData;// 面试数据已经完整

            // 获取面试的问题
            let questionsData=responseData.msfpwtk.filter(item=>item.FPDM===  responseData.msfpk[i].ID);
            let questions=[];
            for (let j = 0; j < questionsData.length; j++){
              let question={};
                  /*description: "介绍一下 Vue 的生命周期。",
                  answer: "Vue 生命周期包含创建、挂载、更新和销毁等阶段，每个阶段都有相应的钩子函数。",
                  improvement: "可以补充各个生命周期钩子函数的具体作用。",
                  tags: ["Vue", "生命周期"],
                  score: 80,
                  tagInputVisible: false,
                  tagInputValue: ""*/

              question.description=questionsData[j].WTMS; // 问题描述
              question.answer=questionsData[j].WDHD; // 我的回答
              question.improvement=questionsData[j].GJHD;// 改进回答
             // question.tags=questionsData[j].ZDY;
              question.score=questionsData[j].ZWPF;// 自我评分
              question.tagInputVisible=false;
              question.tagInputValue="";
              // 获取标签
              let TagList=[];
              let TagData=responseData.fpwtbqk.filter(item=>item.WTID===responseData.msfpwtk[i].ID);// 从所有数据中获取标签数据
              for (let k = 0; k < TagData.length; k++){
                  TagList.push(TagData[k].BQNR);
              }
              question.tags=TagList;
              questions.push(question);
            }
            MSFPK.questions=questions;// 问题数据已经完整
            this.interviewSessions.push(MSFPK);
          }

        } else {
          this.$message.error("获取面试信息失败1:" + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取面试信息失败2，网络错误！");
      });

    },
    // 移除问题
    removeQuestion(sIndex, index) {
      this.interviewSessions[sIndex].questions.splice(index, 1);
    },
    // 移除标签
    removeTag(sIndex, qIndex, tag) {
      const question = this.interviewSessions[sIndex].questions[qIndex];
      question.tags = question.tags.filter(item => item !== tag);
    },
    // 显示标签输入框
    showTagInput(sIndex, qIndex) {
      this.interviewSessions[sIndex].questions[qIndex].tagInputVisible = true;
    },
    // 输入标签后按回车或失去焦点添加标签
    addTag(sIndex, qIndex) {
      const question = this.interviewSessions[sIndex].questions[qIndex];
      const newTag = question.tagInputValue && question.tagInputValue.trim();
      if (newTag && !question.tags.includes(newTag)) {
        question.tags.push(newTag);
      }
      question.tagInputVisible = false;
      question.tagInputValue = "";
    },
    getProgressColor(score) {
      if (score < 40) return "#F56C6C";
      if (score < 80) return "#E6A23C";
      return "#67C23A";
    },
    calculateSessionScore(sessionData) {
      const total = sessionData.questions.reduce((sum, q) => sum + q.score, 0);
      return Math.round(total / sessionData.questions.length);
    }
  }
};
</script>

<style scoped>
.content {
  display: flex;
  min-height: 100vh;
}

.el-card__body {
  padding: 10px !important;
}

.main-content {
  flex: 1;
  margin-left: 16rem;
  padding: 10px;
  min-height: 100vh;
 /* background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);*/
}

.interview-container {
  max-width: 90rem;
  margin: 0 auto;
}

.session-container {
  margin-bottom: 3rem;
}

.gradient-card {
 /* background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);*/
  border: 1px solid #e2e8f0;
  /*border-radius: 1rem;*/
  margin-bottom: 1.5rem;
}

.session-header {
  padding-bottom: 1rem;
  margin-bottom: 1.5rem;
  border-bottom: 1px solid #e2e8f0;
}

.company-name {
  font-size: 1.5rem;
  font-weight: 700;
  color: #1e293b;
  margin-bottom: 0.5rem;
}

.position-tag {
  display: inline-flex;
  align-items: center;
  padding: 0.5rem 1rem;
  background-color: #eff6ff;
  color: #2563eb;
  border-radius: 9999px;
  font-size: 0.875rem;
  font-weight: 500;
}

.result-badge {
  margin-left: 0.5rem;
  padding: 0.25rem 0.5rem;
  border-radius: 9999px;
  font-size: 0.75rem;
  font-weight: 700;
}

.result-badge.success {
  background-color: #dcfce7;
  color: #16a34a;
}

.result-badge.danger {
  background-color: #fee2e2;
  color: #dc2626;
}

.session-details {
  padding: 0 1rem;
}

.detail-value {
  color: #334155;
  font-weight: 500;
}

.questions-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  gap: 1.5rem;
}

.question-card {
/*  border-radius: 0.75rem;
  transition: all 0.3s ease;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);*/
}

.question-card:hover {
/*  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
  transform: translateY(-2px);*/
}

.question-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1rem;
}

.question-meta {
  display: flex;
  align-items: center;
  gap: 0.75rem;
}

.question-index {
  font-size: 1.25rem;
  font-weight: 700;
  color: #2563eb;
}

.question-tags {
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
}

.delete-btn {
  flex-shrink: 0;
}

.question-content {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.section-label {
  display: block;
  font-size: 0.875rem;
  color: #64748b;
  margin-bottom: 0.5rem;
}

.section-text {
  color: #334155;
  line-height: 1.6;
}

.highlight-box {
  background-color: #fffbeb;
  padding: 0.75rem;
  border-radius: 0.5rem;
  border: 1px solid #fde68a;
}

.improvement-text {
  color: #059669;
  font-style: italic;
}

.divider {
  margin: 1rem 0;
  background-color: #e2e8f0;
}

.question-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 1.5rem;
}

.score-section {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  width: 70%;
}

.score-text {
  font-size: 0.875rem;
  color: #475569;
  font-weight: 500;
}

.add-tag-btn {
  color: #64748b;
  transition: color 0.2s;
}

.add-tag-btn:hover {
  color: #2563eb;
}

.tag-input {
  width: 8rem;
}

.flip-list-move {
  transition: transform 0.5s;
}
</style>