<template>
  <div class="content">
    <div>
      <teacher-menu></teacher-menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h2>成绩管理</h2>
      </header>
      <!-- 使用 el-tabs 分离成绩列表和新增/编辑表单 -->
      <el-tabs v-model="activeTab" type="card">
        <!-- 成绩列表 -->
        <el-tab-pane label="成绩列表" name="list">
          <div style="margin-bottom: 10px;">
            <el-button v-show="0" type="primary" @click="handleAdd">新增成绩</el-button>
          </div>
          <!-- 新增搜索框 -->
          <div style="margin-bottom: 10px;">
            <el-input
                v-model="filterText"
                placeholder="输入关键词筛选（学号/姓名/课程名称）"
                clearable
                style="width: 300px; margin-bottom: 10px;">
              <i slot="prefix" class="el-icon-search"></i>
            </el-input>
            <el-button  style="margin-left: 10px;"  type="primary" size="mini" @click="exportData">导出</el-button>
          </div>
          <el-table :data="paginatedList" style="width: 100%" border
                    class="w-full rounded-lg overflow-hidden"
                    element-loading-background="rgba(255, 255, 255, 0.8)"
                    element-loading-spinner="el-icon-loading"
                    element-loading-text="加载中..."
                    :v-loading="isLoading">
            <el-table-column prop="ID" label="编号" width="80"></el-table-column>
            <el-table-column prop="KCCJ" label="评级" width="170">
              <template slot-scope="scope">
                <el-tag type="info" v-if="scope.row.KCCJ >=60 && scope.row.KCCJ <90">及格</el-tag>
                <el-tag type="warning" v-if="scope.row.KCCJ <60 && scope.row.KCCJ >=45">不及格</el-tag>
                <el-tag type="danger" v-if="scope.row.KCCJ <45">严重不及格（重修）</el-tag>
                <el-tag type="success" v-if="scope.row.KCCJ >=90">优秀</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="STUID" label="学号" width="120"></el-table-column>
            <el-table-column prop="XSXM" label="姓名" width="100"></el-table-column>
            <el-table-column prop="KCMC" label="课程名称" width="150"></el-table-column>
            <el-table-column prop="KCXZ" label="课程性质" width="136"></el-table-column>
            <el-table-column prop="XF" label="学分" width="80"></el-table-column>
            <el-table-column prop="JD" label="绩点" width="80"></el-table-column>
            <el-table-column prop="CJXZ" label="成绩性质" width="100"></el-table-column>
            <el-table-column prop="KCCJ" label="课程成绩" width="100"></el-table-column>
            <el-table-column prop="BJMC" label="班级名称" width="200"></el-table-column>
            <el-table-column prop="SKJS" label="授课教师"></el-table-column>
            <el-table-column prop="QYDM" label="是否有效" width="100">
              <template slot-scope="scope">
                <el-tag type="success" v-if="scope.row.QYDM === 1">有效</el-tag>
                <el-tag type="danger" v-else>无效</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="150">
              <template slot-scope="scope">
                <el-button type="text" size="small" @click="handleEdit(scope.row)">编辑</el-button>
                <el-button type="text" style="color: red;" size="small" @click="handleDelete(scope.row)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <!-- 分页 -->
          <el-pagination
              layout="total, sizes, prev, pager, next, jumper"
              :total="filteredScoreList.length"
              :current-page="currentPage"
              :page-size="pageSize"
              :page-sizes="[5, 9,10, 20, 50]"
              @size-change="handleSizeChange"
              @current-change="handlePageChange"
              background
              style="margin-top: 15px; text-align: right;">
          </el-pagination>
        </el-tab-pane>
        <!-- 新增/编辑表单 -->
        <el-tab-pane label="新增/编辑" name="form">
          <div class="form-container">
            <h3>{{ isEditing ? '编辑成绩' : '新增成绩' }}</h3>
            <el-form :model="form" :rules="rules" ref="form" label-width="80px" size="small">
              <el-form-item label="选择学生" prop="STUID">
                <el-select v-model="form.STUID" placeholder="请选择学生" clearable filterable>
                  <el-option
                      v-for="(item, index) in DATA_STUDENT"
                      :key="index"
                      :label="item.学号 + '-' + item.学生姓名 + '-' + item.班级名称"
                      :value="item.学生代码">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="课程名称" prop="KCMC">
                <el-input v-model="form.KCMC" placeholder="请输入课程名称"></el-input>
              </el-form-item>
              <el-form-item label="课程性质" prop="KCXZ">
                <el-select v-model="form.KCXZ" placeholder="请选择课程性质" clearable filterable>
                  <el-option
                      v-for="(item, index) in KCXZK"
                      :key="index"
                      :label="index + 1 + '-' + item"
                      :value="item">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="学分" prop="XF">
                <el-input v-model="form.XF" placeholder="请输入学分"></el-input>
              </el-form-item>
              <el-form-item label="绩点" prop="JD">
                <el-input v-model="form.JD" placeholder="请输入绩点"></el-input>
              </el-form-item>
              <el-form-item label="成绩性质" prop="CJXZ">

                <el-select v-model="form.CJXZ" placeholder="请选择成绩性质" clearable filterable>
                  <el-option
                      v-for="(item, index) in CJXZK"
                      :key="index"
                      :label="index + 1 + '-' + item"
                      :value="item">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="课程成绩" prop="KCCJ">
                <el-input v-model="form.KCCJ" placeholder="请输入课程成绩"></el-input>
              </el-form-item>
              <el-form-item label="授课教师" prop="SKJS">
                <el-select v-model="form.SKJS" allow-create placeholder="请选择、输入授课教师" clearable filterable>
                  <el-option
                      v-for="(item, index) in teachers"
                      :key="index"
                      :label="index+1+'-'+item.jsmc"
                      :value="item.jsmc">
                  </el-option>
                </el-select>
              </el-form-item>
