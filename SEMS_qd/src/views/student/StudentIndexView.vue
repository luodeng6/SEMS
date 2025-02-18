<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6">

      <div class="header animated-header">
        <!--        <h1 class="text-dark font-bold">就业信息系统</h1>-->
        <div class="user-info">
          <div class="user-dropdown">

            <el-badge :value="12" class="item" style="margin-right: 20px;">
              <el-button size="small" plain>待处理面试</el-button>
            </el-badge>
            <el-badge is-dot class="item" style="margin-right: 20px;color: #0d0d0d;">新消息</el-badge>
            <el-badge is-dot class="item" style="margin-right: 20px;">
              <el-button class="share-button" icon="el-icon-share" type="primary"></el-button>
            </el-badge>


            <img src="@/assets/avatar.png" alt="用户头像" class="avatar animated-avatar"/>
            <span class="text-dark"> 用户: {{ UserInfo.name }}</span>
            <el-dropdown trigger="click" style="margin-left: 10px;">
              <span class="el-dropdown-link text-dark">点我查看<i
                  class="el-icon-caret-bottom el-icon--right"></i></span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item class="clearfix">评论
                  <el-badge class="mark" :value="12"/>
                </el-dropdown-item>
                <el-dropdown-item class="clearfix">回复
                  <el-badge class="mark" :value="3"/>
                </el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </div>
        </div>
      </div>

      <!--      <div class="stats animated-stats">
              <div class="stat-card">
                <h2>5 <i class="fas fa-envelope"></i></h2>
                <p>新消息</p>
              </div>
              <div class="stat-card">
                <h2>3 <i class="fas fa-briefcase"></i></h2>
                <p>新职位</p>
              </div>
              <div class="stat-card">
                <h2>31 <i class="fas fa-paper-plane"></i></h2>
                <p>申请总数</p>
              </div>
              <div class="stat-card">
                <h2>13 <i class="fas fa-clock"></i></h2>
                <p>待审核职位</p>
              </div>
            </div>-->

      <div class="row" style="margin-top: 20px">
        <div class="col-md-4">
          <!--          <div class="notifications">
                      <h2 class="text-highlight">通知公告</h2>
                      <div class="notification-list">
                        <div v-for="(notification, index) in announcements" :key="index" class="notification-item">
                          <div class="notification-header">
                            <span class="notification-date">{{ notification.date }}</span>
                            <span class="notification-title">{{ notification.title }}</span>
                          </div>
                          <p class="notification-content">{{ notification.content }}</p>
                        </div>
                      </div>
                    </div>-->

          <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
            <el-tab-pane label="最新公告" name="first">

              <div class="announcement-board luo">
                <!--                  <div class="announcement-header">
                                    <h2>公告栏</h2>
                                  </div>-->
                <div class="announcement-list">

                  <div class="announcement-item" v-if="index <4" v-for="(item, index) in announcements" :key="index">
                    <div class="announcement-content">
                      <div style="display: flex;    justify-content: space-between;">
                        <h3 class="announcement-title">{{ index + 1 + '.' + item.title }}</h3>
                        <div class="announcement-meta" style="position: relative; right: 5px;">
                          <span class="announcement-publisher">{{ item.publisher }}</span>
                          <span class="announcement-date">{{ item.date }}</span>
                        </div>
                      </div>

                      <p class="announcement-description">
                        此次评估旨在获取学生们对课程及实习教育质量的反馈,你的意见至关重要。</p>
                    </div>
                  </div>
                </div>
              </div>
              <el-alert
                  title="重要提示"
                  type="warning"
                  description="请认真填写反馈问卷，你的每一个建议都将帮助我们改进教学质量。"
                  show-icon>
              </el-alert>

            </el-tab-pane>
            <el-tab-pane label="就业日历" name="second">
              <el-calendar v-model="value" ></el-calendar>
            </el-tab-pane>
            <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
            <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
          </el-tabs>


        </div>

        <!--        <div class="col-md-3">
                  <div class="calendar-container">
                    <el-calendar v-model="value"></el-calendar>
                  </div>
                </div>-->

        <div class="col-md-5">
          <div class="job-list">
            <h2 class="text-highlight">最新职位</h2>
            <div class="job-item" v-for="(job, index) in jobs" :key="index">
              <div class="job-header">
                <h3 class="job-title">{{ job.title }}</h3>
                <div class="job-meta">
                  <span class="job-company">{{ job.company }}</span>
                  <span class="job-location">{{ job.location }}</span>
                </div>
              </div>
              <div class="job-body">
                <p class="job-description">{{ job.description }}</p>
              </div>
              <div class="job-footer">
                <span class="job-date">{{ job.date }}</span>
                <el-button type="text" size="mini" @click="navigateTo(job.id)">查看详情</el-button>
              </div>
            </div>
          </div>
        </div>


        <div class="col-md-3">
          <div class="system-info">
            <h2 class="text-main">
              <i class="fas fa-user-circle"></i>
              <span class="font-weight-bold">{{ UserInfo.name }}</span> 的就业信息
            </h2>
            <el-table :data="systemInfo" style="width: 100%">
              <el-table-column prop="parameter" label="参数"/>
              <el-table-column prop="value" label="值"/>
            </el-table>
          </div>
        </div>

      </div>
    </main>
  </div>
