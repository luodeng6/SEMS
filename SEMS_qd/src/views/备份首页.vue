<template>
  <div class="modern-container">
    <public-menu class="modern-navbar"></public-menu>

    <!-- 主内容区 -->
    <div class="container-fluid px-4 py-5">
      <div class="row g-4">
        <!-- 左侧导航 -->
        <aside class="col-lg-3">
          <!-- 服务导航 -->
          <div class="modern-card sidebar-nav">
            <div class="nav-header gradient-bg">
              <i class="fas fa-briefcase me-2"></i>
              就业服务平台
            </div>
            <div class="list-group rounded-3">
              <router-link
                  v-for="(nav, index) in navItems"
                  :key="index"
                  :to="nav.path"
                  class="list-group-item list-group-item-action d-flex align-items-center"
              >
                <i :class="`${nav.icon} me-3`"></i>
                <span class="flex-grow-1">{{ nav.title }}</span>
                <i class="fas fa-chevron-right text-muted"></i>
              </router-link>
            </div>
          </div>

          <!-- 宣讲会日程 -->
          <div class="modern-card mt-4">
            <div class="event-header gradient-bg">
              <i class="fas fa-calendar-alt me-2"></i>
              近期宣讲会
            </div>
            <div class="event-tabs">
              <nav>
                <div class="nav nav-pills mb-3" role="tablist">
                  <button
                      v-for="(tab, index) in eventTabs"
                      :key="index"
                      class="nav-link"
                      :class="{ active: activeTab === index }"
                      @click="activeTab = index"
                  >
                    {{ tab }}
                  </button>
                </div>
              </nav>
              <div class="event-list">
                <transition-group name="fade-list">
                  <div
                      v-for="(event, index) in filteredEvents"
                      :key="event.id"
                      class="event-card"
                  >
                    <div class="event-date-badge">
                      <div class="date">{{ event.date }}</div>
                      <div class="month">{{ event.month }}</div>
                    </div>
                    <div class="event-details">
                      <h5 class="event-title">{{ event.title }}</h5>
                      <div class="event-meta">
                        <span class="badge" :class="event.typeClass">
                          <i :class="event.typeIcon"></i> {{ event.type }}
                        </span>
                        <span class="time">{{ event.time }}</span>
                        <span class="participants">
                          <i class="fas fa-users"></i> {{ event.participants }}
                        </span>
                      </div>
                    </div>
                  </div>
                </transition-group>
              </div>
            </div>
          </div>
        </aside>

        <!-- 主内容 -->
        <main class="col-lg-9">
          <div class="row g-4">
            <!-- 轮播图 -->
            <div class="col-xxl-8">
              <div class="modern-carousel">
                <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
                  <div class="carousel-inner rounded-4">
                    <div
                        v-for="(slide, index) in carouselItems"
                        :key="index"
                        class="carousel-item"
                        :class="{ active: index === 0 }"
                    >
                      <img :src="slide.image" class="d-block w-100" :alt="slide.title">
                      <div class="carousel-caption d-none d-md-block">
                        <h3>{{ slide.title }}</h3>
                        <p>{{ slide.description }}</p>
                      </div>
                    </div>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
              </div>
            </div>

            <!-- 实时资讯 -->
            <div class="col-xxl-4">
              <div class="modern-card news-box">
                <div class="news-header gradient-bg">
                  <i class="fas fa-bullhorn me-2"></i>
                  招聘快讯
                </div>
                <div class="news-list">
                  <div
                      v-for="(news, index) in newsList"
                      :key="index"
                      class="news-item"
                  >
                    <div class="news-badge" v-if="news.isNew">NEW</div>
                    <div class="news-content">
                      <h6>{{ news.title }}</h6>
                      <div class="news-meta">
                        <span class="company">{{ news.company }}</span>
                        <span class="deadline">{{ news.deadline }}</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 快捷入口 -->
            <div class="col-12">
              <div class="row g-4">
                <div class="col-md-6 col-xl-3">
                  <div class="quick-card resume-help">
                    <i class="fas fa-file-alt"></i>
                    <h5>简历优化</h5>
                    <p>专业导师一对一指导</p>
                  </div>
                </div>
                <div class="col-md-6 col-xl-3">
                  <div class="quick-card interview-prep">
                    <i class="fas fa-comments"></i>
                    <h5>面试辅导</h5>
                    <p>模拟面试实战训练</p>
                  </div>
                </div>
                <div class="col-md-6 col-xl-3">
                  <div class="quick-card policy-info">
                    <i class="fas fa-file-contract"></i>
                    <h5>政策解读</h5>
                    <p>最新就业政策解析</p>
                  </div>
                </div>
                <div class="col-md-6 col-xl-3">
                  <div class="quick-card data-center">
                    <i class="fas fa-chart-line"></i>
                    <h5>就业数据</h5>
                    <p>实时就业率统计</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>

    <!-- 悬浮操作菜单 -->
    <div class="floating-menu">
      <button class="menu-btn main-btn" @click="toggleSubMenu">
        <i class="fas" :class="showSubMenu ? 'fa-times' : 'fa-plus'"></i>
      </button>
      <div class="sub-buttons" :class="{ active: showSubMenu }">
        <a href="tel:123456789" class="menu-btn">
          <i class="fas fa-phone"></i>
        </a>
        <a href="mailto:career@example.com" class="menu-btn">
          <i class="fas fa-envelope"></i>
        </a>
        <a href="#" class="menu-btn">
          <i class="fas fa-map-marker-alt"></i>
        </a>
        <a href="#" class="menu-btn">
          <i class="fas fa-comments"></i>
        </a>
      </div>
    </div>
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
      showSubMenu: false,
      activeTab: 0,
      navItems: [
        { title: '校园招聘', icon: 'fas fa-building', path: '#' },
        { title: '就业管理', icon: 'fas fa-tasks', path: '/dw/login' },
        { title: '手续办理', icon: 'fas fa-file-alt', path: '#' },
        { title: '学生登录', icon: 'fas fa-user', path: '/stu/login' },
        { title: '单位入口', icon: 'fas fa-user-tie', path: '/dw/login' }
      ],
      eventTabs: ['云宣讲', '在线招聘', '校内宣讲', '校外宣讲'],
      events: [
        {
          id: 1,
          date: '23',
          month: '04月',
          title: '南方医科大学云宣讲会',
          type: '线上',
          typeIcon: 'fas fa-video',
          typeClass: 'online-badge',
          time: '19:00',
          participants: '237'
        },
        // 其他活动数据...
      ],
      carouselItems: [
        {
          image: 'http://static.bysjy.com.cn/frontend/public/images/push/push_4.jpg',
          title: '名企招聘专场',
          description: '500+优质岗位火热招聘中'
        },
        // 其他轮播项数据...
      ],
      newsList: [
        {
          title: '腾讯2024校园招聘启动',
          company: '腾讯科技',
          deadline: '截止9月30日',
          isNew: true
        },
        // 其他新闻数据...
      ]
    }
  },
  computed: {
    filteredEvents() {
      return this.events.filter(e => e.type === this.eventTabs[this.activeTab]);
    }
  },
  methods: {
    toggleSubMenu() {
      this.showSubMenu = !this.showSubMenu;
    }
  }
}
</script>

