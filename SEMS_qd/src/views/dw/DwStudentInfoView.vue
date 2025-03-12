<template>
  <div class="content">
    <dw-menu></dw-menu>

    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <el-card shadow="never" style="padding: 27px !important;">
        <div class="content-wrapper" style="display: flex; gap: 30px;">
          <!-- 左侧列 -->
          <div style="width: 600px;">
            <!-- 个人信息模块 -->
            <div class="profile-header">
              <div class="photo-container">
                <img
                    :src="studentData.xszp"
                    alt="个人照片"
                    class="profile-photo"
                    @click="handlePhotoClick">
                <input
                    type="file"
                    ref="photoInput"
                    @change="updatePhoto"
                    style="display: none;">
              </div>
              <div class="personal-info">
                <h1 class="name">{{ studentData.xsxm }}</h1>
                <h2 class="position">{{ personalInfo.position }}</h2>
                <div class="contact-info">
                  <p><i class="el-icon-message"></i> {{ personalInfo.email }}</p>
                  <p><i class="el-icon-phone"></i> {{ personalInfo.phone }}</p>
                  <p><i class="el-icon-location-outline"></i> {{ personalInfo.location }}</p>
                </div>
              </div>
            </div>

            <!-- 教育背景 -->
            <section-box title="教育背景">
              <div
                  v-for="(edu, index) in education"
                  :key="index"
                  class="education-item">
                <h3>{{ edu.school }}</h3>
                <p class="degree">{{ edu.degree }}</p>
                <p class="duration">{{ edu.duration }}</p>
                <p class="gpa">GPA: {{ edu.gpa }}</p>
              </div>
            </section-box>

            <!-- 专业证书 -->
            <section-box title="专业证书" style="margin-top: 20px;">
              <div
                  v-for="(cert, index) in certificates"
                  :key="'cert'+index"
                  class="certificate-item">
                <div class="cert-header">
                  <h3>{{ cert.name }}</h3>
                  <el-tag :type="cert.status === '有效' ? 'success' : 'danger'" size="mini">
                    {{ cert.status }}
                  </el-tag>
                </div>
                <p class="issuer">{{ cert.issuer }}</p>
                <div class="cert-footer">
                  <span class="date">{{ cert.date }}</span>
                  <div class="cert-actions">
                    <el-button
                        type="text"
                        size="mini"
                        @click="viewCertificate(cert)">
                      <i class="el-icon-document"></i> 查看
                    </el-button>
                  </div>
                </div>
              </div>
            </section-box>

            <!-- 技能专长 -->
            <section-box title="技能专长" style="margin-top: 20px;">
              <div class="skills-container">
                <div
                    v-for="(skill, index) in skills"
                    :key="index"
                    class="skill-tag"
                    :style="{ backgroundColor: skill.color }">
                  {{ skill.name }}
                </div>
              </div>
            </section-box>
          </div>

          <!-- 右侧列 -->
          <div style="flex: 1;">
            <!-- 工作经历 -->
            <section-box title="工作经历">
              <div
                  v-for="(exp, index) in workExperience"
                  :key="index"
                  class="experience-item"
                  style="padding: 10px 0; border-bottom: 1px solid #eaeaea;">
                <div class="exp-header" style="display: flex; justify-content: space-between; align-items: baseline;">
                  <h3 class="company-name" style="font-size: 1.4em; font-weight: bold; color: #333; margin: 0;">
                    {{ exp.company }}
                  </h3>
                  <span class="duration" style="font-size: 0.85em; color: #999; margin-left: 10px;">
                    {{ exp.duration }}
                  </span>
                </div>
                <p class="position" style="font-size: 1em; color: #666; margin: 5px 0;">
                  {{ exp.position }}
                </p>
                <ul class="responsibilities" style="list-style: disc; padding-left: 18px; margin: 0;">
                  <li v-for="(item, i) in exp.responsibilities" :key="i" style="margin-bottom: 3px;">
                    {{ item }}
                  </li>
                </ul>
              </div>
            </section-box>

            <!-- 项目成果 -->
            <section-box title="项目成果">
              <div
                  v-for="(project, index) in projects"
                  :key="index"
                  class="project-item">
                <h3 class="project-title">{{ project.name }}</h3>
                <p class="project-desc">{{ project.description }}</p>
                <div class="tech-stack">
                  <span
                      v-for="(tech, i) in project.technologies"
                      :key="i"
                      class="tech-tag">
                    {{ tech }}
                  </span>
                </div>
              </div>
            </section-box>

            <!-- 学业成绩 -->
            <section-box title="学业成绩" style="margin-top: 20px;">
              <div class="transcript-container">
                <el-table
                    :data="transcripts"
                    border
                    style="width: 100%"
                    size="mini">
                  <el-table-column
                      prop="course"
                      label="课程名称"
                      width="180">
                  </el-table-column>
                  <el-table-column
                      label="成绩"
                      width="120">
                    <template slot-scope="scope">
                      <el-tag :type="getGradeType(scope.row.score)">
                        {{ scope.row.score }}
                      </el-tag>
                    </template>
                  </el-table-column>
                  <el-table-column
                      prop="credit"
                      label="学分"
                      width="80">
                  </el-table-column>
                  <el-table-column
                      label="详细信息">
                    <template slot-scope="scope">
                      <div class="course-detail">
                        <p>教师：{{ scope.row.teacher }}</p>
                        <p>学期：{{ scope.row.semester }}</p>
                      </div>
                    </template>
                  </el-table-column>
                </el-table>

                <div class="gpa-summary">
                  <el-row :gutter="20" style="margin-top: 15px;">
                    <el-col :span="12">
                      <div class="gpa-item">
                        <label>当前GPA：</label>
                        <span class="highlight">3.75</span>
                      </div>
                    </el-col>
                    <el-col :span="12">
                      <div class="gpa-item">
                        <label>总学分：</label>
                        <span class="highlight">128</span>
                      </div>
                    </el-col>
                  </el-row>
                </div>
              </div>
            </section-box>
          </div>
        </div>
      </el-card>
    </main>
  </div>
