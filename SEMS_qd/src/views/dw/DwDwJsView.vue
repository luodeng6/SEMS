<template>
  <div class="content">
    <div>
      <DwMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">

      <dw-d-h-l></dw-d-h-l>
      <!-- 返回按钮 -->
      <el-button
          class="mb-4"
          icon="el-icon-arrow-left"
          type="text"
          @click="$router.go(-1)"
      >返回列表
      </el-button>

      <!-- 公告主体 -->
      <el-card class="!border-none  " shadow="never">
        <!-- 标题区 -->
        <div class="border-b pb-4 mb-6">
          <h1 class="text-3xl font-bold text-gray-800 mb-2">{{ detail.gsmc }}</h1>
          <div class="flex items-center text-sm text-gray-500 space-x-4">
            <span>发布者：{{ UserInfo.name }}</span>
            <span>单位规模：{{ detail.dwgm }}</span>
            <el-tag size="mini" type="info">单位性质 {{ detail.dwxz }}</el-tag>
            <el-button icon="el-icon-zoom-in" type="text" size="mini" @click="addViewLarge">增大视图</el-button>
            <el-button icon="el-icon-zoom-out" type="text" size="mini" @click="addViewSmall">缩小视图</el-button>
          </div>
        </div>

        <!-- 内容区 -->
        <article class="prose max-w-none gg-content">
          <div v-if="detail.gsjjhtml" v-html="detail.gsjjhtml"></div>
          <pre v-else class="whitespace-pre-wrap">{{ detail.dwmc }}</pre>
        </article>

        <!-- 元信息 -->
        <!--        <div class="mt-8 pt-4 border-t text-sm text-gray-500">
                  <p>发布者身份代码：{{ detail.FBZSFDM }}</p>
                  <p>启用代码：{{ detail.QYDM }}</p>
                </div>-->
      </el-card>
    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";
import dayjs from 'dayjs';
import axios from "axios";
import {EventBus} from "@/event-bus";
import DwDHL from "@/components/dw/Dw_DHL.vue";
// 单位介绍展示
export default {
  name: 'DwDwJsView',
  components: {DwDHL, DwMenu},
  data() {
    return {// 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },

      detail: null,
      loading: true,
    };
  },
  created() {
    this.getLoginUserInfo();
  },
  methods: {
    addViewSmall(){
      // 获取 el-card 元素
      const card = document.querySelector('.el-card');
      // 获取当前宽度并转换为数字（去掉单位）
      const currentWidth = parseInt(window.getComputedStyle(card).width, 10);
      // 减少 100 像素
      const newWidth = currentWidth - 100;
      // 设置新的宽度，记得加上单位
      card.style.width = newWidth + 'px';
    },
    addViewLarge(){
      // 获取 el-card 元素
      const card = document.querySelector('.el-card');
      // 获取当前宽度并转换为数字（去掉单位）
      const currentWidth = parseInt(window.getComputedStyle(card).width, 10);
      // 增加 100 像素
      const newWidth = currentWidth + 100;
      // 设置新的宽度，记得加上单位
      card.style.width = newWidth + 'px';
    },

    async getLoginUserInfo() {
      try {
        const response = await axios.get('/user/checkSession');
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
          this.loadMockData();
        }
      } catch (error) {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      }
    },

    loadMockData() {
      axios.get(`/dw/getDwDataByDwUserName?dwUserName=${this.UserInfo.username}`).then(res => {
        if (res.data.result) {
          this.detail = res.data.data;
          this.loading = false;
        } else {
          this.$message.error(res.data.msg);
          this.loading = false;
        }
      }).catch(error => {
        console.error('获取公告列表失败,网络错误！', error);
        this.$message.error('获取公告列表失败,网络错误！');
        this.loading = false;
      });

    }
  }
};
</script>

<style scoped>
.gg-content ::v-deep {
  line-height: 1.8;
  color: #4a5568;
}

.gg-content ::v-deep h2 {
  @apply text-2xl font-semibold mb-4 mt-6 text-gray-800;
}

.gg-content ::v-deep h3 {
  @apply text-lg font-medium mb-2 text-gray-700;
}

.gg-content ::v-deep ul {
  @apply list-disc pl-6 mb-4;
}

.gg-content ::v-deep table {
  @apply w-full my-4 border-collapse;
}

.gg-content ::v-deep th {
  @apply bg-gray-100 font-medium p-3 border;
}

.gg-content ::v-deep td {
  @apply p-3 border text-gray-700;
}

.gg-content ::v-deep img {
  @apply rounded-lg my-4 shadow-md;
}

.el-card {
  width: 1024px ;
  margin: 0 auto;
}

.p-6 {
  padding: 2px !important;
}
</style>