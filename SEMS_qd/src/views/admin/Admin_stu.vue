<template>
  <div>
    <admin-menu></admin-menu>
    <main class="ml-64 flex-1 p-6">
      <header class="flex justify-between items-center mb-6">

        <h1 class="text-2xl font-semibold text-gray-800">学生管理</h1>
        <el-breadcrumb separator="/">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item><a href="/">活动管理</a></el-breadcrumb-item>
          <el-breadcrumb-item>活动列表</el-breadcrumb-item>
          <el-breadcrumb-item>活动详情</el-breadcrumb-item>
        </el-breadcrumb>
        <div class="flex items-center space-x-4">
          <div class="relative" @click="toggleDropdown">
            <button class="bg-gray-300 text-gray-700 px-4 py-2 rounded hover:bg-gray-400">
              设置
            </button>
            <ul v-show="dropdownVisible"
                class="absolute left-0 mt-2 w-48 bg-white rounded-lg shadow-lg z-20">
              <li class="hover:bg-gray-100 p-2 cursor-pointer" @click="navigateTo('basicInfoManagement')">基本信息管理
              </li>
              <li class="hover:bg-gray-100 p-2 cursor-pointer" @click="navigateTo('parameterConfig')">参数配置</li>
              <li class="hover:bg-gray-100 p-2 cursor-pointer" @click="navigateTo('accountManagement')">账号管理</li>
            </ul>
          </div>
          <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600" @click="showAddStudentPopup">
            <i class="fas fa-plus"></i> 新增学生
          </button>
          <button class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600" @click="">
            <i class="fas fa-sync"></i> 同步责任教师
          </button>
        </div>
      </header>

      <!-- 数据统计卡片 -->
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

      <!-- 学生列表 -->
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div class="lg:col-span-2 bg-white rounded-lg shadow p-4">
          <div class="flex justify-between items-center mb-4">
            <h2 class="text-lg font-semibold">学生列表</h2>
            <div class="flex items-center space-x-2">
