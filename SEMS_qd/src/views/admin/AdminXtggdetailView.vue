<template>
  <div class="content">
    <div>
      <admin-menu></admin-menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
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
          <h1 class="text-3xl font-bold text-gray-800 mb-2">{{ detail.GGBT }}</h1>
          <div class="flex items-center text-sm text-gray-500 space-x-4">
            <span>发布者：{{ detail.FBZ }}</span>
            <span>发布时间：{{ formatTime(detail.CJSJ) }}</span>
            <el-tag size="mini" type="info">浏览 {{ detail.LLL }}</el-tag>
          </div>
        </div>

        <!-- 内容区 -->
        <article class="prose max-w-none gg-content">
          <div v-if="detail.GGNRHTML" v-html="detail.GGNRHTML"></div>
          <pre v-else class="whitespace-pre-wrap">{{ detail.GGNR }}</pre>
        </article>

        <!-- 元信息 -->
        <div class="mt-8 pt-4 border-t text-sm text-gray-500">
          <p>发布者身份代码：{{ detail.FBZSFDM }}</p>
          <p>启用代码：{{ detail.QYDM }}</p>
        </div>
      </el-card>
    </main>
  </div>
</template>

<script>
import dayjs from 'dayjs';
import axios from "axios";
import {EventBus} from "@/event-bus";
import AdminMenu from "@/components/admin/Admin_menu.vue";

export default {
  name: 'DwZpgkDetail',
  components: {AdminMenu },
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
      GGID: null,
    };
  },
  created() {
    this.loading=true;
    console.log("获取页面参数：");
    // 获取页面参数：this.$router.push({path: '/dw/jobDetail', query: {id: this.currentJobSelectRow.id}})
    console.log(this.$route.query.id);
    if (this.$route.query.id) {
      this.GGID = this.$route.query.id;
      this.getLoginUserInfo();
    } else {
      this.$router.push({path: '/dw/zpgggl'});
    }

  },
  methods: {
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
    formatTime(time) {
      return dayjs(time).format('YYYY-MM-DD HH:mm');
    },
    loadMockData() {
      axios.get(`/xtggk/getXtggk?QYDM=-1&JUSTONE=1&GGID=${this.$route.query.id}`).then(res => {
        if (res.data.result) {
          this.detail = res.data.data[0];
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

      // 模拟数据加载
      /* setTimeout(() => {
         this.detail = {
           ID: 1,
           GGBT: '2023年校园招聘公告',
           GGNRHTML: ``,
           CJSJ: '2023-08-01 14:30:00',
           LLL: 1234,
           FBZ: '人力资源部',
           FBZSFDM: 'RS-2023',
           QYDM: 'ACTIVE'
         };
         this.loading = false;
       }, 500);*/
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
  width: 1024px !important;
  margin: 0 auto;
}

.p-6 {
  padding: 2px !important;
}
</style>