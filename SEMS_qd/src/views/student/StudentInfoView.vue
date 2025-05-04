<template>
  <div class="content">
    <student-menu></student-menu>

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
                    ref="photoInput"
                    style="display: none;"
                    type="file"
                    @change="updatePhoto">
              </div>
              <div class="personal-info">
                <h1 class="name">{{ studentData.xsxm }}</h1>
                <h2 class="position">{{ XSXXK.XSZY }}</h2>
                <div class="contact-info">
                  <p><i class="el-icon-message"></i> {{ XSXXK.YXDZ}}</p>
                  <p><i class="el-icon-phone"></i> {{ XSXXK.LXDH }}</p>
                  <p><i class="el-icon-location-outline"></i> {{ XSXXK.SFCS}}</p>
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

            <!-- 专业证书
                {
                    "ID": 12,
                    "ZSMC": "计算机等级考试",
                    "ZSKM": "计算机科学与技术",
                    "ZSCJ": 90.0,
                    "ZSYXQ": "2025-04-30T00:00:00.000+00:00",
                    "BFJG": "国家计算机机构",
                    "ZSFJ": "/img/upload/XSZSK/attachments/1745305423626_实施工程师工作周报_罗邓(2).doc",
                    "ZSZP": "/img/upload/XSZSK/photos/1745305423593_d53f8794a4c27d1ed21bd726fb8cba6eddc450da9285.jpg",
                    "BFSJ": "2025-03-31T18:00:00.000+00:00",
                    "QYDM": 1,
                    "STUID": 1224,
                    "XSXM": "陈洁梅",
                    "XSZP": "/img/upload/Userpofile/20213260021_1742207649940_.jpg",
                    "XSXH": "20213260021",
                    "XSXB": "女",
                    "BJMC": "2021级信息管理与信息系统",
                    "ZYMC": "信息管理与信息系统",
                    "ZYLB": null
                }
            -->
            <section-box style="margin-top: 20px;" title="专业证书">
              <div
                  v-for="(cert, index) in certificates"
                  :key="'cert'+index"
                  class="certificate-item">
                <div class="cert-header">
                  <h3>{{ cert.ZSMC }}</h3>
                  <el-tag type="success" size="mini">
                        有效
                  </el-tag>
                </div>
                <p class="issuer">{{ cert.BFJG }}</p>
                <div class="cert-footer">
                  <span class="date">{{ changeDateFormat(cert.BFSJ) }}</span>
                  <div class="cert-actions">
                    <el-button
                        size="mini"
                        type="text"
                        @click="viewCertificate(cert)">
                      <i class="el-icon-document"></i> 查看
                    </el-button>
                  </div>
                </div>
              </div>
            </section-box>

            <!-- 技能专长 -->
            <section-box style="margin-top: 20px;" title="技能专长">
              <div class="skills-container">
                <div
                    v-for="(skill, index) in skills"
                    :key="index"
                    :style="{ backgroundColor: skill.color }"
                    class="skill-tag">
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

            <!-- 项目成果
                 {
                  "ID": 4,
                  "XMMC": "基于Springboot的高校就业信息系统",
                  "XMNR": "近年来，我国高"
                  "STUID": 1224,
                  "QYDM": 1,
                  "CJSJ": "2025-03-29T14:54:36.217+00:00",
                  "XMLX": "科研",
                  "XMFJ": "/img/upload/XMCGK/1743260102016_基于Springboot的高校就业信息系统.docx",
                  "XSXM": "陈洁梅",
                  "XSZP": "/img/upload/Userpofile/20213260021_1742207649940_.jpg",
                  "XSXH": "20213260021",
                  "XSXB": "女",
                  "BJMC": "2021级信息管理与信息系统",
                  "ZYMC": "信息管理与信息系统",
                  "ZYLB": null
              },
             -->
            <section-box title="项目成果">
              <div
                  v-for="(project, index) in projects"
                  :key="index"
                  class="project-item">
                <h3 class="project-title">{{ project.XMMC }}</h3>
                <p class="project-desc" style="text-indent: 2em;">{{ project.XMNR ? project.XMNR.slice(0, 100) : '' }}</p>
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
            <section-box style="margin-top: 20px;" title="学业成绩">
              <div class="transcript-container">
                <div>
                  <el-table
                      :data="paginatedTranscripts"
                      border
                      size="mini"
                      style="width: 100%">

                    <el-table-column
                        label="课程名称"
                        prop="KCMC"
                        width="180">
                    </el-table-column>

                    <el-table-column
                        label="成绩"
                        width="120">
                      <template slot-scope="scope">
                        <el-tag :type="getGradeType(scope.row.KCCJ)">
                          {{ scope.row.KCCJ }}
                        </el-tag>
                      </template>
                    </el-table-column>

                    <el-table-column
                        label="学分"
                        prop="XF"
                        width="80">
                    </el-table-column>

                    <el-table-column
                        label="详细信息">
                      <template slot-scope="scope">
                        <div class="course-detail">
                          <p>教师：{{ scope.row.SKJS }}</p>
                          <p>性质：{{ scope.row.KCXZ }}</p>
                        </div>
                      </template>
                    </el-table-column>
                  </el-table>

                  <!-- 分页器 -->
                  <el-pagination
                      :current-page="currentPage"
                      :page-size="pageSize"
                      :total="transcripts.length"
                      background
                      layout="prev, pager, next, jumper"
                      style="margin-top: 20px; text-align: right;"
                      @current-change="handlePageChange">
                  </el-pagination>
                </div>

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
import StudentMenu from "@/components/student/Student_menu.vue";

