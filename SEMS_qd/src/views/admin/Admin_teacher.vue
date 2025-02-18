<template xmlns="http://www.w3.org/1999/html">


  <div>
  <admin-menu></admin-menu>
  <main class="ml-64 flex-1 p-6">
    <header class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-semibold text-gray-800">教师信息管理</h1>
      <div class="flex space-x-2">

        <button
            class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600 text-sm"
            @click="refresh"
        >
          <i class="fas fa-sync"></i> 刷新
        </button>
        <button
            class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600 text-sm"
            @click="showAddTeacherPopup"
        >
          <i class="fas fa-plus"></i> 新增教师
        </button>


        <button
            class="bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600 text-sm"
            @click="showManageSubjectsPopup"
        >
          <i class="fas fa-book"></i> 管理学科
        </button>
        <button
            class="bg-purple-500 text-white px-3 py-1 rounded hover:bg-purple-600 text-sm"
            @click="showManageTitlesPopup"
        >
          <i class="fas fa-graduation-cap"></i> 管理职称
        </button>
      </div>
    </header>

    <!-- 学科管理弹窗 -->
    <transition name="fade">
      <div v-if="isSubjectsPopupVisible" class="popup-overlay" @click="closeSubjectsPopup">
        <div class="popup" @click.stop>
          <h2 class="popup-title">管理学科</h2>
          <div class="flex mb-4">
            <input
                v-model="newSubject"
                type="text"
                placeholder="输入新学科名称"
                class="border p-2 rounded-l w-full"
            />
            <button
                @click="addSubject"
                class="bg-blue-500 text-white px-4 rounded-r"
            >
              添加
            </button>
          </div>
          <div class="grid grid-cols-3 gap-2">
            <div
                v-for="(subject, index) in subjects"
                :key="index"
                class="flex justify-between items-center bg-gray-100 p-2 rounded"
            >
              {{ subject }}
              <button
                  @click="deleteSubject(subject)"
                  class="text-red-500 hover:text-red-700 text-sm"
              >
                <i class="fas fa-trash"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </transition>

    <!-- 职称管理弹窗 -->
    <transition name="fade">
      <div v-if="isTitlesPopupVisible" class="popup-overlay" @click="closeTitlesPopup">
        <div class="popup" @click.stop>
          <h2 class="popup-title">管理职称</h2>
          <div class="flex mb-4">
            <input
                v-model="newTitle"
                type="text"
                placeholder="输入新职称名称"
                class="border p-2 rounded-l w-full"
            />
            <button
                @click="addTitle"
                class="bg-purple-500 text-white px-4 rounded-r"
            >
              添加
            </button>
          </div>
          <div class="grid grid-cols-3 gap-2">
            <div
                v-for="(title, index) in titles"
                :key="index"
                class="flex justify-between items-center bg-gray-100 p-2 rounded"
            >
              {{ title }}
              <button
                  @click="deleteTitle(title)"
                  class="text-red-500 hover:text-red-700 text-sm"
              >
                <i class="fas fa-trash"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </transition>

    <!-- 教师列表 -->
    <div>
      <!--        <el-input
                  placeholder="查询教师名称"
                  v-model="searchQuery"
                  @input="filterTeachers"
                  style="margin-bottom: 20px; width: 300px;"/>-->
      <button id="Luodeng">罗邓</button>

      <el-table
          :data="teachers.filter(data => !search || data.name.toLowerCase().includes(search.toLowerCase()))"
          style="width: 100%">
        <el-table-column
            label="教师编号"
            prop="id">
        </el-table-column>
        <el-table-column
            label="教师名称"
            prop="jsmc">
        </el-table-column>

        <el-table-column
            label="性别"
            prop="sex">
        </el-table-column>
        <el-table-column
            label="登录账号"
            prop="dlzh">
        </el-table-column>
        <el-table-column
            label="登录密码"
            prop="dlmm">
        </el-table-column>
        <el-table-column
            align="right">
          <template slot="header" slot-scope="scope">
            <el-input
                v-model="search"
                size="mini"
                placeholder="输入关键字搜索"/>
          </template>
          <template slot-scope="scope">
            <el-button
                size="mini"
                @click="handleEdit(scope.$index, scope.row)">编辑
            </el-button>
            <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)">停用
            </el-button>
            <el-button
                size="mini"
                type="danger"
                @click="DyClassList(scope.$index, scope.row)">对应班级信息
            </el-button>
          </template>
        </el-table-column>
      </el-table>