<!--              <el-form-item label="启用代码" prop="QYDM">
                <el-input v-model="form.QYDM" placeholder="请输入启用代码"></el-input>
              </el-form-item>-->
              <el-form-item>
                <el-button type="primary" @click="saveForm">保存</el-button>
                <el-button @click="cancelEdit">取消</el-button>
              </el-form-item>
            </el-form>
          </div>
        </el-tab-pane>
        <!-- 导入/导出 -->
        <el-tab-pane label="导入/导出" name="import">
<!--          {
            "课程名称": "经济法",
            "课程性质": "专业基础限选课",
            "学分": "2",
            "绩点": "0.00",
            "成绩性质": "正常考试",
            "任课教师": "秦祖智",
            "学号": 20213260031,
            "姓名": "罗邓",
            "成绩": "80"
          },-->
          <div class="form-container">
            <el-card shadow="never"  >
              <el-form label-width="80px" size="small">
                <el-form-item>
                  <el-upload
                      class="upload-demo"
                      action="#"
                      :before-upload="beforeAvatarUpload"
                      :on-change="handleAvatarChange"
                      :auto-upload="false"
                      :multiple="false"
                      :disabled="isUploading"
                      :limit="1"
                      name="file"
                      accept=".xls,.xlsx">
                    <i class="el-icon-upload upload-icon"></i>
                    <div class="el-upload__tip">将文件拖到此处，或点击上传</div>
                  </el-upload>
                </el-form-item>
                <el-form-item label="导入信息确认" label-width="100" style="margin-left: 60px;">
                  <el-button type="primary" @click="handleExport">确认导入</el-button>
                </el-form-item>
              </el-form>
            </el-card>
          </div>
          <el-table :data="uploadList" v-show="uploadList.length>0" style="width: 100%" border :v-loading="isLoading">
            <el-table-column prop="学号" label="学号" width="120"></el-table-column>
            <el-table-column prop="姓名" label="姓名" width="100"></el-table-column>
            <el-table-column prop="成绩" label="评级" width="140">
              <template slot-scope="scope">
                <el-tag type="info" v-if="scope.row.成绩 >=60 && scope.row.成绩 <90">及格</el-tag>
                <el-tag type="warning" v-if="scope.row.成绩 <60&&scope.row.成绩 >=45">不及格</el-tag>
                <el-tag type="danger" v-if="scope.row.成绩 <45">严重不及格（重修）</el-tag>
                <el-tag type="success" v-if="scope.row.成绩 >=90" >优秀</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="课程名称" label="课程名称"></el-table-column>
            <el-table-column prop="课程性质" label="课程性质" width="120"></el-table-column>
            <el-table-column prop="学分" label="学分" width="80"></el-table-column>
            <el-table-column prop="绩点" label="绩点" width="80"></el-table-column>
            <el-table-column prop="成绩性质" label="成绩性质" width="100"></el-table-column>
            <el-table-column prop="成绩" label="成绩" width="100"></el-table-column>
            <el-table-column prop="任课教师" label="授课教师"></el-table-column>
            <el-table-column label="操作" width="150">
              <template slot-scope="scope">
                <el-button type="danger" size="small" @click="removeRow(scope.$index)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
      </el-tabs>
    </main>
    <el-backtop  ></el-backtop>
  </div>
