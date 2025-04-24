<template>
  <div class="content">
    <div>
   <student-menu></student-menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">

      <stu_-d-h-l></stu_-d-h-l>
      <!-- 返回按钮 -->
      <el-button
          class="mb-4"
          icon="el-icon-arrow-left"
          type="text"
          @click="$router.go(-1)"
      >返回列表
      </el-button>
      <el-button
          class="mb-4"
          icon="el-icon-arrow-left"
          type="text"
          plain
          v-show="index > 0"
          @click="index--"
      >
        上一篇
      </el-button>

      <el-button
          class="mb-4"
          icon="el-icon-arrow-right"
          type="text"
          v-show="index < ZpjzList.length - 1"
          plain
          @click="index++"
      >
        下一篇
      </el-button>

      <!-- 公告主体 -->
      <el-card class="!border-none  " shadow="never">
        <!-- 标题区 -->
        <div class="border-b pb-4 mb-6">
          <h1 class="text-3xl font-bold text-gray-800 mb-2">{{ ZpjzList[index].GSMC }}-{{ ZpjzList[index].DWMC }} -招聘简章-{{index+1}}</h1>
          <div class="flex items-center text-sm text-gray-500 space-x-4">
            <span>创建者：{{ ZpjzList[index].CJZMC }}</span>
            <span>创建时间：{{ formatTime(ZpjzList[index].CJSJ) }}</span>
            <el-tag size="mini" type="info">浏览 "暂无"</el-tag>
          </div>
        </div>

        <!-- 内容区 -->
        <article class="prose max-w-none gg-content">
          <div v-if="ZpjzList[index].HTML" v-html="ZpjzList[index].HTML"></div>
        </article>

        <!-- 元信息 -->
        <div class="mt-8 pt-4 border-t text-sm text-gray-500">
          <p>发布者身份代码：{{ ZpjzList[index].GSMC }}</p>
          <p>启用代码：{{ ZpjzList[index].FBBZ }}</p>
        </div>
      </el-card>
    </main>
  </div>
</template>

<script>

import dayjs from 'dayjs';
import Stu_DHL from "@/components/student/Stu_DHL.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";
import StudentMenu from "@/components/student/Student_menu.vue";

export default {
  name: 'DwZpjzDetail',
  components: {StudentMenu, Stu_DHL},
  data() {
    return {// 用户信息
      index: 0,
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      ZpjzList: null,
      loading: true,
      DWDM: null,
    };
  },
  created() {
    this.loading = true;
    console.log("获取页面参数：");
    // 获取页面参数：this.$router.push({path: '/dw/jobDetail', query: {id: this.currentJobSelectRow.id}})
    console.log(this.$route.query.dwdm);
    if (this.$route.query.dwdm) {
      this.DWDM = this.$route.query.dwdm;
      this.getLoginUserInfo();
    } else {
      this.$router.push({path: '/dw/zpjz'});
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
      axios.get("/datazpjzk/getZpjzk", {
        params: {
          fbbz: 2,
          isjustone: 0,
          zpjzid: -1,
          isjustoneyh: 0,
          yhm: '-1',
          yhsfdm: -1,
          isjustonedw: 1,
          dwdm: this.DWDM,
        }
      }).then(response => {
        if (response.data.result) {
          if (response.data.data.length > 0) {
            this.ZpjzList = response.data.data;

            this.$confirm(
                '<div style="font-size:15px;color:#606266;">该单位已有多个 <strong style="color:#409EFF;">已发布</strong> 的招聘简章。</div>' +
                '<div style="margin-top:10px;">是否仍要继续操作？</div>',
                '小提示',
                {
                  dangerouslyUseHTMLString: true,
                  confirmButtonText: '继续',
                  cancelButtonText: '取消',
                  type: 'info',  // info 类型是淡蓝色，表示普通信息
                  center: true,
                  roundButton: true,
                }
            ).then(() => {

            }).catch(() => {
              this.$message.info('已取消操作');
            });
          }
        } else {
          this.$message.error("获取招聘简章数据失败！");
        }
      }).catch(error => {
        console.error(error);
        this.$message.error("获取招聘简章数据失败！");
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
  width: 1024px !important;
  margin: 0 auto;
}

.p-6 {
  padding: 2px !important;
}
</style>