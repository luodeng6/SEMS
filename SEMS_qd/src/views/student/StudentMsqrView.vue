<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">

      <div>
        <div class="header animated-header">
          <div class="user-info">
            <div class="user-dropdown">

              <el-badge :value="12" class="item" style="margin-right: 20px;">
                <el-button plain size="small">待处理面试</el-button>
              </el-badge>
              <el-badge class="item" is-dot style="margin-right: 20px;color: #0d0d0d;">新消息</el-badge>
              <el-badge class="item" is-dot style="margin-right: 20px;">
                <el-button class="share-button" icon="el-icon-share" type="primary"></el-button>
              </el-badge>


              <img alt="用户头像" class="avatar animated-avatar" src="@/assets/avatar.png"/>
              <span class="text-dark"> 用户: {{ UserInfo.name }}</span>
              <el-dropdown style="margin-left: 10px;" trigger="click">
              <span class="el-dropdown-link text-dark">点我查看<i
                  class="el-icon-caret-bottom el-icon--right"></i></span>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item class="clearfix">评论
                    <el-badge :value="12" class="mark"/>
                  </el-dropdown-item>
                  <el-dropdown-item class="clearfix">回复
                    <el-badge :value="3" class="mark"/>
                  </el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
            </div>
          </div>
        </div>

        <div>
          <!-- 数据统计 -->
          <div class="grid grid-cols-3 gap-4 mb-6">
            <el-card shadow="never">
              <div class="p-4">
                <div class="text-sm text-gray-600 mb-2">待确认面试</div>
                <div class="text-3xl font-bold text-blue-600">{{ interviewList.filter(item=>item.QRDM===0 && item.QYDM===1).length }}</div>
              </div>
            </el-card>
            <el-card class="bg-green-40" shadow="never">
              <div class="p-4">
                <div class="text-sm text-gray-600 mb-2">已确认面试</div>
                <div class="text-3xl font-bold text-green-600">{{ interviewList.filter(item=>item.QRDM===1 && item.QYDM===1).length }}</div>
              </div>
            </el-card>
            <el-card class="bg-green-50" shadow="never">
              <div class="p-4">
                <div class="text-sm text-gray-600 mb-2">已面试</div>
                <div class="text-3xl font-bold text-green-600">{{ interviewList.filter(item=>item.QRDM===1 && item.QYDM===1 && item.MSZT>=3).length }}</div>
              </div>
            </el-card>
          </div>

          <!-- 面试列表 -->
          <el-card class="shadow-sm">
            <div class="p-4">
              <div v-for="(item, index) in paginatedData" :key="index"
                   class="mb-4 pb-4 border-b last:border-0 hover:bg-gray-50 transition-colors">
                <div class="flex items-start justify-between">
                  <!-- 左侧信息 -->
                  <div class="flex items-start flex-1">
                    <!-- Logo展示 -->
                    <div class="mr-4 flex-shrink-0">
                      <img
                          :src="item.LOGO"
                          alt="公司logo"
                          class="w-16 h-16 rounded-lg border object-cover bg-white p-1"
                          @error="handleLogoError">
                    </div>


                    <!-- 公司信息 -->
                    <div class="flex-1">
                      <div class="flex items-baseline mb-1">
                        <h3 class="text-lg font-semibold text-gray-800 mr-3">{{ item.GSMC }}</h3>
                        <el-tag
                            :type="getMsStatus(item).type"
                            class="!font-medium"
                            effect="light"
                            size="mini">
                          {{ getMsStatus(item).text }}
                        </el-tag>
                      </div>
                      <p class="text-sm text-gray-600 mb-2">{{ item.GWMC }}</p>
                      <div class="space-y-1">
                        <div class="text-sm text-gray-500 flex items-center">
                          <i class="el-icon-time mr-1 text-gray-400"></i>
                          <span>{{ formatDate(item.MSSJ) }}</span>
                        </div>
                        <div class="text-sm text-gray-500 flex items-center">
                          <i class="el-icon-location-outline mr-1 text-gray-400"></i>
                          <span>{{ item.MSDD }}</span>
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- 操作按钮 -->
                  <div class="flex flex-col gap-2 ml-4 min-w-[120px]">
                    <el-button
                        class="w-full"
                        size="small"
                        type="success"
                        v-show="item.QRDM === 0"
                        @click="handleConfirm(item)">
                      确认参加
                    </el-button>
                    <el-button
                        class="w-full"
                        size="small"
                        type="danger"
                        @click="handleCancel(item)">
                      取消参加
                    </el-button>
                  </div>
                </div>
              </div>

              <!-- 分页 -->
              <div class="mt-6 flex justify-end">
                <el-pagination
                    :page-size="pageSize"
                    :total="interviewList.length"
                    background
                    layout="prev, pager, next"
                    @current-change="handlePageChange">
                </el-pagination>
              </div>
            </div>
          </el-card>
        </div>
      </div>


    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import axios from "axios";