</template>

<script>
import {Chart, registerables} from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';
import axios from 'axios';
import {EventBus} from "@/event-bus";
import StudentMenu from "@/components/student/Student_menu.vue";

export default {
  components: {
    StudentMenu
  },
  name: "StudentIndexView",
  data() {
    return {
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      activeName: 'first',
      highlightedDates: [
        {
          date: '2025-01-18',
          type: 'danger',
          text: '有任务'
        }
      ],
      jobs: [
        {
          id: 1,
          title: '前端开发工程师',
          company: '腾讯科技',
          location: '深圳',
          description: '负责公司网站和移动应用的前端开发工作',
          date: '2023-04-01'
        },
        {
          id: 2,
          title: '产品经理',
          company: '阿里巴巴',
          location: '杭州',
          description: '负责公司新产品的策划和推广工作',
          date: '2023-04-05'
        },
        {
          id: 3,
          title: 'Java 开发工程师',
          company: '字节跳动',
          location: '北京',
          description: '负责公司后端服务的开发和维护',
          date: '2023-04-10'
        }
      ],
      value: new Date(),
      systemInfo: [
        {parameter: '年龄', value: '20'},
        {parameter: '班级', value: '2021级信息管理与信息系统'},
        {parameter: '性别', value: '男'},
        {parameter: '就业状态', value: '求职中'},
        {parameter: '学历', value: '本科'},
        {parameter: '专业', value: '计算机科学与技术'},
      ],
      announcements: [
        {
          date: '12-23 2024',
          title: '关于开展2025届毕业生就业服务工作情况调研的通知',
          content: '为全面了解2025届毕业生的就业意向和需求，调整就业服务工作的方向和内容，学校将于近期开展相关调研。'
        },
        {
          date: '11-19 2024',
          title: '关于2023届毕业生培养质量评估的通知',
          content: '此次评估旨在获取学生们对课程及实习教育质量的反馈，你的意见至关重要。'
        },
        {
          date: '11-13 2024',
          title: '关于举办甘肃省卫生健康人才能进专场招聘会的公告',
          content: '为深入实施人才能进战略，改善严峻的人才能结构问题，学校将于下月举办相关招聘会。'
        },
        {
          date: '11-05 2024',
          title: '招企业就业支持开办“觉醒领军能力”访企拓岗促就业主题党日活动',
          content: '通过主题党日活动推进访企工作，邀请企业走进校园进行招聘活动。'
        },
        {
          date: '09-29 2024',
          title: '关于2025届普通高校毕业生就业招聘季系列活动',
          content: '通过国策引导，创新就业服务，尽最大努力帮助毕业生、求职者实现就业。'
        },
        {
          date: '05-05 2024',
          title: '关于开展我校2016-2018届毕业生培养质量评估',
          content: '为了了解学校2016-2018届毕业生培养质量以及用人单位对毕业生的评价，学校特组织开展评估活动。'
        },
        {
          date: '04-25 2023',
          title: '关于西南医科大学2022届毕业生护理评估的公告',
          content: '请各位毕业生积极参与，反馈，你的建议至关重要。'
        },
        {
          date: '11-23 2023',
          title: '关于西南药科大学2023届毕业生的选拔面谈会议的公告',
          content: '关于2022届毕业生工作落实情况，我们希望您能参加会议。'
        }
      ]
    }
  },
  mounted() {
    this.getLoginUserInfo();
  },
  methods: {
    getLoginUserInfo() {
      axios.get('/user/checkSession').then(response => {
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({name: 'StudentLoginView'});
          }, 1000);
        } else {
          console.log('登录成功-----！');
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          console.log(this.UserInfo);
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'StudentLoginView'});
        }, 1000);
      });
    },
    navigateTo(announcementId) {
      console.log(`Navigating to ${announcementId}`);
    },
    handleClick(tab, event) {
      console.log("你点击了标签")
      console.log(tab, event);
    }
  }
}
</script>

<style scoped>
/*.job-list {
  background-color: #f9f9f9; !* 背景颜色 *!
  border-radius: 8px; !* 圆角 *!
  padding: 20px; !* 内边距 *!
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); !* 阴影效果 *!
}*/

.job-item {
  background-color: #ffffff; /* 职位项背景颜色 */
/*  //border: 1px solid #e0e0e0; !* 边框颜色 *!*/
  border-radius: 5px; /* 圆角 */
  margin-bottom: 15px; /* 职位项之间的间距 */
  padding: 15px; /* 内边距 */
  transition: transform 0.2s; /* 动画效果 */
}

.job-item:hover {
  transform: translateY(-2px); /* 悬停时的效果 */
  background-color:aliceblue ;
  cursor: pointer;
}

.job-header {
  display: flex; /* 使用 flexbox 布局 */
  justify-content: space-between; /* 头部内容两端对齐 */
  align-items: center; /* 垂直居中 */
}

