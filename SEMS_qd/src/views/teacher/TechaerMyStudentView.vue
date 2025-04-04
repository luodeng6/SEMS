<template>
  <div class="content">
    <div>
      <teacher_menu></teacher_menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold text-gray-800">学生信息管理</h1>
        <div class="flex items-center space-x-4">
          <el-button icon="el-icon-plus" type="primary" @click="handleAdd">新增学生</el-button>
          <el-button icon="el-icon-download">导出数据</el-button>
        </div>
      </header>

      <!-- 统计模块 -->
      <div class="grid grid-cols-4 gap-4 mb-6">
        <el-card class="bg-gradient-to-r from-blue-400 to-blue-200" shadow="hover">
          <div class="flex items-center justify-between text-white">
            <div>
              <div class="text-sm">总学生数</div>
              <div class="text-3xl font-bold">{{ statistics.total }}</div>
            </div>
            <i class="el-icon-user text-4xl opacity-50"></i>
          </div>
        </el-card>
        <el-card class="bg-gradient-to-r from-green-400 to-green-200" shadow="hover">
          <div class="flex items-center justify-between text-white">
            <div>
              <div class="text-sm">男生人数</div>
              <div class="text-3xl font-bold">{{ statistics.male }}</div>
            </div>
            <i class="el-icon-male text-4xl opacity-50"></i>
          </div>
        </el-card>
        <el-card class="bg-gradient-to-r from-pink-400 to-pink-200" shadow="hover">
          <div class="flex items-center justify-between text-white">
            <div>
              <div class="text-sm">女生人数</div>
              <div class="text-3xl font-bold">{{ statistics.female }}</div>
            </div>
            <i class="el-icon-female text-4xl opacity-50"></i>
          </div>
        </el-card>
        <el-card class="bg-gradient-to-r from-purple-400 to-purple-200" shadow="hover">
          <div class="flex items-center justify-between text-white">
            <div>
              <div class="text-sm">就业率</div>
              <div class="text-3xl font-bold">{{ statistics.employmentRate }}%</div>
            </div>
            <i class="el-icon-data-analysis text-4xl opacity-50"></i>
          </div>
        </el-card>
      </div>

      <!-- 搜索和过滤 -->
      <div class="mb-4 bg-white p-4 rounded">
        <el-row :gutter="20">
          <el-col :span="4">
            <el-input v-model="searchQuery" clearable placeholder="姓名/学号">
              <template #prefix>
                <i class="el-icon-search"></i>
              </template>
            </el-input>
          </el-col>
          <el-col :span="4">
            <el-select v-model="selectedClass" clearable placeholder="班级">
              <el-option
                  v-for="item in classOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
              </el-option>
            </el-select>
          </el-col>
          <el-col :span="4">
            <el-select v-model="selectedEmployment" clearable placeholder="就业状态">
              <el-option
                  v-for="item in JYZTTYPLE"
                  :key="item.JYZTDM"
                  :label="item.JYZTMC"
                  :value="item.JYZTMC">
              </el-option>
            </el-select>
          </el-col>
          <el-col :span="4">
            <el-select v-model="selectedMajor" clearable placeholder="专业">
              <el-option
                  v-for="major in majorOptions"
                  :key="major"
                  :label="major"
                  :value="major">
              </el-option>
            </el-select>
          </el-col>
          <el-col :span="4">
            <el-select v-model="selectedGender" clearable placeholder="性别">
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
          </el-col>
        </el-row>
      </div>

      <!-- 数据表格 -->
      <el-table
          v-loading="loading"
          :data="filteredStudents"
          class="w-full rounded-lg overflow-hidden"
          element-loading-background="rgba(255, 255, 255, 0.8)"
          element-loading-spinner="el-icon-loading"
          element-loading-text="加载中..."
          style="width: 100%">
        <el-table-column label="学号" prop="XSXH" width="160"></el-table-column>
        <el-table-column label="姓名" prop="XSXM" width="120"></el-table-column>
        <el-table-column label="学生照片" width="120"  align="center"  prop="XSZP">
          <template #default="{ row }">
            <el-image
                style="width: 80px; height: 100px"
                :src="row.XSZP"
                :preview-src-list="[row.XSZP]"
                fit="cover">
            </el-image>
          </template>
        </el-table-column>
        <el-table-column label="性别" prop="XSXB" width="80">
          <template #default="{row}">
            {{ row.XSXB === 1 ? '男' : '女' }}
          </template>
        </el-table-column>
        <el-table-column label="班级" prop="BJMC"></el-table-column>
        <el-table-column label="专业" prop="ZYMC"></el-table-column>
        <el-table-column label="学制" prop="XZ"></el-table-column>
        <el-table-column label="学历" prop="XLMC"></el-table-column>
        <el-table-column label="负责教师" prop="JSMC"></el-table-column>
        <el-table-column label="就业状态" prop="JYZT">
          <template #default="{row}">
            <el-tag :type="getJyztType(row.JYZT)">
              {{ row.JYZT }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180">
          <template #default="{row}">
            <el-button size="mini" @click="handleEdit(row)">编辑</el-button>
            <el-button size="mini" type="danger" @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页 -->
      <div class="mt-4 flex justify-end">
        <el-pagination
            :page-size="pageSize"
            :page-sizes="[4, 5, 6]"
            :total="filteredTotal"
            background
            layout="total, sizes, prev, pager, next"
            @current-change="handlePageChange"
            @size-change="handleSizeChange">
        </el-pagination>
      </div>

      <!-- 编辑/新增对话框 -->
      <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="600px">
        <el-form ref="studentForm" :model="currentStudent" :rules="rules" label-width="100px">
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="学生姓名" prop="XSXM">
                <el-input v-model="currentStudent.XSXM"></el-input>
              </el-form-item>
              <el-form-item label="性别" prop="XSXB">
                <el-radio-group v-model="currentStudent.XSXB">
                  <el-radio :label="1">男</el-radio>
                  <el-radio :label="0">女</el-radio>
                </el-radio-group>
              </el-form-item>
              <el-form-item label="身份证号" prop="SFZH">
                <el-input v-model="currentStudent.SFZH"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="所属班级" prop="SSBJ">
                <el-select v-model="currentStudent.SSBJ" placeholder="请选择班级">
                  <el-option
                      v-for="item in classOptions"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="就业状态" prop="JYZT">
                <el-select v-model="currentStudent.JYZT" placeholder="请选择状态">
                  <el-option
                      v-for="item in JYZTTYPLE"
                      :key="item.JYZTDM"
                      :label="item.JYZTMC"
                      :value="item.JYZTMC">
                  </el-option>
                </el-select>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
        <span slot="footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitForm">确定</el-button>
        </span>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import teacher_menu from "@/components/teacher/Teacher_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";

export default {
  components: {teacher_menu},
  data() {
    return {
      JYZTTYPLE: [],
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      loading: false,
      searchQuery: '',
      selectedClass: '',
      selectedEmployment: '',
      selectedMajor: '',
      selectedGender: '',
      pageSize: 4,
      currentPage: 1,
      dialogVisible: false,
      dialogTitle: '新增学生',
      currentStudent: this.emptyStudent(),
      classOptions: [
        {value: '2021-01', label: '2021级计算机1班'},
        {value: '2021-02', label: '2021级计算机2班'},
        {value: '2022-01', label: '2022级软件工程1班'}
      ],
      rules: {
        XSXM: [{required: true, message: '请输入姓名', trigger: 'blur'}],
        XSXB: [{required: true, message: '请选择性别', trigger: 'change'}],
        SFZH: [
          {required: true, message: '请输入身份证号', trigger: 'blur'},
          {pattern: /^\d{17}[\dXx]$/, message: '身份证格式不正确'}
        ]
      },
      students: []
    }
  },
  computed: {
    majorOptions() {
      return [...new Set(this.students.map(item => item.ZYMC))];
    },
    filteredStudents() {
      return this.students.filter(s => {
        const matchesSearch = s.XSXM.includes(this.searchQuery) || s.XSXH.includes(this.searchQuery);
        const matchesClass = this.selectedClass ? s.SSBJ === this.selectedClass : true;
        const matchesEmployment = this.selectedEmployment ? s.JYZT === this.selectedEmployment : true;
        const matchesMajor = this.selectedMajor ? s.ZYMC === this.selectedMajor : true;
        const matchesGender = this.selectedGender !== '' ? s.XSXB=== this.selectedGender : true;

        return matchesSearch && matchesClass && matchesEmployment && matchesMajor && matchesGender;
      }).slice((this.currentPage - 1) * this.pageSize, this.currentPage * this.pageSize);
    },
    statistics() {
      const total = this.students.length;
      const male = this.students.filter(s => s.XSXB === '男').length;
      const employed = this.students.filter(s => s.JYZT === '已就业').length;
      return {
        total,
        male,
        female: total - male,
        employmentRate: total > 0 ? ((employed / total) * 100).toFixed(2) : 0
      }
    },
    filteredTotal() {
      return this.students.filter(s => {
        const matchesSearch = s.XSXM.includes(this.searchQuery) || s.XSXH.includes(this.searchQuery);
        const matchesClass = this.selectedClass ? s.SSBJ === this.selectedClass : true;
        const matchesEmployment = this.selectedEmployment ? s.JYZT === this.selectedEmployment : true;
        const matchesMajor = this.selectedMajor ? s.ZYMC === this.selectedMajor : true;
        const matchesGender = this.selectedGender !== '' ? s.XSXB.toString() === this.selectedGender : true;

        return matchesSearch && matchesClass && matchesEmployment && matchesMajor && matchesGender;
      }).length;
    }
  },
  mounted() {
    this.getLoginUserInfo();
    this.getJtztDmk();
  },
  methods: {
    getJyztType(JYZT){
      switch (JYZT) {
        case '已就业': return 'success';
        case '未就业': return 'warning';
        case '实习中': return 'info';
        case '已签定第三方': return 'success';
        default: return '';
      }
    },
    getJtztDmk() {
      axios.get("/jyztdmk/getAllJyztdmk").then(response => {
        if (response.data.result) {
          this.JYZTTYPLE = response.data.data;
        } else {
          console.error('获取就业状态数据失败');
          this.$message.error('获取就业状态数据失败');
        }
      }).catch(error => {
        console.error('获取就业状态数据失败', error);
        this.$message.error('获取数据失败');
      });
    },
    async getLoginUserInfo() {
      try {
        this.loading = true;
        const response = await axios.get('/user/checkSession');
        if (!response.data.result) {
          this.handleAuthFailure(response.data.msg);
        } else {
          this.UserInfo = {
            name: response.data.name,
            role: response.data.role,
            username: response.data.username
          };
          this.loadStudents();
        }
      } catch (error) {
        console.error('获取用户信息失败', error);
        this.handleAuthFailure();
      }
    },
    handleAuthFailure() {
      EventBus.$emit('show-auth-popup');
      setTimeout(() => {
        this.$router.push({name: 'StudentLoginView'});
      }, 1000);
    },
    loadStudents() {
      this.loading = true;
      axios.get(`/student/getStudentDataNewInterface?YHM=${this.UserInfo.username}&YHSFDM=3&QYDM=2`)
          .then(response => {
            this.students = response.data.data;
            this.loading = false;
          })
          .catch(error => {
            console.error('加载学生数据失败', error);
            this.loading = false;
            this.handleAuthFailure();
          });
    },
    handleAdd() {
      this.currentStudent = this.emptyStudent();
      this.dialogTitle = '新增学生';
      this.dialogVisible = true;
    },
    handleEdit(row) {
      this.currentStudent = {...row};
      this.dialogTitle = '编辑学生信息';
      this.dialogVisible = true;
    },
    handleDelete(row) {
      this.$confirm('确定删除该学生记录吗？', '提示', {
        type: 'warning'
      }).then(() => {
        const index = this.students.findIndex(s => s.XSXH === row.XSXH);
        this.students.splice(index, 1);
      });
    },
    submitForm() {
      this.$refs.studentForm.validate(valid => {
        if (valid) {
          if (this.currentStudent.isNew) {
            this.students.push({...this.currentStudent, XSXH: Date.now().toString()});
          } else {
            const index = this.students.findIndex(s => s.XSXH === this.currentStudent.XSXH);
            this.students.splice(index, 1, this.currentStudent);
          }
          this.dialogVisible = false;
        }
      });
    },
    emptyStudent() {
      return {
        XSXH: '',
        XSXM: '',
        XSXB: 1,
        SSBJ: '',
        JYZT: '未就业',
        ZYMC: '',
        SFZH: '',
        isNew: true
      }
    },
    handlePageChange(page) {
      this.currentPage = page;
    },
    handleSizeChange(size) {
      this.pageSize = size;
      this.currentPage = 1;
    }
  }
}
</script>

<style scoped>
.el-card {
  @apply border-0;
}

.el-table::before {
  height: 0;
}
</style>