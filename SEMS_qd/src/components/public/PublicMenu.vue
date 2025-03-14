

<template>
  <!-- 顶部导航 -->
  <header class="main-header">
    <div class="header-content container">
      <div class="university-brand">
        <img class="logo" src="@/assets/logo.png">
        <div class="brand-text">
          <h1>广西中医药大学就业平台</h1>
          <p>Career Development Center</p>
        </div>
      </div>
      <nav class="header-nav">
        <router-link to="/">
          <el-link :underline="false" class="nav-item">首页</el-link>
        </router-link>

        <el-link :underline="false" class="nav-item">招聘会</el-link>
        <el-link :underline="false" class="nav-item">就业指导</el-link>
        <el-link :underline="false" class="nav-item">政策法规</el-link>
      </nav>
    </div>
  </header>
</template>

<script>
export default {
  name: "PublicMenu2"
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
</style>