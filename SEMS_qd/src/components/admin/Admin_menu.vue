<template>
  <div>
    <aside class="w-64 bg-white shadow-md h-screen fixed left-0 top-0 overflow-y-auto">
      <div class="p-5 border-b">
        <h2 class="text-xl font-bold text-blue-600">就业信息系统</h2>
      </div>
      <nav class="p-4">
        <ul class="space-y-2">
          <li class="hover:bg-blue-50 rounded">
            <router-link to="/admin/index">
              <a class="flex items-center p-2 text-gray-700">
                <i class="fas fa-home mr-2"></i>
                首页总览
              </a>
            </router-link>
          </li>
          <li class="hover:bg-blue-50 rounded">
            <router-link to="/admin/stu">
              <a class="flex items-center p-2 text-gray-700">
                <i class="fas fa-users mr-2"></i>
                学生管理
              </a>
            </router-link>
          </li>
          <li class="hover:bg-blue-50 rounded">
            <router-link to="/admin/job">
              <a class="flex items-center p-2 text-gray-700">
                <i class="fas fa-briefcase mr-2"></i>
                就业信息
              </a>
            </router-link>
          </li>
          <li class="hover:bg-blue-50 rounded">
            <router-link to="/admin/teacher">
              <a class="flex items-center p-2 text-gray-700">
                <i class="fas fa-user-graduate mr-2"></i>
                教师管理
              </a>
            </router-link>
          </li>
          <li class="hover:bg-blue-50 rounded">
            <router-link to="/admin/dwgl">
              <a class="flex items-center p-2 text-gray-700">
                <i class="fas fa-cog mr-2"></i>
                单位管理
              </a>
            </router-link>
          </li>
          <li class="hover:bg-blue-50 rounded">
            <router-link to="/admin/Zph">
              <a class="flex items-center p-2 text-gray-700">
                <i class="bi bi-people-fill mr-2"></i>
                招聘会管理
              </a>
            </router-link>
          </li>
          <li class="hover:bg-blue-50 rounded">
            <router-link to="/admin/xsjl">
              <a class="flex items-center p-2 text-gray-700">
                <i class="bi bi-file-earmark-text"></i>
                学生简历管理
              </a>
            </router-link>
          </li>


          <li @click="toggleStatsMenuXiaoYuanOpen" class="hover:bg-blue-50 rounded cursor-pointer">
            <a class="flex items-center p-2 text-gray-700">
              <i class="fas fa-chart-pie mr-2"></i>
              校园信息管理
              <i :class="{'fas fa-chevron-down': !isStatsMenuXiaoYuanOpen, 'fas fa-chevron-up': isStatsMenuXiaoYuanOpen}" class="ml-auto"></i>
            </a>
          </li>
          <ul v-show="isStatsMenuXiaoYuanOpen" class="pl-4 space-y-2">
            <li class="hover:bg-blue-50 rounded">
              <router-link to="/admin/stats/students">
                <a class="flex items-center p-2 text-gray-700">
                  新闻管理
                </a>
              </router-link>
            </li>
            <li class="hover:bg-blue-50 rounded">
              <router-link to="/admin/stats/graduates">
                <a class="flex items-center p-2 text-gray-700">
                  公告栏管理
                </a>
              </router-link>
            </li>
          </ul>


          <li @click="toggleStatsMenuQiTaOpen" class="hover:bg-blue-50 rounded cursor-pointer">
            <a class="flex items-center p-2 text-gray-700">
              <i class="fas fa-cogs mr-2"></i>
              系统设置
              <i :class="{'fas fa-chevron-down': !isStatsMenuXiTongOpen, 'fas fa-chevron-up': isStatsMenuXiTongOpen}" class="ml-auto"></i>
            </a>
          </li>
          <ul v-show="isStatsMenuXiTongOpen" class="pl-4 space-y-2">
            <li class="hover:bg-blue-50 rounded">
              <router-link to="/admin/sysUseradmin">
                <a class="flex items-center p-2 text-gray-700">
                  系统用户管理
                </a>
              </router-link>
            </li>
            <li class="hover:bg-blue-50 rounded">
              <router-link to="/admin/stats/graduates">
                <a class="flex items-center p-2 text-gray-700">
                  系统参数配置
                </a>
              </router-link>
            </li>
            <li class="hover:bg-blue-50 rounded">
              <router-link to="/admin/stats/logs">
                <a class="flex items-center p-2 text-gray-700">
                  用户权限管理
                </a>
              </router-link>
            </li>
            <li class="hover:bg-blue-50 rounded">
              <router-link to="/admin/jcsj">
                <a class="flex items-center p-2 text-gray-700">
                  基础数据配置
                </a>
              </router-link>
            </li>
          </ul>


          <li @click="toggleStatsMenu" class="hover:bg-blue-50 rounded cursor-pointer">
            <a class="flex items-center p-2 text-gray-700">
              <i class="fas fa-chart-pie mr-2"></i>
              其他管理
              <i :class="{'fas fa-chevron-down': !isStatsMenuQiTaOpen, 'fas fa-chevron-up': isStatsMenuQiTaOpen}" class="ml-auto"></i>
            </a>
          </li>
              <ul v-show="isStatsMenuQiTaOpen" class="pl-4 space-y-2">
                <li class="hover:bg-blue-50 rounded">
                  <router-link to="/admin/stats/students">
                    <a class="flex items-center p-2 text-gray-700">
                      面试管理
                    </a>
                  </router-link>
                </li>
                <li class="hover:bg-blue-50 rounded">
                  <router-link to="/admin/stats/graduates">
                    <a class="flex items-center p-2 text-gray-700">
                      简历管理
                    </a>
                  </router-link>
                </li>
                <li class="hover:bg-blue-50 rounded">
                  <router-link to="/admin/stats/logs">
                    <a class="flex items-center p-2 text-gray-700">
                      班级管理
                    </a>
                  </router-link>
                </li>
                <li class="hover:bg-blue-50 rounded">
                  <router-link to="/admin/stats/logs">
                    <a class="flex items-center p-2 text-gray-700">
                      招聘简章管理
                    </a>
                  </router-link>
                </li>
                <li class="hover:bg-blue-50 rounded">
                  <router-link to="/admin/stats/logs">
                    <a class="flex items-center p-2 text-gray-700">
                      专业管理
                    </a>
                  </router-link>
                </li>
              </ul>




          <li class="hover:bg-blue-50 rounded" style="cursor: pointer">
            <a @click="LoginOutOK" class="flex items-center p-2 text-gray-700" id="logout-button">
              <i class="fas fa-sign-out-alt mr-2"></i>
              退出登录
            </a>
          </li>
        </ul>
      </nav>
    </aside>

    <div v-if="visible" class="popup-overlay" @click="closePopup">
      <div class="popup" @click.stop>
        <h2 class="popup-title">{{ title }}</h2>
        <p class="popup-message">{{ message }}</p>
        <button class="popup-button" @click="closePopup">关闭</button>
      </div>
    </div>

  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "AdminMenu",
  data() {
    return {
      showModal: false,
      title: '',
      message: '',
      visible: false,
      isStatsMenuQiTaOpen: false, // 控制统计分析子菜单的展开状态
      isStatsMenuXiaoYuanOpen: false,// 控制校园信息管理子菜单的展开状态
      isStatsMenuXiTongOpen: false // 控制系统设置子菜单的展开状态
    }
  },
  methods: {
    toggleStatsMenuQiTaOpen() {
      this.isStatsMenuXiTongOpen = !this.isStatsMenuXiTongOpen; // 系统设置子菜单的展开状态
    },
    toggleStatsMenu() {
      this.isStatsMenuQiTaOpen = !this.isStatsMenuQiTaOpen; // 切换子菜单的展开状态
    },
    toggleStatsMenuXiaoYuanOpen() {
      this.isStatsMenuXiaoYuanOpen = !this.isStatsMenuXiaoYuanOpen; // 切换子菜单的展开状态
    },
    confirmLogout() {
      axios.get("/user/logout").then((response) => {
        if (response.data.result) {
          this.$router.push({name: 'Login'});
        } else {
          this.title = '错误';
          this.message = '退出登录失败，请稍后再试';
          this.visible = true;
        }
      }).catch((error) => {
        console.log(error);
        this.title = '错误';
        this.message = '退出登录失败，请稍后再试';
        this.visible = true;
      });
      this.showModal = false;
    },
    closePopup() {
      this.visible = false;
      this.$router.push({name: 'Login'});
    },
    LoginOutOK() {
      this.$confirm('确认退出登录吗？', '确认信息', {
        distinguishCancelAndClose: true,
        confirmButtonText: '确定退出',
        cancelButtonText: '取消'
      }).then(() => {
        axios.get("/user/logout").then((response) => {
          if (response.data.result) {
            this.$router.push({name: 'Login'});
          } else {
            this.title = '错误';
            this.message = '退出登录失败，请稍后再试';
            this.visible = true;
          }
        }).catch((error) => {
          console.log(error);
          this.title = '错误';
          this.message = '退出登录失败，请稍后再试';
          this.visible = true;
        });
      }).catch(action => {});
    }
  }
}
</script>

<style>
/* 增强弹窗体验的样式 */
.fixed {
  position: fixed;
}

.flex {
  display: flex;
}

.hidden {
  display: none;
}

.popup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 99999;
  transition: opacity 0.3s ease;
}

.popup {
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
  padding: 20px;
  max-width: 400px;
  width: 90%;
  text-align: center;
  animation: fadeIn 0.3s;
}

.popup-title {
  margin: 0 0 10px;
  font-size: 1.5em;
  font-weight: bold;
  color: #333;
}

.popup-message {
  margin-bottom: 20px;
  font-size: 1em;
  color: #666;
}

.popup-button {
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  cursor: pointer;
  font-size: 1em;
  transition: background-color 0.3s;
}

.popup-button:hover {
  background-color: #0056b3;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

/*--------------信息弹窗-样式end*/
</style>
