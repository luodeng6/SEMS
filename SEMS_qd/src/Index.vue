<template>
  <div class="next-gen-container">
    <public-menu class="modern-nav"></public-menu>

    <main class="fluid-layout">

      <!-- 功能卡片区 -->
      <div class="container-fluid" style="padding: 39px 76px;">
        <section  class="row">
          <div class="col-md-3">
            <div class="card quick-actions">
              <div class="action-grid">
                <router-link
                    v-for="(action, index) in quickActions"
                    :key="index"
                    :to="action.path"
                    class="action-card"
                    :style="`--hue: ${index * 60}`"
                >
                  <i :class="action.icon"></i>
                  <span>{{ action.title }}</span>
                </router-link>
              </div>
            </div>
          </div>
          <div class="col-md-5">
            <div class="card">
              <div class="carousel-content">
                <img src="http://localhost:83/img.png" alt="职业发展">
                <div class="carousel-overlay">
                  <h3>2024届名企招聘季</h3>
                  <p>500+优质岗位火热进行中</p>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="info-card announcements">
              <h3><i class="fas fa-bullhorn"></i> 最新公告</h3>
              <ul class="announcement-list">
                <li v-for="(announcement, index) in announcements" :key="index">
                  <span class="announcement-date">{{ announcement.date }}</span>
                  <span class="announcement-title">{{ announcement.title }}</span>
                  <i class="fas fa-external-link-alt"></i>
                </li>
              </ul>
            </div>
          </div>

        </section>
      </div>


    </main>

  </div>
</template>

<script>
import publicMenu from "@/components/public/public_menu.vue";

export default {
  components: {
    publicMenu
  },
  data() {
    return {
      quickActions: [
        { title: '校园招聘', icon: 'fas fa-building', path: '#' },
        { title: '简历中心', icon: 'fas fa-file-signature', path: '#' },
        { title: '面试预约', icon: 'fas fa-handshake', path: '#' },
        { title: '职业测评', icon: 'fas fa-chart-line', path: '#' },
        { title: '单位入口', icon: 'fas fa-door-open', path: '/dw/login' },
        { title: '学生登录', icon: 'fas fa-user-graduate', path: '/stu/Login' }
      ],
      events: [
        {
          title: '腾讯科技2024校园宣讲会',
          type: '线上',
          time: '9月15日 14:00',
          location: '腾讯会议 #123456',
          highlight: true
        },
        // 其他活动数据...
      ],
      newsList: [
        {
          title: '阿里巴巴秋招正式启动',
          tag: '热门',
          company: '阿里巴巴集团',
          deadline: '截止10月31日'
        },
        // 其他资讯数据...
      ],
      user: {
        name: "张三",
        role: "学生",
        avatar: "https://source.unsplash.com/100x100/?portrait"
      },
      announcements: [
        {
          date: "09-01",
          title: "2024秋季校园招聘会通知"
        },
        {
          date: "08-28",
          title: "就业协议书电子签署系统上线"
        },
        {
          date: "08-25",
          title: "职业指导讲座时间调整通知"
        }
      ],
      recentJobs: [
        {
          title: "前端开发工程师",
          company: "腾讯科技",
          salary: "15-25K",
          location: "深圳",
          logo: "https://logo.clearbit.com/tencent.com"
        }
      ]
    }
  }
}
</script>

<style scoped>
.next-gen-container {
  --primary-hue: 220;
  --glass-bg: hsla(var(--primary-hue), 100%, 98%, 0.9);
  --text-primary: hsl(var(--primary-hue), 76%, 35%);
  --gradient-1: linear-gradient(145deg,
  hsl(var(--primary-hue), 100%, 92%) 0%,
  hsl(260, 90%, 92%) 100%);
  --shadow-sm: 0 4px 12px hsla(var(--primary-hue), 50%, 20%, 0.08);
}

/* 玻璃质感头部 */
.glass-header {
  background: var(--glass-bg);
  backdrop-filter: blur(12px);
  box-shadow: var(--shadow-sm);
  position: relative;
  padding-bottom: 120px;
}

.hero-banner {
  text-align: center;
  padding: 4rem 1rem 8rem;
  background: var(--gradient-1);
  clip-path: ellipse(100% 80% at 50% 20%);
}

.dynamic-text {
  font-size: 3.5rem;
  background: linear-gradient(45deg,
  hsl(250, 80%, 50%),
  hsl(220, 90%, 55%));
  -webkit-background-clip: text;
  color: transparent;
  margin-bottom: 2rem;
}

.search-bar {
  max-width: 800px;
  margin: 0 auto;
  display: flex;
  border-radius: 50px;
  overflow: hidden;
  box-shadow: var(--shadow-sm);
}

.search-bar input {
  flex: 1;
  padding: 1.5rem 2rem;
  border: none;
  font-size: 1.1rem;
}

