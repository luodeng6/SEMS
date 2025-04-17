<template>
  <div class="home-container">
    <PublicMenu2></PublicMenu2>

    <!-- 登录入口 -->
    <section class="login-section">
      <div class="container">
        <h3 class="section-title"><i class="el-icon-key"></i> 用户登录入口</h3>
        <el-row :gutter="30" class="login-grid">
          <router-link v-for="(entry, index) in loginTypes" :key="index" :to="entry.url">
            <el-col
                :md="6"
                :sm="6"
                :xs="12">
              <div
                  :class="`type-${entry.type}`"
                  class="login-card"
                  @click="handleLogin(entry.type)"
              >
                <div class="card-icon">
                  <i :class="entry.icon"></i>
                </div>
                <h4>{{ entry.title }}</h4>
                <div class="hover-mask"></div>
              </div>
            </el-col>
          </router-link>
        </el-row>
      </div>
    </section>

    <!-- 公告区域 -->
    <section class="notice-section">
      <div class="container">
        <el-row :gutter="30">
          <el-col :md="12">
            <div class="enhanced-card recruit-notice">
              <div class="card-header">
                <i class="el-icon-mic"></i>
                <h3>招聘公告</h3>
                <el-tag size="small" type="danger">实时更新</el-tag>
              </div>
              <div class="card-body">
                <div
                    v-for="(notice, index) in notices"
                    :key="index"
                    class="notice-item"
                >
                  <!--                  {
                  "ID": 2,
                  "FBZ": "luo",
                  "FBZSFDM": 3,
                  "QYDM": 1,
                  "GGNR": "",
                  "GGNRHTML": "",
                  "CJSJ": "2025-03-11T05:53:31.640+00:00",
                  "GGBT": "学院乒乓球室改造工程成交公告",
                  "LLL": 0,
                  "FBZXM": "罗邓卫宁招聘",
                  "FBZSF": "HR"
                  },-->
                  <div class="notice-main" style="cursor: pointer;" @click="handleNotice(notice)">
                    <el-tag size="mini" type="danger">NEW</el-tag>
                    <span class="notice-title">{{ truncateText(notice.GGBT, 25) }}</span>
                  </div>
                  <div class="notice-extra">
                    <span class="notice-date">{{ formatDate(notice.CJSJ) }}</span>
                    <el-button size="mini" type="text">详情</el-button>
                  </div>
                </div>
              </div>
            </div>
          </el-col>

          <el-col :md="12">
            <div class="enhanced-card system-notice">
              <div class="card-header">
                <i class="el-icon-message"></i>
                <h3>系统公告</h3>
                <el-tag size="small" type="success">最新动态</el-tag>
              </div>
              <div class="card-body">
                <div
                    v-for="(xtgg, index) in XTGGK"
                    :key="'system'+index"
                    class="notice-item"
                >

                  <div class="notice-main" @click="handleXtgG(xtgg)">
                    <el-tag size="mini" type="success">UPD</el-tag>
                    <span class="notice-title" style="cursor: pointer;">{{ truncateText(xtgg.GGBT, 30) }}</span>
                  </div>
                  <div class="notice-extra">
                    <span class="notice-date">{{ formatDate(xtgg.CJSJ) }}</span>
                    <el-button size="mini" type="text">查看</el-button>
                  </div>
                </div>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </section>

    <!-- 额外信息：最近发布岗位 & 紧凑招聘会 -->
    <section class="extra-info-section">
      <div class="container">
        <el-row :gutter="30">
          <!-- 最近发布的岗位 -->
          <el-col :md="12">
            <div class="enhanced-card recent-jobs-card">
              <div class="card-header">
                <i class="el-icon-s-order"></i>
                <h3>最近发布的岗位</h3>
                <el-button size="small" type="primary">查看更多</el-button>
              </div>
              <div class="card-body">
                <div v-for="(job, index) in DATAGWDMK" :key="index" class="job-item">
                  <h4 class="job-title">{{ job.gwmc }}</h4>
                  <div class="job-details">
                    <span><i class="el-icon-office-building"></i> {{ DATADWDMK.find(dw=>dw.dwdm===job.dwdm).gsmc }}</span>
                    <span><i class="el-icon-location"></i> {{ job.gzdd }}</span>
                    <span><i class="el-icon-time"></i> {{ formatDate(job.fbsj) }}</span>
                  </div>
                  <el-button @click="handleJobDetail(job.id)" size="mini" type="text">详情</el-button>
                </div>
              </div>
            </div>
          </el-col>

          <!-- 紧凑招聘会信息
          "data": [
                {
                    "ID": 1,
                    "ZPHBT": "卫宁招聘会",
                    "DWDM": 1,
                    "WZBZ": 1,
                    "JBSJ": "2025-04-14T16:00:00.000+00:00",
                    "DYGWDM": "实施、开发",
                    "SZXX": "广西中医药大学",
                    "JBDD": "教学楼1楼",
                    "FBZ": "lls",
                    "FBZSFDM": 2,
                    "QYDM": 1,
                    "ZY": "计算机专业类即可！",
                    "YYRS": 100,
                    "CJSJ": "2025-04-14T15:55:15.483+00:00",
                    "FBZMC": "罗老湿",
                    "DWMC": "卫宁健康科技集团有限公司",
                    "GSMC": "卫宁健康科技集团有限公司"
                },
               -->
          <el-col :md="12">
            <div class="enhanced-card compact-jobfair-card">
              <div class="card-header">
                <i class="el-icon-s-opportunity"></i>
                <h3>近期招聘会</h3>
                <el-button size="small" type="primary">查看更多</el-button>
              </div>
              <div class="card-body">
                <div
                    v-for="(ZPH, index) in ZPHDATA"
                    :key="index"
                    class="compact-jobfair-item"
                >
                  <h4>{{ ZPH.ZPHBT }}</h4>
                  <div class="fair-meta">
                    <span><i class="el-icon-time"></i> {{formatDate2(ZPH.JBSJ) }}</span>
                    <span><i class="el-icon-location"></i> {{ ZPH.JBDD }}</span>
                    <span><i class="el-icon-user"></i> {{ ZPH.FBZMC }}</span>
                  </div>
                </div>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </section>

    <!-- 固定漂浮消息框 -->
    <div class="fixed-message-box" v-show="accountMessages.length">
      <div class="message-icon">
        <i class="el-icon-message"></i>
        <span v-if="accountMessages.length" class="badge">{{ accountMessages.length }}</span>
      </div>
      <div class="message-list">
        <ul>
          <li v-for="(msg, index) in accountMessages" :key="index">
            <div class="msg-title">{{ msg.CFZXW }}</div>
            <div class="msg-content">{{ msg.DZNR }}</div>
          </li>
        </ul>
      </div>
    </div>

  </div>
</template>

<script>
import axios from "axios";
import {EventBus} from "@/event-bus";
import PublicMenu from "@/components/public/public_menu.vue";
import PublicMenu2 from "@/components/public/PublicMenu.vue";

export default {
  components: {PublicMenu2, PublicMenu},
  data() {
    return {
      ZPHDATA: [],//招聘会列表
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      XTGGK: [],
      loginTypes: [
        {type: 'student', title: '学生登录', icon: 'el-icon-user-solid', url: "/stu/Login"},
        {type: 'teacher', title: '教师登录', icon: 'el-icon-s-custom', url: '/teacher/login'},
        {type: 'admin', title: '管理员登录', icon: 'el-icon-s-tools', url: '/Login'},
        {type: 'hr', title: '企业HR登录', icon: 'el-icon-office-building', url: "/dw/login"}
      ],
      notices: [],
      DATAGWDMK: [],
      DATADWDMK: [],
      accountMessages: []
    }
  },
  computed: {},
  mounted() {
    this.getLoginUserInfo();
    this.getRecruitmentNotices();
    this.getAllJob();
    this.getAllDwInfo();
    this.getGongGaoList();
    this.fetchTableData();
  },
  methods: {
    formatDate2(input) {
      const date = new Date(input);

      const year = date.getFullYear();
      const month = date.getMonth() + 1; // 月份从 0 开始
      const day = date.getDate();
      const hour = date.getHours();
      const minute = date.getMinutes();

      return `${year}-${month}-${day} ${hour}:${minute}`;
    },
    getAllDwInfo() {
      axios.get("/dw/getAllDw").then((response) => {
        if (response.data.result) {
          console.log("获取单位信息成功！")
          this.DATADWDMK = response.data.data;
          console.log(this.DATADWDMK);
        } else {
          this.$message.error("获取单位信息失败！，后台错误")
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error("获取单位信息失败，网络错误")
      })
    },
    handleJobDetail(gwdm){
      console.log(gwdm);
      this.$router.push({path: '/public/jobDetail', query: {id: gwdm}})
    },
    fetchTableData() {
      this.isLoading = true;
      axios.get("/datazphjlk/getDataZphjlk", {
        params: {
           QYDM:1,
          ISJUSTONE:0,
          ZPHID:-1,
          ISJUSTONEYH:0,
          YHM:-1,
          YHSFDM:-1,
          getBySHR:0,
          SHR:-1,
          SHRSFDM:-1
        }
      }).then(res => {
        if (res.data.result) {
          this.ZPHDATA = res.data.data;
        } else {
          $.confirm({
            title: '提示',
            content: '获取招聘会列表失败：' + res.data.msg,
            type: 'red',
            buttons: {
              重试: {
                btnClass: 'btn-orange',
                action: () => {
                  this.fetchTableData();
                }
              },
              取消: () => {
                this.$message('已取消操作');
              }
            }
          });
        }
      }).catch(error => {
        console.error("获取招聘会列表失败", error);
        $.confirm({
          title: '提示',
          content: '获取招聘会列表失败：' + error.message,
          type: 'red',
          buttons: {
            重试: {
              btnClass: 'btn-orange',
              action: () => {
                this.fetchTableData();
              }
            },
            取消: () => {
              this.$message('已取消操作');
            }
          }
        });
      });
    },
    truncateText(text, maxLength) {
      if (text.length > maxLength) {
        return text.slice(0, maxLength) + '...';
      }
      return text;
    },
    handleXtgG(xtgg){
      console.log(xtgg);
      this.$router.push({path: '/public/PublicXtggView', query: {id: xtgg.ID}})
    },
    formatDate(dateStr) {
      return dateStr ? new Date(dateStr).toLocaleDateString() : '-';
    },
    getLoginUserInfo() {
      axios.get('/user/checkSession').then(response => {
        if (!response.data.result) {
          return;
        } else {
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.getXxdmk();
          console.log(this.UserInfo);
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
      });
    },
    // 获取用户未读消息
    getXxdmk() {
      axios.get(`/xxdmk/getXxdmk?YHM=${this.UserInfo.username}&YHSFDM=4`).then(response => {
        if (response.data.result) {
          // 不看自己发起的消息
          this.accountMessages = response.data.data.filter(message => message.CFZ !== this.UserInfo.username);
          console.log(this.accountMessages);
        } else {
          console.error('获取消息信息失败,网络错误：' + response.data.msg);
          this.$message.error('获取消息信息失败:' + response.data.msg);
        }
      }).catch(error => {
        console.error('获取消息信息失败,网络错误！', error);
        this.$message.error('获取消息信息失败:' + error.message);
      });
    },
    // 获取招聘公告
    getRecruitmentNotices() {
      axios.get(`/dwzpggk/getdwzpggk?YFSFDM=4&YHM=null&QYDM=1`).then(res => {
        if (res.data.result) {
          // 只获取前3条公告
          this.notices = res.data.data.slice(0, 3);
          //this.notices = res.data.data;
        } else {
          this.$message.error(res.data.msg);
        }
      }).catch(error => {
        console.error('获取公告列表失败,网络错误！', error);
        this.$message.error('获取公告列表失败,网络错误！');
      });
    },

    handleLogin(type) {
      // this.$message.info(`跳转到${this.loginTypes.find(t => t.type === type).title}页面`)
      //this.$router.replace(this.loginTypes.find(t => t.type === type).url)

    },
    handleNotice(notice) {
      console.log(notice);
      this.$router.push({path: '/public/gonggaoDetail', query: {id: notice.ID}})
    },
    // 加载系统公告列表
    getGongGaoList() {
      /* Integer QYDM, Integer JUSTONE, Integer GGID*/
      axios.get(`/xtggk/getXtggk?QYDM=1&JUSTONE=-1&GGID=-1`).then(res => {
        if (res.data.result) {
          this.XTGGK = res.data.data;
        } else {
          this.$message.error(res.data.msg);
        }
      }).catch(error => {
        console.error('获取公告列表失败,网络错误！', error);
        this.$message.error('获取公告列表失败,网络错误！');
      });
    },

    // 获取所有岗位数据
    getAllJob() {
      this.loading = true; // 开始加载
      axios.get("/dataGwdmk/getGwdmkDataByisQy?isQy=1").then(res => {
        this.loading = false; // 结束加载
        if (res.data.result) {
          this.DATAGWDMK = res.data.data;
          console.log("获取岗位数据成功:");
          this.DATAGWDMK= this.DATAGWDMK.sort((a, b) => b.id - a.id).slice(0, 3);

          console.log(this.DATAGWDMK);
        } else {
          console.log("获取岗位数据失败：后台数据库错误！");
        }
      }).catch(err => {
        this.loading = false; // 结束加载
        console.log(err);
      });
    },
  }
}
</script>

<style scoped>
/* 整体背景 */
.home-container {
  background: #f8f9fa;
}

/* 顶部导航 */
.main-header {
  background: linear-gradient(135deg, #2c3e50, #3498db);
  color: white;
  padding: 1rem 0;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.university-brand {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.logo {
  border-radius: 8px;
}

.brand-text h1 {
  margin: 0;
  font-size: 1.8rem;
}

.brand-text p {
  margin: 0;
  font-size: 0.9rem;
  opacity: 0.9;
}

.header-nav {
  display: flex;
  gap: 2rem;
}

.nav-item {
  color: white !important;
  font-size: 1.1rem;
  transition: 0.3s;
}

.nav-item:hover {
  color: #a0cfff !important;
}

/* 登录区域 */
.login-section {
  padding: 2rem 0;
  background: white;
  margin: 20px 0;
  border-radius: 8px;
  /*box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);*/
}

.login-grid {
  margin-top: 1.5rem;
}

.login-card {
  position: relative;
  background: white;
  border-radius: 12px;
  padding: 2rem 1rem;
  text-align: center;
  cursor: pointer;
  transition: 0.3s;
  overflow: hidden;
  border: 1px solid #eee;
}

.login-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}
.login-card.type-student {
  border-top: 4px solid #409EFF;
}

.login-card.type-teacher {
  border-top: 4px solid #67C23A;
}

.login-card.type-admin {
  border-top: 4px solid #909399;
}

.login-card.type-hr {
  border-top: 4px solid #E6A23C;
}

.card-icon {
  font-size: 2.5rem;
  color: #409EFF;
  margin-bottom: 1rem;
  transition: 0.3s;
}

.login-card:hover .card-icon {
  transform: scale(1.1);
}

/* 公告卡片 */
.enhanced-card {
  background: white;
  border-radius: 12px;
  padding: 1.5rem;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.card-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1.5rem;
}

.card-header h3 {
  margin: 0;
  font-size: 1.4rem;
}

.notice-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 0;
  border-bottom: 1px solid #eee;
}

.notice-item:last-child {
  border-bottom: none;
}

/* 额外信息区域 */
.extra-info-section {
  margin: 20px 0;
}

.recent-jobs-card .job-item {
  padding: 1rem 0;
  border-bottom: 1px solid #f0f0f0;
}

.recent-jobs-card .job-item:last-child {
  border-bottom: none;
}

.job-title {
  font-size: 1.2rem;
  margin-bottom: 0.5rem;
}

.job-details {
  font-size: 0.9rem;
  color: #666;
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
  margin-bottom: 0.5rem;
}

.compact-jobfair-card .compact-jobfair-item {
  padding: 1rem 0;
  border-bottom: 1px solid #f0f0f0;
}

.compact-jobfair-card .compact-jobfair-item:last-child {
  border-bottom: none;
}

.fair-meta {
  font-size: 0.9rem;
  color: #666;
  display: flex;
  gap: 1rem;
}

/* 固定漂浮消息框 */
.fixed-message-box {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background: #fff;
  border: 1px solid #eee;
  border-radius: 8px;
  width: 250px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  transition: transform 0.3s ease;
  cursor: pointer;
}

.fixed-message-box .message-icon {
  display: flex;
  align-items: center;
  padding: 10px;
  background: #409EFF;
  color: #fff;
}

.fixed-message-box .badge {
  background: red;
  color: #fff;
  border-radius: 50%;
  padding: 2px 6px;
  margin-left: 8px;
  font-size: 12px;
}

.fixed-message-box .message-list {
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.3s ease;
}

.fixed-message-box:hover .message-list {
  max-height: 300px;
  padding: 10px;
}

.fixed-message-box .message-list ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.fixed-message-box .message-list li {
  border-bottom: 1px solid #eee;
  padding: 8px 0;
}

.fixed-message-box .message-list li:last-child {
  border-bottom: none;
}

.fixed-message-box .msg-title {
  font-weight: bold;
  margin-bottom: 4px;
}

.fixed-message-box .msg-content {
  font-size: 0.9rem;
  color: #666;
}

.notice-main:hover {
  background-color: #f5f5f5;
  cursor: pointer;
  transition: 0.3s;
}

/* 响应式调整 */
@media (max-width: 768px) {
  .header-content {
    flex-direction: column;
    text-align: center;
    gap: 1rem;
  }

  .login-card {
    margin-bottom: 1rem;
  }
}


.enhanced-card{
  box-shadow: 0 0px 0px !important ;

}
</style>
