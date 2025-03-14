<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1>{{UserInfo.name}}的成绩单</h1>
      </header>
      <!-- 筛选、导出及分页开关 -->
      <div class="mb-4 flex justify-between items-center">
        <div class="flex items-center">
          <el-input
              v-model="filterText"
              placeholder="请输入关键词进行筛选"
              clearable
              style="width: 300px; margin-right: 20px;"
              @input="handleFilter"
          ></el-input>
          <el-switch
              v-model="enablePagination"
              active-text="启用分页"
              inactive-text="禁用分页"
          ></el-switch>
        </div>
        <el-button type="primary" @click="exportData">导出数据</el-button>
      </div>
      <!-- 成绩列表 -->
      <el-table :data="displayedScores" style="width: 100%" border :v-loading="isLoading">
        <el-table-column prop="ID" label="编号" width="80"></el-table-column>
        <el-table-column prop="STUID" label="学号" width="120"></el-table-column>
        <el-table-column prop="KCMC" label="课程名称"></el-table-column>
        <el-table-column prop="KCXZ" label="课程性质" width="200"></el-table-column>
        <el-table-column prop="XF" label="学分" width="80"></el-table-column>
        <el-table-column prop="JD" label="绩点" width="80"></el-table-column>
        <el-table-column prop="CJXZ" label="成绩性质" width="100"></el-table-column>
        <el-table-column prop="KCCJ" label="课程成绩" width="100"></el-table-column>
        <el-table-column prop="SKJS" label="授课教师"></el-table-column>
        <el-table-column prop="QYDM" label="启用代码" width="100"></el-table-column>
      </el-table>
      <!-- 分页组件 -->
      <div class="pagination-container" v-if="enablePagination && filteredScores.length">
        <el-pagination
            background
            layout="prev, pager, next, jumper"
            :current-page="currentPage"
            :page-size="pageSize"
            :total="filteredScores.length"
            @current-change="handlePageChange"
        ></el-pagination>
      </div>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import axios from "axios";
import { EventBus } from "@/event-bus";

export default {
  name: "StudentInfo",
  components: { StudentMenu },
  data() {
    return {
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: ''
      },
      scoreList: [],      // 成绩列表
      isLoading: false,
      filterText: '',     // 筛选关键词
      enablePagination: true, // 是否启用分页功能
      currentPage: 1,         // 当前页码
      pageSize: 10            // 每页显示条数
    };
  },
  computed: {
    // 根据筛选关键词过滤成绩列表
    filteredScores() {
      if (!this.filterText) return this.scoreList;
      return this.scoreList.filter(item => {
        return Object.keys(item).some(key => {
          return String(item[key]).toLowerCase().includes(this.filterText.toLowerCase());
        });
      });
    },
    // 根据是否启用分页返回表格显示数据
    displayedScores() {
      if (this.enablePagination) {
        const start = (this.currentPage - 1) * this.pageSize;
        const end = this.currentPage * this.pageSize;
        return this.filteredScores.slice(start, end);
      } else {
        return this.filteredScores;
      }
    }
  },
  watch: {
    // 当筛选关键词或分页开关改变时，重置页码为1
    filterText() {
      this.currentPage = 1;
    },
    enablePagination(newVal, oldVal) {
      if (newVal !== oldVal) {
        this.currentPage = 1;
      }
    }
  },
  mounted() {
    this.getLoginUserInfo();
  },
  methods: {
    // 获取成绩列表
    async fetchScores() {
      try {
        this.isLoading = true;
        const response = await axios.get(
            `/xscjdk/getXscjdk?QYDM=2&YHSFDM=4&YHM=${this.UserInfo.username}&STUID=-1`
        );
        this.isLoading = false;
        if (response.data.result) {
          this.scoreList = response.data.data;
        } else {
          this.$confirm('获取数据失败：' + response.data.msg, '提示', {
            type: 'error',
            showCancelButton: false
          });
        }
      } catch (error) {
        this.isLoading = false;
        this.$confirm('获取数据失败：' + error, '提示', {
          type: 'error',
          showCancelButton: false
        });
      }
    },
    async getLoginUserInfo() {
      this.isLoading = true;
      try {
        const response = await axios.get('/user/checkSession');
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({ name: 'DwLoginView' });
          }, 1000);
        } else {
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.fetchScores();
        }
      } catch (error) {
        EventBus.$emit('show-auth-popup');
        setTimeout(() => {
          this.$router.push({ name: 'DwLoginView' });
        }, 1000);
      } finally {
        this.isLoading = false;
      }
    },
    // 筛选方法（目前由 computed 属性自动响应）
    handleFilter() {
      // 可在此扩展其他逻辑
    },
    // 分页页码改变时的回调
    handlePageChange(page) {
      this.currentPage = page;
    },
    getKccjLevel(kccj) {
      switch (true) {
        case kccj< 45:
          return "重修";
          break;
        case kccj < 60:
          return "及格";
          break;
        case kccj  < 90:
          return "合格";
          break;
        case kccj  >= 90:
          return "优秀";
          break;
        default:
          return "无效";
      }
    },
    // 导出数据为 CSV 文件（导出筛选后的全部数据）
    exportData() {
      let changeTitleData = [];
      let itemData={}
      // 改标题
      for (let i = 0; i < this.filteredScores.length; i++){
        itemData['学生编号']=this.filteredScores[i].STUID;
        itemData['学号']=this.filteredScores[i].XSXH;
        itemData['姓名']=this.filteredScores[i].XSXM;
        itemData['课程名称']=this.filteredScores[i].KCMC;
        itemData['课程性质']=this.filteredScores[i].KCXZ;
        itemData['成绩性质']=this.filteredScores[i].CJXZ;
        itemData['课程成绩']=this.filteredScores[i].KCCJ;
        itemData['等级']=  this.getKccjLevel(this.filteredScores[i].KCCJ);
        itemData['学分']=this.filteredScores[i].XF;
        itemData['绩点']=this.filteredScores[i].JD;
        itemData['专业']=this.filteredScores[i].ZYMC;
        itemData['班级']=this.filteredScores[i].BJMC;

        itemData['授课教师']=this.filteredScores[i].SKJS;
        itemData['有效性']=this.filteredScores[i].QYDM===1?"有效":"无效";
        changeTitleData.push(itemData);
        itemData={}
      }

      const csvContent = this.convertToCSV(changeTitleData);
      const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
      const link = document.createElement("a");
      const url = URL.createObjectURL(blob);
      link.setAttribute("href", url);
      link.setAttribute("download", this.UserInfo.name + "-成绩单.csv");
      link.style.visibility = 'hidden';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    },
    // 将数据转换为 CSV 格式
    convertToCSV(objArray) {
      const array = typeof objArray !== 'object' ? JSON.parse(objArray) : objArray;
      let str = '';
      const headers = Object.keys(array[0] || {});
      str += headers.join(',') + '\r\n';
      array.forEach(item => {
        const line = headers.map(header => `"${item[header]}"`).join(',');
        str += line + '\r\n';
      });
      return str;
    }
  }
};
</script>

<style scoped>
.pagination-container {
  margin-top: 20px;
  text-align: center;
}
.form-container {
  background: #fff;
  padding: 20px;
  border: 1px solid #ebeef5;
  border-radius: 4px;
}
</style>