.search-btn {
  width: 80px;
  background: var(--text-primary);
  color: white;
  border: none;
  cursor: pointer;
  transition: all 0.3s;
}

.search-btn:hover {
  background: hsl(var(--primary-hue), 80%, 45%);
}

/* 仪表盘布局 */
.dashboard-grid {
  display: grid;
  gap: 2rem;
  margin-top: -8px;
  padding: 0 2rem;
  grid-template-columns: 1fr 400px;
}

.main-carousel {
  border-radius: 20px;
  overflow: hidden;
  position: relative;
}

.carousel-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 2rem;
  background: linear-gradient(transparent, rgba(0,0,0,0.7));
  color: white;
}

.quick-actions {
  background: white;
  border-radius: 20px;
  padding: 1.5rem;
  height: 100%;
}

.action-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1rem;
  height: 100%;
}

.action-card {
  padding: 1.5rem;
  border-radius: 15px;
  background: hsl(var(--hue), 90%, 96%);
  color: hsl(var(--hue), 80%, 40%);
  text-align: center;
  transition: all 0.3s;
}

.action-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 16px hsla(var(--hue), 50%, 50%, 0.1);
}

/* 时间轴设计 */
.event-timeline {
  margin: 2rem;
  padding: 2rem;
  background: white;
  border-radius: 20px;
}

.timeline-container {
  position: relative;
  padding-left: 40px;
}

.timeline-item {
  padding: 1.5rem 0;
  position: relative;
}

.timeline-marker {
  position: absolute;
  left: -28px;
  top: 24px;
  width: 16px;
  height: 16px;
  border-radius: 50%;
  background: var(--text-primary);
  border: 3px solid white;
  box-shadow: 0 0 0 4px hsl(var(--primary-hue), 90%, 90%);
}

.timeline-item.highlight .timeline-marker {
  background: #ff6b6b;
  box-shadow: 0 0 0 4px #ffe3e3;
}

/* 悬浮按钮系统 */
.fab-container {
  position: fixed;
  bottom: 2rem;
  right: 2rem;
}

.fab-main {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  background: var(--text-primary);
  color: white;
  border: none;
  box-shadow: var(--shadow-sm);
  transition: all 0.3s;
}

.fab-main:hover {
  transform: scale(1.1) rotate(90deg);
}

@media (max-width: 1200px) {
  .dashboard-grid {
    grid-template-columns: 1fr;
  }

  .dynamic-text {
    font-size: 2.5rem;
  }
}

/* 新增样式 */
.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 2rem;
}

.user-profile {
  display: flex;
  align-items: center;
  gap: 1rem;
  background: rgba(255,255,255,0.9);
  padding: 0.5rem 1rem;
  border-radius: 50px;
  backdrop-filter: blur(5px);
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.user-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  border: 2px solid white;
}

.user-info {
  display: flex;
  flex-direction: column;
  line-height: 1.2;
}

.username {
  font-weight: 600;
  color: var(--text-primary);
}

.user-role {
  font-size: 0.8em;
  color: #666;
}

.quick-info-bar {
  display: grid;
  grid-template-columns: 1fr 1.5fr;
  gap: 2rem;
  margin: 2rem;
}

.info-card {
  background: white;
  border-radius: 20px;
  padding: 1.5rem;
  box-shadow: var(--shadow-sm);
}

.announcement-list li {
  display: flex;
  align-items: center;
  padding: 1rem 0;
  border-bottom: 1px solid #eee;
  cursor: pointer;
  transition: all 0.2s;
}

.announcement-list li:hover {
  background: #f8f9fa;
  transform: translateX(5px);
}

.announcement-date {
  width: 60px;
  color: var(--text-primary);
  font-weight: 500;
}

.announcement-title {
  flex: 1;
  margin: 0 1rem;
}

.job-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
}

.job-card {
  display: flex;
  align-items: center;
  padding: 1rem;
  border-radius: 15px;
  background: #f8f9fa;
  transition: all 0.3s;
}

.job-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.company-logo {
  width: 50px;
  height: 50px;
  border-radius: 12px;
  overflow: hidden;
  margin-right: 1rem;
}

.company-logo img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.job-details {
  flex: 1;
}

.company-name {
  color: #666;
  font-size: 0.9em;
}

.job-meta {
  display: flex;
  gap: 1rem;
  margin-top: 0.5rem;
  font-size: 0.9em;
}

.salary {
  color: #e91e63;
  font-weight: 500;
}

.location {
  color: #2196f3;
}

@media (max-width: 768px) {
  .quick-info-bar {
    grid-template-columns: 1fr;
  }

  .header-content {
    flex-direction: column;
    align-items: flex-start;
  }

  .user-profile {
    margin-top: 1rem;
  }
}
</style>