<template>
  <div>
    <admin-menu></admin-menu>
    <main class="ml-64 flex-1 p-6">

      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold text-gray-800">基础数据管理</h1>
        <div class="flex items-center space-x-4">
          <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600" @click="refreshData()">
            <i class="fas fa-sync"></i> 刷新数据
          </button>
        </div>
      </header>

      <div class="bg-gray-100 p-4 rounded mb-4">
        <h2 class="text-lg font-semibold">此界面用于管理基础数据！</h2>
      </div>

      <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
        <el-tab-pane label="单位行业代码" name="first">
          <!--           操作按钮-->
          <el-row style="margin-bottom:20px;display: flex;justify-content: end;">
            <el-button @click="handleSelectAllOrCancelAllDWHYDMK" border plain>全选/取消全选</el-button>
            <el-button @click="deleteDWHYDMK" plain><i class="el-icon-delete"></i> 删除</el-button>
            <el-button @click="showAddDialogDWHYDMK" plain><i class="el-icon-plus"></i> 新增</el-button>
            <el-button @click="editDWHYDMK" plain><i class="el-icon-edit"></i> 修改</el-button>
          </el-row>
          <el-table
              ref="multipleTableHYDMK"
              :data="paginatedDataDWHYDMK"
              tooltip-effect="dark"
              style="width: 100%"
              @selection-change="selectedRowChangedDWHYDMK" border>
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="hydm" label="行业代码" width="120"></el-table-column>
            <el-table-column prop="hymc" label="行业名称" width="350"></el-table-column>
            <el-table-column prop="hyms" label="行业描述" show-overflow-tooltip></el-table-column>
          </el-table>

          <el-pagination
              @current-change="handleCurrentChangeDWHYDMK"
              :current-page="currentPageDWHYDMK"
              :page-size="pageSizeDWHYDMK"
              :total="DWHYDMK.length"
              layout="total, prev, pager, next, jumper"
              class="mt-4">
          </el-pagination>
        </el-tab-pane>

        <el-tab-pane label="单位性质" name="second">
          <el-row style="margin-bottom:20px;">
            <el-button @click="handleSelectAllOrCancelAllDWXZ" border plain>全选/取消全选</el-button>
            <el-button plain><i class="el-icon-delete"></i> 删除</el-button>
            <el-button @click="showAddDialogDWXZK" plain><i class="el-icon-plus"></i> 新增</el-button>
            <el-button plain><i class="el-icon-edit"></i> 修改</el-button>
          </el-row>
          <el-table
              ref="multipleTableDWXZ"
              :data="paginatedDataDWXZK"
              tooltip-effect="dark"
              style="width: 100%">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="dwxzdm" label="单位性质代码" width="120"></el-table-column>
            <el-table-column prop="dwxz" label="单位性质" width="120"></el-table-column>
            <el-table-column prop="xzms" label="单位性质描述" show-overflow-tooltip></el-table-column>
          </el-table>

          <el-pagination
              @current-change="handleCurrentChangeDWXZK"
              :current-page="currentPageDWXZK"
              :page-size="pageSizeDWXZK"
              :total="DWXZK.length"
              layout="total, prev, pager, next, jumper"
              class="mt-4">
          </el-pagination>
        </el-tab-pane>

        <el-tab-pane label="省份代码库" name="third">
          <el-row style="margin-bottom:20px;">
            <el-button @click="handleSelectAllOrCancelAllSFDMK" border plain>全选/取消全选</el-button>
            <el-button plain><i class="el-icon-delete"></i> 删除</el-button>
            <el-button @click="showAddDialogSFDMK" plain><i class="el-icon-plus"></i> 新增</el-button>
            <el-button @click="editSFDMK" plain><i class="el-icon-edit"></i> 修改</el-button>
          </el-row>
          <el-table
              ref="multipleTableSFDMK"
              :data="paginatedDataSFDMK"
              tooltip-effect="dark"
              style="width: 100%"
              @selection-change="selectedRowChangedSFDMK">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="sfdm" label="省份代码" width="120"></el-table-column>
            <el-table-column prop="sfmc" label="省份名称" width="120"></el-table-column>
          </el-table>

          <el-pagination
              @current-change="handleCurrentChangeSFDMK"
              :current-page="currentPageSFDMK"
              :page-size="pageSizeSFDMK"
              :total="SFDMK.length"
              layout="total, prev, pager, next, jumper"
              class="mt-4">
          </el-pagination>
        </el-tab-pane>

        <el-tab-pane label="学历天梯库" name="fourth">
          <el-row style="margin-bottom:20px;">
            <el-button @click="handleSelectAllOrCancelAllXLTTK" border plain>全选/取消全选</el-button>
            <el-button plain><i class="el-icon-delete"></i> 删除</el-button>
            <el-button @click="showAddDialogXLTTK" plain><i class="el-icon-plus"></i> 新增</el-button>
            <el-button  plain><i class="el-icon-edit"></i> 修改</el-button>
          </el-row>

          <el-table
              ref="multipleTableXLTTK"
              :data="paginatedDataXLTTK"
              tooltip-effect="dark"
              style="width: 100%">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="id" label="学历ID" width="120"></el-table-column>
            <el-table-column prop="xlmc" label="学历名称" width="120"></el-table-column>
            <el-table-column prop="xlms" label="学历描述" show-overflow-tooltip></el-table-column>
          </el-table>

          <el-pagination
              @current-change="handleCurrentChangeXLTTK"
              :current-page="currentPageXLTTK"
              :page-size="pageSizeXLTTK"
              :total="XLTTK.length"
              layout="total, prev, pager, next, jumper"
              class="mt-4">
          </el-pagination>
        </el-tab-pane>

        <el-tab-pane label="单位规模库" name="fifth">
          <el-row style="margin-bottom:20px;">
            <el-button @click="handleSelectAllOrCancelAllDWGMK" border plain>全选/取消全选</el-button>
            <el-button plain><i class="el-icon-delete"></i> 删除</el-button>
            <el-button @click="showAddDialogDWGMK" plain><i class="el-icon-plus"></i> 新增</el-button>
            <el-button plain><i class="el-icon-edit"></i> 修改</el-button>
          </el-row>
          <el-table
              ref="multipleTableDWGMK"
              :data="paginatedDataDWGMK"
              tooltip-effect="dark"
              style="width: 100%">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="gmdm" label="规模代码" width="120"></el-table-column>
            <el-table-column prop="gmxq" label="规模详情" show-overflow-tooltip></el-table-column>
          </el-table>

          <el-pagination
              @current-change="handleCurrentChangeDWGMK"
              :current-page="currentPageDWGMK"
              :page-size="pageSizeDWGMK"
              :total="DWGMK.length"
              layout="total, prev, pager, next, jumper"
              class="mt-4">
          </el-pagination>
        </el-tab-pane>
      </el-tabs>

      <!-- DWHYDMK 新增 修改数据弹窗 -->
      <el-dialog title="新增数据" :visible.sync="isShowDialog.DWHYDMK" width="500px">
        <el-form :model="DWHYDMKform" ref="DWHYDMKform" label-width="120px">
          <el-form-item label="行业代码" prop="hydm" v-show="isEdit.DWHYDMK">
            <el-input v-model="DWHYDMKform.hydm" readonly></el-input>
          </el-form-item>
          <el-form-item label="行业名称" prop="hymc"
                        :rules="[{ required: true, message: '请输入行业名称', trigger: 'blur' }]">
            <el-input v-model="DWHYDMKform.hymc"></el-input>
          </el-form-item>
          <el-form-item label="行业描述">

            <el-input type="textarea" v-model="DWHYDMKform.hyms"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="isShowDialog.DWHYDMK = false">取 消</el-button>
          <el-button type="primary" @click="submitHYDMKForm">确 定</el-button>
        </span>
      </el-dialog>

      <!-- XLTTK 新增 修改数据弹窗 -->
      <el-dialog title="新增数据" :visible.sync="isShowDialog.XLTTK" width="500px">
        <el-form :model="XLTTKform" ref="XLTTKform" label-width="120px">
          <el-form-item label="学历ID" prop="id" v-show="isEdit.XLTTK"
                        :rules="[{ required: true, message: '请输入学历ID', trigger: 'blur' }]">
            <el-input v-model="XLTTKform.id" readonly></el-input>
          </el-form-item>
          <el-form-item label="学历名称" prop="xlmc"
                        :rules="[{ required: true, message: '请输入学历名称', trigger: 'blur' }]">
            <el-input v-model="XLTTKform.xlmc"></el-input>
          </el-form-item>
          <el-form-item label="学历描述">
            <el-input type="textarea" v-model="XLTTKform.xlms"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
              <el-button @click="isShowDialog.XLTTK = false">取 消</el-button>
              <el-button type="primary" @click="submitXLTTKForm">确 定</el-button>
        </span>
      </el-dialog>

      <!-- SFDMK 新增 修改数据弹窗-->
      <el-dialog title="新增数据" :visible.sync="isShowDialog.SFDMK" width="500px">
        <el-form :model="SFDMKform" ref="SFDMKform" label-width="120px">
          <el-form-item label="省份代码" prop="sfdm" v-show="isEdit.SFDMK">
            <el-input v-model="SFDMKform.sfdm" readonly></el-input>
          </el-form-item>
          <el-form-item label="省份名称" prop="sfmc"
                        :rules="[{ required: true, message: '请输入省份名称', trigger: 'blur' }]">
            <el-input v-model="SFDMKform.sfmc"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
                <el-button @click="isShowDialog.SFDMK = false">取 消</el-button>
                <el-button type="primary" @click="submitSFDMKForm">确 定</el-button>
              </span>
      </el-dialog>


    </main>
  </div>
