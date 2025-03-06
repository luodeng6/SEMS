
<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <div>
        <header class="header">
          <div class="header-content">
            <div class="brand">
              <img src="https://cdn-icons-png.flaticon.com/512/2967/2967747.png"
                   class="logo"
                   alt="健康图标">
              <h1>卫生健康科技集团</h1>
            </div>
            <div class="header-right">
              <button class="btn-join">加入我们</button>
              <button class="btn-hire">社会招聘</button>
            </div>
          </div>
        </header>

        <div class="main-content">
          <div class="job-list-container">
            <div class="filter-box">
              <div class="filter-group">
                <select v-model="location" @change="filterJobs" class="custom-select">
                  <option value="">工作地点</option>
                  <option value="上海">上海</option>
                  <option value="全国">全国</option>
                </select>

                <select v-model="jobType" @change="filterJobs" class="custom-select">
                  <option value="">职位类型</option>
                  <option value="高级职位">高级职位</option>
                </select>
                <div class="search-input">
                  <input
                      type="text"
                      v-model="keyword"
                      placeholder="输入关键词..."
                      class="custom-input"
                  >
                  <button @click="filterJobs" class="search-btn">
                    <i class="search-icon">🔍</i>
                  </button>
                </div>
              </div>
            </div>

            <!-- 省略其他不变部分 -->
            <div class="jobs-grid">
              <div
                  class="job-card"
                  v-for="job in jobs"
                  :key="job.id"
              >
                <!-- 新增用户信息区块 -->
                <div class="user-info">
                  <img
                      :src="job.userAvatar"
                      class="user-avatar"
                      alt="招聘负责人"
                  >
                  <div class="user-details">
                    <span class="user-name">{{ job.userName }}</span>
                    <span class="user-role">招聘负责人</span>
                  </div>
                </div>

                <!-- 新增单位名称 -->
                <div class="company-info">
                  <span class="company-name">{{ job.companyName }}</span>
                  <span class="company-tag">官方认证</span>
                </div>

                <div class="job-header">
                  <h3 class="job-title">{{ job.title }}</h3>
                  <span class="job-tag">{{ job.location }}</span>
                </div>

                <!-- 新增薪资和学历信息 -->
                <div class="job-highlights">
                  <div class="salary-range">
                    <i class="icon">💰</i>
                    {{ job.salaryRange }}
                  </div>
                  <div class="education">
                    <i class="icon">🎓</i>
                    {{ job.education }}
                  </div>
                </div>

                <div class="job-meta">
                  <p class="job-location">
                    <i class="icon">📍</i>
                    {{ job.location }}
                  </p>
                  <p class="job-date">
                    <i class="icon">📅</i>
                    {{ job.date }}
                  </p>
                </div>
                <button class="detail-btn">
                  查看详情 →
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>


<script>
import StudentMenu from "@/components/student/Student_menu.vue";

