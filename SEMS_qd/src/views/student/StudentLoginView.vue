<template>
  <div>
    <transition name="el-zoom-in-center">
      <div class="flex items-center justify-end h-screen login" v-show="isShow"
           :style="{ backgroundImage: 'url(' + currentBackground + ')' }">
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
import {EventBus} from "@/event-bus";
import {ServerIP} from "@/SystemConfig";

export default {
  name: 'StudentLoginView',
  data() {
    return {
      Alt: {
        isShowArl: false,
        AltMSG: '',
        AltType: 'error'
      },

      form: {
        username: '',
        password: ''
      },
      isShow: false,
      username: '',
      password: '',
      backgrounds: [
        ServerIP + '/img.png',
        // 'http://localhost:83/img_1.png',
        ServerIP + '/1.png',
        'https://s.qkmov.cc/files/202412201639744.webp',
        'http://172.18.2.104:18040/static/img/002.54397cf9.png',
        'http://172.18.2.104:18040/static/img/003.6ab30b51.png'
      ],
      currentBackgroundIndex: 0,
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
          console.log(response.data)
          if (response.data.result === 1 || response.data.result) {
            console.log('登录成功')
            await this.loginState(response.data.Msg, '登录成功')
            // 登录成功，重定向到管理页面
            await this.$router.push({name: 'StudentIndexView'});
          } else {
            console.log('登录失败')
            this.loginState(false, response.data.Msg);
          }
        } catch (error) {
          this.errorMessage = '网络错误，请稍后再试'; // 通用错误消息
          console.error(error);
          this.visible = true; // 显示登录失败弹窗
        }
      }
    }
    ,
    loginState(isLoginSuccess, msg) {
      this.Alt.AltMSG = msg;
      if (isLoginSuccess) {
        this.Alt.AltType = 'success';
      } else {
        this.Alt.AltType = 'error';
      }
      this.Alt.isShowArl = true;
      setTimeout(() => {
        this.Alt.isShowArl = false;
        //this.$router.push({ name: 'StudentHome' });
      }, 3000);
    }
  },
  mounted() {

    // 读取当前服务器地址
    console.log("当前服务器地址：" + ServerIP);

    this.isShow = true;
    setInterval(() => {
      this.currentBackgroundIndex = (this.currentBackgroundIndex + 1) % this.backgrounds.length;
    }, 5000); // 每5秒切换一次背景
  }
  ,
  computed: {
    currentBackground() {
      return this.backgrounds[this.currentBackgroundIndex];
    }
  }
}

</script>

<style scoped>
.login {
  background-size: cover;
  background-position: center;
  transition: background-image 1s ease-in-out; /* 添加过渡效果 */
}

.login-form {
  position: relative;
  right: 150px;
  width: 350px;
  opacity: 0.9;
  backdrop-filter: blur(10px); /* 背景模糊效果 */
}

input {
  transition: border-color 0.3s;
}

input {
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
  transform: translateY(-50%); /* 使图标垂直居中 */
  pointer-events: none; /* 禁止图标的鼠标事件 */
}
</style>

<!-- 在你的 HTML 文件中引入 Font Awesome -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> -->