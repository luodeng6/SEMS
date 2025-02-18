<template>
  <div>
    <admin-menu></admin-menu>
    <main class="ml-64 flex-1 p-6">
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold text-gray-800">学生管理</h1>
        <div class="flex items-center space-x-4">
          <div class="relative" @click="toggleDropdown">
            <button class="bg-gray-300 text-gray-700 px-4 py-2 rounded hover:bg-gray-400">
              设置
            </button>
            <ul
                v-show="dropdownVisible"
                class="absolute left-0 mt-2 w-48 bg-white rounded-lg shadow-lg z-20">
              <li class="hover:bg-gray-100 p-2 cursor-pointer" @click="navigateTo('basicInfoManagement')">基本信息管理</li>
              <li class="hover:bg-gray-100 p-2 cursor-pointer" @click="navigateTo('parameterConfig')">参数配置</li>
              <li class="hover:bg-gray-100 p-2 cursor-pointer" @click="navigateTo('accountManagement')">账号管理</li>
            </ul>
          </div>
          <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600" @click="showAddStudentPopup">
            <i class="fas fa-plus"></i> 新增学生
          </button>
        </div>
      </header>

      <div class="grid grid-cols-4 gap-4 mb-6">
        <div class="bg-white p-4 rounded-lg shadow">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-gray-500">总学生数</p>
              <p class="text-2xl font-bold text-blue-600">{{ totalStudents }}</p>
            </div>
            <i class="fas fa-users text-blue-400"></i>
          </div>
        </div>
        <div class="bg-white p-4 rounded-lg shadow">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-gray-500">本科生</p>
              <p class="text-2xl font-bold text-green-600">{{ undergraduateCount }}</p>
            </div>
            <i class="fas fa-graduation-cap text-green-400"></i>
          </div>
        </div>
        <div class="bg-white p-4 rounded-lg shadow">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-gray-500">研究生</p>
              <p class="text-2xl font-bold text-purple-600">{{ postgraduateCount }}</p>
            </div>
            <i class="fas fa-university text-purple-400"></i>
          </div>
        </div>
        <div class="bg-white p-4 rounded-lg shadow">
          <div class="flex justify-between items-center">
            <div>
              <p class="text-gray-500">外籍学生</p>
              <p class="text-2xl font-bold text-yellow-600">{{ internationalCount }}</p>
            </div>
            <i class="fas fa-globe text-yellow-400"></i>
          </div>
        </div>
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div class="lg:col-span-2 bg-white rounded-lg shadow p-4">
          <div class="flex justify-between items-center mb-4">
            <h2 class="text-lg font-semibold">学生列表</h2>
            <div class="flex items-center space-x-2">
              <input
                  v-model="searchQuery"
                  type="text"
                  placeholder="搜索学生"
                  class="border px-2 py-1 rounded">
              <select v-model="selectedMajor" class="border px-2 py-1 rounded">
                <option value="">全部专业</option>
                <option>计算机</option>
                <option>电子工程</option>
              </select>
            </div>
          </div>
          <table class="w-full text-left">
            <thead>
            <tr class="bg-gray-100 border-b">
              <th class="p-3">学生代码</th>
              <th class="p-3">学生姓名</th>
              <th class="p-3">性别</th>
              <th class="p-3">出生日期</th>
              <th class="p-3">年龄</th>

              <th class="p-3">登录账号</th>
              <th class="p-3">专业</th>
              <th class="p-3">身份证号</th>
              <th class="p-3">政治面貌</th>

              <th class="p-3">年级</th>
              <th class="p-3">学制</th>
              <th class="p-3">民族</th>
              <th class="p-3">学号</th>
              <th class="p-3">班级</th>
              <th class="p-3">学历</th>
              <th class="p-3">就业状态</th>

            </tr>
            </thead>
            <tbody>
            <tr
                v-for="student in paginatedStudents"
                :key="student.id"
                class="border-b hover:bg-gray-50">
              <td class="p-3">
                <img :src="student.photoUrl" alt="学生照片" class="w-16 h-16 object-cover rounded-md">
              </td>
              <td class="p-3">{{ student.name }}</td>
              <td class="p-3">{{ student.id }}</td>
              <td class="p-3">{{ student.gender }}</td>
              <td class="p-3">{{ student.class }}</td>
              <td class="p-3">{{ student.major }}</td>
              <td class="p-3">{{ student.interviewCount }}</td>
              <td class="p-3">
                  <span :class='{"px-2 py-1 rounded-full text-xs bg-red-100 text-red-600": student.employmentStatus === "未就业", "bg-green-100 text-green-600": student.employmentStatus === "已就业"} '>
                    {{ student.employmentStatus }}
                  </span>
              </td>
              <td class="p-3">
                <button class="text-blue-500 hover:text-blue-700 mr-2" @click="editStudent(student)">
                  <i class="fas fa-edit"></i>
                </button>
                <button class="text-red-500 hover:text-red-700" @click="deleteStudent(student.id)">
                  <i class="fas fa-trash"></i>
                </button>
              </td>
            </tr>
            </tbody>
          </table>

          <!-- Pagination Component -->
          <div class="flex justify-between items-center mt-4">
            <div class="flex items-center">
              <span>第 {{ currentPage }} 页，总共 {{ totalPages }} 页</span>
              <span class="ml-4">每页 </span>
              <select v-model="itemsPerPage" @change="resetPagination" class="border px-2 py-1 rounded ml-2">
                <option v-for="option in [5, 10, 15, 20]" :key="option">{{ option }}</option>
              </select>
              <span> 条</span>
            </div>
            <div class="flex space-x-2">
              <button @click="prevPage" :disabled="currentPage === 1" class="bg-gray-300 text-white px-4 py-2 rounded hover:bg-gray-400">
                上一页
              </button>
              <button @click="nextPage" :disabled="currentPage === totalPages" class="bg-gray-300 text-white px-4 py-2 rounded hover:bg-gray-400">
                下一页
              </button>
              <input
                  type="number"
                  v-model.number="goToPage"
                  @keyup.enter="goToPageMethod"
                  min="1"
                  :max="totalPages"
                  class="border-gray-300 border rounded px-2 py-1 w-16"
                  placeholder="页码">
              <button @click="goToPageMethod" class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600">
                转到
              </button>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow p-4">
          <h2 class="text-lg font-semibold mb-4">学生专业分布</h2>
          <canvas id="majorDistributionChart" width="300" height="300"></canvas>
        </div>
      </div>


      <!-- 新增、修改学生弹窗 -->
      <transition name="fade">
        <div v-if="isPopupVisible" class="popup-overlay" @click="closePopup">
          <div class="popup" @click.stop>
            <h2 class="popup-title">{{ isEditMode ? '修改学生信息' : '新增学生' }}</h2>
            <label class="block">
              姓名：<input v-model="studentForm.name" type="text" class="border p-2 rounded">
            </label>
            <label class="block">
              学号：<input v-model="studentForm.id" type="text" class="border p-2 rounded" :disabled="isEditMode">
            </label>
            <label class="block">
              性别：
              <select v-model="studentForm.gender" class="border p-2 rounded">
                <option value="">请选择</option>
                <option value="男">男</option>
                <option value="女">女</option>
              </select>
            </label>
            <label class="block">
              班级：<input v-model="studentForm.class" type="text" class="border p-2 rounded">
            </label>
            <label class="block">
              专业：<input v-model="studentForm.major" type="text" class="border p-2 rounded">
            </label>
            <label class="block">
              面试次数：<input v-model.number="studentForm.interviewCount" type="number" class="border p-2 rounded">
            </label>
            <label class="block">
              就业状态：
              <select v-model="studentForm.employmentStatus" class="border p-2 rounded">
                <option value="已就业">已就业</option>
                <option value="未就业">未就业</option>
              </select>
            </label>
            <label class="block">
              照片：
              <input type="file" @change="onFileChange" accept="image/*" class="border p-2 rounded">
            </label>
            <!-- 预览区域 -->
            <div class="mt-4">
              <h3 class="text-sm font-semibold">照片预览：</h3>
              <img :src="studentForm.photoUrl" v-if="studentForm.photoUrl" class="mt-2 w-24 h-24 object-cover border border-gray-300 rounded-md">
            </div>
            <div class="flex justify-end space-x-2">
              <button class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600" @click="saveStudent">
                {{ isEditMode ? '保存' : '新增' }}
              </button>
              <button class="bg-gray-500 text-white px-3 py-1 rounded hover:bg-gray-600" @click="closePopup">取消</button>
            </div>
          </div>
        </div>
      </transition>



    </main>
  </div>