<style scoped>
:root {
  --primary: #4361ee;
  --secondary: #3f37c9;
  --accent: #4895ef;
  --light: #f8f9fa;
  --dark: #2b2d42;
  --success: #4cc9f0;
}

.modern-container {
  background: var(--light);
  min-height: 100vh;
}

.modern-navbar {
  box-shadow: 0 4px 20px rgba(0,0,0,0.08);
}

.gradient-bg {
  background: linear-gradient(135deg, var(--primary), var(--secondary));
  color: white;
  padding: 1.2rem;
  border-radius: 12px 12px 0 0;
}

.modern-card {
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.08);
  overflow: hidden;
}

.sidebar-nav .list-group-item {
  border: none;
  padding: 1rem;
  transition: all 0.3s ease;
  border-bottom: 1px solid rgba(0,0,0,0.05);
}

.sidebar-nav .list-group-item:hover {
  background: var(--light);
  transform: translateX(8px);
}

.event-card {
  display: flex;
  align-items: center;
  padding: 1rem;
  margin: 0.8rem;
  background: white;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.event-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

.event-date-badge {
  background: var(--accent);
  color: white;
  border-radius: 6px;
  padding: 0.8rem;
  text-align: center;
  min-width: 60px;
  margin-right: 1rem;
}

.modern-carousel {
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 8px 24px rgba(0,0,0,0.1);
}

.quick-card {
  padding: 1.5rem;
  border-radius: 12px;
  color: white;
  text-align: center;
  transition: all 0.3s ease;
  min-height: 180px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.quick-card:hover {
  transform: translateY(-5px);
}

.resume-help { background: linear-gradient(135deg, #4895ef, #4361ee); }
.interview-prep { background: linear-gradient(135deg, #f72585, #b5179e); }
.policy-info { background: linear-gradient(135deg, #7209b7, #560bad); }
.data-center { background: linear-gradient(135deg, #3a0ca3, #480ca8); }

.floating-menu {
  position: fixed;
  right: 2rem;
  bottom: 2rem;
  z-index: 1000;
}

.menu-btn {
  width: 56px;
  height: 56px;
  border-radius: 50%;
  border: none;
  background: var(--primary);
  color: white;
  box-shadow: 0 6px 12px rgba(67, 97, 238, 0.3);
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.menu-btn:hover {
  transform: scale(1.1);
}

.sub-buttons {
  position: absolute;
  bottom: 70px;
  right: 0;
  opacity: 0;
  visibility: hidden;
  transition: all 0.3s ease;
}

.sub-buttons.active {
  opacity: 1;
  visibility: visible;
  bottom: 80px;
}

.fade-list-move {
  transition: transform 0.5s ease;
}

@media (max-width: 992px) {
  .modern-carousel img {
    height: 300px;
  }

  .quick-card {
    min-height: 150px;
    padding: 1rem;
  }
}
</style>