.job-title {
  font-size: 1.5em; /* 职位标题字体大小 */
  color: #333; /* 字体颜色 */
  margin: 0; /* 去掉默认外边距 */
}

.job-meta {
  font-size: 0.9em; /* 元数据字体大小 */
  color: #777; /* 元数据字体颜色 */
}

.job-body {
  margin: 10px 0; /* 上下间距 */
}

.job-description {
  font-size: 1em; /* 描述字体大小 */
  color: #555; /* 描述字体颜色 */
}

.job-footer {
  display: flex; /* 使用 flexbox 布局 */
  justify-content: space-between; /* 内容两端对齐 */
  align-items: center; /* 垂直居中 */
}

.job-date {
  font-size: 0.8em; /* 日期字体大小 */
  color: #999; /* 日期字体颜色 */
}

.el-button {
  background-color: #007bff; /* 按钮背景颜色 */
  color: white; /* 按钮字体颜色 */
  border-radius: 4px; /* 按钮圆角 */
  padding: 5px 10px; /* 按钮内边距 */
  transition: background-color 0.3s; /* 按钮悬停效果 */
}

.el-button:hover {
  background-color: #0056b3; /* 悬停时的背景颜色 */
}
.p-6 {
  padding: 0.5rem !important;
}

.content {
  font-family: 'Arial', sans-serif;
  background-color: #ffffff; /* 白色背景 */
  margin: 0;
  padding: 0;
}

.header {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 14px 20px;
  background-color: #e5e7eb; /* 蓝色背景 */
  color: #ffffff; /* 白色文字 */
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.text-main {
  color: #ffffff; /* 主要文字颜色 */
}

.user-info {
  display: flex;
  align-items: center;
}

.user-dropdown {
  position: relative;
  display: flex;
  align-items: center;
}


.stats {
  display: flex;
  justify-content: space-around;
  margin: 20px 0;
}

.stat-card {
  background-color: #28a745; /* 绿色背景 */
  color: white; /* 白色文字 */
  padding: 20px;
  border-radius: 5px;
  text-align: center;
  flex: 1;
  margin: 0 10px;
  transition: transform 0.2s; /* 动画效果 */
}

.stat-card:hover {
  transform: scale(1.05); /* 鼠标悬停放大 */
  background-color: #218838; /* 深绿色 */
}

.notifications {
  margin: 20px 0;
}

.notification-list {
  border: 1px solid #e0e0e0;
  border-radius: 5px;
  padding: 10px;
  background-color: #f8f9fa; /* 柔和的背景 */
}

.notification-item {
  padding: 15px;
  border-bottom: 1px solid #e0e0e0;
}

.notification-item:last-child {
  border-bottom: none; /* 去掉最后一项的下边框 */
}

.notification-header {
  display: flex;
  justify-content: space-between;
  font-weight: bold;
}

.notification-content {
  margin-top: 5px;
}

.calendar-container {
  margin-top: 20px;
}

.system-info {
  margin-top: 20px;
  border-top: 1px solid #e0e0e0;
  padding-top: 20px;
}

h1, h2 {
  margin: 0;
  color: #333; /* 深色文字 */
}

.text-highlight {
  color: #007bff; /* 突出显示的标题颜色 */
}

.left-column {
  flex: 1;
  margin-right: 20px;
}

.right-column {
  flex: 1;
}

.row {
  display: flex;
}

.avatar {
  width: 45px;
  height: 45px;
  border-radius: 50%;
  margin-right: 10px;
  transition: transform 0.2s; /* 动画效果 */
}

.animated-avatar:hover {
  transform: rotate(360deg); /* 头像旋转 */
}

.animated-header {
  animation: fade-in 0.5s; /* 渐入动画 */
}

.animated-stats {
  display: flex;
  justify-content: space-between;
  animation: bounce-in 1s; /* 弹跳动画 */
}

@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes bounce-in {
  from {
    transform: translateY(-30px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

.el-card__body, .el-main {
  padding: 2px !important;
}

.luo {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  margin: 0;
  padding: 2px;
}

.announcement-board {
  max-width: 800px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.announcement-header {
  background-color: #f0f2f5;
  padding: 16px 24px;
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}

.announcement-header h2 {
  margin: 0;
  font-size: 18px;
  font-weight: bold;
}

.announcement-list {
  padding: 0px 16px;
}

.announcement-item {
  border-bottom: 1px solid #e4e7ed;
  padding: 16px 0;
  cursor: pointer;
}
.announcement-item:hover {
  background-color: aliceblue;
}




.announcement-item:last-child {
  border-bottom: none;
}

.announcement-meta {
  display: flex;
  justify-content: space-between;
  font-size: 14px;
  color: #909399;
  margin-bottom: 8px;
}

.announcement-title {
  font-size: 13px;
  font-weight: bold;
  margin-bottom: 8px;
}

.announcement-description {
  font-size: 14px;
  color: #606266;
  line-height: 1.5;
}

.item {
  margin-top: 10px;
  margin-right: 40px;
}
</style>