</template>

<script>
import AdminMenu from "@/components/admin/Admin_menu.vue";
import { Chart } from 'chart.js';
import axios   from "axios";

export default {
  name: "AdminStu",
  components: { AdminMenu },
  data() {
    return {
      students: [
        { id: '2021001', name: '李明', gender: '男', class: '计算机01', major: '计算机', interviewCount: 2, employmentStatus: '已就业', photoUrl: 'http://192.168.15.114:81/img/me.jpg' },
        { id: '2021002', name: '张华', gender: '女', class: '电子工程01', major: '电子工程', interviewCount: 1, employmentStatus: '未就业', photoUrl: '' },
        // 更多模拟学生数据...
      ],
      searchQuery: '',
      selectedMajor: '',
      currentPage: 1,
      itemsPerPage: 10,
      isPopupVisible: false,
      isEditMode: false,
      dropdownVisible: false,
      studentForm: {
        id: '',
        name: '',
        gender: '',
        class: '',
        major: '',
        interviewCount: 0,
        employmentStatus: '未就业',
        photoUrl: ''
      },
      goToPage: 1
    };
  },
  computed: {
    totalStudents() {
      return this.students.length;
    },
    undergraduateCount() {
      return this.students.filter(s => s.major === '计算机').length;
    },
    postgraduateCount() {
      return this.students.filter(s => s.major === '电子工程').length;
    },
    internationalCount() {
      return this.students.filter(s => s.major === '外语').length;
    },
    totalPages() {
      return Math.ceil(this.filteredStudents.length / this.itemsPerPage);
    },
    paginatedStudents() {
      return this.filteredStudents.slice((this.currentPage - 1) * this.itemsPerPage, this.currentPage * this.itemsPerPage);
    },
    filteredStudents() {
      return this.students.filter(student => {
        const matchesQuery = student.name.includes(this.searchQuery);
        const matchesMajor = this.selectedMajor === '' || student.major === this.selectedMajor;
        return matchesQuery && matchesMajor;
      });
    }
  },
  mounted() {
    // 学生专业分布饼图
    const ctx = document.getElementById('majorDistributionChart').getContext('2d');
    new Chart(ctx, {
      type: 'pie',
      data: {
        labels: ['计算机', '电子工程', '机械', '经济', '外语', '艺术'],
        datasets: [{
          data: [35, 20, 15, 10, 8, 12],
          backgroundColor: [
            'rgba(54, 162, 235, 0.6)',
            'rgba(255, 99, 132, 0.6)',
            'rgba(75, 192, 192, 0.6)',
            'rgba(255, 206, 86, 0.6)',
            'rgba(153, 102, 255, 0.6)',
            'rgba(255, 159, 64, 0.6)'
          ]
        }]
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'bottom'
          }
        }
      }
    });
  },
  methods: {
    // 获取学生数据
    getStudentData() {
      axios.get('/student/getStudents').then(response => {
        console.log(response.data);
      }).catch(error => {
        console.log(error);
      });
    },
    toggleDropdown() {
      this.dropdownVisible = !this.dropdownVisible;
    },
    showAddStudentPopup() {
      this.isEditMode = false;
      this.studentForm = { id: '', name: '', gender: '', class: '', major: '', interviewCount: 0, employmentStatus: '未就业', photoUrl: '' };
      this.isPopupVisible = true;
    },
    editStudent(student) {
      this.isEditMode = true;
      this.studentForm = { ...student };
      this.isPopupVisible = true;
    },
    closePopup() {
      this.isPopupVisible = false;
    },
    saveStudent() {
      if (this.isEditMode) {
        const index = this.students.findIndex(student => student.id === this.studentForm.id);
        if (index !== -1) {
          this.students[index] = { ...this.studentForm };
        }
      } else {
        this.students.push({ ...this.studentForm });
      }
      this.closePopup();
    },
    deleteStudent(studentId) {
      this.students = this.students.filter(student => student.id !== studentId);
    },
    prevPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
      }
    },
    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.currentPage++;
      }
    },
    resetPagination() {
      this.currentPage = 1;
    },
    goToPageMethod() {
      const page = Math.max(1, Math.min(this.goToPage, this.totalPages));
      this.currentPage = page;
    },
    navigateTo(menu) {
      console.log(`Navigating to: ${menu}`);
      // 实际的导航逻辑
    },
    onFileChange(event) {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
          this.studentForm.photoUrl = e.target.result; // 将图片的 URL 存储到学生表单中
        };
        reader.readAsDataURL(file); // 读取文件为 Data URL
      }
    }
  }
}
</script>

<style scoped>
.popup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999; /* 保证弹窗在最上方 */
}

.popup {
  background: white;
  border-radius: 8px;
  padding: 20px;
  max-width: 500px;
  width: 90%;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to /* .fade-leave-active in <2.1.8 */ {
  opacity: 0;
}

.object-cover {
  object-fit: cover; /* 确保内容覆盖元素 */
}

.rounded-md {
  border-radius: 0.375rem; /* 分别定义元素粗细边框和圆角 */
}
</style>
