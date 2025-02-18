<template>
  <div>
    <!-- 头部 -->


    <!-- 导航栏菜单 -->
    <nav class="bg-dark text-white mb-4">
      <div class="container mx-auto">
        <div class="flex justify-between items-center py-3">
          <a class="text-white text-lg font-semibold" href="#">首页</a>
          <div :class="{'hidden': !isNavbarOpen, 'block': isNavbarOpen}" class="md:flex md:items-center md:justify-end">
            <ul class="flex flex-col md:flex-row md:space-x-4">

              <li><a class="text-white hover:bg-gray-700 px-3 py-2 rounded" href="#">我是学生</a></li>
              <li><a class="text-white hover:bg-gray-700 px-3 py-2 rounded" href="#">我是企业</a></li>

              <router-link to="/Login">
                <li><a class="text-white hover:bg-gray-700 px-3 py-2 rounded" >我是管理员</a></li>
              </router-link>

              <li><a class="text-white hover:bg-gray-700 px-3 py-2 rounded" href="就业指导.html">就业指导</a></li>
              <li><a class="text-white hover:bg-gray-700 px-3 py-2 rounded" href="#">公示栏</a></li>

              <li><a class="text-white hover:bg-gray-700 px-3 py-2 rounded" href="#">新闻公告</a></li>

            </ul>
          </div>
        </div>

      </div>
    </nav>
  </div>
</template>

<script>
export default {
  name: "publicMenu",
  data() {
    return {
      isNavbarOpen: false,
      dropdownOpen: false,
    };
  },
  methods: {
    toggleNavbar() {
      this.isNavbarOpen = !this.isNavbarOpen;
    },
    toggleDropdown() {
      this.dropdownOpen = !this.dropdownOpen;
    },
  },
}
</script>

<style scoped>
/* 自定义奶白色背景 */
.bg-cream {
  background-color: #f5f5dc; /* 奶白色 */
}
</style>
