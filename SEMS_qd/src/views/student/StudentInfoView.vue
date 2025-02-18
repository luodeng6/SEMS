
<template>
  <div class="content">
    <div>
      <StudentMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <el-card style="margin-bottom: 10px">
        <header class="flex justify-between items-center mb-6">
          <div>
            <h1 class="text-3xl font-bold text-gray-800">个人就业信息</h1>
            <p class="text-sm text-gray-500 mt-1">就业方向、职位信息、岗位发布、岗位管理</p>
          </div>
          <div class="flex items-center space-x-4">
            <el-button type="text" icon="el-icon-plus"  >查看</el-button>
            <el-button type="text" icon="el-icon-edit"  >编辑岗位</el-button>
            <el-button type="text" icon="el-icon-search"  >查看岗位详情</el-button>
            <el-dropdown trigger="click">
              <el-button icon="el-icon-download"></el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item>编辑个人信息</el-dropdown-item>
                  <el-dropdown-item>编辑简历</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </div>
        </header>
      </el-card>
      <div class="profile-container">
        <!-- 头部照片和个人信息 -->
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

        <!-- 主要内容区域 -->
        <div class="content-wrapper">
          <!-- 左侧列 -->
          <div class="left-column">
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

            <section-box title="技能专长">
              <div class="skills-container">
                <div
                    v-for="(skill, index) in skills"
                    :key="index"
                    class="skill-tag"
                    :style="{ backgroundColor: skill.color }"
                >
                  {{ skill.name }}
                </div>
              </div>
            </section-box>
          </div>

          <!-- 右侧列 -->
          <div class="right-column">
            <section-box title="工作经历">
              <div
                  v-for="(exp, index) in workExperience"
                  :key="index"
                  class="experience-item"
              >
                <div class="exp-header">
                  <h3>{{ exp.company }}</h3>
                  <span class="duration">{{ exp.duration }}</span>
                </div>
                <p class="position">{{ exp.position }}</p>
                <ul class="responsibilities">
                  <li v-for="(item, i) in exp.responsibilities" :key="i">{{ item }}</li>
                </ul>
              </div>
            </section-box>

            <section-box title="项目成果">
              <div
                  v-for="(project, index) in projects"
                  :key="index"
                  class="project-item"
              >
                <h3 class="project-title">{{ project.name }}</h3>
                <p class="project-desc">{{ project.description }}</p>
                <div class="tech-stack">
              <span
                  v-for="(tech, i) in project.technologies"
                  :key="i"
                  class="tech-tag"
              >
                {{ tech }}
              </span>
                </div>
              </div>
            </section-box>
          </div>
        </div>
      </div>

    </main>
  </div>
</template>
<script>
import SectionBox from '@/components/student/SectionBox.vue'
import StudentMenu from "@/components/student/Student_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";
export default {
  name: 'StudentInfoView',
  components: {
    SectionBox,
      StudentMenu
  },
  data() {
    return {
      studentData:null,
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
      workExperience: [
        {
          company: '某科技公司',
          position: '前端开发工程师',
          duration: '2019-至今',
          responsibilities: [
            '负责公司核心产品的前端架构设计和开发',
            '主导Vue技术栈迁移和组件库建设',
            '优化前端性能，首屏加载时间减少40%',
            '带领3人前端团队完成多个重大项目'
          ]
        }
      ],
      projects: [
        {
          name: '企业级管理系统',
          description: '基于Vue+ElementUI的中后台管理系统，包含20+功能模块',
          technologies: ['Vue2', 'Vuex', 'ElementUI', 'ECharts']
        }
      ]
    }
  },
  created() {
    this.getLoginUserInfo();
  },
  methods: {
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
    // 获取学生信息
    async loadData() {
      axios.get(`/student/getStudentByUsernameOrId?usernameOrId=${this.UserInfo.username}&type=username`).then(response => {
        if (response.data.result) {
          this.studentData = response.data.data;
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

/* 其他详细样式... */
</style>