<!--      <div class="modal fade" id="customModal" style="top: 144px;" tabindex="-1" aria-labelledby="modalLabel"
           aria-hidden="true">
        <div class="modal-dialog custom-modal"> &lt;!&ndash; 应用自定义类 &ndash;&gt;
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="myModalLabel">教师 :{{ selectTeacher.jsmc }} 班级信息</h5>
              <button type="button" class="btn-close" @click="closeModal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <el-table :data="pagedData_DYBJ" style="width: 100%">
                <el-table-column prop="id" label="班级代码" width="180"></el-table-column>
                <el-table-column prop="bjmc" label="班级名称" width="180"></el-table-column>
                <el-table-column prop="dyzy" label="所属专业"></el-table-column>
                <el-table-column prop="bzrdm" label="班主任代码"></el-table-column>
                <el-table-column align="right">
                  <template v-slot="scope">
                    <el-button size="mini" type="danger" @click="cancelClassRelation(scope.$index, scope.row)">
                      取消关联
                    </el-button>
                  </template>
                </el-table-column>
              </el-table>
              <el-pagination
                  @current-change="handlePageChange_DYBJ"
                  :current-page="currentPage_DYBJ"
                  :page-size="pageSize_DYBJ"
                  :total="selectClassList.length"
                  layout="total, prev, pager, next, jumper"
                  style="text-align: right; margin-top: 10px;"/>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" >新建对应</button>
            </div>
          </div>
        </div>
      </div>-->

      <el-dialog :title="'教师 :'+selectTeacher.jsmc + '班级信息'" :visible.sync="isShowJsBjDialog">
        <el-table :data="pagedData_DYBJ" style="width: 100%">
          <el-table-column prop="id" label="班级代码" width="180"></el-table-column>
          <el-table-column prop="bjmc" label="班级名称" width="180"></el-table-column>
          <el-table-column prop="dyzy" label="所属专业"></el-table-column>
          <el-table-column prop="bzrdm" label="班主任代码"></el-table-column>
          <el-table-column align="right">
            <template v-slot="scope">
              <el-button size="mini" type="danger" @click="cancelClassRelation(scope.$index, scope.row)">
                取消关联
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        <el-pagination
            @current-change="handlePageChange_DYBJ"
            :current-page="currentPage_DYBJ"
            :page-size="pageSize_DYBJ"
            :total="selectClassList.length"
            layout="total, prev, pager, next, jumper"
            style="text-align: right; margin-top: 10px;"/>
        <span slot="footer" class="dialog-footer">
          <el-button @click="isShowJsBjDialog = false">关 闭</el-button>
          <el-button type="primary" @click="openDialog">新建对应</el-button>
        </span>
      </el-dialog>


      <!-- 新增/编辑教师弹窗 -->
      <transition name="fade">
        <div v-if="isPopupVisible" class="popup-overlay" @click="closePopup">
          <div class="popup" @click.stop>
            <h2 class="popup-title">
              {{ isEditMode ? '修改教师信息' : '新增教师' }}
            </h2>
            <div class="flex space-x-4">
              <div class="w-1/3">
                <div class="mb-4 flex justify-center">
                  <div class="w-32 h-32 bg-gray-100 rounded-full flex items-center justify-center">
                    <img
                        :src="postForm.avatar"
                        class="w-full h-full rounded-full object-cover"/>
                  </div>
                </div>
                <button
                    class="w-full bg-blue-100 text-blue-600 py-1 rounded text-sm"
                    @click="triggerAvatarUpload">
                  上传头像
                </button>
                <input
                    type="file"
                    ref="avatarInput"
                    @change="handleAvatarUpload"
                    accept="image/*"
                    class="hidden"
                />
              </div>
              <div class="w-2/3">
                <label class="block mb-2">
                  姓名：
                  <input
                      v-model="postForm.name"
                      type="text"
                      class="border p-2 rounded w-full"
                      required>
                </label>
                <label class="block mb-2">
                  性别：
                  <div class="flex">
                    <select v-model="postForm.sex"
                            class="border p-2 rounded w-full mr-2">
                      <option value="">请选择</option>
                      <option value="男">男</option>
                      <option value="女">女</option>
                    </select>
                    <button
                        @click="showManageSubjectsPopup"
                        class="bg-blue-100 text-blue-600 px-2 rounded">
                      <i class="fas fa-plus"></i>
                    </button>
                  </div>

                </label>

                <label class="block mb-2">
                  登录账号：
                  <input
                      v-model="postForm.dlzh"
                      type="text"
                      class="border p-2 rounded w-full">
                </label>
                <label class="block mb-2">
                  登录密码：
                  <input
                      v-model="postForm.dlmm"
                      type="text"
                      class="border p-2 rounded w-full">
                </label>
              </div>
            </div>

            <div class="flex justify-end space-x-2 mt-4">
              <button
                  class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600 text-sm"
                  @click="saveTeacher">
                {{ isEditMode ? '保存' : '创建' }}
              </button>
              <button
                  class="bg-gray-500 text-white px-3 py-1 rounded hover:bg-gray-600 text-sm"
                  @click="closePopup">
                取消
              </button>
            </div>
          </div>
        </div>
      </transition>

      <!-- 罗列班级信息弹窗 -->
      <class-selection-dialog
          :dialogVisible.sync="dialogVisible"
          :classList="classList"
          @selection-saved="handleSelectionSaved"/>
    </div>


  </main>
  </div>

