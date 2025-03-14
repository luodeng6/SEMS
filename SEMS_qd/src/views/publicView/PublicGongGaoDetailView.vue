<template>
  <div>
    <public-menu2></public-menu2>



    <!-- 公告主体 -->
    <el-card class="!border-none" shadow="never">
      <el-page-header @back="goBack" style="margin-bottom: 100px;" content="详情页面">
      </el-page-header>

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
    <el-backtop :visibility-height="10" ></el-backtop>
  </div>

</template>

<script>
import axios from "axios";
import dayjs from "dayjs";
import PublicMenu2 from "@/components/public/PublicMenu.vue";

export default {
  components: {PublicMenu2},
  data() {
    return {
      detail: {}
    }
  },
  mounted() {
    console.log("获取页面参数：");
    // 获取页面参数：this.$router.push({path: '/dw/jobDetail', query: {id: this.currentJobSelectRow.id}})
    console.log(this.$route.query.id);
    if (this.$route.query.id) {
      this.GGID = this.$route.query.id;
      this.loadMockData();
    } else {
      this.$router.push({path: '/'});
    }
  },
  methods: {
    goBack() {
      this.$router.go(-1)
    },
    formatTime(time) {
      return dayjs(time).format('YYYY-MM-DD HH:mm');
    },
    loadMockData() {
      axios.get(`/dwzpggk/getdwzpggk?YFSFDM=4&YHM=null&QYDM=1&JUSTONE=1&GGID=${this.$route.query.id}`).then(res => {
        if (res.data.result) {
          this.detail = res.data.data[0];
        } else {
          this.$message.error(res.data.msg);
        }
      }).catch(error => {
        console.error('获取公告列表失败,网络错误！', error);
        this.$message.error('获取公告列表失败,网络错误！');

      });

    }
  }
}
</script>

<style  scoped>
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