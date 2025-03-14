<template>
  <div class="relative h-screen overflow-hidden">
    <!-- 动态背景，根据 backgroundMode 判断使用视频还是图片 -->
    <template v-if="backgroundMode === 'video'">
      <video class="absolute top-0 left-0 w-full h-full object-cover"
             autoplay loop muted playsinline>
        <source :src="videoUrl" type="video/mp4" />
        您的浏览器不支持视频播放。
      </video>
    </template>
    <template v-else>
      <div class="absolute top-0 left-0 w-full h-full object-cover bg-no-repeat bg-cover"
           :style="{ backgroundImage: 'url(' + currentBackground + ')' }"></div>
    </template>

    <!-- 登录表单 -->
    <transition name="el-zoom-in-center">
      <div class="relative flex items-center justify-end h-screen login" v-show="isShow">
        <div class="bg-white bg-opacity-80 rounded-lg shadow-lg p-8 max-w-md mr-0 login-form">
          <h1 class="text-2xl font-bold text-center mb-4">Good Afternoon!</h1>
          <p class="text-center mb-6">一天的工作保持好心情哦~</p>

          <el-form ref="loginForm" :model="form" label-width="100px">
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700" for="username">请输入您的账号</label>
              <div class="relative">
                <input type="text" v-model="form.username"
                       class="mt-1 block w-full border border-gray-300 rounded-md p-2 pl-10" placeholder="账号">
                <span class="absolute left-3 top-2 text-gray-500"><i class="fas fa-user"></i></span>
              </div>
            </div>
            <div class="mb-4">
              <label class="block text-sm font-medium text-gray-700" for="password">请输入您的密码</label>
              <div class="relative">
                <input type="password" v-model="form.password"
                       class="mt-1 block w-full border border-gray-300 rounded-md p-2 pl-10" placeholder="密码">
                <span class="absolute left-3 top-2 text-gray-500"><i class="fas fa-lock"></i></span>
              </div>
            </div>
            <el-alert v-show="Alt.isShowArl"
                      :title="Alt.AltMSG"
                      :type="Alt.AltType"
                      effect="dark">
            </el-alert>
            <br>
            <button @click="handleLogin"
                    class="w-full bg-blue-600 text-white font-bold py-2 rounded-md hover:bg-blue-700 transition duration-200">
              登录
            </button>
          </el-form>
          <p class="text-center text-sm mt-4">本系统建议使用最新的Chrome浏览器</p>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
import axios from 'axios'
import { EventBus } from "@/event-bus";
import { ServerIP } from "@/SystemConfig";

export default {
  name: 'StudentLoginView',
  data() {
    return {
      // 可选 "image" 或 "video" 来动态切换背景类型
      backgroundMode: 'video',
      videoUrl: ServerIP + '/video/backgrond.mp4',
      backgrounds: [
        ServerIP + '/img.png',
        // 可加入更多图片地址
      ],
      currentBackgroundIndex: 0,
      Alt: {
        isShowArl: false,
        AltMSG: '',
        AltType: 'error'
      },
      form: {
        username: '',
        password: ''
      },
      isShow: false
    }
  },
  computed: {
    currentBackground() {
      return this.backgrounds[this.currentBackgroundIndex];
    }
  },
  methods: {
    async handleLogin() {
      // 登录逻辑
      if (this.form.username === "") {
        this.loginState(false, '请输入账号');
      } else {
        try {
          const DataForm = new FormData();
          DataForm.append('username', this.form.username);
          DataForm.append('password', this.form.password);

          const response = await axios.post('/user/StuLogin', DataForm);
          console.log(response.data);
          if (response.data.result === 1 || response.data.result) {
            console.log('登录成功');
            await this.loginState(response.data.Msg, '登录成功');
            // 登录成功，重定向到管理页面
            await this.$router.push({name: 'StudentIndexView', params: {from:'login'}});
          } else {
            console.log('登录失败');
            this.loginState(false, response.data.Msg);
          }
        } catch (error) {
          this.errorMessage = '网络错误，请稍后再试';
          console.error(error);
          this.visible = true;
        }
      }
    },
    loginState(isLoginSuccess, msg) {
      this.Alt.AltMSG = msg;
      this.Alt.AltType = isLoginSuccess ? 'success' : 'error';
      this.Alt.isShowArl = true;
      setTimeout(() => {
        this.Alt.isShowArl = false;
      }, 3000);
    }
  },
  mounted() {
    console.log("当前服务器地址：" + ServerIP);
    this.isShow = true;
    if (this.backgroundMode === 'image') {
      setInterval(() => {
        this.currentBackgroundIndex = (this.currentBackgroundIndex + 1) % this.backgrounds.length;
      }, 5000); // 每5秒切换一次背景图片
    }
  }
}
</script>

<style scoped>
/* 针对背景部分无需额外样式，背景视频或图片已使用绝对定位 */
.login {
  /* 登录区域的背景已移除，由背景视频或图片提供 */
}

/* 登录表单样式 */
.login-form {
  position: relative;
  right: 150px;
  width: 350px;
  opacity: 0.9;
  backdrop-filter: blur(10px); /* 背景模糊效果 */
}

input {
  transition: border-color 0.3s;
  padding-left: 30px !important; /* 修复 input 高度 */
}

input:focus {
  border-color: #cd1b1b; /* 聚焦时边框颜色 */
  outline: none; /* 去掉默认的聚焦轮廓 */
}

button {
  transition: background-color 0.3s;
}

button:hover {
  background-color: #2563eb; /* 悬停时按钮颜色 */
}

/* 图标样式 */
.relative {
  position: relative;
}

.relative span {
  position: absolute;
  left: 10px; /* 图标距离左边的距离 */
  top: 50%; /* 垂直居中 */
  transform: translateY(-50%);
  pointer-events: none; /* 禁止图标的鼠标事件 */
}
</style>
