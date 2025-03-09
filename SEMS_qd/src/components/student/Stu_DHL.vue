<template>
  <div class="header animated-header">

    <div class="user-info">
      <div class="user-dropdown">
        <!-- 通知按钮和弹窗 -->
        <el-popover
            placement="bottom-end"
            width="400"
            trigger="click"
            popper-class="notification-popover">
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
                    <span class="time">{{formatDate(message.CFSJ)  }}</span>
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
                layout="prev, pager, next"
                class="pagination"
                @current-change="handlePageChange"
            />
          </div>
          <!-- 触发按钮 -->
          <button slot="reference" class="hover:text-slate-600 relative" style="margin-right: 10px;color: black;">
            <i class="el-icon-bell text-xl"></i>
            <span v-show="(messages.filter(message => message.YDBZ===0).length)!== 0" class="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full"></span>
          </button>
        </el-popover>

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
</template>

<script>
import axios from "axios";
import {EventBus} from "@/event-bus";

export default {
  name: 'Stu_DHL',
  data() {
    return {
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      messages: [],
      currentPage: 1,
      pageSize: 5,
    }
  },
  computed: {
    currentPageMessages() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.messages.slice(start, end);
    }
  },
  methods: {
    formatDate(dateStr) {
      return dateStr ? new Date(dateStr).toLocaleString() : '-'
    },
    getXxdm(){
      axios.get(`/xxdmk/getXxdmk?YHM=${this.UserInfo.username}&YHSFDM=4`).then(response => {
        if (response.data.result){
          this.messages = response.data.data;
          // 不看自己发起的消息
          this.messages = this.messages.filter(message => message.CFZ !== this.UserInfo.username);

        }else{
          console.error('获取消息信息失败,网络错误：'+ response.data.msg);
          this.$message.error('获取消息信息失败:'+response.data.msg);
        }
      }).catch(error => {
        console.error('获取消息信息失败,网络错误！', error);
        this.$message.error('获取消息信息失败:'+error.message);
      });
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
  },
  created() {
    this.getLoginUserInfo();
  }
}
</script>

<style scoped>
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
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  transition: all 0.3s ease;
}
.message-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
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