export default {
  name: 'StudentInfo',
  components: { StudentMenu },
  data() {
    return {
      location: '',
      jobType: '',
      keyword: '',
      jobs: [
        {

          id: 1,
          companyName: '健康科技上海研发中心', // 新增单位名称字段
          title: '软件测试工程师',
          location: '上海',
          date: '2020-11-17',
          userName: '张晓敏',
          userAvatar: 'https://randomuser.me/api/portraits/women/1.jpg',
          salaryRange: '15-25K·15薪',
          education: '本科及以上'
        },
        {
          id: 2,
          companyName: '集团总部事业部',
          title: 'BI实施开发',
          location: '上海',
          date: '2020-11-17',
          userName: '王浩然',
          userAvatar: 'https://randomuser.me/api/portraits/men/2.jpg',
          salaryRange: '20-30K·13薪',
          education: '硕士优先'
        },
        {
          id: 3,
          companyName: '集团总部事业部',
          title: 'BI实施开发',
          location: '上海',
          date: '2020-11-17',
          userName: '王浩然',
          userAvatar: 'https://randomuser.me/api/portraits/men/2.jpg',
          salaryRange: '20-30K·13薪',
          education: '硕士优先'
        },{
          id: 4,
          companyName: '集团总部事业部',
          title: 'BI实施开发',
          location: '上海',
          date: '2020-11-17',
          userName: '王浩然',
          userAvatar: 'https://randomuser.me/api/portraits/men/2.jpg',
          salaryRange: '20-30K·13薪',
          education: '硕士优先'
        },{
          id: 5,
          companyName: '集团总部事业部',
          title: 'BI实施开发',
          location: '上海',
          date: '2020-11-17',
          userName: '王浩然',
          userAvatar: 'https://randomuser.me/api/portraits/men/2.jpg',
          salaryRange: '20-30K·13薪',
          education: '硕士优先'
        },{
          id: 2,
          companyName: '集团总部事业部',
          title: 'BI实施开发',
          location: '上海',
          date: '2020-11-17',
          userName: '王浩然',
          userAvatar: 'https://randomuser.me/api/portraits/men/2.jpg',
          salaryRange: '20-30K·13薪',
          education: '硕士优先'
        },{
          id: 2,
          companyName: '集团总部事业部',
          title: 'BI实施开发',
          location: '上海',
          date: '2020-11-17',
          userName: '王浩然',
          userAvatar: 'https://randomuser.me/api/portraits/men/2.jpg',
          salaryRange: '20-30K·13薪',
          education: '硕士优先'
        },{
          id: 2,
          companyName: '集团总部事业部',
          title: 'BI实施开发',
          location: '上海',
          date: '2020-11-17',
          userName: '王浩然',
          userAvatar: 'https://randomuser.me/api/portraits/men/2.jpg',
          salaryRange: '20-30K·13薪',
          education: '硕士优先'
        },{
          id: 2,
          companyName: '集团总部事业部',
          title: 'BI实施开发',
          location: '上海',
          date: '2020-11-17',
          userName: '王浩然',
          userAvatar: 'https://randomuser.me/api/portraits/men/2.jpg',
          salaryRange: '20-30K·13薪',
          education: '硕士优先'
        },
      ],
      filteredJobs: []
    };
  },
  methods: {
    /* filterJobs() {
       this.filteredJobs = this.jobs.filter(job => {
         return (
             (!this.location || job.location === this.location) &&
             (!this.jobType || job.jobType === this.jobType) &&
             (!this.keyword || job.title.includes(this.keyword))
         );
       });
     }*/
  },
  mounted() {
    this.filteredJobs = this.jobs;  // 初始化时显示所有职位
  }
};
</script>

<style scoped>

.p-6 {
  padding: 0.5rem !important;
}

/* 新增单位名称样式 */
.company-info {
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
  gap: 0.8rem;
}

.company-name {
  font-size: 1.05rem;
  font-weight: 600;
  color: var(--text-color);
  position: relative;
  padding-left: 1.2rem;
}

.company-name::before {
  content: "🏢";
  position: absolute;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
}

.company-tag {
  background: #ffe58f;
  color: #d48806;
  padding: 0.2rem 0.6rem;
  border-radius: 4px;
  font-size: 0.8rem;
  font-weight: 500;
}

/* 调整原有布局 */
.job-header {
  margin-top: 0.5rem; /* 增加与单位名称的间距 */
}

@media (max-width: 768px) {
  .company-info {
    flex-direction: column;
    align-items: flex-start;
    gap: 0.4rem;
  }
}


/* 新增用户信息样式 */
.user-info {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 1.5rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid #eee;
}

.user-avatar {
  width: 45px;
  height: 45px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid var(--primary-color);
}

.user-details {
  display: flex;
  flex-direction: column;
}

.user-name {
  font-weight: 600;
  color: var(--text-color);
  font-size: 0.95rem;
}

.user-role {
  color: #666;
  font-size: 0.85rem;
}

