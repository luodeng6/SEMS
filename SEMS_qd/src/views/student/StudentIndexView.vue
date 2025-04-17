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
            <!-- 通知按钮和弹窗 -->
            <el-popover
                placement="bottom-end"
                popper-class="notification-popover"
                trigger="click"
                width="400">
              <div class="notification-container">
                <div class="message-list">
                  <div
                      v-for="(message, index) in currentPageMessages"
                      :key="index"
                      class="message-card"
                      @click="markAsRead(message)"
                  >
                    <!--                 "CFZ": "20213260024",
                                        "CFZXM": "陈兴远",
                                        "CFZXW": "学生确认了面试",
                                        "JSZ": "msk",
                                        "JSZXM": "Elon Reeve Musk",
                                        "DZNR": "学生:陈兴远,确认了面试:“特斯拉销售代表”",
                                        "YDBZ": 0,
                                        "DZLX": 10,
                                        "CFSJ": "2025-02-28T06:44:33.453+00:00"
                                        },-->

                    <!-- 用户头像 -->
                    <el-avatar :size="40" :src="message.YHZP" class="mr-3"></el-avatar>
                    <div class="message-content">
                      <div class="message-header">
                        <span class="sender">{{ message.CFZXM }}</span>
                        <span class="time">{{ formatDate(message.CFSJ) }}</span>
                      </div>
                      <p>{{ message.DZNR }}</p>
                    </div>

                    <!-- 未读红点 -->
                    <div v-if="!message.YDBZ" class="unread-dot"></div>
                  </div>
                </div>
                <!-- 分页 -->
                <el-pagination
                    :current-page.sync="currentPage"
                    :page-size="pageSize"
                    :total="messages.length"
                    class="pagination"
                    layout="prev, pager, next"
                    @current-change="handlePageChange"
                />
              </div>
              <!-- 触发按钮 -->
              <button slot="reference" class="hover:text-slate-600 relative" style="margin-right: 10px;color: black;">
                <i class="el-icon-bell text-xl"></i>
                <span v-show="(messages.filter(message => message.YDBZ===0).length)!== 0"
                      class="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full"></span>
              </button>
            </el-popover>

            <el-badge :value="12" class="item" style="margin-right: 20px;">
              <el-button plain size="small">待处理面试</el-button>
            </el-badge>
            <el-badge class="item" is-dot style="margin-right: 20px;color: #0d0d0d;">新消息</el-badge>
            <el-badge class="item" is-dot style="margin-right: 20px;">
              <el-button class="share-button" icon="el-icon-share" type="primary"></el-button>
            </el-badge>


            <img alt="用户头像" class="avatar animated-avatar" src="@/assets/avatar.png"/>
            <span class="text-dark"> 用户: {{ UserInfo.name }}</span>
            <el-dropdown style="margin-left: 10px;" trigger="click">
              <span class="el-dropdown-link text-dark">点我查看<i
                  class="el-icon-caret-bottom el-icon--right"></i></span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item class="clearfix">评论
                  <el-badge :value="12" class="mark"/>
                </el-dropdown-item>
                <el-dropdown-item class="clearfix">回复
                  <el-badge :value="3" class="mark"/>
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
          <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
            <el-tab-pane label="最新公告" name="first">

              <div class="announcement-board luo">
                <!--                  <div class="announcement-header">
                                    <h2>公告栏</h2>
                                  </div>-->
                <div class="announcement-list">

                  <div v-for="(item, index) in announcements" :key="index"
                       class="announcement-item" @click="navigateTo(item)">
                    <div class="announcement-content">
                      <div style="display: flex;    justify-content: space-between;">
                        <h3 class="announcement-title">{{ index + 1 + '.' + GGBTRETURN(item.GGBT) }}</h3>
                        <div class="announcement-meta" style="position: relative; right: 5px;">
                          <span class="announcement-publisher">{{ item.FBZXM }}</span>
                          <span class="announcement-date">{{ formatDate(item.CJSJ) }}</span>
                        </div>
                      </div>

                      <p class="announcement-description"> {{ stripHtml(item.GGNR).slice(0, 30) + '...' }}</p>
                    </div>
                  </div>
                </div>
              </div>
              <el-alert
                  description="请认真填写反馈问卷，你的每一个建议都将帮助我们改进教学质量。"
                  show-icon
                  title="重要提示"
                  type="warning">
              </el-alert>

            </el-tab-pane>
            <el-tab-pane label="就业日历" name="second">
              <el-calendar v-model="value"></el-calendar>
            </el-tab-pane>
            <el-tab-pane label="面试动态" name="third">

              <el-card v-for="(item, index) in interviewList" :key="index" class="interview-card"
                       shadow="hover">
                <div slot="header" class="clearfix">
                  <span class="position-name">{{ item.GWMC }}</span>
                  <el-tag size="mini" type="info">{{ item.GSMC }}</el-tag>
                </div>

                <div class="interview-info">
                  <div class="info-item">
                    <i class="el-icon-alarm-clock"></i>
                    面试时间：{{ formatDate(item.MSSJ) }}
                  </div>
                  <div class="info-item">
                    <i class="el-icon-location-outline"></i>
                    面试地点：{{ item.MSDD || '待确认' }}
                  </div>
                  <div class="info-item">
                    <i class="el-icon-user"></i>
                    面试官：{{ item.FQZXM || '暂未分配' }}
                  </div>
                  <el-divider></el-divider>
                  <div class="status-wrapper">
                    <el-tag
                        :type="getMsStatus(item).type"
                        effect="dark"
                    >
                      {{ getMsStatus(item).text }}
                    </el-tag>
                    <div class="operation-btns">
                      <el-button plain size="mini" type="primary">查看详情</el-button>
                      <el-button plain size="mini" type="danger">取消面试</el-button>
                    </div>
                  </div>
                </div>
              </el-card>


            </el-tab-pane>
            <el-tab-pane label="待处理" name="fourth">定时任务补偿</el-tab-pane>
          </el-tabs>

        </div>

        <div class="col-md-5">
          <div class="job-list">
            <h2 class="text-highlight">最新职位</h2>
            <div v-for="(job, index) in jobs" :key="index" class="job-item">
              <div class="job-header">
                <h3 class="job-title">{{ job.GWMC }}</h3>
                <div class="job-meta">
                  <span class="job-company">{{ job.GSMC }}</span>
                  <!--                  <span class="job-location">{{ job.GZDD }}</span>-->
                </div>
              </div>
              <div class="job-body">
                <p class="job-description">{{ job.GWMS.slice(0, 30) + '...' }}</p>
              </div>
              <div class="job-footer">
                <span class="job-date">{{ formatDate(job.FBSJ) }}</span>
                <el-button size="mini" type="text" @click="lookJobDetail(job.ID)">查看详情</el-button>
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
              <el-table-column label="参数" prop="parameter"/>
              <el-table-column label="值" prop="value"/>
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
import {NOWIP} from "@/NOWIP"
export default {
  components: {
    StudentMenu
  },
  name: "StudentIndexView",
  data() {
    return {
      // 确认代码为0，qydm为1 就是待确认
      statusConfig: {
        pending: {type: 'warning', text: '待确认'},
        confirmed: {type: 'success', text: '已确认'},
        canceled: {type: 'info', text: '已取消'}
      },
      interviewList: [
        {
          position: '前端开发工程师',
          company: 'XX科技有限公司',
          time: '2024-03-15 14:30',
          location: '北京市海淀区XX大厦8层',
          interviewer: '王经理',
          status: '待确认'
        },
        {
          position: 'Java高级工程师',
          company: 'YY互联网集团',
          time: '2024-03-16 10:00',
          location: '',
          interviewer: '',
          status: '已安排'
        },
        {
          position: '产品经理',
          company: 'ZZ数字科技',
          time: '2024-03-17 15:00',
          location: '上海市浦东新区XX中心',
          interviewer: '李总监',
          status: '已结束'
        }
      ],
      statusType: {
        '待确认': 'warning',
        '已安排': 'success',
        '已结束': 'info'
      },
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      messages: [],
      currentPage: 1,
      pageSize: 5,
      activeName: 'first',
      highlightedDates: [
        {
          date: '2025-01-18',
          type: 'danger',
          text: '有任务'
        }
      ],
      jobs: [],
      value: new Date(),
      systemInfo: [
        {parameter: '年龄', value: '20'},
        {parameter: '班级', value: '2021级信息管理与信息系统'},
        {parameter: '性别', value: '男'},
        {parameter: '就业状态', value: '求职中'},
        {parameter: '学历', value: '本科'},
        {parameter: '专业', value: '计算机科学与技术'},
      ],
      announcements: []
    }
  },
  computed: {
    currentPageMessages() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.messages.slice(start, end);
    }
  },
  mounted() {
    console.log(this.$route.params.from);
    this.getLoginUserInfo();
    this.getRecruitmentNotices();
    this.getJobData();
  },
  methods: {
    lookJobDetail(gwdm) {
      this.$router.push({path: '/public/jobDetail', query: {id: gwdm}})
    },
    getMsStatus(row) {
      if (row.QYDM === 0) {
       // console.log("已取消");
        return this.statusConfig['canceled']; // 已取消
      } else if (row.QRDM === 1) {
       // console.log("已确认");
        return this.statusConfig['confirmed']; // 已确认
      } else if (row.QRDM === 0 && row.QYDM === 1) {
       // console.log("待确认");
        return this.statusConfig['pending'];// 待确认
      } else {
       // console.log("未知状态");
      }
    },
    // 新方法获取面试列表
    getInterviews() {
      axios.get("/msdmk/getInterviewsMainIdea?Type=3&yhm=" + this.UserInfo.username).then(response => {
        if (response.data.result) {
          this.interviewList = response.data.data;
          console.log(this.interviewList);
        } else {
          this.$message.error("获取面试数据失败:" + response.data.msg);
        }
      }).catch(error => {
        console.error("获取面试列表失败！", error);
        this.$message.error("获取面试数据失败：" + error.message);
      });
    },
    getJobData() {
      axios.get("/dataGwdmk/getGwdmkDataToInterface?IsJustOne=0&gwdm=0&QYDM=1&IsByFBZ=0&FBZ=null&SXBZ=2").then(res => {
        if (res.data.result) {
          this.jobs = res.data.data;
          // 重新根据发布时间排序
          this.jobs.sort((a, b) => new Date(b.FBSJ) - new Date(a.FBSJ));
          this.jobs = this.jobs.slice(0, 5);
        } else {
          console.error('获取职位信息失败,网络错误：' + res.data.msg);
          this.$message.error('获取职位信息失败:' + res.data.msg);
        }
      }).catch(error => {
        console.error('获取职位信息失败,网络错误！', error);
        this.$message.error('获取职位信息失败:' + error.message);
      });
    },
    GGBTRETURN(GGBT) {
      if (!GGBT) return ''; // 处理空值情况

      // 统计英文字母的数量
      const englishCount = (GGBT.match(/[a-zA-Z]/g) || []).length;

      // 确定截取长度（超过5个英文字符取30，否则取15）
      const maxLength = englishCount > 5 ? 30 : 15;

      // 如果字符串长度小于 maxLength，直接返回，不加 "..."
      return GGBT.length <= maxLength ? GGBT : GGBT.slice(0, maxLength) + '...';
    },
    stripHtml(html) {
      let doc = new DOMParser().parseFromString(html, 'text/html');
      return doc.body.textContent || "";
    },
    // 获取招聘公告
    getRecruitmentNotices() {
      axios.get(`/dwzpggk/getdwzpggk?YFSFDM=4&YHM=null&QYDM=1`).then(res => {
        if (res.data.result) {
          this.announcements = res.data.data.slice(0, 31);
        } else {
          this.$message.error(res.data.msg);
        }
      }).catch(error => {
        console.error('获取公告列表失败,网络错误！', error);
        this.$message.error('获取公告列表失败,网络错误！');
      });
    },
    formatDate(dateStr) {
      return dateStr
          ? new Date(dateStr).toLocaleString(undefined, {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit'
          })
          : '-';
    },
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
          this.getInterviews();
          if (this.$route.params.from === 'login') {
            this.$notify({
              title: '温馨提示',
              message: '欢迎回来 ： ' + this.UserInfo.name + '！',
              type: 'success',
              position: 'top-left'
            });
          }
          this.getXxdm();
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
    getXxdm() {
      axios.get(`/xxdmk/getXxdmk?YHM=${this.UserInfo.username}&YHSFDM=4`).then(response => {
        if (response.data.result) {
          this.messages = response.data.data;
          // 不看自己发起的消息
          this.messages = this.messages.filter(message => message.CFZ !== this.UserInfo.username);
          this.showMessage();
        } else {
          console.error('获取消息信息失败,网络错误：' + response.data.msg);
          this.$message.error('获取消息信息失败:' + response.data.msg);
        }
      }).catch(error => {
        console.error('获取消息信息失败,网络错误！', error);
        this.$message.error('获取消息信息失败:' + error.message);
      });
    },
    showMessage() {
      // 如果是登录进来就显示提示消息
      if (this.$route.params.from === 'login') {
        // 遍历系统消息
        let offset = 0;
        for (let i = 0; i < this.messages.length; i++) {
          console.log(this.messages[i])
          if (this.messages[i].YDBZ === 0) {

            this.$notify({
              title: '新消息',
              message: `
                      <div style="display: flex; align-items: center;">
                        <img src="${this.messages[i].YHZP}" alt="用户头像" style="width: 40px; height: 40px; border-radius: 50%; margin-right: 10px;">
                        <span>${this.messages[i].DZNR}</span>
                      </div>
                    `,
              dangerouslyUseHTMLString: true,
              type: 'warning',
              position: 'top-right',
              offset: offset,
            });
            offset += 100
          }
        }


      }
    },
    navigateTo(announcementId) {
      console.log(announcementId);
      this.$router.push({path: '/public/gonggaoDetail', query: {id: announcementId.ID}})
    },
    handleClick(tab, event) {
      console.log("你点击了标签")
      console.log(tab, event);
    }
  }
}
</script>