</template>

<script>
import SectionBox from '@/components/student/SectionBox.vue'

import axios from "axios";
import {EventBus} from "@/event-bus";
import DwMenu from "@/components/dw/Dw_menu.vue";
export default {
  name: 'StudentInfoView',
  components: {
    DwMenu,
    SectionBox
  },
  data() {
    return {
      stuid: null,
      studentData: null,
      allgzjlsxk: [],
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      photoUrl: require('@/assets/avatar.png'),
      personalInfo: {
        name: '张三',
        position: '高级前端工程师',
        email: 'zhangsan@example.com',
        phone: '+86 138-1234-5678',
        location: '中国，上海'
      },
      education: [
        {
          school: '上海交通大学',
          degree: '计算机科学 硕士',
          duration: '2016-2019',
          gpa: '3.8/4.0'
        }
      ],
      skills: [
        { name: 'Vue.js', color: '#42b883' },
        { name: 'JavaScript', color: '#f0db4f' },
        { name: 'Node.js', color: '#68a063' },
        { name: 'HTML5', color: '#e44d26' },
        { name: 'CSS3', color: '#264de4' },
        { name: 'Webpack', color: '#8dd6f9' }
      ],
      workExperience: [],
      projects: [
        {
          name: '企业级管理系统',
          description: '基于Vue+ElementUI的中后台管理系统，包含20+功能模块',
          technologies: ['Vue2', 'Vuex', 'ElementUI', 'ECharts']
        }
      ],
      // 新增证书数据
      certificates: [
        {
          name: 'AWS认证解决方案架构师',
          issuer: '亚马逊云科技',
          date: '2023-06',
          status: '有效',
          docUrl: '/certificates/aws-cert.pdf'
        },
        {
          name: 'PMP项目管理专业人士',
          issuer: 'PMI协会',
          date: '2022-12',
          status: '有效',
          docUrl: '/certificates/pmp-cert.pdf'
        }
      ],
      // 新增成绩数据
      transcripts: [
        {
          course: '分布式系统',
          score: 90,
          credit: 3,
          teacher: '王教授',
          semester: '2023-2024第一学期'
        },
        {
          course: '机器学习',
          score: 95,
          credit: 4,
          teacher: '李教授',
          semester: '2023-2024第一学期'
        },
        {
          course: '数据库系统',
          score: 85,
          credit: 3,
          teacher: '张教授',
          semester: '2022-2023第二学期'
        }
      ]
    }
  },
  created() {
    console.log("获取页面参数：");
    console.log(this.$route.query.id);
    this.stuid = this.$route.query.id;
    if (this.stuid){
      this.getLoginUserInfo();
    }
  },
  methods: {
    // 新增证书查看方法
    viewCertificate(cert) {
      window.open(cert.docUrl, '_blank')
    },

    // 新增成绩类型判断
    getGradeType(score) {
      if (score >= 90) return 'success';
      if (score >= 80) return 'warning';
      return 'danger';
    },
    async getLoginUserInfo() {
      await axios.get('/user/checkSession').then(response => {
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
          console.log(this.UserInfo);
          // this.loadData(this.UserInfo.username);
          this.loadData(); // 获取学生信息
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      });
    },
    // 获取工作经历数据
    async getGzjlData() {
      this.loading = true;
      try {

        this.workExperiences=[];
        const response = await axios.get('/gzjlk/getAllGzjlk?YHM=' +this.studentData.yhm);
        if (!response.data.result) {
          this.confirmGetData();
        } else {
          console.log(response.data.data);
          let ResultData = response.data.data.gzjlk;
          this.allgzjlsxk=response.data.data.gzjlsxk;
          let ItemData,responsibilities = [];
          /* [
               {
                 company: '深度求索',
                 position: '前端开发工程师',
                 duration: '2019-至今',
                 responsibilities: [
                   '负责公司核心产品的前端架构设计和开发',
                   '主导Vue技术栈迁移和组件库建设',
                   '优化前端性能，首屏加载时间减少40%',
                   '带领3人前端团队完成多个重大项目'
                 ]
               },
             ]*/
          for (let i = 0; i < ResultData.length; i++) {
            ItemData = {};
            responsibilities = [];
            //ItemData.ID = ResultData[i].ID;
            //ItemData.STUID = ResultData[i].STUID;

            ItemData.company = ResultData[i].DWMC;
            ItemData.position = ResultData[i].GWMC;
            // ItemData.KSSJ = ResultData[i].KSSJ;
            ItemData.duration = '2019-至今';
            let filterData=  this.allgzjlsxk.filter(item=>item.GZJLDM===ResultData[i].ID);
            /* "ID": 1,
                 "GZJLSX": "负责系统调试",
                 "CJSJ": "2025-03-10T03:09:25.000+00:00",
                 "GZJLDM": 9*/
            for (let j = 0; j < filterData.length; j++){
              responsibilities.push(filterData[j].GZJLSX);
            }
            ItemData.responsibilities = responsibilities;

            ItemData.JLMS = ResultData[i].JLMS;//经历描述
            this.workExperience.push(ItemData);
            console.log( this.workExperience);
          }
          this.loading = false;
        }
      } catch (error) {
        console.error('获取工作经历数据失败:', error);
        this.confirmGetData();
      }
    },
    confirmGetData(msg) {
      $.confirm({
        title: '提示',
        content: '获取工作经历数据失败：' + msg,
        type: 'red', // 错误提示用红色
        buttons: {
          重试: {
            btnClass: 'btn-red',
            action: () => {
              this.getGzjlData();
            }
          }
        }
      });
    },
    // 获取学生信息
    async loadData() {
      axios.get(`/student/getStudentByUsernameOrId?usernameOrId=${this.stuid}&type=id`).then(response => {
        if (response.data.result) {
          this.studentData = response.data.data;
          this.getGzjlData();
        } else {
          this.$message.error('获取学生信息失败:'+ response.data.msg);
        }
      }).catch(error => {
        this.$message.error('获取学生信息失败,网络错误！');
        console.error('获取学生信息失败,网络错误！', error);
      })
    },
    handlePhotoClick() {
      this.$refs.photoInput.click()
    },
    updatePhoto(e) {
      const file = e.target.files[0]
      if (file) {
        this.photoUrl = URL.createObjectURL(file)
      }
    }
  }
}
</script>
<style scoped>
.profile-container {
  /* max-width: 1200px;*/
  margin: 2rem auto;
  margin-top: 2px;
  padding: 2rem;
  background: #fff;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  border-radius: 12px;
}