<!--              <input
                  v-model="searchQuery"
                  type="text"
                  placeholder="搜索学生"
                  class="border px-2 py-1 rounded"
                  prefix-icon="el-icon-search"
              >-->

             <el-input
              placeholder="搜索学生"
              v-model="searchQuery">
              <i slot="prefix" class="el-input__icon el-icon-search"></i>
              </el-input>

              <select v-model="selectedMajor" class="border px-2 py-1 rounded">
                <option value="">选择专业</option>
                <option>计算机</option>
                <option>电子工程</option>
                <option>外语</option>
                <option>机械</option>
                <option>经济</option>
                <option>艺术</option>
              </select>
            </div>
          </div>

          <el-table
              :data="paginatedStudents"
              style="width: 100%;">
            <el-table-column label="编号" prop="学生代码"></el-table-column>
            <el-table-column label="姓名" prop="学生姓名">
              <template slot-scope="scope">
                <span v-tooltip="scope.row.学生姓名">{{ truncateText(scope.row.学生姓名) }}</span>
              </template>
            </el-table-column>
            <el-table-column label="性别" prop="性别"></el-table-column>
            <el-table-column label="学生照片" prop="学生照片"></el-table-column>
            <el-table-column label="出生日期" prop="出生日期"></el-table-column>
            <el-table-column label="年龄" prop="年龄"></el-table-column>
            <el-table-column label="账号" prop="登录账号"></el-table-column>
            <el-table-column label="专业" prop="专业"></el-table-column>
            <el-table-column label="身份证号" prop="身份证号"></el-table-column>
            <el-table-column label="政治面貌" prop="政治面貌"></el-table-column>
            <el-table-column label="年级" prop="年级"></el-table-column>
            <el-table-column label="学制" prop="学制"></el-table-column>
            <el-table-column label="民族" prop="民族"></el-table-column>
            <el-table-column label="学号" prop="学号"></el-table-column>
            <el-table-column label="班级" prop="班级"></el-table-column>
            <el-table-column label="学历" prop="学历"></el-table-column>
            <el-table-column label="负责教师" prop="教师名称"></el-table-column>
            <el-table-column label="就业状态" prop="就业状态">
              <template slot-scope="scope">
                <span :style="{ color: scope.row.就业状态 === '未就业' ? 'red' : 'green' }">
                  {{ scope.row.就业状态 }}
                </span>
              </template>
            </el-table-column>

            <el-table-column align="right">
              <template slot-scope="scope">
                <el-button size="mini" @click="editStudent(scope.row)">编辑</el-button>
                <el-button size="mini" type="danger" @click="deleteStudent(scope.row)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>

          <!-- 分页组件 -->
          <div class="mt-4">
            <el-pagination
                @current-change="handleCurrentChange"
                :current-page="currentPage"
                :page-size="pageSize"
                :total="filteredStudents.length"
                layout="total, prev, pager, next, jumper">
            </el-pagination>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow p-4">
          <h2 class="text-lg font-semibold mb-4">学生统计图</h2>
          <select v-model="selectedChart" class="border px-2 py-1 rounded mb-4" @change="initCharts">
            <option value="majorDistribution">专业分布</option>
            <option value="employmentStatus">就业状态</option>
            <option value="genderDistribution">性别分布</option>
          </select>
          <canvas id="majorDistributionChart" width="300" height="300"></canvas>
        </div>
      </div>


      <!-- 新增、编辑学生信息弹窗 -->
      <transition name="fade">
        <div v-if="isPopupVisible" class="popup-overlay" @click="closePopup">
          <div class="popup" @click.stop>
            <h2 class="popup-title">
              <i class="fas fa-user-edit"></i> <!-- 编辑图标 -->
              {{ isEditMode ? '修改学生信息' : '新增学生' }}
            </h2>
            <label class="block">
              <i class="fas fa-user"></i> 学生姓名：
              <input v-model="studentForm.学生姓名" type="text" class="border p-2 rounded">
            </label>
            <label class="block">
              <i class="fas fa-id-badge"></i> 学号：
              <input v-model="studentForm.学号" type="text" class="border p-2 rounded" :disabled="isEditMode">
            </label>
            <label class="block">
              <i class="fas fa-venus-mars"></i> 性别：
              <select v-model="studentForm.性别" class="border p-2 rounded">
                <option value="">请选择</option>
                <option value="男">男</option>
                <option value="女">女</option>
              </select>
            </label>
            <label class="block">
              <i class="fas fa-calendar-alt"></i> 出生日期：
              <input v-model="studentForm.出生日期" type="date" class="border p-2 rounded">
            </label>
            <label class="block">
              <i class="fas fa-user-circle"></i> 登录账号：
              <input v-model="studentForm.登录账号" type="text" class="border p-2 rounded">
            </label>
            <label class="block">
              <i class="fas fa-book"></i> 专业：
              <select v-model="studentForm.专业" class="border p-2 rounded">
                <option value="">请选择</option>
                <option v-for="(item, index) in majorList" :key="index" :value="item.zymc">{{ item.zymc }}</option>
              </select>
            </label>
            <label class="block">
              <i class="fas fa-id-card"></i> 身份证号：
              <input v-model="studentForm.身份证号" type="text" class="border p-2 rounded">
            </label>
            <label class="block">
              <i class="fas fa-flag"></i> 政治面貌：
              <select v-model="studentForm.政治面貌" class="border p-2 rounded">
                <option value="">请选择</option>
                <option v-for="(item, index) in zymmList" :key="index" :value="item">{{ item }}</option>
              </select>
            </label>
            <label class="block">
              <i class="fas fa-graduation-cap"></i> 年级：
              <input v-model="studentForm.年级" type="text" class="border p-2 rounded">
            </label>
            <label class="block">
              <i class="fas fa-school"></i> 学制：
              <select v-model="studentForm.学制" class="border p-2 rounded">
                <option value="">请选择</option>
                <option v-for="(value, key) in xzList" :key="value" :value="key">{{ key }}</option>
              </select>

            </label>
            <label class="block">
              <i class="fas fa-users"></i>民族：
              <select v-model="studentForm.民族" class="border p-2 rounded">
                <option value="">请选择</option>
                <option value="汉族">汉族</option>
                <option value="蒙古族">蒙古族</option>
                <option value="回族">回族</option>
                <option value="藏族">藏族</option>
                <option value="维吾尔族">维吾尔族</option>
                <option value="苗族">苗族</option>
                <option value="彝族">彝族</option>
                <option value="壮族">壮族</option>
                <option value="布依族">布依族</option>
                <option value="朝鲜族">朝鲜族</option>
                <option value="满族">满族</option>
                <option value="侗族">侗族</option>
                <option value="瑶族">瑶族</option>
                <option value="白族">白族</option>
                <option value="土家族">土家族</option>
                <option value="哈尼族">哈尼族</option>
                <option value="哈萨克族">哈萨克族</option>
                <option value="傣族">傣族</option>
                <option value="黎族">黎族</option>
                <option value="傈僳族">傈僳族</option>
                <option value="佤族">佤族</option>
                <option value="畲族">畲族</option>
                <option value="高山族">高山族</option>
                <option value="拉祜族">拉祜族</option>
                <option value="水族">水族</option>
                <option value="东乡族">东乡族</option>
                <option value="纳西族">纳西族</option>
                <option value="景颇族">景颇族</option>
                <option value="柯尔克孜族">柯尔克孜族</option>
                <option value="土族">土族</option>
                <option value="达斡尔族">达斡尔族</option>
                <option value="仫佬族">仫佬族</option>
                <option value="羌族">羌族</option>
                <option value="布朗族">布朗族</option>
                <option value="撒拉族">撒拉族</option>
                <option value="仡佬族">仡佬族</option>
                <option value="锡伯族">锡伯族</option>
                <option value="阿昌族">阿昌族</option>
                <option value="普米族">普米族</option>
                <option value="塔吉克族">塔吉克族</option>
                <option value="怒族">怒族</option>
                <option value="乌孜别克族">乌孜别克族</option>
                <option value="俄罗斯族">俄罗斯族</option>
                <option value="德昂族">德昂族</option>
                <option value="保安族">保安族</option>
                <option value="裕固族">裕固族</option>
                <option value="京族">京族</option>
                <option value="塔塔尔族">塔塔尔族</option>
                <option value="独龙族">独龙族</option>
                <option value="鄂伦春族">鄂伦春族</option>
                <option value="赫哲族">赫哲族</option>
                <option value="门巴族">门巴族</option>
                <option value="珞巴族">珞巴族</option>
                <option value="基诺族">基诺族</option>
                <option value="其他">其他</option>
              </select>
            </label>
            <label class="block">
              <i class="fas fa-users-class"></i> 班级：

              <select v-model="studentForm.班级" class="border p-2 rounded">
                <option value="">请选择</option>
                <option v-for="(item, index) in classList" :key="index" :value="item.bjmc">{{ item.id+'-'+item.bjmc }}</option>
              </select>
            </label>
            <label class="block">
              <i class="fas fa-graduation-cap"></i> 学历：
              <select v-model="studentForm.学历" class="border p-2 rounded">
                <option value="">请选择</option>
                <option v-for="(item, index) in xlttkList" :key="index" :value="item.xlmc">{{ item.xlmc }}</option>
              </select>

            </label>

            <!--            新增模式下没有负责老师选项-->
            <label class="block" v-show="isEditMode">
              <i class="fas fa-graduation-cap"></i> 负责老师：
              <select v-model="studentForm.负责教师" class="border p-2 rounded">
                <option value="">请选择</option>
                <option v-for="(item, index) in FZTeacherList" :key="index" :value="item.id">{{ item.id +'-'+item.jsmc }}</option>
              </select>
            </label>

            <label class="block">
              <i class="fas fa-briefcase"></i> 就业状态：
              <select v-model="studentForm.就业状态" class="border p-2 rounded">
                <option v-for="(jyztk,index) in JyZtList" :key="index" :value="jyztk.jyzt">{{ jyztk.jyzt }}</option>
              </select>
            </label>
            <!--只有新增模式才有照片上传-->
            <label class="block" v-if="!isEditMode">
              <i class="fas fa-image"></i> 照片：
              <input type="file" @change="onFileChange" accept="image/*" class="border p-2 rounded">
            </label>
            <div class="mt-4">
              <h3 class="text-sm font-semibold">照片预览：</h3>
              <img :src="studentForm.学生照片" v-if="studentForm.学生照片"
                   class="mt-2 w-24 h-24 object-cover border border-gray-300 rounded-md">
            </div>
            <div class="flex justify-end space-x-2">
              <button class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600" @click="saveStudent">
                <!-- 保存图标 -->
                {{ isEditMode ? '保存' : '新增' }}
              </button>
              <button class="bg-gray-500 text-white px-3 py-1 rounded hover:bg-gray-600" @click="closePopup">
                <i class="fas fa-times"></i> <!-- 取消图标 -->
                取消
              </button>
            </div>
          </div>
        </div>
      </transition>

    </main>
  </div>