<style scoped>
.interview-card {
  margin-bottom: 20px;
  transition: transform 0.3s;
}

.interview-card:hover {
  transform: translateY(-5px);
}

.position-name {
  font-size: 16px;
  font-weight: bold;
  margin-right: 10px;
}

.info-item {
  margin: 8px 0;
  color: #666;
}

.status-wrapper {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.operation-btns {
  display: flex;
  gap: 8px;
}

.el-divider {
  margin: 12px 0;
}


.notification-container {
  max-height: 400px;
  overflow-y: auto;
  padding: 10px;
}

.message-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.message-card {
  position: relative;
  display: flex;
  align-items: center;
  padding: 10px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.message-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.message-content {
  flex: 1;
}

.message-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 5px;
  font-size: 0.9em;
  color: #909399;
}

.sender {
  font-weight: bold;
  color: #303133;
}

.time {
  color: #909399;
}

.message-content p {
  margin: 0;
  font-size: 1em;
  color: #606266;
}

.unread-dot {
  position: absolute;
  top: 10px;
  right: 10px;
  width: 8px;
  height: 8px;
  background-color: red;
  border-radius: 50%;
}

.pagination {
  display: flex;
  justify-content: center;
  margin-top: 10px;
}

.el-pager li {
  border-radius: 4px;
  transition: background-color 0.2s;
}

.el-pager li:hover {
  background-color: #ecf5ff;
}

.el-pager li.active {
  background-color: #409eff;
  color: #fff;
}

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
  background-color: aliceblue;
  cursor: pointer;
}

.job-header {
  display: flex; /* 使用 flexbox 布局 */
  justify-content: space-between; /* 头部内容两端对齐 */
  align-items: center; /* 垂直居中 */
}

.job-title {
  font-size: 17px; /* 职位标题字体大小 */
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
  font-size: 13px; /* 描述字体大小 */
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