.profile-header {
  display: flex;
  align-items: center;
  gap: 2rem;
  margin-bottom: 2rem;
}

.photo-container {
  width: 160px;
  height: 210px; /* 2寸照片比例 */
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  cursor: pointer;
  transition: transform 0.3s ease;
}

.photo-container:hover {
  transform: scale(1.05);
}

.profile-photo {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.personal-info {
  flex: 1;
}

.name {
  font-size: 2.5rem;
  color: #2c3e50;
  margin-bottom: 0.5rem;
}

.position {
  font-size: 1.5rem;
  color: #42b883;
  margin-bottom: 1rem;
}

.contact-info p {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  color: #666;
  margin: 0.5rem 0;
}

.content-wrapper {
  display: grid;
  grid-template-columns: 1fr 2fr;
  gap: 2rem;
}

.el-card_body, .el-main {
  padding: 27px !important;
}

/* 原有样式 */
.profile-container {
  margin: 2rem auto;
  margin-top: 2px;
  padding: 2rem;
  background: #fff;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  border-radius: 12px;
}

.profile-header {
  display: flex;
  align-items: center;
  gap: 2rem;
  margin-bottom: 2rem;
}

.photo-container {
  width: 160px;
  height: 210px;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  cursor: pointer;
  transition: transform 0.3s ease;
}

.photo-container:hover {
  transform: scale(1.05);
}

.profile-photo {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.personal-info {
  flex: 1;
}

.name {
  font-size: 2.5rem;
  color: #2c3e50;
  margin-bottom: 0.5rem;
}

.position {
  font-size: 1.5rem;
  color: #42b883;
  margin-bottom: 1rem;
}

.contact-info p {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  color: #666;
  margin: 0.5rem 0;
}

/* 新增证书样式 */
.certificate-item {
  padding: 16px;
  margin-bottom: 12px;
  background: #f8f9fa;
  border-radius: 8px;
  border-left: 4px solid #42b883;
}

.cert-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
}

.cert-header h3 {
  font-size: 16px;
  color: #2c3e50;
  margin: 0;
}

.issuer {
  color: #666;
  font-size: 14px;
  margin: 4px 0;
}

.cert-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 8px;
}

.date {
  color: #999;
  font-size: 13px;
}

/* 新增成绩单样式 */
.gpa-summary {
  padding: 15px;
  background: #f8f9fa;
  margin-top: 10px;
  border-radius: 8px;
}

.gpa-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 0;
}

.highlight {
  color: #42b883;
  font-weight: bold;
}

</style>