export default {
  name: 'StudentInfoView',
  components: {
    StudentMenu,

    SectionBox
  },
  data() {
    return {
      currentPage: 1,
      pageSize: 5,  // 每页条数
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
        {name: 'Vue.js', color: '#42b883'},
        {name: 'JavaScript', color: '#f0db4f'},
        {name: 'Node.js', color: '#68a063'},
        {name: 'HTML5', color: '#e44d26'},
        {name: 'CSS3', color: '#264de4'},
        {name: 'Webpack', color: '#8dd6f9'}
      ],
      workExperience: [],
      // 项目成果数据
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
      XSXXK:{    },
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
    this.getLoginUserInfo();
  },
  computed: {
    paginatedTranscripts() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.transcripts.slice(start, end);
    }
  },
  methods: {
    getXsxxk() {
      axios.get("/xsxxk/getXxxk", {
        params: {
          STUID: -1,
          BYYHM: 1,
          YHM: this.UserInfo.username,
        }
      }).then(response => {
        if (response.data.result) {
          console.log(response.data.data);
          if (response.data.data.length > 0) {
              this.XSXXK=response.data.data[0];
          } else {
            $.confirm({
              title: '警告提示',
              content: '个人信息未完善，请及时完善！',
              type: 'orange',
              typeAnimated: true,
              buttons: {
                确定: {
                  btnClass: 'btn-orange',
                  action: () => {
                    this.isShowXsxxkDialog = true;
                    this.$router.push({name: 'StudentIndexView'});
                  }
                }
              }
            });
          }
        } else {
          this.$message.error("获取学生信息失败:" + response.data.msg);
        }
      }).catch(error => {
        console.error("获取学生信息失败！", error);
        this.$message.error("获取学生信息失败：" + error.message);
      })
    },
    changeDateFormat(isoString) {
      const date = new Date(isoString);
        // 获取年月日
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, '0'); // 月份从0开始，要+1
      const day = String(date.getDate()).padStart(2, '0');
      const formattedDate = `${year}-${month}-${day}`;
      return formattedDate;
    },
    handlePageChange(page) {
      this.currentPage = page;
    },
    getGradeType(grade) {
      // 这里自己定义成绩对应的tag类型，比如：
      if (grade >= 90) return 'success';
      if (grade >= 75) return 'warning';
      if (grade >= 60) return 'info';
      return 'danger';
    },
    // 获取证书
    async GetCertificatesData() {
      try {
        //Integer QYDM,Integer ISGETALL,Integer STUID
        const res = await axios.get(`/xszsk/getXszsk?QYDM=2&ISGETALL=0&STUID=${this.UserInfo.id}`);
        if (res.data.result) {
          this.certificates = res.data.data;
        } else {
          $.confirm({
            title: '提示',
            content: '获取数据失败：' + res.data.msg,
            type: 'red', // warning 样式
            buttons: {
              重试: {
                btnClass: 'btn-orange',
                action: () => {
                  this.GetCertificatesData();
                }
              },
              取消: () => {
                this.$message('取消');
              }
            }
          });
        }
      } catch (error) {
        $.confirm({
          title: '提示',
          content: '新增失败：' + error.message,
          type: 'red', // warning 样式
          buttons: {
            重试: {
              btnClass: 'btn-orange',
              action: () => {
                this.GetCertificatesData();
              }
            },
            取消: () => {
              this.$message('取消');
            }
          }
        });
      }

    },
    // 获取项目成果
    getProjectData() {
      axios.get("/xmcgk/getXmcgk", {
        params: {
          QYDM: 1,
          ISGETALL: 0,
          STUID: this.UserInfo.id
        }
      }).then(response => {
        console.log(response.data);
        this.projects = response.data.data;
      }).catch(error => {
        console.log(error);
      });
    },
    // 新增证书查看方法
    viewCertificate(cert) {
      window.open(cert.docUrl, '_blank')
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
          this.getStudentDataByUsername(this.UserInfo.username); // 获取学生信息
          this.getXsxxk(); // 获取学生信息
          this.fetchScores(); // 获取成绩列表
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'StudentLoginView'});
        }, 1000);
      });
    },
    // 获取成绩列表
    async fetchScores() {
      /*  this.scoreList = [
          { ID: 1, STUID: 'S001', KCMC: '数学', KCXZ: '必修', XF: 3, JD: 4.0, CJXZ: '正常', KCCJ: 95, SKJS: '张老师', QYDM: 'A1' },
          { ID: 2, STUID: 'S002', KCMC: '英语', KCXZ: '选修', XF: 2, JD: 3.5, CJXZ: '正常', KCCJ: 88, SKJS: '李老师', QYDM: 'A1' }
        ];*/
      try {
        this.isLoading = true;
        const response = await axios.get(`/xscjdk/getXscjdk?QYDM=1&YHSFDM=4&YHM=${this.UserInfo.username}&STUID=-1`);
        console.log(response.data);
        this.isLoading = false;
        if (response.data.result) {
          this.transcripts = response.data.data;
        } else {
          $.confirm({
            title: '提示',
            content: '获取数据失败：' + response.data.msg,
            type: 'red', // warning 样式
            buttons: {
              重试: {
                btnClass: 'btn-orange',
                action: () => {
                  this.fetchScores();
                }
              },
              取消: () => {
                this.$message('取消');
              }
            }
          });
        }
      } catch (error) {
        console.error(error);
        $.confirm({
          title: '提示',
          content: '获取数据失败：' + error,
          type: 'red', // warning 样式
          buttons: {
            重试: {
              btnClass: 'btn-orange',
              action: () => {
                this.fetchScores();
              }
            },
            取消: () => {
              this.$message('取消');
            }
          }
        });
      }
    },
    // 获取工作经历数据
    async getGzjlData() {
      this.loading = true;
      try {

        this.workExperiences = [];
        const response = await axios.get('/gzjlk/getAllGzjlk?YHM=' + this.studentData.yhm);
        if (!response.data.result) {
          this.confirmGetData();
        } else {
          console.log(response.data.data);
          let ResultData = response.data.data.gzjlk;
          this.allgzjlsxk = response.data.data.gzjlsxk;
          let ItemData, responsibilities = [];
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
            let filterData = this.allgzjlsxk.filter(item => item.GZJLDM === ResultData[i].ID);
            /* "ID": 1,
                 "GZJLSX": "负责系统调试",
                 "CJSJ": "2025-03-10T03:09:25.000+00:00",
                 "GZJLDM": 9*/
            for (let j = 0; j < filterData.length; j++) {
              responsibilities.push(filterData[j].GZJLSX);
            }
            ItemData.responsibilities = responsibilities;

            ItemData.JLMS = ResultData[i].JLMS;//经历描述
            this.workExperience.push(ItemData);
            console.log(this.workExperience);
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
    getStudentDataByUsername(yhm) {
      axios.get(`/student/getStudentByUsernameOrId?usernameOrId=${yhm}&type=username`).then(response => {
        if (response.data.result) {
          this.UserInfo.id = response.data.data.id;
          console.log(this.UserInfo);
          this.stuid = this.UserInfo.id;
          this.loadData(response.data.data.id);// 获取学生信息
          this.getProjectData();// 获取项目成果
          this.GetCertificatesData(); // 获取证书信息
        } else {
          this.$message.error("获取学生信息失败:" + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取学生信息失败:" + error.message);
      });
    },
    // 获取学生信息
    async loadData(id) {
      axios.get(`/student/getStudentByUsernameOrId?usernameOrId=${id}&type=id`).then(response => {
        if (response.data.result) {
          this.studentData = response.data.data;
          this.getGzjlData();
        } else {
          this.$message.error('获取学生信息失败:' + response.data.msg);
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