</template>

<script>

import axios from "axios";
import {EventBus} from "@/event-bus";
import TeacherMenu from "@/components/teacher/Teacher_menu.vue";

export default {
  name: "StudentInfo",
  components: {TeacherMenu },
  data() {
    return {
     // 新增变量用于存放筛选关键词
      filterText: '',
      isUploading: false,// 标记是否正在上传文件
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      teachers: [],
      KCXZK:[ "公共限选课",
        "公选网络课",
        "免费课程",
        "实践技能必修课",
        "通识必修课",
        "通识限选课-体育",
        "学科基础必修课",
        "专业必修课",
        "专业基础限选课",
        "专业限选课"],
      DATA_STUDENT: [],
      activeTab: 'list', // 当前激活的 tab，默认显示列表
      scoreList: [],     // 成绩列表，字段均为大写
      uploadList: [],
      form: {            // 表单数据对象
        ID: null,
        STUID: '',
        KCMC: '',
        KCXZ: '',
        XF: '',
        JD: '',
        CJXZ: '',
        KCCJ: '',
        SKJS: '',
        QYDM: ''
      },

      currentPage: 1, // 当前页码
      pageSize: 9, // 每页显示的条数
      rules: {
        STUID: [
          { required: true, message: '请选择学生', trigger: 'change' }
        ],
        KCMC: [
          { required: true, message: '请输入课程名称', trigger: 'blur' }
        ],
        KCXZ: [
          { required: true, message: '请选择课程性质', trigger: 'change' }
        ],
        XF: [
          { required: true, message: '请输入学分', trigger: 'blur' },
          { pattern: /^[0-9]+(\.[0-9]{1,2})?$/, message: '请输入有效的学分', trigger: 'blur' }
        ],
        JD: [
          { required: true, message: '请输入绩点', trigger: 'blur' },
          { pattern: /^[0-9]+(\.[0-9]{1,2})?$/, message: '请输入有效的绩点', trigger: 'blur' }
        ],
        CJXZ: [
          { required: true, message: '请输入成绩性质', trigger: 'blur' }
        ],
        KCCJ: [
          { required: true, message: '请输入课程成绩', trigger: 'blur' }
        ],
        SKJS: [
          { required: true, message: '请输入授课教师', trigger: 'blur' }
        ],
        QYDM: [
          { required: true, message: '请输入启用代码', trigger: 'blur' }
        ]
      },
      CJXZK:["正常考试", "补考", "重修", "重修补考", "其他"],
      isLoading: false,
      isEditing: false // 标记是否处于编辑状态
    };
  },
  computed:{
    // 根据筛选关键词过滤成绩列表
    filteredScoreList() {
      if (!this.filterText) {
        return this.scoreList;
      }
      const lowerFilter = this.filterText.toLowerCase();
      return this.scoreList.filter(item => {
        // 这里以学号（STUID）、姓名（XSXM）、课程名称（KCMC）为例
        return (
            (item.STUID && item.STUID.toString().toLowerCase().includes(lowerFilter)) ||
            (item.XSXM && item.XSXM.toLowerCase().includes(lowerFilter)) ||
            (item.KCMC && item.KCMC.toLowerCase().includes(lowerFilter))
        );
      });
    },
    // 分页显示过滤后的数据
    paginatedList() {
      const start = (this.currentPage - 1) * this.pageSize;
      return this.filteredScoreList.slice(start, start + this.pageSize);
    }
  },
  mounted() {
    this.getLoginUserInfo();

  },
  methods: {
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
      for (let i = 0; i < this.filteredScoreList.length; i++){
        itemData['学生编号']=this.filteredScoreList[i].STUID;
        itemData['学号']=this.filteredScoreList[i].XSXH;
        itemData['姓名']=this.filteredScoreList[i].XSXM;
        itemData['课程名称']=this.filteredScoreList[i].KCMC;
        itemData['课程性质']=this.filteredScoreList[i].KCXZ;
        itemData['成绩性质']=this.filteredScoreList[i].CJXZ;
        itemData['课程成绩']=this.filteredScoreList[i].KCCJ;
        itemData['等级']=  this.getKccjLevel(this.filteredScoreList[i].KCCJ);
        itemData['学分']=this.filteredScoreList[i].XF;
        itemData['绩点']=this.filteredScoreList[i].JD;
        itemData['专业']=this.filteredScoreList[i].ZYMC;
        itemData['班级']=this.filteredScoreList[i].BJMC;

        itemData['授课教师']=this.filteredScoreList[i].SKJS;
        itemData['有效性']=this.filteredScoreList[i].QYDM===1?"有效":"无效";
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
    },
    handleSizeChange(newSize) {
      this.pageSize = newSize;
      this.currentPage = 1; // 重新分页
    },
    handlePageChange(newPage) {
      this.currentPage = newPage;
    },

    handleExport(){
      console.log(this.uploadList);
      if (this.uploadList.length === 0){
        $.confirm({
          title: '提示',
          content: '请先选择文件！',
          type: 'red', // warning 样式
          buttons: {
            确认: {
              btnClass: 'btn-blue',
              action: () => {
                console.log('确认');
              }
            }
          }
        });
      }else {
        $.confirm({
          title: '提示',
          content: '确认导入吗？',
          type: 'blue', // warning 样式
          buttons: {
            确认: {
              btnClass: 'btn-blue',
              action: () => {
                let dataForm = new FormData();
                dataForm.append("data", JSON.stringify(this.uploadList));
                axios.post("/xscjdk/import", dataForm, {
                  headers: {"Content-Type": "multipart/form-data"},
                }).then((response) => {
                  console.log(response.data);
                  $.confirm({
                    title: '🎉 成功！',
                    content: '<p style="text-align:center;">操作已成功！<br><img src="https://i.imgur.com/6pLfsVZ.gif" width="100"></p>',
                    type: 'green', // 成功样式
                    buttons: {
                      确认: {
                        btnClass: 'btn-green',
                        action: () => {
                            this.uploadList = [];
                            this.fetchScores();
                        }
                      }
                    }
                  });

                }).catch((error) => {
                  console.error(error);
                  this.$message.error("导入失败！");
                });
              }
            },
            取消: () => {
              this.$message('取消');
            }
          }
        });
      }


    },
    removeRow(index){
      console.log(index);
      this.uploadList.splice(index,1);
    },
    // **手动上传文件**
    async uploadFile(file) {
      this.isUploading = true;
      const formData = new FormData();
      formData.append("file", file);

      try {
        const response = await axios.post("/xscjdk/upload", formData, {
          headers: { "Content-Type": "multipart/form-data" },
        });

        console.log("上传成功", response.data);
        this.uploadList = response.data;
        this.$message.success("导入成功！");
      } catch (error) {
        console.error("导入成功", error);
        this.$message.error("导入成功！");
      } finally {
        this.isUploading = false;
      }
    },
    // 上传前校验（检查文件类型、大小）
    beforeAvatarUpload(file) {
      const isExcel = file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" || file.type === "application/vnd.ms-excel";
      if (!isExcel) {
        this.$message.error("只能上传 Excel 文件 (.xls, .xlsx)");
        return false;
      }
      return true;
    },

    // 选择文件后，处理文件
    handleAvatarChange(file) {
      console.log("已选择文件：", file);
      // 这里可以手动调用上传接口
      this.uploadFile(file.raw);
    },
    handleImportSuccess(file, response){
      console.log(response);
      this.$message.success("导入成功");
      this.fetchScores();

    },
    getAllTeachers() {
      axios.get("/teacher/getAllTeachers").then((response) => {
        if (response.data.result) {
          this.teachers = response.data.data;
        } else {
          this.$message.error("获取教师信息失败，后台错误");
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error("获取教师信息失败,网络错误");
      });

    },
    // 自动获取老师管的学生信息
    getStuInfo() {
      axios.get("/student/getStudentAuto").then(response => {
        if (response.data.result){
          this.DATA_STUDENT = response.data.data;
        }else{
          this.$message.error("获取学生信息失败："+response.data.msg);
        }
      }).catch(error => {
        console.error(error);
        this.$message.error("获取学生信息失败；"+error);
      });
    },
    // 获取成绩列表
    async fetchScores() {
      /*  this.scoreList = [
          { ID: 1, STUID: 'S001', KCMC: '数学', KCXZ: '必修', XF: 3, JD: 4.0, CJXZ: '正常', KCCJ: 95, SKJS: '张老师', QYDM: 'A1' },
          { ID: 2, STUID: 'S002', KCMC: '英语', KCXZ: '选修', XF: 2, JD: 3.5, CJXZ: '正常', KCCJ: 88, SKJS: '李老师', QYDM: 'A1' }
        ];*/
      try{
        this.isLoading=true;
        const response = await axios.get(`/xscjdk/getXscjdk?QYDM=2&YHSFDM=2&YHM=${this.UserInfo.username}&STUID=-1`);
        console.log(response.data);
        this.isLoading=false;
        if (response.data.result){
          this.scoreList = response.data.data;
        }else{
          $.confirm({
            title: '提示',
            content: '获取数据失败：' + response.data.msg,
            type: 'red', // warning 样式
            buttons: {
              重试: {
                btnClass: 'btn-orange',
                action: () => {
                  this.fetchScores();
                }
              },
              取消: () => {
                this.$message('取消');
              }
            }
          });
        }
      }catch (error){
        console.error(error);
        $.confirm({
          title: '提示',
          content: '获取数据失败：' + error,
          type: 'red', // warning 样式
          buttons: {
            重试: {
              btnClass: 'btn-orange',
              action: () => {
                this.fetchScores();
              }
            },
            取消: () => {
              this.$message('取消');
            }
          }
        });
      }



    },
    async getLoginUserInfo() {
      this.isLoading=true;
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
          this.fetchScores();
          this.getStuInfo();
          this.getAllTeachers();
        }
      } catch (error) {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      }
    },
    // 新增操作：清空表单，并切换到表单 tab
    handleAdd() {
      this.isEditing = false;
      this.form = {
        ID: null,
        STUID: '',
        KCMC: '',
        KCXZ: '',
        XF: '',
        JD: '',
        CJXZ: '',
        KCCJ: '',
        SKJS: '',
        QYDM: ''
      };
      this.activeTab = 'form';
    },
    // 编辑操作：加载选中行数据到表单，并切换到表单 tab
    handleEdit(row) {
      this.isEditing = true;
      this.form = { ...row };
      this.activeTab = 'form';
    },
    // 保存表单数据（新增或更新）
    saveForm() {
      if (this.isEditing) {
        // 更新操作：查找对应记录进行替换（实际应调用 API）
        const index = this.scoreList.findIndex(item => item.ID === this.form.ID);
        if (index !== -1) {
          this.scoreList.splice(index, 1, { ...this.form });
          this.$message.success("更新成功");
        }
      } else {
        // 新增操作：模拟自增 ID（实际应由后端返回）
        const newRecord = { ...this.form, ID: Date.now(),QYDM:1 };

        console.log(newRecord)
        /*{
          "ID": 1741941663324,
            "STUID": 1205,
            "KCMC": "高数1",
            "KCXZ": "公选网络课",
            "XF": "1",
            "JD": "2.1",
            "CJXZ": "正常考试",
            "KCCJ": "23",
            "SKJS": "罗邓",
            "QYDM": ""
        }*/

        let dataForm = new FormData();

        dataForm.append("stuid", newRecord.STUID);
        dataForm.append("kcmc", newRecord.KCMC);
        dataForm.append("kcxz", newRecord.KCXZ);
        dataForm.append("xf", newRecord.XF);
        dataForm.append("jd", newRecord.JD);
        dataForm.append("cjxz", newRecord.CJXZ);
        dataForm.append("kccj", newRecord.KCCJ);
        dataForm.append("skjs", newRecord.SKJS);
        axios.post("/xscjdk/insertXscjdk",dataForm).then(response => {
          if (response.data.result) {
            this.scoreList.push(newRecord);
            this.$message.success("新增成功");
          } else {
            $.confirm({
              title: '提示',
              content: '新增成绩失败：' + response.data.msg,
              type: 'red', // warning 样式
              buttons: {
                重试: {
                  btnClass: 'btn-orange',
                  action: () => {
                    this.saveForm();
                  }
                },
                取消: () => {
                  this.$message('取消');
                  // 切换回列表
                  this.cancelEdit();
                }
              }
            });
          }}).catch(error => {
            console.error(error);
            $.confirm({
              title: '提示',
              content: '新增成绩失败：' + error,
              type: 'red', // warning 样式
              buttons: {
                重试: {
                  btnClass: 'btn-orange',
                  action: () => {
                    this.saveForm();
                  }
                },
                取消: () => {
                  this.$message('取消');
                  // 切换回列表
                  this.cancelEdit();
                }
              }
            });
          });
      }

    },
    // 取消编辑/新增，清空表单并切换回列表 tab
    cancelEdit() {
      this.form = {
        ID: null,
        STUID: '',
        KCMC: '',
        KCXZ: '',
        XF: '',
        JD: '',
        CJXZ: '',
        KCCJ: '',
        SKJS: '',
        QYDM: ''
      };
      this.isEditing = false;
      this.activeTab = 'list';
    },
    // 删除记录操作
    handleDelete(row) {
      $.confirm({
        title: '提示',
        content: '确认停用吗？',
        type: 'red', // warning 样式
        buttons: {
          确认: {
            btnClass: 'btn-red',
            action: () => {
              let dataForm = new FormData();
              dataForm.append("id", row.ID);
              dataForm.append("qydm", 0);
              axios.post("/xscjdk/updateXscjdk", dataForm).then((response) => {
                console.log(response.data);
                if (response.data.result) {
                  this.$message.success("停用成功");
                  // 刷新数据
                  this.fetchScores();
                } else {
                  this.$message.error("停用失败：" + response.data.msg);
                }
              }).catch((error) => {
                console.error(error);
                this.$message.error("停用失败！");
              });
            }
          },
          取消: () => {
            this.$message('取消');
          }
        }
      });



    }
  }
};
</script>

<style scoped>
.form-container {
  background: #fff;
  padding: 20px;
  /*border: 1px solid #ebeef5;*/
  border-radius: 4px;
}
.el-input{
  width: 50% !important;
}


</style>
