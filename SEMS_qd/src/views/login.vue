<template>
  <div class="bg-gradient-to-r from-green-400 to-blue-500 min-h-screen flex items-center justify-center p-4">
    <div class="container mx-auto flex flex-wrap items-center">
      <div class="w-full md:w-1/2 text-center text-white mb-8 md:mb-0">
        <h1 class="text-4xl font-bold mb-4 float-animation">高校 "互联网+精准就业"平台</h1>
        <p class="text-xl mb-2">覆盖：20+省份600+高校</p>
        <p class="text-xl mb-2">服务700万+毕业生</p>
        <p class="text-xl mb-2">80万+单位入驻</p>
        <p class="text-2xl font-semibold mt-4">服务应届生 职业一生</p>
      </div>
      <div class="w-full md:w-1/2">
        <div class="bg-white bg-opacity-90 rounded-3xl shadow-xl p-8 max-w-md mx-auto">
          <h3 class="text-2xl font-bold text-center mb-6">管理员用户登录 <span
              class="text-red-500 text-sm">(建议您使用谷歌浏览器)</span></h3>
          <form @submit.prevent="login">
            <div class="mb-4">
              <input v-model="username" type="text"
                     class="w-full px-4 py-2 rounded-full border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
                     placeholder="用户名（手机号）" required>
            </div>
            <div class="mb-4">
              <input v-model="password" type="password"
                     class="w-full px-4 py-2 rounded-full border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
                     placeholder="密码">
            </div>
            <div class="mb-4 flex">
              <input type="text" v-model="captcha"
                     class="w-2/3 px-4 py-2 rounded-full border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
                     placeholder="验证码">
              <img :src="captchaImage" alt="验证码" class="w-1/3 h-10 ml-2 rounded" @click="refreshCaptcha">
            </div>
            <div class="mb-4 flex items-center">
              <input type="checkbox" id="rememberMe" class="mr-2">
              <label for="rememberMe" class="text-sm text-gray-600">记住登录账号</label>
            </div>
            <button type="submit"
                    class="w-full bg-blue-500 text-white py-2 rounded-full hover:bg-blue-600 transition duration-300 mb-2">
              登录
            </button>
<!--            <router-link to="/register">
              <button type="button"
                      class="w-full bg-green-500 text-white py-2 rounded-full hover:bg-green-600 transition duration-300 mb-4">
                注册
              </button>
            </router-link>-->
            <div class="text-center mb-4">
              <a href="#" class="text-red-500 hover:underline">忘记登录密码?</a>
            </div>
            <div class="flex justify-center space-x-4">
              <router-link to="/">
              <button type="button"
                      class="flex items-center bg-blue-600 text-white py-2 px-4 rounded-full hover:bg-blue-700 transition duration-300">
                <img src=" " class="mr-2"> 返回首页
              </button>
              </router-link>
                <button type="button"
                        class="flex items-center bg-green-600 text-white py-2 px-4 rounded-full hover:bg-green-700 transition duration-300">
<!--                  <img src=" " class="mr-2">--> 微信登录
                </button>

            </div>
          </form>
          <div v-if="errorMessage" class="text-red-500 text-center mt-4">{{ errorMessage }}</div>
        </div>
      </div>
    </div>
    <div v-if="visible" class="popup-overlay" @click="visible = false">
      <div class="popup" @click.stop> <!-- 阻止点击事件向上传递 -->
        <h2 class="popup-title">登录失败</h2>
        <p class="popup-message">{{ errorMessage }}</p>
        <button class="popup-button" @click="visible = false">关闭</button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'Login',
  data() {
    return {
      username: '',
      password: '',
      captcha: '',
      captchaImage: '/api/captcha', // 示例验证码的 API 地址

      visible: false, // 登录失败弹窗
      errorMessage: '密码错误，请重新输入',
    }
  },
  mounted() {
    this.refreshCaptcha(); // 首次加载时刷新验证码
  },
  methods: {
    // 登录方法
    async login() {
      this.errorMessage = ''; // 重置错误消息
      const DataForm = new FormData();
      DataForm.append('username', this.username);
      DataForm.append('password', this.password);
      // DataForm.append('captcha', this.captcha); // 添加验证码

      try {
        const response = await axios.post('/user/login', DataForm);
        console.log(response.data)
        if (response.data.result) {
          console.log('登录成功')
          /*  // 登录成功，保存登录状态到 sessionStorage
            sessionStorage.setItem("isLogin", "true")
            // 登录成功，更新用户信息到 store
            this.$store.commit('updateUser', {
              username: this.username,
              name: "暂无",
              age: 20,
            });*/
          // 登录成功，重定向到管理页面
          await this.$router.push({name: 'AdminIndex'});
        } else {
          // 登录失败，显示错误信息
          this.errorMessage = response.data.message || '登录失败，请检查用户名和密码';
          // this.refreshCaptcha(); // 登录失败后刷新验证码
          this.visible = true; // 显示登录失败弹窗
        }
      } catch (error) {
        this.errorMessage = '网络错误，请稍后再试'; // 通用错误消息
        console.error(error);
        this.visible = true; // 显示登录失败弹窗
      }
    },
    // 刷新验证码
    refreshCaptcha() {
      this.captchaImage = `/api/captcha?${new Date().getTime()}`; // 添加时间戳以防止缓存
    }
  }
}
</script>

<style scoped>
@keyframes float {
  0% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-20px);
  }
  100% {
    transform: translateY(0px);
  }
}

.float-animation {
  animation: float 6s ease-in-out infinite;
}
</style>