export default {
  name: 'StudentMsqrView',
  components: {StudentMenu},
  data() {
    return {
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      stats: {
        pending: 3,
        confirmed: 2
      },
      // 确认代码为0，qydm为1 就是待确认
      statusConfig: {
        pending: {type: 'warning', text: '待确认'},
        confirmed: {type: 'success', text: '已确认'},
        canceled: {type: 'info', text: '已取消'}
      },
      interviewList: [],
      currentPage: 1,
      pageSize: 5
    };
  },
  computed: {
    paginatedData() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.interviewList.slice(start, end);
    }
  },
  created() {
    this.getLoginUserInfo();
  },
  methods: {
    formatDate(dateStr) {
      return dateStr ? new Date(dateStr).toLocaleString() : '-'
    },
    getMsStatus(row) {
      if (row.QYDM===0){
        console.log("已取消");
        return this.statusConfig['canceled']; // 已取消
      }else if (row.QRDM===1){
        console.log("已确认");
        return this.statusConfig['confirmed']; // 已确认
      }else if (row.QRDM===0&&row.QYDM===1){
        console.log("待确认");
        return this.statusConfig['pending'];// 待确认
      }else{
      console.log("未知状态");}
    },
    getLoginUserInfo() {
      axios.get('/user/checkSession').then(response => {
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
          // 获取待确认面试列表
       //   this.getWaitConfirmInterviews();
          this.getInterviews();
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      });
    },
    // 获取待确认面试列表
    getWaitConfirmInterviews() {
      axios.get("/msdmk/getWaitConfirmApms?yhm=" + this.UserInfo.username).then(response => {
        if (response.data.result) {
          this.interviewList = response.data.data;
          console.log("获取待确认面试列表成功！");
          console.log(this.interviewList)
        } else {
          console.log("获取待确认面试列表失败！");
          this.$message.error("获取面试数据失败:" + response.data.msg);
        }
      }).catch(error => {
        console.error("获取待确认面试列表失败！", error);
        this.$message.error("获取面试数据失败：" + error.message);
      });

    },
    // 新方法获取面试列表
    getInterviews() {
      axios.get("/msdmk/getInterviewsMainIdea?Type=3&yhm=" + this.UserInfo.username).then(response => {
        if (response.data.result) {
          this.interviewList = response.data.data;
          console.log(this.interviewList);
        } else {
          this.$message.error("获取面试数据失败:" + response.data.msg);
        }
      }).catch(error => {
        console.error("获取面试列表失败！", error);
        this.$message.error("获取面试数据失败：" + error.message);
      });
    },
    handlePageChange(page) {
      this.currentPage = page;
    },
    handleConfirm(item) {
      // 展示面试信息
      console.log(item);
      let dataForm = new FormData();
      dataForm.append("qrdm", 1);
      dataForm.append("msdm", item.MSDM);


      this.$confirm('确认参加本次面试吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        item.status = 'confirmed';
        axios.post("/msdmk/confirmInterview", dataForm).then((response) => {
          if (response.data.result) {
            this.$message.success("确认成功！");
            this.updateStats();
          } else {
            this.$message.error("确认失败:" + response.data.msg);
          }
        }).catch((error) => {
          console.error("确认面试失败！", error);
          this.$message.error("确认面试失败：" + error.message);
        });
      }).catch(() => {
         this.$message.info('已取消');
      });
    },
    handleCancel(item) {
      this.$confirm('确认取消参加本次面试吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        item.status = 'canceled';
        this.updateStats();
        this.$message.success('已取消！');
      });
    }
    ,
    updateStats() {
      this.stats.pending = this.interviewList.filter(
          item => item.status === 'pending'
      ).length;
      this.stats.confirmed = this.interviewList.filter(
          item => item.status === 'confirmed'
      ).length;
    }
    ,
    handleLogoError(e) {
      const defaultLogo = 'https://cube.elemecdn.com/e/fd/0fb7e36a8a4e4d8a58b3a5b7d30fjpeg.jpeg';
      if (e.target.src !== defaultLogo) {
        e.target.src = defaultLogo;
      }
    }
  }
};
</script>

<style scoped>
.el-card {
  border-radius: 8px;
  transition: box-shadow 0.3s;
}

.el-card__body {
  padding: 0;
}

.el-tag {
  transform: translateY(-1px);
  letter-spacing: 0.5px;
}

.el-button.is-disabled {
  @apply opacity-50 cursor-not-allowed;
}

.el-pagination {
  @apply mt-4;
}


.el-card {
  border-radius: 8px;
  border: 1px solid #ebeef5;
}

.el-card__body {
  padding: 0;
}

.p-6 {
  padding: 0 1.5rem !important;
}

.header {
  margin-bottom: 10px;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 14px 20px;
  background-color: #e5e7eb; /* 蓝色背景 */
  color: #ffffff; /* 白色文字 */
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.user-info {
  display: flex;
  align-items: center;
}

.user-dropdown {
  position: relative;
  display: flex;
  align-items: center;
}


h1, h2 {
  margin: 0;
  color: #333; /* 深色文字 */
}


.avatar {
  width: 45px;
  height: 45px;
  border-radius: 50%;
  margin-right: 10px;
  transition: transform 0.2s; /* 动画效果 */
}

.animated-avatar:hover {
  transform: rotate(360deg); /* 头像旋转 */
}

.animated-header {
  animation: fade-in 0.5s; /* 渐入动画 */
}


@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes bounce-in {
  from {
    transform: translateY(-30px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}


.announcement-header h2 {
  margin: 0;
  font-size: 18px;
  font-weight: bold;
}

</style>