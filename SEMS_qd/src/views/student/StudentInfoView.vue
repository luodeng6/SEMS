
<template>
  <div class="content">
    <div>
      <StudentMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <el-card style="margin-bottom: 10px" shadow="never">
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
      <!-- 主要内容区域 -->
      <el-card shadow="never" style="padding: 27px !important;">
      <div class="content-wrapper">
        <div style="    width: 588px;">
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

          <!-- 左侧列 -->
          <div>
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
        </div>
          <!-- 右侧列 -->
          <div >
            <section-box title="工作经历">
              <div
                  v-for="(exp, index) in workExperience"
                  :key="index"
                  class="experience-item"
                  style="padding: 10px 0; border-bottom: 1px solid #eaeaea;"
              >
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
      </el-card>


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
        /*{
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
        {
          company: '阿里巴巴',
          position: '前端开发工程师',
          duration: '2019-至今',
          responsibilities: [
            '负责公司核心产品的前端架构设计和开发',
            '主导Vue技术栈迁移和组件库建设',
            '优化前端性能，首屏加载时间减少40%',
            '带领3人前端团队完成多个重大项目'
          ]
        }*/
      ],
      projects: [
        {
          name: '企业级管理系统',
          description: '基于Vue+ElementUI的中后台管理系统，包含20+功能模块',
          technologies: ['Vue2', 'Vuex', 'ElementUI', 'ECharts']
        },
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
          this.getGzjlData(); // 获取工作经历数据
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
        /* [
           {
             "ID": 1,
             "STUID": 1214,
             "TJSJ": "2025-03-09T17:00:35.260+00:00",
             "DWMC": "11",
             "GWMC": "11",
             "KSSJ": "2025-03-11T00:00:00.000+00:00",
             "JSSJ": "2025-03-21T00:00:00.000+00:00",
             "JLMS": "11",
             "QYDM": 1,
             "XSXM": "李家辉",
             "XSXB": "男",
             "SSBJ": 1292,
             "ZYDM": 1085,
             "SFZH": "450703200302201551",
             "ZZMM": "共青团员",
             "SSNJ": "2021",
             "JYZT": 1000,
             "XSZP": "/img/upload/Userpofile/20213260030_1740397262501_.jpeg",
             "FZJS": 0
           }
         ]*/
        this.workExperiences=[];
        const response = await axios.get('/gzjlk/getAllGzjlk?YHM=' + this.UserInfo.username);
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

.el-card_body, .el-main {
  padding: 27px !important;
}


/* 其他详细样式... */
</style>