</template>

<script>
import AdminMenu from "@/components/admin/Admin_menu.vue";
import axios from "axios";
import $ from 'jquery'; // 引入 jQuery

import {Modal} from 'bootstrap';
import ClassSelectionDialog from "@/components/admin/ClassSelectionDialog.vue";


export default {
  name: "TeacherManagement",
  components: {AdminMenu, ClassSelectionDialog},
  data() {
    return {
      isShowJsBjDialog: false,
      //新建对应时班级列表（所有）
      classList: [],
      // 所有班级信息弹窗
      dialogVisible: false,
      search: '',// 搜索词
      teachers: [],
      selectedClasses: [],// 选择的班级信息
      selectClassList: [],// 对应班级信息
      selectTeacher: {},// 选择的教师信息
      subjects: ['数学', '语文', '英语', '物理', '化学', '生物'],
      titles: ['助教', '讲师', '副教授', '教授', '高级教师'],
      searchQuery: '',
      // 新增/编辑弹窗相关数据
      newSubject: '',
      newTitle: '',
      // `isPopupVisible` 用于判断新增/编辑弹窗是否可见
      isPopupVisible: false,
      // `isSubjectsPopupVisible` 用于判断学科管理弹窗是否可见
      isSubjectsPopupVisible: false,
      // `isTitlesPopupVisible` 用于判断职称管理弹窗是否可见
      isTitlesPopupVisible: false,
      // `isEditMode` 用于判断是新增还是编辑模式
      isEditMode: false,
      // 提交数据
      postForm: {
        name: '',
        dlzh: '',
        dlmm: '',
        sex: '',
      },


      currentPage_DYBJ: 1, // 当前页码  --对应班级信息弹窗
      pageSize_DYBJ: 5, // 每页显示的条目数   --对应班级信息弹窗

    };
  },
  computed: {
    // 计算属性以获取当前页的数据
    pagedData_DYBJ() {
      const start = (this.currentPage_DYBJ - 1) * this.pageSize_DYBJ; // 计算数据起始索引
      return this.selectClassList.slice(start, start + this.pageSize_DYBJ); // 根据当前页和页面大小返回数据
    },
    filteredTeachers() {
      return this.teachers.filter(teacher => {
        return teacher.name.includes(this.searchQuery);
      });
    }
  },
  mounted() {
    /* $("#closeModal").click(() => {
       console.log("closeModal");
     })
     $("#Luodeng").click(() => {
       console.log("Luodeng");
     })*/
    // 获取数据
    this.getDatas();
    //this.getAllClassList();
  },
  methods: {
    handlePageChange_DYBJ(newPage) {
      this.currentPage_DYBJ = newPage; // 更新当前页
    },

    //新建班级关联弹窗
    openDialog() {
      if(this.classList.length === 0){
        this.getAllClassList();
      }
      console.log("打开新建班级关联弹窗!!!");
      // isShowJsBjDialog: false,
      this.dialogVisible = true;
    },
    async handleSelectionSaved(selected) {
      this.selectedClasses = selected;
      console.log('选中的班级信息:', this.selectedClasses);

      let successfulCount = 0; // 成功关联的班级数量
      let errors = []; // 存储错误信息

      // 获取老师的 ID
      let teacherId = this.selectTeacher.id;

      // 使用 Promise.all 进行并发请求
      const promises = this.selectedClasses.map(classItem => {
        let postData = new FormData();
        postData.append("JSID", teacherId);
        postData.append("BJID", classItem.id);

        return axios.post("/teacher/addBjJsRelation", postData)
            .then(response => {
              if (response.data.result) {
                successfulCount++; // 成功计数
              } else {
                errors.push(`班级ID ${classItem.id} 关联失败`);
              }
            })
            .catch(error => {
              errors.push(`班级ID ${classItem.id} 关联出错: ${error.message}`);
            });
      });

      // 等待所有请求完成
      await Promise.all(promises);

      // 根据成功与错误的信息进行用户提示
      if (errors.length > 0) {
        this.$message.error(`关联班级出现错误！失败信息: ${errors.join(', ')}`);
      }
      this.$message.success(`关联班级成功！共关联 ${successfulCount} 个班级`);
      //更新数据
      this.getAllClassList();

    },


    // 获取所有未对应选定教师的班级信息
    getAllClassList() {
      console.log("获取所有未对应选定教师的班级信息:教师:");
      console.log(this.selectTeacher);
      axios.get("/class/getClassByTeacherIdNotBind?jsid=" + this.selectTeacher.id).then((response) => {
        console.log("获取所有未对应选定教师的班级信息:");
        console.log("教师信息:");
        console.log(this.selectTeacher);

        if (response.data.result) {
          this.classList = response.data.data;
          this.$message.success("获取班级信息成功");
        } else {
          this.$message.error("获取班级信息失败，后台错误");
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error("获取班级信息失败,网络错误");
      });
    },


    //刷新
    refresh() {
      this.getDatas();
    },
    // 取消关联班级
    cancelClassRelation(index, row) {
      this.$confirm('确认取消老师:  ' + this.selectTeacher.jsmc + '与班级:  ' + row.bjmc + ' 关联？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log("取消关联:");
        console.log(row);
        console.log(index);
        console.log("教师信息:")
        console.log(this.selectTeacher);
        console.log("班级信息:")
        console.log(row)
        let Postdata = new FormData();
        Postdata.append("JSID", this.selectTeacher.id);
        Postdata.append("BJID", row.id);
        axios.post("/teacher/cancelRelation", Postdata).then((response) => {
          if (response.data.result) {
            this.$message.success("取消关联成功");
            // 获取数据
            this.getAllClassList();
          } else {
            this.$message.error("取消关联失败，后台错误");
          }
        }).catch((err) => {
          this.$message.error("取消关联失败，网络错误");
        });
      }).catch(() => {
        this.$message.info('已取消该操作');
      });


    },
    closeModal() {
      const myModal = new Modal(document.getElementById('customModal'));
      // 关闭模态框
      myModal.hide();
      console.log("关闭模态框");
    },

    // 单击对应班级弹窗显示对应班级信息
    DyClassList(index, row) {
      /*const myModal = new Modal(document.getElementById('customModal'));
      myModal.show();*/
      this.isShowJsBjDialog = true;

      console.log("点击对应班级信息：");
      console.log(index, row);
      this.selectClassList = row.BJLIST;
      this.selectTeacher = row;
    },

    handleEdit(index, row) {
      console.log("点击编辑：");
      console.log(index, row);
    },
    handleDelete(index, row) {
      this.$confirm('确认停用教师:  ' + row.jsmc + '？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log("停用教师:");

        let Postdata = new FormData();
        Postdata.append("JSID", row.id);
        axios.post("/teacher/stopTeacher", Postdata).then((response) => {
          if (response.data.result) {
            this.$message.success("停用成功");
            // 获取数据
            this.getDatas();
          } else {
            this.$message.error("停用失败，后台错误");
          }
        }).catch((err) => {
          this.$message.error("停用失败，网络错误");
        });
      }).catch(() => {
        this.$message.info('已取消该操作');
      });
      console.log("点击停用：");
      console.log(index, row);
    },
    // 初始化数据
    getDatas() {
      axios.get("/teacher/getAllTeachers").then((response) => {
        if (response.data.result) {
          this.teachers = response.data.data;
          this.$message.success("获取教师信息成功");
        } else {
          this.$message.error("获取教师信息失败，后台错误");
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error("获取教师信息失败,网络错误");
      });

    },
    // 学科管理相关方法
    showManageSubjectsPopup() {
      this.isSubjectsPopupVisible = true;
      this.newSubject = '';
    },
    closeSubjectsPopup() {
      this.isSubjectsPopupVisible = false;
    },
    addSubject() {
      if (this.newSubject && !this.subjects.includes(this.newSubject)) {
        this.subjects.push(this.newSubject);
        this.newSubject = '';
      }
    },
    deleteSubject(subject) {
      this.subjects = this.subjects.filter(s => s !== subject);
    },

    // 职称管理相关方法
    showManageTitlesPopup() {
      this.isTitlesPopupVisible = true;
      this.newTitle = '';
    },
    closeTitlesPopup() {
      this.isTitlesPopupVisible = false;
    },
    addTitle() {
      if (this.newTitle && !this.titles.includes(this.newTitle)) {
        this.titles.push(this.newTitle);
        this.newTitle = '';
      }
    },
    deleteTitle(title) {
      this.titles = this.titles.filter(t => t !== title);
    },

    // 头像上传相关方法
    triggerAvatarUpload() {
      this.$refs.avatarInput.click();
    },
    handleAvatarUpload(event) {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
          this.postForm.avatar = e.target.result;
        };
        reader.readAsDataURL(file);
      }
    },

    // 教师管理相关方法
    showAddTeacherPopup() {
      this.isEditMode = false;// 新增模式
      this.postForm = {
        name: '',
        dlzh: '',
        dlmm: '',
        sex: '',
      };
      this.isPopupVisible = true;
    },
    editTeacher(teacher) {
      this.isEditMode = true;
      this.postForm = {...teacher};
      this.isPopupVisible = true;
    },
    saveTeacher() {
      if (this.postForm.name === '' || this.postForm.dlzh === '' || this.postForm.dlmm === '' || this.postForm.sex === '') {
        alert('请填写完整信息');
        return;
      }

      if (this.isEditMode) {
        // 编辑模式
        const index = this.teachers.findIndex(t => t.id === this.postForm.id);
        if (index !== -1) {
          this.teachers[index] = {...this.postForm};
        }
      } else {
        // 新增模式
        console.log("新增教师：");
        console.log(this.postForm)
        let Postdata = new FormData();
        Postdata.append("jsmc", this.postForm.name);
        Postdata.append("dlzh", this.postForm.dlzh);
        Postdata.append("dlmm", this.postForm.dlmm);
        Postdata.append("sex", this.postForm.sex);

        axios.post("/teacher/addTeacher", Postdata).then((response) => {
          if (response.data.result) {
            this.$message.success("新增教师成功");
            this.closePopup();
            // 获取数据
            this.getDatas();
          } else {
            this.$message.error("新增教师失败，后台错误");
          }
        }).catch((error) => {
          console.log(error);
          this.$message.error("新增教师失败,网络错误");
        });

      }

    },
    deleteTeacher(teacherId) {
      this.teachers = this.teachers.filter(t => t.id !== teacherId);
    },
    closePopup() {
      this.isPopupVisible = false;
      this.isSubjectsPopupVisible = false;
      this.isTitlesPopupVisible = false;
    },
  }
}
</script>

<style scoped>

.custom-modal {
  max-width: 1000px; /* 设置最大宽度为 800px */
  width: 1000px; /* 设置固定宽度为 800px */
  height: 582px; /* 设置高度为 1000px */
  margin: auto; /* 居中对齐 */
}

.modal-content {
  height: 100%; /* 使模态框内容高度填满 */
}

.popup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.popup {
  background: white;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.popup-title {
  font-size: 1.5rem;
  margin-bottom: 20px;
}
</style>
