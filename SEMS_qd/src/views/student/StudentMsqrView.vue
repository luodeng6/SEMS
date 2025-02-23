<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <div class="header animated-header">
        <div class="user-info">
          <div class="user-dropdown">

            <el-badge :value="12" class="item" style="margin-right: 20px;">
              <el-button size="small" plain>待处理面试</el-button>
            </el-badge>
            <el-badge is-dot class="item" style="margin-right: 20px;color: #0d0d0d;">新消息</el-badge>
            <el-badge is-dot class="item" style="margin-right: 20px;">
              <el-button class="share-button" icon="el-icon-share" type="primary"></el-button>
            </el-badge>


            <img src="@/assets/avatar.png" alt="用户头像" class="avatar animated-avatar"/>
            <span class="text-dark"> 用户: {{ UserInfo.name }}</span>
            <el-dropdown trigger="click" style="margin-left: 10px;">
              <span class="el-dropdown-link text-dark">点我查看<i
                  class="el-icon-caret-bottom el-icon--right"></i></span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item class="clearfix">评论
                  <el-badge class="mark" :value="12"/>
                </el-dropdown-item>
                <el-dropdown-item class="clearfix">回复
                  <el-badge class="mark" :value="3"/>
                </el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </div>
        </div>
      </div>

      <!-- 数据统计 -->
      <div class="grid grid-cols-2 gap-4 mb-6">
        <el-card class="bg-blue-50">
          <div class="p-4">
            <div class="text-sm text-gray-600 mb-2">待确认面试</div>
            <div class="text-3xl font-bold text-blue-600">{{ stats.pending }}</div>
          </div>
        </el-card>
        <el-card class="bg-green-50">
          <div class="p-4">
            <div class="text-sm text-gray-600 mb-2">已确认面试</div>
            <div class="text-3xl font-bold text-green-600">{{ stats.confirmed }}</div>
          </div>
        </el-card>
      </div>

      <!-- 面试列表 -->
      <el-card>
        <div class="p-4">
          <div v-for="(item, index) in paginatedData" :key="item.id"
               class="mb-4 pb-4 border-b last:border-0">
            <div class="flex items-center justify-between">
              <div>
                <h3 class="text-lg font-semibold text-gray-800">{{ item.company }}</h3>
                <p class="text-sm text-gray-600 mb-1">{{ item.position }}</p>
                <div class="text-sm text-gray-500">
                  <span class="mr-4"><i class="el-icon-time"></i> {{ item.time }}</span>
                  <span><i class="el-icon-location-outline"></i> {{ item.location }}</span>
                </div>
              </div>
              <div class="flex gap-2">
                <el-button
                    type="success"
                    size="small"
                    :disabled="item.status !== 'pending'"
                    @click="handleConfirm(item)">
                  {{ item.status === 'confirmed' ? '已确认' : '确认参加' }}
                </el-button>
                <el-button
                    type="danger"
                    size="small"
                    :disabled="item.status !== 'pending'"
                    @click="handleCancel(item)">
                  取消参加
                </el-button>
              </div>
            </div>
          </div>

          <!-- 分页 -->
          <div class="mt-6 flex justify-end">
            <el-pagination
                background
                layout="prev, pager, next"
                :page-size="pageSize"
                :total="interviewList.length"
                @current-change="handlePageChange">
            </el-pagination>
          </div>
        </div>
      </el-card>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";

export default {
  name: 'StudentMsqrView',
  components: { StudentMenu },
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
      interviewList: [
        {
          id: 1,
          company: '腾讯科技',
          position: '前端开发工程师',
          time: '2024-03-20 14:00',
          location: '腾讯大厦A座3层会议室',
          status: 'pending'
        },
        {
          id: 2,
          company: '阿里巴巴',
          position: 'Java开发工程师',
          time: '2024-03-22 10:30',
          location: '阿里中心T2座10层',
          status: 'confirmed'
        },
        // 更多模拟数据...
      ],
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
  methods: {
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
          // this.loadData(this.UserInfo.username);
          this.loadData(); // 获取学生信息
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      });
    },
    handlePageChange(page) {
      this.currentPage = page;
    },
    handleConfirm(item) {
      this.$confirm('确认参加本次面试吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        item.status = 'confirmed';
        this.updateStats();
        this.$message.success('确认成功！');
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
    },
    updateStats() {
      this.stats.pending = this.interviewList.filter(
          item => item.status === 'pending'
      ).length;
      this.stats.confirmed = this.interviewList.filter(
          item => item.status === 'confirmed'
      ).length;
    }
  }
};
</script>

<style scoped>
.el-card {
  border-radius: 8px;
  border: 1px solid #ebeef5;
}
.el-card__body {
  padding: 0;
}


.header {
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