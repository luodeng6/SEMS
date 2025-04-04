<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <div class="flex gap-4">
          <el-input
              v-model="searchKeyword"
              clearable
              placeholder="搜索项目名称"
              style="width: 240px"
          />
          <el-select
              v-model="selectedType"
              clearable
              placeholder="项目类型"
          >
            <el-option
                v-for="item in typeOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
            />
          </el-select>
        </div>
        <el-button type="default" size="mini" @click="handleAdd">新增项目</el-button>
      </header>

      <!-- 表格数据使用分页后的数据 -->
      <el-table v-loading="loading" :data="paginatedProjects" border
                class="w-full"
                element-loading-background="rgba(255, 255, 255, 0.8)"
                element-loading-spinner="el-icon-loading"
                element-loading-text="加载中...">
        <el-table-column align="center" label="ID" prop="ID" width="80"/>
        <el-table-column label="姓名" min-width="140" prop="XSXM"/>
        <el-table-column label="项目名称" min-width="180" prop="XMMC"/>
        <el-table-column label="项目内容" min-width="240" prop="XMNR">
          <template #default="{row}">
            {{ row.XMNR.slice(0, 20) + '...' }}
          </template>
        </el-table-column>
        <el-table-column label="类型" prop="XMLX" width="120">
          <template #default="{row}">
            <el-tag :type="typeTagMap[row.XMLX]">{{ row.XMLX }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="录入时间" prop="CJSJ" width="180">
          <template #default="{row}">
            <span>{{ formatDate(row.CJSJ) }}</span>
          </template>
        </el-table-column>
        <el-table-column label="附件" width="100">
          <template slot-scope="scope">
            <el-link v-if="scope.row.XMFJ" :href="ServerIP()+scope.row.XMFJ" target="_blank" type="primary">查看</el-link>
            <div v-else style="color: red;font-size: 14px;text-align: left;">暂无附件</div>
          </template>
        </el-table-column>
        <el-table-column align="center" fixed="right" label="操作" width="160">
          <template #default="{row}">
            <el-button size="mini" type="default" @click="uploadFjFile(row)">上传附件</el-button><br/>
            <el-button size="mini" @click="handleEdit(row)">编辑</el-button><br/>
            <el-button size="mini" type="danger" @click="handleDelete(row.ID)">删除</el-button><br/>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页组件 -->
      <el-pagination
          :current-page="currentPage"
          :page-size="pageSize"
          :total="filteredProjects.length"
          background
          layout="prev, pager, next, jumper"
          style="margin-top: 20px; text-align: right;"
          @current-change="handlePageChange"
      ></el-pagination>

      <!-- 新增/编辑对话框 -->
      <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="600px">
        <el-form ref="form" :model="formData" :rules="rules" label-width="100px">
          <el-form-item label="项目名称" prop="XMMC">
            <el-input v-model="formData.XMMC" placeholder="请输入项目名称"/>
          </el-form-item>
          <el-form-item label="项目内容" prop="XMNR">
            <el-input
                v-model="formData.XMNR"
                :rows="4"
                placeholder="请输入项目内容"
                type="textarea"
            />
          </el-form-item>


          <el-form-item label="项目类型" prop="XMLX">
            <el-select v-model="formData.XMLX" placeholder="请选择">
              <el-option
                  v-for="item in typeOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
              />
            </el-select>
          </el-form-item>
        </el-form>
        <span slot="footer">

          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitForm">确认</el-button>
        </span>
      </el-dialog>
      <el-dialog :visible.sync="isShowZsFjDialog" title="上传证书附件" width="600px">

        <el-upload
            :auto-upload="false"
            :before-upload="beforeUpload"
            :limit="1"
            :on-change="handZsFjChange"
        >
          <el-button size="small" type="primary">点击上传</el-button>
          <div slot="tip" class="el-upload__tip">支持各种文件，大小不超过10MB</div>
        </el-upload>
        <span slot="footer">
              <el-button type="primary" @click="uploadZsFj2Server">上传</el-button>
              <el-button @click="resetForm">重置</el-button>
            </span>
      </el-dialog>

    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";
import {ServerIP} from "@/SystemConfig";

export default {
  name: 'StudentProject',
  components: {StudentMenu},
  data() {
    return {
      uploadID:null,
      isShowZsFjDialog: false,
      CGFJFile: null,// 上传的附件
      loading: false,
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      searchKeyword: '',
      selectedType: '',
      projects: [],
      dialogVisible: false,
      dialogType: 'add',
      formData: {
        XMMC: '',
        XMNR: '',
        XMLX: ''
      },
      typeOptions: [
        {value: '科研', label: '科研项目'},
        {value: '竞赛', label: '学科竞赛'},
        {value: '实践', label: '社会实践'}
      ],
      typeTagMap: {
        '科研': 'success',
        '竞赛': 'warning',
        '实践': 'info'
      },
      rules: {
        XMMC: [{required: true, message: '请输入项目名称', trigger: 'blur'}],
        XMNR: [{required: true, message: '请输入项目内容', trigger: 'blur'}],
        XMLX: [{required: true, message: '请选择项目类型', trigger: 'change'}]
      },
      // 分页相关数据
      currentPage: 1,
      pageSize: 10
    }
  },
  computed: {
    // 筛选条件下的数据
    filteredProjects() {
      return this.projects.filter(item => {
        const matchKeyword = item.XMMC.includes(this.searchKeyword) ||
            item.XMNR.includes(this.searchKeyword);
        const matchType = this.selectedType ? item.XMLX === this.selectedType : true;
        return matchKeyword && matchType;
      });
    },
    // 分页后的数据
    paginatedProjects() {
      const start = (this.currentPage - 1) * this.pageSize;
      return this.filteredProjects.slice(start, start + this.pageSize);
    },
    dialogTitle() {
      return this.dialogType === 'add' ? '新增项目' : '编辑项目';
    }
  },
  watch: {
    // 当搜索或筛选条件变化时重置到第一页
    searchKeyword() {
      this.currentPage = 1;
    },
    selectedType() {
      this.currentPage = 1;
    }
  },
  created() {
    this.getLoginUserInfo();

  },
  methods: {
    ServerIP() {
      return ServerIP
    },
    uploadZsFj2Server(){
      console.log(this.uploadID);
      console.log(this.CGFJFile);
      let dataForm = new FormData();
      dataForm.append('id', this.uploadID);
      dataForm.append('cgfj', this.CGFJFile);
      axios.post("/xmcgk/uploadFile",dataForm).then(response => {
        if (response.data.result) {
          this.$message.success('上传成功');
          this.isShowZsFjDialog = false;
          } else {
          this.$message.error('上传失败:' + response.data.msg);
          }
      }).catch(error => {
        console.log(error);
        this.$message.error('上传失败:'+error.message);
      });
    },
    handZsFjChange(file) {
      this.CGFJFile = file.raw;
    },
    beforeUpload(file) {
      const isLt10M = file.size / 1024 / 1024 < 10
      if (!isLt10M) {
        this.$message.error('上传文件大小不能超过 10MB!')
      }
      return isLt10M
    },
    // 上传附件
    uploadFjFile(row) {
      console.log(row);
      this.uploadID = row.ID;
      this.isShowZsFjDialog = true;
    },
    // 获取学生信息
    getStudentDataByUsername(yhm) {
      axios.get(`/student/getStudentByUsernameOrId?usernameOrId=${yhm}&type=username`).then(response => {
        if (response.data.result) {
          this.UserInfo.id = response.data.data.id;
          this.getProjectDATA();
        } else {
          this.$message.error("获取学生信息失败:" + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取学生信息失败，网络错误！");
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
          this.getStudentDataByUsername(this.UserInfo.username);

        }
      } catch (error) {
        console.error('获取用户信息失败，网络错误！', error);
        this.handleAuthFailure();
      }
    },
    handleAuthFailure() {
      EventBus.$emit('show-auth-popup');
      setTimeout(() => {
        this.$router.push({name: 'StudentLoginView'});
      }, 1000);
    },
    // 学生获取项目数据
    getProjectDATA() {
      axios.get("/xmcgk/getXmcgk?QYDM=2&ISGETALL=0&STUID=" + this.UserInfo.id).then(response => {
        if (response.data.result) {
          this.projects = response.data.data;
          this.loading = false;
        } else {
          this.$message.error("获取项目数据失败:" + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取项目数据失败，网络错误！");
      });
    },
    handleAdd() {
      this.dialogType = 'add';
      this.formData = {XMMC: '', XMNR: '', XMLX: ''};
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.$refs.form.clearValidate();
      });
    },
    handleEdit(row) {
      this.dialogType = 'edit';
      this.formData = {...row};
      this.dialogVisible = true;
    },
    formatDate(dateStr) {
      return dateStr ? new Date(dateStr).toLocaleString() : '-'
    },
    handleDelete(id) {
      this.$confirm('确认删除该项目？', '提示', {
        type: 'warning'
      }).then(() => {
        this.projects = this.projects.filter(item => item.ID !== id);
        this.$message.success('删除成功');
      });
    },
    submitForm() {
      this.$refs.form.validate(valid => {
        if (valid) {
          if (this.dialogType === 'add') {
            this.projects.unshift({
              ...this.formData,
              ID: this.projects.length + 1,
              CJSJ: new Date().toLocaleString(),
              STUID: `202300${this.projects.length + 1}`,
              QYDM: `A0${(this.projects.length % 3) + 1}`
            });
            console.log(this.formData);
            let dataForm = new FormData();
            dataForm.append('xmmc', this.formData.XMMC);
            dataForm.append('xmnr', this.formData.XMNR);
            dataForm.append('xmlx', this.formData.XMLX);
            dataForm.append('stuid', this.UserInfo.id);
            axios.post("/xmcgk/InsertXmcgk", dataForm).then(response => {
              if (response.data.result) {
                this.$message.success('新增成功');
              } else {
                this.$message.error('新增失败:' + response.data.msg);
              }
            }).catch(error => {
              console.log(error);
              this.$message.error('新增失败，网络错误！');
            });


          } else {
            const index = this.projects.findIndex(item => item.ID === this.formData.ID);
            this.projects.splice(index, 1, this.formData);
          }
          this.dialogVisible = false;
          this.$message.success('操作成功');
        }
      });
    },
    // 分页页码变化的处理函数
    handlePageChange(newPage) {
      this.currentPage = newPage;
    }
  }
}
</script>

<style scoped>
/*.el-table {
  margin-top: 20px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.1);
}*/

.el-tag {
  margin: 2px;
}
</style>