/* 新增薪资和学历样式 */
.job-highlights {
  display: flex;
  gap: 1rem;
  margin: 1rem 0;
}

.salary-range {
  color: #ff6b6b;
  background: #fff5f5;
  padding: 0.4rem 0.8rem;
  border-radius: 6px;
  font-weight: 600;
}

.education {
  color: var(--primary-color);
  background: #e3f2fd;
  padding: 0.4rem 0.8rem;
  border-radius: 6px;
}

/* 调整原有卡片布局 */
.job-card {
  padding: 1.8rem; /* 增加内边距 */
}

.job-title {
  font-size: 1.2rem; /* 放大标题 */
}

/* 调整响应式布局 */
@media (max-width: 768px) {
  .job-highlights {
    flex-direction: column;
    gap: 0.5rem;
  }

  .user-avatar {
    width: 40px;
    height: 40px;
  }
}





/* 基础样式 */
:root {
  --primary-color: #1a73e8;
  --secondary-color: #4a90e2;
  --text-color: #2c3e50;
  --bg-color: #f8f9fa;
  --card-bg: #ffffff;
}

body {
  margin: 0;
  font-family: 'Segoe UI', 'Helvetica Neue', sans-serif;
}

/* 头部样式 */
.header {
  background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.header-content {
  max-width: 1200px;
  margin: 0 auto;
  padding: 1.5rem 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.brand {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.logo {
  width: 45px;
  height: 45px;
  filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
}

h1 {
  color: white;
  margin: 0;
  font-size: 1.8rem;
  letter-spacing: 1px;
}

.header-right button {
  padding: 0.8rem 1.5rem;
  border-radius: 25px;
  border: none;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-join {
  background: rgba(255,255,255,0.9);
  color: var(--primary-color);
}

.btn-hire {
  background: #ff6b6b;
  color: white;
  margin-left: 1rem;
}

/* 主要内容区 */
.main-content {
  max-width:  1648px;
  margin: 2rem auto;
  padding: 0 2rem;
}

/* 筛选区域 */
.filter-box {
  background: var(--card-bg);
  border-radius: 12px;
  padding: 1.5rem;
  box-shadow: 0 4px 6px rgba(0,0,0,0.05);
  margin-bottom: 2rem;
}

.filter-group {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
}

.custom-select {
  padding: 0.8rem;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  background: white;
  min-width: 180px;
  transition: all 0.3s ease;
}

.search-input {
  position: relative;
  flex-grow: 1;
}

.custom-input {
  width: 100%;
  padding: 0.8rem 2.5rem 0.8rem 1rem;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
}

.search-btn {
  position: absolute;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
  background: none;
  border: none;
  cursor: pointer;
  padding: 5px;
}

/* 职位卡片 */
.jobs-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1.5rem;
}

.job-card {
  background: var(--card-bg);
  border-radius: 12px;
  padding: 1.5rem;
  transition: all 0.3s ease;
  box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  position: relative;
}

.job-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0,0,0,0.1);
}

.job-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1rem;
}

.job-title {
  margin: 0;
  color: var(--text-color);
  font-size: 1.1rem;
}

.job-tag {
  background: #e3f2fd;
  color: var(--primary-color);
  padding: 0.3rem 0.8rem;
  border-radius: 20px;
  font-size: 0.9rem;
}

.job-meta {
  margin: 1.2rem 0;
  color: #666;
}

.job-meta p {
  margin: 0.5rem 0;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.detail-btn {
  background: var(--primary-color);
  color: white;
  border: none;
  padding: 0.8rem 1.5rem;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.3s ease;
  width: 100%;
  font-weight: 600;
}

.detail-btn:hover {
  background: #1557b0;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .header-content {
    flex-direction: column;
    gap: 1rem;
  }

  .filter-group {
    flex-direction: column;
  }

  .custom-select, .search-input {
    width: 100%;
  }
}
</style>