</template>

<script>
import AdminMenu from "@/components/admin/Admin_menu.vue";
import {Chart} from 'chart.js';
import axios from "axios";
// 引入 Bootstrap CSS
import 'bootstrap/dist/css/bootstrap.css';
// 引入 Bootstrap JS (需使用 jQuery 和 Popper.js)
import 'bootstrap';


export default {
  name: "AdminStu",
  components: {AdminMenu},
  data() {
    return {
      searchQuery: '',// 搜索框内容
      students: [],// 学生列表
      selectedMajor: '',// 选择的专业
      isPopupVisible: false,// 弹窗是否可见
      isEditMode: false,// 是否为编辑模式
      dropdownVisible: false,
      selectedChart: 'majorDistribution', // 默认选择的图表类型

      majorList: [], // 专业列表
      classList: [], // 班级列表
      zymmList: [
        '中共党员',         // 共产党员
        '中共预备党员',     // 预备党员
        '入党积极分子',
        '共青团员',// 积极分子
        '群众',             // 群众
        '民主党派成员',     // 民主党派成员
        '无党派人士',       // 无党派人士
        '其他'              // 其他
      ],// 政治面貌列表
      xlttkList: [],//学历列表
      xzList: {"四年制": 4, "五年制": 5, "六年制": 6, "七年制": 7, "八年制": 8},//学制列表
      xmzList: [],//民族列表--- 不从后端获取
      NJList: ['2015', 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024],

      /*   [
             {
               "ztdm": 1000,
               "jyzt": "未就业",
               "ztms": "未就业",
               "qydm": 1
             },
             {
               "ztdm": 1001,
                 "jyzt": "已就业",
                 "ztms": "已就业",
                 "qydm": 1
             },
             {
               "ztdm": 1002,
                 "jyzt": "实习中",
                 "ztms": "学生在实习期间",
                 "qydm": 1
             },
             {
               "ztdm": 1003,
                 "jyzt": "已签订第三方",
                 "ztms": null,
                 "qydm": 1
             }
     ]*/

      JyZtList: [],
      // 负责老师列表： 获取当前班级的负责老师列表
      FZTeacherList: [],
      /*
      "学生代码": 377,
      "学生姓名": "王昕雨",
      "性别": "女",
      "出生日期": "2002-12-19",
      "年龄": 22,
      "登录账号": "20203014042",
      "专业": "中医学",
      "身份证号": "220203200212195928",
      "政治面貌": "共青团员",
      "年级": "2020",
      "学制": "五年制",
      "民族": "汉族",
      "学号": "20203014042",
      "班级": "2020中医4班",
      "学历": null,
      "就业状态": "未就业"*/

      studentForm: {
        "学生姓名": "",
        "性别": "",
        "出生日期": "",
        "年龄": "",
        "登录账号": "",
        "专业": "",
        "身份证号": "",
        "政治面貌": "",
        "年级": "",
        "学制": "",
        "民族": "",
        "学号": "",
        "班级": "",
        "学历": "",
        "就业状态": "",
        "学生照片": "",
        "负责老师": ""
      },

      currentPage: 1,
      pageSize: 4 // 每页显示的学生数量
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
    filteredStudents() {
      return this.students.filter(student => {
        const matchesQuery = student.学生姓名.includes(this.searchQuery);
        const matchesMajor = this.selectedMajor === '' || student.专业 === this.selectedMajor;
        return matchesQuery && matchesMajor;
      });
    },
    paginatedStudents() {
      const start = (this.currentPage - 1) * this.pageSize;
      return this.filteredStudents.slice(start, start + this.pageSize);
    },
    majorDistribution() {
      const distribution = {};
      this.students.forEach(student => {
        const major = student.专业;
        if (distribution[major]) {
          distribution[major]++;
        } else {
          distribution[major] = 1;
        }
      });
      return distribution;
    },
    employmentDistribution() {
      const distribution = {
        '已就业': 0,
        '未就业': 0
      };
      this.students.forEach(student => {
        distribution[student.就业状态]++;
      });
      return distribution;
    },
    genderDistribution() {
      const distribution = {
        '男': 0,
        '女': 0
      };
      this.students.forEach(student => {
        distribution[student.性别]++;
      });
      return distribution;
    },
    chartData() {
      switch (this.selectedChart) {
        case 'employmentStatus':
          const employmentData = this.employmentDistribution;
          return {
            labels: Object.keys(employmentData),
            data: Object.values(employmentData)
          };
        case 'genderDistribution':
          const genderData = this.genderDistribution;
          return {
            labels: Object.keys(genderData),
            data: Object.values(genderData)
          };
        case 'majorDistribution':
        default:
          const majorData = this.majorDistribution;
          return {
            labels: Object.keys(majorData),
            data: Object.values(majorData)
          };
      }
    }
  },
  mounted() {

    this.getStudentData();
  },
  methods: {
    //获取当前班级的负责老师列表
    getFZTeacherList(bjdm) {
      axios.get("/teacher/getTeacherByClassId?bjdm=" + bjdm).then(response => {
        if (response.data.result) {
          this.FZTeacherList = response.data.data;
          console.log(bjdm + "：负责老师列表：")
          console.log(this.FZTeacherList)
        } else {
          this.$message.error('获取负责老师列表失败, 后台接口错误！');
        }
      }).catch(error => {
        console.log(error);
        this.$message.error('获取负责老师列表失败, 网络连接错误！');
      });

    },
    // 获取学生管理所需数据
    getXSGLData() {
      axios.get("/data/getAllStuGLData").then(response => {
        if (response.data.result) {
          /*
          * 后端代码：
          * dataList.put("XLTTK",xlttkMapper.getAllXlttk());
            dataList.put("BJDMK",bjdmkMapper.getAllBjdmk());
            dataList.put("ZYDMK",zydmkMapper.getAllZydmk());
          * **/

          this.$message.success('获取学生管理数据成功');
          this.majorList = response.data.data.ZYDMK;//专业列表
          this.classList = response.data.data.BJDMK;//班级列表
          // this.xmzList=response.data.data.MZ;//民族列表
          this.xlttkList = response.data.data.XLTTK;//学历列表
        } else {
          this.$message.error('获取数据失败，灾难性错误');
        }
      }).catch(error => {
        console.log(error);
        this.$message.error('获取数据失败, 网络连接错误！');
      });
    },
    // 由值获取键
    getKeyByValue(object, value) {
      return Object.keys(object).find(key => object[key] === value) || null;
    },
    changeStudetData() {

    },
    // 获取就业状态数据
    getAllJyztdata() {
      axios.get("/jyztdmk/getAllJyztdmk").then(response => {
        if (response.data.result) {
          this.JyZtList = response.data.data;
          console.log(this.JyZtList)
        } else {
          this.$message.error('获取数据失败, 网络连接错误！');
        }
      }).catch(error => {
        console.log(error);
        this.$message.error('获取就业状态基础数据失败, 网络连接错误！');
      });

    },
    // 获取学生数据
    getStudentData() {
      axios.get('/student/getStudentAuto').then(response => {
        this.$message.success('获取学生数据成功');
        this.students = response.data.data;
        this.initCharts(); // 数据获取后初始化图表
      }).catch(error => {
        console.log(error);
        this.$message.error('获取学生数据失败, 网络连接错误');
      });
    },
    toggleDropdown() {
      this.dropdownVisible = !this.dropdownVisible;
    },
    // 单击新增按钮事件
    showAddStudentPopup() {
      // 如果数据不为空则无需再次获取数据,减少服务器压力
      if (this.xlttkList.length === 0) {
        this.getXSGLData(); // 获取学生管理所需数据
      }
      if (this.JyZtList.length === 0) {
        this.getAllJyztdata(); //获取就业状态基础数据
      }


      this.isEditMode = false;// 新增模式
      //新增模式，表单内容初始化
      this.studentForm = {
        "学生姓名": "",
        "性别": "",
        "出生日期": "",
        "年龄": "",
        "登录账号": "",
        "专业": "",
        "身份证号": "",
        "政治面貌": "",
        "年级": "",
        "学制": "",
        "民族": "",
        "学号": "",
        "班级": "",
        "学历": "",
        "就业状态": "",
        "学生照片": ""
      };
      // 弹窗显示
      this.isPopupVisible = true;
    },
    // 数据修改按钮事件，把当前学生信息传递给弹窗
    editStudent(student) {
      // 如果数据不为空则无需再次获取数据,减少服务器压力
      if (this.xlttkList.length === 0) {
        this.getXSGLData(); // 获取学生管理所需数据
      }
      if (this.JyZtList.length === 0) {
        this.getAllJyztdata(); //获取就业状态基础数据
      }

      this.isEditMode = true; // 编辑模式
      this.studentForm = {...student};// 使用对象展开运算符拷贝学生信息

      // this.getFZTeacherList(student.)
      console.log("编辑的学生信息：")
      console.log(student)
      this.getFZTeacherList(student.班级代码);
      this.isPopupVisible = true;
    },
    closePopup() {
      this.isPopupVisible = false;
    },
    saveStudent() {

      axios.get("/data/getStuDYMap").then(response => {
        if (response.data.result) {
          let DyData = response.data.data;
          console.log("数据对应：");
          console.log(DyData);

          const formData = new FormData();
          // 将每个字段逐个添加到 FormData 中
          /*
          *"学生代码": "ID",
          "学生姓名": "XSXM",
          "性别": "XSXB",
          "出生日期": "BIRTH",
          "登录账号": "YHM",
          "专业": "ZYDM",
          "身份证号": "SFZH",
          "政治面貌": "ZZMM",
          "年级": "SSNJ",
          "学制": "XZ",
          "民族": "MZ",
          "学号": "XSXH",
          "班级": "SSBJ",
          "学历": "XLDM",
          "就业状态": "JYZT"
          * */
          console.log("数据：")
          console.log(this.majorList)
          console.log(this.classList)
          console.log(this.xlttkList)

          formData.append(DyData.学生代码.toLowerCase(), this.studentForm.学生代码);
          formData.append(DyData.学生姓名.toLowerCase(), this.studentForm.学生姓名);
          formData.append(DyData.性别.toLowerCase(), this.studentForm.性别);
          formData.append(DyData.出生日期.toLowerCase(), this.studentForm.出生日期);
          formData.append(DyData.登录账号.toLowerCase(), this.studentForm.登录账号);
          formData.append(DyData.专业.toLowerCase(), this.majorList.find(item => item.zymc === this.studentForm.专业).id);
          formData.append(DyData.身份证号.toLowerCase(), this.studentForm.身份证号);
          formData.append(DyData.政治面貌.toLowerCase(), this.studentForm.政治面貌);
          formData.append(DyData.年级.toLowerCase(), this.studentForm.年级);// 年级id
          //xzList: {"四年制": 4, "五年制": 5, "六年制": 6, "七年制": 7, "八年制": 8},//学制列表
          formData.append(DyData.学制.toLowerCase(), this.xzList[this.studentForm.学制]);
          formData.append(DyData.民族.toLowerCase(), this.studentForm.民族);
          formData.append(DyData.学号.toLowerCase(), this.studentForm.学号);
          formData.append(DyData.班级.toLowerCase(), this.classList.find(item => item.bjmc === this.studentForm.班级).id);//班级id
          console.log("传入参数：")
          console.log(this.xlttkList)
          console.log(this.studentForm.学历)
          formData.append(DyData.学历.toLowerCase(), this.xlttkList.find(item => item.xlmc === this.studentForm.学历).id);// 学历id
          formData.append(DyData.就业状态.toLowerCase(), this.JyZtList.find(item => item.jyzt === this.studentForm.就业状态).ztdm);//待修改
          formData.append(DyData.负责教师.toLowerCase(), this.studentForm.负责教师);


          if (this.isEditMode) {
            // 编辑模式，需要将修改后的学生信息发送到服务器
            console.log('修改学生信息如下:');
            console.log({...this.studentForm});
            console.log("开始启用修改更新学生信息接口:")
            // 启用修改更新学生信息接口
            axios.post("student/updateStudentByEdit", formData).then(response => {
              if (response.data.result) {
                this.$message.success('修改学生信息成功!');
                console.log(response.data);
              } else {
                this.$message.error('修改学生信息失败, 后台错误');
              }
            }).catch(error => {
              console.log(error);
              this.$message.error('修改学生信息失败, 网络连接错误');
            })


          } else {
            // 新增逻辑：
            console.log('新增学生信息如下:');
            console.log({...this.studentForm});
            // 新增模式，将新增的学生信息添加到 students 数组中
            this.students.push({...this.studentForm});
            console.log("开始启用新增学生信息接口:")
            // 启用修改更新学生信息接口
            axios.post("student/updateStudentByEdit", formData).then(response => {
              if (response.data.result) {
                this.$message.success('修改学生信息成功!');
                console.log(response.data);
              } else {
                this.$message.error('修改学生信息失败, 后台错误');
              }
            }).catch(error => {
              console.log(error);
              this.$message.error('修改学生信息失败, 网络连接错误');
            })
          }
        } else {
          this.$message.error('获取对应数据失败,后台错误');
        }
      }).catch(error => {
        console.log(error);
        this.$message.error('网络错误，获取对应数据错误');
      });

      this.closePopup();
      this.initCharts(); // 更新图表
    },
    deleteStudent(student) {
      console.log('删除学生信息如下:');
      console.log(student);
      this.$confirm('确认删除该学生(' + student.学生姓名 + ')吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log('开始删除...');
        axios.get("/student/deleteStudentById?id=" + student.学生代码).then(response => {
          if (response.data.result) {
            this.$message.success('停用学生成功!');
            // 直接在数据中删除该学生
            this.students = this.students.filter(s => s.学生代码 !== student.学生代码);
          } else {
            this.$message.error('停用学生失败, 后台错误');
          }
        }).catch(error => {
          console.log(error);
        });

      }).catch(() => {
        console.log('取消删除...');
      });

      // this.students = this.students.filter(s => s.id !== student.id);
      this.initCharts(); // 更新图表
    },
    handleCurrentChange(page) {
      this.currentPage = page;
    },
    initCharts() {
      const ctx = document.getElementById('majorDistributionChart').getContext('2d');
      const {labels, data} = this.chartData;

      // 清除之前的图表
      if (this.chart) {
        this.chart.destroy();
      }

      // 创建新的图表
      this.chart = new Chart(ctx, {
        type: this.selectedChart === 'employmentStatus' || this.selectedChart === 'genderDistribution' ? 'pie' : 'bar',
        data: {
          labels: labels,
          datasets: [{
            data: data,
            backgroundColor: [
              'rgba(75, 192, 192, 0.6)', // 计算机
              'rgba(255, 99, 132, 0.6)', // 电子工程
              'rgba(255, 206, 86, 0.6)', // 外语
              'rgba(153, 102, 255, 0.6)', // 机械
              'rgba(255, 159, 64, 0.6)', // 经济
              'rgba(54, 162, 235, 0.6)'  // 艺术
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
    navigateTo(menu) {
      console.log(`Navigating to: ${menu}`);
      // 实际的导航逻辑
    },
    // 图像修改事件
    onFileChange(event) {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
          this.studentForm.学生照片 = e.target.result; // 将图片的 URL 存储到学生表单中
        };
        reader.readAsDataURL(file); // 读取文件为 Data URL
        console.log("图片选择：")
        console.log(this.studentForm.学生照片);
        console.log(file)
        console.log(this.studentForm)
        console.log("文件大小:")
        console.log(file.size / 1024 / 1024 + "M")
      }
    },
    truncateText(text) {
      return text.length > 10 ? text.substring(0, 10) + '...' : text;
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
.fade-leave-to /* .fade-leave-active in <2.1.8 */
{
  opacity: 0;
}

.object-cover {
  object-fit: cover; /* 确保内容覆盖元素 */
}


.rounded-md {
  border-radius: 0.375rem; /* 分别定义元素粗细边框和圆角 */
}


</style>
