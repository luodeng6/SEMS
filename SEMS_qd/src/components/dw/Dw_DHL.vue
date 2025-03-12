
<template>
  <header style="background-color: steelblue;" padding="20px;">
    <div class="  mx-auto px-4">
      <div class="flex justify-between items-center h-16" style="margin-bottom: 27px;">
        <!-- 左侧品牌和导航 -->
        <div class="flex items-center space-x-8">
          <!-- 品牌Logo -->
          <div class="flex items-center">
            <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
            </svg>
            <span class="ml-2 text-xl font-bold text-white">账号管理</span>
          </div>

          <!-- 导航菜单 -->
          <nav class="hidden md:flex items-center space-x-6">
            <a href="#" class="text-gray-200 hover:text-white flex items-center transition-colors">
              <i class="el-icon-s-home mr-1"></i>
              首页
            </a>
            <a href="#" class="text-gray-200 hover:text-white flex items-center transition-colors">
              <i class="el-icon-s-management mr-1"></i>
              职位管理
            </a>
            <a href="#" class="text-gray-200 hover:text-white flex items-center transition-colors">
              <i class="el-icon-user mr-1"></i>
              候选人
            </a>
          </nav>
        </div>

        <!-- 右侧功能区域 -->
        <div class="flex items-center space-x-6">
          <!-- 通知按钮 -->
          <button class="text-gray-200 hover:text-white relative">
            <i class="el-icon-bell text-xl"></i>
            <span class="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full"></span>
          </button>

          <!-- 用户头像和下拉菜单 -->
          <el-dropdown trigger="click">
            <div class="flex items-center cursor-pointer">
              <el-avatar
                  :src="IMGURL"
                  class="border-2 border-white"
              ></el-avatar>

              <span class="ml-2 text-gray-200 hover:text-white">{{ UserInfo.name }}</span>
              <i class="el-icon-arrow-down el-icon--right text-gray-200"></i>
            </div>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>
                <i class="el-icon-user mr-2"></i>个人中心
              </el-dropdown-item>
              <el-dropdown-item>
                <i class="el-icon-setting mr-2"></i>账户设置
              </el-dropdown-item>
              <el-dropdown-item divided>
                <i class="el-icon-switch-button mr-2"></i>退出登录
              </el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>

          <!-- 发布按钮 -->
          <el-button
              type="text"
              icon="el-icon-plus">
            发布职位
          </el-button>
        </div>
      </div>
    </div>
  </header>
</template>
<script  >
  import axios   from "axios";
  import { ServerIP } from "@/SystemConfig";
  import {EventBus} from "@/event-bus";
  export default {
    name: 'DwDHL',
    data() {
      return {
        // 用户信息
        UserInfo: {
          id: '',
          name: '',
          role: '',
          username: '',
        },
        IMGURL: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',

      }
    },
    mounted() {
      this.getLoginUserInfo();
    } ,
    methods: {
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
            console.log(this.UserInfo);
            this.loadData(this.UserInfo.username);
          }
        }).catch(error => {
          EventBus.$emit('show-auth-popup');
          console.error('获取用户信息失败,网络错误！', error);
          setTimeout(() => {
            this.$router.push({name: 'DwLoginView'});
          }, 1000);
        });
      },
      // 获取单位用户管理数据
      loadData(yhm) {
        axios.get(`/dwyhk/getDwyhkAndDwDataAndPostCountByYhm?yhm=${yhm}`).then(res => {
          if (res.data.result) {
            this.imageUrl=ServerIP+ res.data.data.YHZP;
            this.IMGURL=ServerIP+ res.data.data.YHZP;
          } else if (res.data.code === 504) {
            this.$message.error("数据冗余，系统错误，请联系管理员:" + res.data.msg);
          } else {
            this.$message.error("获取数据失败：" + res.data.msg);
          }
        }).catch(err => {
          console.log(err);
          this.$message.error("获取数据失败：" + err.message);
        });
      },
    }
  }
</script>
<style scoped>

</style>