<template>
  <div class="content">
    <div>
      <teacher_menu></teacher_menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4 bg">
        学生面试管理
      </header>

      <!-- 数据统计 -->
      <div class="stats-container mb-4">
        <el-row :gutter="20">
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">总面试数</div>
              <div class="stat-value">{{ tableData.length }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">通过数</div>
              <div class="stat-value">{{ tableData.filter(item=>item.MSZT===4&&item.MSJG==='录用').length }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">面试中</div>
              <div class="stat-value">{{ tableData.filter(item=>item.MSZT===3).length  }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="stat-card shadow-none">
              <div class="stat-title">未通过</div>
              <div class="stat-value">{{ tableData.filter(item=>item.MSZT===4&&item.MSJG==='不录用').length}}</div>
            </div>
          </el-col>
        </el-row>
      </div>
      <header class="flex justify-between items-center mb-4">
        <div class="flex gap-2">
          <el-input
              v-model="searchParams.STUDENTNAME"
              placeholder="学生姓名"
              style="width: 200px"
              clearable
          />
          <el-input
              v-model="searchParams.COMPANY"
              placeholder="单位名称"
              style="width: 200px"
              clearable
          />
          <el-select
              v-model="searchParams.STATUS"
              placeholder="状态筛选"
              clearable
          >
            <el-option
                v-for="item in statusOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
            />
          </el-select>
          <el-button type="default" size="mini" @click="handleSearch">查询</el-button>

          <el-checkbox v-model="isShowStuImg" label="显示学生图片" />
        </div>
        <el-button type="default" size="mini" @click="handleAdd">安排新面试</el-button>
      </header>
<!--      "MSDM": 1,
      "XSDM": 1211,
      "DWDM": 58,
      "GWDM": 34,
      "MSSJ": "2025-03-10T03:00:00.000+00:00",
      "MSZT": 4,
      "FQZ": "msk",
      "FQZXM": "Elon Reeve Musk",
      "FQZSFDM": 3,
      "FQSJ": "2025-03-09T14:21:03.630+00:00",
      "QYDM": 1,
      "QRDM": 1,
      "MSDD": "麻栗坡",
      "GWMC": "特斯拉销售代表",
      "TDSM": "请通过特斯拉官网的招聘页面提交申请，面试将通过电话和面对面两种方式进行。",
      "GSMC": "特斯拉科技股份有限公司",
      "DWMC": "特斯拉（Tesla）",
      "XSXM": "苏晨聪",
      "XSXB": "男",
      "BIRTH": "2001-09-11",
      "SSBJ": 1292,
      "BJMC": "2021级信息管理与信息系统",
      "SSNJ": "2021",
      "ZZMM": "群众",
      "JYZT": 1002,
      "XSZP": "/img/upload/Userpofile/20213260035_1740223350808_.jpeg",
      "FZJS": 0,
      "FZJSMC": null,
      "MZ": "汉族",
      "MSPJ": 70,
      "HRZJ": "录用",
      "MSJG": "录用"-->
      <el-table :data="pagedData" border stripe style="width: 100%">
        <el-table-column type="expand" width="100">
          <template slot-scope="props">
            <el-form label-position="left" inline class="demo-table-expand">
              <el-form-item label="面试结果:">
                <span>{{ props.row.MSJG }}</span>
              </el-form-item>
            </el-form>
          </template>
        </el-table-column>
        <el-table-column prop="XSXH" label="学号" width="120" />
        <el-table-column prop="XSXM" label="姓名" width="120" />
        <el-table-column label="图片" width="120"  v-if="isShowStuImg" align="center">
          <template #default="{ row }">
            <el-image
                style="width: 80px; height: 100px"
                :src="row.XSZP"
                :preview-src-list="[row.XSZP]"
                fit="cover">
            </el-image>
          </template>
        </el-table-column>
        <el-table-column prop="XSXB" label="性别" width="70" />
        <el-table-column prop="BJMC" label="班级" width="170" />
        <el-table-column prop="SSNJ" label="年级" width="70" />
        <el-table-column prop="DWMC" label="应聘单位" width="200" />
        <el-table-column prop="GWMC" label="应聘岗位" width="200" />
        <el-table-column prop="FQZXM" label="面试官" width="100" />
        <el-table-column prop="MSDD" label="面试地点" width="200" />
        <el-table-column label="面试时间" sortable width="180">
          <template #default="{row}">
            {{ row.MSSJ | timeFormat }}
          </template>
        </el-table-column>
        <el-table-column label="状态" width="150">
          <template #default="{row}">
            <el-tag :type="statusTagType(row.MSZT)">
              {{ row.MSZT | statusText }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="MSJG" label="面试结果" width="200" >
          <template #default="{row}">
           {{ row.MSJG|| '暂无' }}
          </template>
        </el-table-column>
        <el-table-column label="操作" width="250" fixed="right">
          <template #default="{row}">
            <el-button size="mini" @click="handleDetail(row)">详情</el-button>
            <el-button size="mini" type="warning" :disabled="[4,5].includes(row.MSZT)" @click="handleEdit(row)">编辑</el-button>
            <el-button size="mini" type="success" :disabled="row.MSZT !== 3" @click="handleInputResult(row)">录入结果</el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-pagination
          class="pagination"
          :current-page="currentPage"
          :page-sizes="[10, 20, 50]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next"
          :total="filteredData.length"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
      />

      <!-- 结果录入对话框 -->
      <el-dialog title="录入面试结果" :visible.sync="resultDialogVisible">
        <el-form :model="resultForm" label-width="100px">
          <el-form-item label="面试结果" prop="MSJG">
            <el-select v-model="resultForm.MSJG" placeholder="请选择">
              <el-option
                  v-for="item in resultOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="面试评价">
            <el-input
                v-model="resultForm.MSPJ"
                type="textarea"
                :rows="4"
                placeholder="请输入面试评价"
            />
          </el-form-item>
          <el-form-item label="HR总结">
            <el-input
                v-model="resultForm.HRZJ"
                type="textarea"
                :rows="4"
                placeholder="请输入HR总结"
            />
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="resultDialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitResult">确认</el-button>
        </div>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import teacher_menu from "@/components/teacher/Teacher_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";

export default {
  name: 'InterviewManagement',
  components: { teacher_menu },
  filters: {
    // 面试状态：1单位已安排（待学生确认），2学生已确认，3开始面试（面试中，待录入结果） 4已录入结果（关闭面试）    5 面试关闭（无法修改任何信息）
    statusText(value) {
      const map = {
        1: '待学生确认',
        2: '待开始面试',
        3: '面试进行中',
        4: '已录入结果',
        5: '面试已关闭'
      }
      return map[value] || '未知状态'
    },
    timeFormat(value) {
      return new Date(value).toLocaleString()
    }
  },
  data() {
    return {
      isShowStuImg: true,
      searchParams: {
        STUDENTNAME: '',
        COMPANY: '',
        STATUS: null
      },
      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      currentPage: 1,
      pageSize: 10,
      tableData: [], // 实际应从接口获取
      resultDialogVisible: false,
      resultForm: {
        MSJG: '',
        MSPJ: '',
        HRZJ: ''
      },
      statusOptions: [
        { value: 1, label: '待确认' },
        { value: 2, label: '已确认' },
        { value: 3, label: '面试中' },
        { value: 4, label: '已完成' },
        { value: 5, label: '已关闭' }
      ],
      resultOptions: [
        { value: 1, label: '通过' },
        { value: 2, label: '待定' },
        { value: 3, label: '不通过' }
      ]
    }
  },
  computed: {
    filteredData() {
      return this.tableData.filter(item => {
        return (
            (!this.searchParams.STUDENTNAME || item.STUDENTNAME.includes(this.searchParams.STUDENTNAME)) &&
            (!this.searchParams.COMPANY || item.DWDM.includes(this.searchParams.COMPANY)) &&
            (!this.searchParams.STATUS || item.MSZT === this.searchParams.STATUS)
        )
      })
    },
    pagedData() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.filteredData.slice(start, end);
    }
  },

  methods: {
    getMsdata(){
      // 从接口获取数据
      axios.get(`/msdmk/getAllInterviews?yhm=${this.UserInfo.username}&yhsfdm=2`).then(res => {
        this.tableData = res.data.data;
      }).catch(err => {
        console.log(err);
        this.$message.error('获取面试数据失败:'+ err.message);
      });
    },
    statusTagType(status) {
      const typeMap = {
        1: 'warning',
        2: 'primary',
        3: 'success',
        4: 'info',
        5: 'danger'
      }
      return typeMap[status] || ''
    },
    async getLoginUserInfo() {
      this.isLoading = true;
      try {
        const response = await axios.get('/user/checkSession');
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({name: 'TeacherLoginView'});
          }, 1000);
        } else {
          console.log('登录成功-----！');
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.getMsdata();
        }
      } catch (error) {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'TeacherLoginView'});
        }, 1000);
      }
    },
    handleSearch() {
      this.currentPage = 1;
    },
    handleAdd() {
      // 跳转到新建面试页面
    },
    handleDetail(row) {
      // 显示详情逻辑
    },
    handleEdit(row) {
      // 编辑逻辑
    },
    handleInputResult(row) {
      this.resultForm = { ...row };
      this.resultDialogVisible = true;
    },
    submitResult() {
      // 提交结果逻辑
      this.resultDialogVisible = false;
      this.$message.success('结果提交成功');
    },
    handleSizeChange(val) {
      this.pageSize = val;
    },
    handleCurrentChange(val) {
      this.currentPage = val;
    }
  },
  created() {
    this.getLoginUserInfo();
  }
}
</script>

<style scoped>
.container {
  padding: 20px;
}
.pagination {
  margin-top: 20px;
  text-align: right;
}



.content {
  padding: 20px;
}

.stat-card {
  background: #fff;
  padding: 20px;
  border-radius: 4px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
}

.stat-title {
  color: #909399;
  font-size: 14px;
  margin-bottom: 8px;
}

.stat-value {
  font-size: 24px;
  color: #303133;
}

.el-pagination {
  justify-content: flex-end;
}
</style>