</template>

<script>
import AdminMenu from "@/components/admin/Admin_menu.vue";
import axios from "axios";

export default {
  name: "BasicDataManagement",
  components: {AdminMenu},
  data() {
    return {
      // 是否为编辑状态
      isEdit: {
        DWHYDMK: false,
        DWXZK: false,
        SFDMK: false,
        XLTTK: false,
        DWGMK: false,
      },
      isShowDialog: {
        DWHYDMK: false,
        SFDMK: false,
        XLTTK: false,
        DWGMK: false,
        DWXZK: false,
      },

      activeName: "first",
      pageSizeDWHYDMK: 7,
      currentPageDWHYDMK: 1,
      pageSizeDWXZK: 10,
      currentPageDWXZK: 1,
      pageSizeSFDMK: 10,
      currentPageSFDMK: 1,
      pageSizeXLTTK: 10,
      currentPageXLTTK: 1,
      pageSizeDWGMK: 10,
      currentPageDWGMK: 1,
      tables: [
        {name: "DWHYDMK", label: "单位行业代码库"},
        {name: "DWXZK", label: "单位性质库"},
        {name: "SFDMK", label: "省份代码库"},
        {name: "XLTTK", label: "学历天梯库"},
        {name: "DWGMK", label: "单位规模库"},
      ],
      selectedTable: {},
      searchQuery: "",
      SFDMK: [],
      XLTTK: [],
      DWXZK: [],
      DWGMK: [],
      DWHYDMK: [],
      selectedRows: {
        DWHYDMK: [],
        DWXZK: [],
        SFDMK: [],
        XLTTK: [],
        DWGMK: [],
      },
      dialogVisible: false, // 控制弹窗的显示
      DWHYDMKform: { // 表单数据
        hydm: '',
        hymc: '',
        hyms: ''
      },
      XLTTKform: { // 表单数据
        id: '',
        xlmc: '',
        xlms: ''
      },
      SFDMKform: { // 表单数据
        sfdm: '',
        sfmc: ''
      },
    }
  },
  created() {
    this.get_All_JCSJ();
    this.selectTable(this.tables[0]);
  },
  computed: {
    paginatedDataDWHYDMK() {
      const start = (this.currentPageDWHYDMK - 1) * this.pageSizeDWHYDMK;
      return this.DWHYDMK.slice(start, start + this.pageSizeDWHYDMK);
    },
    paginatedDataDWXZK() {
      const start = (this.currentPageDWXZK - 1) * this.pageSizeDWXZK;
      return this.DWXZK.slice(start, start + this.pageSizeDWXZK);
    },
    paginatedDataSFDMK() {
      const start = (this.currentPageSFDMK - 1) * this.pageSizeSFDMK;
      return this.SFDMK.slice(start, start + this.pageSizeSFDMK);
    },
    paginatedDataXLTTK() {
      const start = (this.currentPageXLTTK - 1) * this.pageSizeXLTTK;
      return this.XLTTK.slice(start, start + this.pageSizeXLTTK);
    },
    paginatedDataDWGMK() {
      const start = (this.currentPageDWGMK - 1) * this.pageSizeDWGMK;
      return this.DWGMK.slice(start, start + this.pageSizeDWGMK);
    }
  },
  methods: {
    deleteDWHYDMK() {
      console.log("删除行业代码:");
      console.log(this.selectedRows.DWHYDMK);
      for (let i = 0; i < this.selectedRows.DWHYDMK.length; i++) {
        console.log(this.selectedRows.DWHYDMK[i].hydm);
      }
      $.confirm({
        title: '温馨提示', // 对话框的标题
        content: '确认删除选中的行业代码吗，删除后不可恢复！', // 对话框的内容
        animation: 'scaleX', // 打开对话框时的动画效果
        closeAnimation: 'scaleX', // 关闭对话框时的动画效果
        animateFromElement: false, // 是否从元素中动画
        buttons: {
          // 修改按钮文本
          confirm: {
            text: '确认删除', // 确认按钮的文本
            btnClass: 'btn-red',
            action: async () => { // 使用 async 函数
              let deleCount = this.selectedRows.DWHYDMK.length;
              let deleteSuccessCount = 0;

              // 创建删除请求的 Promise 数组
              const deletePromises = this.selectedRows.DWHYDMK.map(row => {
                return axios.get(`/dwhydmk/deleteDwhydmkById?hydm=${row.hydm}`);
              });

              try {
                // 等待所有删除请求完成
                const responses = await Promise.all(deletePromises);

                // 处理每个响应
                responses.forEach(response => {
                  if (response.data.result) {
                    deleteSuccessCount++;
                  } else {
                    console.log(response.data);
                  }
                });

                // 更新 UI
                if (deleteSuccessCount === deleCount) {
                  this.selectedRows.DWHYDMK = []; // 清空已选择的行
                  this.$message({showClose: true, message: '全部删除成功！', type: 'success'});
                  this.get_All_JCSJ(); // 刷新页面
                } else {
                  this.$message({
                    showClose: true,
                    message: `部分删除失败：\n成功: ${deleteSuccessCount}\n失败: ${deleCount - deleteSuccessCount}`,
                    type: 'warning'
                  });
                }
              } catch (error) {
                console.log(error);
                this.$message({
                  showClose: true,
                  message: '删除过程中发生错误，请重试。',
                  type: 'error'
                });
              }
            }
          },
          cancel: {
            text: '取消', // 取消按钮的文本
            btnClass: 'btn-green',
            action: () => {
              this.$message({showClose: true, message: '取消删除', type: 'info'}); // 取消后执行的操作
            }
          }
        }
      });
    },
    // 单位行业代码 行选择变化
    selectedRowChangedDWHYDMK(rows) {
      console.log(rows);
      this.selectedRows.DWHYDMK = rows;
    },
    // 省份代码库 行选择变化
    selectedRowChangedSFDMK(rows) {
      console.log(rows);
      this.selectedRows.SFDMK = rows;
    },
    // 全选/取消全选 单位行业代码
    handleSelectAllOrCancelAllDWHYDMK() {
      this.$refs.multipleTableHYDMK.toggleAllSelection(); // 调用全选/取消全选方法
    },
    // 全选/取消全选 省份代码库
    handleSelectAllOrCancelAllSFDMK() {
      this.$refs.multipleTableSFDMK.toggleAllSelection(); // 调用全选/取消全选方法
    },
    // 全选/取消全选 学历天梯库
    handleSelectAllOrCancelAllXLTTK() {
      this.$refs.multipleTableXLTTK.toggleAllSelection();
    },
    // 全选/取消全选 单位性质库
    handleSelectAllOrCancelAllDWXZ() {
      this.$refs.multipleTableDWXZ.toggleAllSelection();
    },
    handleSelectAllOrCancelAllDWGMK() {
      this.$refs.multipleTableDWGMK.toggleAllSelection();
    },

    // 单位行业代码 新增弹窗
    showAddDialogDWHYDMK() {
      this.isEdit.DWHYDMK = false;// 为新增模式
      this.isShowDialog.DWHYDMK = true; // 显示弹窗
    },
    // 省份代码库 新增弹窗
    showAddDialogSFDMK() {
      this.isEdit.SFDMK = false;// 为新增模式
      this.isShowDialog.SFDMK = true; // 显示弹窗
    },
    // 学历天梯库 新增弹窗
    showAddDialogXLTTK() {
      this.isEdit.XLTTK = false;// 为新增模式
      this.isShowDialog.XLTTK = true; // 显示弹窗
    },
    // 单位规模库 新增弹窗
    showAddDialogDWGMK() {
      this.isEdit.DWGMK = false;// 为新增模式
      this.isShowDialog.DWGMK = true; // 显示弹窗
    },
    // 单位性质库 新增弹窗
    showAddDialogDWXZK() {
      console.log("新增单位性质库");
      this.isEdit.DWXZK = false;// 为新增模式
      this.isShowDialog.DWXZK = true; // 显示弹窗
    },

    // 单击确认按钮 新增省份代码 逻辑
    submitSFDMKForm() {
      // 验证表单
      this.$refs.SFDMKform.validate((valid) => {
        if (valid) {
          let formData = new FormData();
          formData.append("sfmc", this.SFDMKform.sfmc);
          console.log("验证通过:"+this.SFDMKform.sfmc);
          // 修改模式需要携带 ID`
          if (!this.isEdit.SFDMK) {
            //新增模式
            axios.post("/sfdmk/AddSFDMK", formData).then(response => {
              if (response.data.result) {
                this.$message({showClose: true, message: '新增成功', type: 'success'});
              } else {
                this.$message({showClose: true, message: '新增失败', type: 'error'});
              }
            }).catch((error) => {
              console.log(error);
              this.$message({showClose: true, message: '网络错误', type: 'error'});
            })
            // 提交表单逻辑
            this.SFDMK.push({...this.SFDMKform}); // 将表单数据添加到数组中
            console.log("新增省份代码:");
            console.log(this.SFDMKform);
          } else {
            formData.append("sfdm", this.SFDMKform.sfdm);
            axios.post("/sfdmk/UpdateSFDMK", formData).then(response => {
              if (response.data.result) {
                this.$message({showClose: true, message: '修改成功', type: 'success'});
              } else {
                this.$message({showClose: true, message: '修改失败', type: 'error'});
              }
            }).catch((error) => {
              console.log(error);
              this.$message({showClose: true, message: '网络错误', type: 'error'});
            });

          }
          this.dialogVisible = false; // 关闭弹窗
          this.$refs.SFDMKform.resetFields(); // 重置表单
        } else {
          console.log('表单验证失败!');
          return false;
        }
      });
    },
    // 单击确认按钮 新增行业代码 逻辑
    submitHYDMKForm() {
      // 验证表单
      this.$refs.DWHYDMKform.validate((valid) => {
        if (valid) {
          let formData = new FormData();
          formData.append("hymc", this.DWHYDMKform.hymc);
          formData.append("hyms", this.DWHYDMKform.hyms);

          // 修改模式需要携带 ID
          if (!this.isEdit.DWHYDMK) {

            axios.post("/dwhydmk/AddDWHYDMK", formData).then(response => {
              if (response.data.result) {
                this.$message({showClose: true, message: '新增成功', type: 'success'});
              } else {
                this.$message({showClose: true, message: '新增失败', type: 'error'});
              }
            }).catch((error) => {
              console.log(error);
              this.$message({showClose: true, message: '网络错误', type: 'error'});
            })
            // 提交表单逻辑
            this.DWHYDMK.push({...this.DWHYDMKform}); // 将表单数据添加到数组中
            console.log("新增行业代码:");
            console.log(this.DWHYDMKform);
          } else {
            formData.append("hydm", this.DWHYDMKform.hydm);
            axios.post("/dwhydmk/EditDWHYDMKById", formData).then(response => {
              if (response.data.result) {
                this.$message({showClose: true, message: '修改成功', type: 'success'});
              } else {
                this.$message({showClose: true, message: '修改失败', type: 'error'});
              }
            }).catch((error) => {
              console.log(error);
              this.$message({showClose: true, message: '网络错误', type: 'error'});
            });

          }
          this.dialogVisible = false; // 关闭弹窗
          this.$refs.DWHYDMKform.resetFields(); // 重置表单
        } else {
          console.log('表单验证失败!');
          return false;
        }
      });
    },

    handleClick(tab, event) {
      console.log("选项卡被点击:", tab.label);
    }
    ,
    handleCurrentChangeDWHYDMK(page) {
      this.currentPageDWHYDMK = page;
    }
    ,
    handleCurrentChangeDWXZK(page) {
      this.currentPageDWXZK = page;
    }
    ,
    handleCurrentChangeSFDMK(page) {
      this.currentPageSFDMK = page;
    }
    ,
    handleCurrentChangeXLTTK(page) {
      this.currentPageXLTTK = page;
    }
    ,
    handleCurrentChangeDWGMK(page) {
      this.currentPageDWGMK = page;
    }
    ,
    get_All_JCSJ() {
      axios.get("/data/getAllJCSJ2").then((response) => {
        if (response.data.result) {
          this.SFDMK = response.data.data.SFDMK.data;
          this.XLTTK = response.data.data.XLTTK.data;
          this.DWXZK = response.data.data.DWXZK.data;
          this.DWGMK = response.data.data.DWGMK.data;
          this.DWHYDMK = response.data.data.DWHYDMK.data;
        } else {
          this.$message({showClose: true, message: '后台错误', type: 'error'});
        }
      }).catch((error) => {
        this.$message({showClose: true, message: '网络错误', type: 'error'});
        console.log(error);
      });
    },
    // 编辑行业代码
    editDWHYDMK() {
      // 如果选中多个，就提示
      if (this.selectedRows.DWHYDMK.length > 1) {
        this.$message({showClose: true, message: '只能选择一行进行编辑！', type: 'warning'});
        return;
      } else if (this.selectedRows.DWHYDMK.length === 0) {
        this.$message({showClose: true, message: '请先选择一行进行编辑！', type: 'warning'});

      } else {
        /*显示弹窗，让用户编辑数据*/
        this.isEdit.DWHYDMK = true; // 切换为编辑模式
        this.isShowDialog.DWHYDMK = true; // 显示弹窗
        this.DWHYDMKform.hydm = this.selectedRows.DWHYDMK[0].hydm;
        this.DWHYDMKform.hymc = this.selectedRows.DWHYDMK[0].hymc;
        this.DWHYDMKform.hyms = this.selectedRows.DWHYDMK[0].hyms;
        console.log("编辑行业代码:");
        console.log(this.DWHYDMKform);
      }
    },
    // 编辑省份代码
    editSFDMK() {
      // 如果选中多个，就提示
      if (this.selectedRows.SFDMK.length > 1) {
        this.$message({showClose: true, message: '只能选择一行进行编辑！', type: 'warning'});
        return;
      } else if (this.selectedRows.SFDMK.length === 0) {
        this.$message({showClose: true, message: '请先选择一行进行编辑！', type: 'warning'});
      } else {
        /*显示弹窗，让用户编辑数据*/
        this.isEdit.SFDMK = true; // 切换为编辑模式
        this.isShowDialog.SFDMK = true; // 显示弹窗
        this.SFDMKform.sfdm = this.selectedRows.SFDMK[0].sfdm;
        this.SFDMKform.sfmc = this.selectedRows.SFDMK[0].sfmc;
        console.log("编辑省份代码:");
        console.log(this.SFDMKform);
      }
    },
    add_JCSJ() {
      console.log("当前选中表：", this.selectedTable);
    },
    // 刷新数据
    refreshData() {
      this.get_All_JCSJ();
    },
    selectTable(table) {
      this.selectedTable = table;
    }
    ,
  }
  ,
}
;
</script>

<style scoped>
/* 添加样式（如果需要） */
</style>