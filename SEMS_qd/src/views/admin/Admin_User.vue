<template>
  <div class="content">
    <div>
      <AdminMenu></AdminMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <el-card style="margin-bottom: 10px">
        <header class="flex justify-between items-center mb-6">
          <div>
            <h1 class="text-3xl font-bold text-gray-800">系统用户管理</h1>
            <p class="text-sm text-gray-500 mt-1">当前有效用户：{{ totalUsers }}个</p>
          </div>
          <div class="flex items-center space-x-4">
            <el-dropdown trigger="click">
              <el-button icon="el-icon-download"></el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item>导出当前列表</el-dropdown-item>
                  <el-dropdown-item>导出全部数据</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </div>
        </header>
      </el-card>

      <el-card>
        <el-tabs v-model="activeName" @tab-click="TabHandleClick">
          <el-tab-pane label="学生用户" name="student">
            <el-input v-model="searchQuery" placeholder="搜索学生用户名" style="margin-bottom: 10px;"></el-input>
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-9">
                  <el-card shadow="never">
                    <el-table :data="paginatedUserListStudent" style="width: 100%">
                      <el-table-column prop="YHM" label="学生用户名" width="200"></el-table-column>
                      <el-table-column prop="MM" label="密码" width="100"></el-table-column>
                      <el-table-column prop="XSXM" label="学生姓名" width="100"></el-table-column>
                      <el-table-column prop="XSXB" label="学生性别" width="100"></el-table-column>
                      <el-table-column prop="SSBJ" label="所在班级" width="100"></el-table-column>
                      <el-table-column prop="BJMC" label="所在班级名称" width="200"></el-table-column>
                      <el-table-column prop="SSNJ" label="所属年级" width="100"></el-table-column>
                      <el-table-column prop="QYDM" label="启用代码" width="200">
                        <template #default="scope">
                            <span>
                              <i :class="scope.row.QYDM === 1 ? 'el-icon-check' : 'el-icon-close'"
                                 :style="{ color: scope.row.QYDM === 1 ? 'green' : 'red', marginRight: '5px' }"></i>
                              {{ scope.row.QYDM === 1 ? "启用" : "停用" }}
                            </span>
                        </template>
                      </el-table-column>
                      <el-table-column label="操作" width="180">
                        <template #default="scope">
                          <el-button @click="editUserStudent(scope.row)" size="small">编辑</el-button>
                          <el-button @click="deleteUserStudent(scope.row)" v-show="scope.row.QYDM === 1" size="small"
                                     style="color: red;">停用
                          </el-button>
                          <el-button @click="enableUserStudent(scope.row)" v-show="scope.row.QYDM === 0" size="small"
                                     style="color: green;">启用
                          </el-button>
                        </template>
                      </el-table-column>
                    </el-table>
                    <el-pagination
                        @current-change="handleCurrentChangeStudent"
                        :current-page="currentPageStudent"
                        :page-size="pageSize"
                        :total="filteredUserListStudent.length"
                        layout="total, prev, pager, next, jumper"
                        style="margin-top: 20px;"
                    ></el-pagination>
                  </el-card>
                </div>
                <div class="col-md-3">
                  <el-card shadow="never">
                    <el-form ref="userForm" :model="studentForm" :rules="StudentEditRule" label-width="100px">
                      <el-form-item prop="YHM" label="学生用户名">
                        <el-input v-model="studentForm.YHM" placeholder="请输入学生用户名"></el-input>
                      </el-form-item>
                      <el-form-item prop="MM" label="密码">
                        <el-input v-model="studentForm.MM" type="password" placeholder="请输入密码"></el-input>
                      </el-form-item>
                      <el-form-item prop="XSXM" label="学生姓名">
                        <el-input v-model="studentForm.XSXM" prop="XSXM" placeholder="请输入学生姓名"></el-input>
                      </el-form-item>
                      <el-form-item prop="XSXB" label="学生性别">
                        <el-select v-model="studentForm.XSXB" placeholder="请选择学生性别" clearable filterable>
                          <el-option label="请选择" value=""></el-option>
                          <el-option label="男" value="男"></el-option>
                          <el-option label="女" value="女"></el-option>
                        </el-select>
                      </el-form-item>

                      <el-form-item prop="SSBJ" label="所在班级">
                        <el-select v-model="studentForm.SSBJ" placeholder="请选择所在班级" clearable filterable>
                          <el-option label="请选择" value=""></el-option>
                          <el-option v-for="item in BJDMKList" :label="item.id+'-'+item.bjmc" :key="item.id"
                                     :value="item.id"></el-option>
                        </el-select>
                      </el-form-item>

                      <el-form-item label="班级名称：">
                        <span>{{
                            (BJDMKList.find(bj => bj.id === studentForm.SSBJ)) === undefined ? '请选择所在班级' : (BJDMKList.find(bj => bj.id === studentForm.SSBJ)).bjmc
                          }}</span>
                      </el-form-item>
                      <el-form-item prop="SSNJ" label="所在年级">
                        <el-input v-model="studentForm.SSNJ" placeholder="请输入所在年级"></el-input>
                      </el-form-item>
                      <el-form-item prop="QYDM" label="启用代码">
                        <el-select v-model="studentForm.QYDM" placeholder="请选择启用代码">
                          <el-option label="启用" value="1"></el-option>
                          <el-option label="停用" value="0"></el-option>
                        </el-select>
                      </el-form-item>
                      <el-form-item>
                        <el-button type="primary" @click="addUserStudent">添加</el-button>
                        <el-button type="primary" @click="BaoCunUserStudent">保存</el-button>
                      </el-form-item>
                    </el-form>
                  </el-card>
                </div>
              </div>
            </div>
          </el-tab-pane>
          <el-tab-pane label="单位用户" name="dw">
            <el-input v-model="searchQueryDw" placeholder="搜索单位用户名" style="margin-bottom: 10px;"></el-input>
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-9">
                  <el-card shadow="never">
                    <el-table :data="paginatedUserListDw" style="width: 100%">
                      <el-table-column prop="ID" label="编号" width="80"></el-table-column>
                      <el-table-column prop="YHM" label="用户名" width="100"></el-table-column>
                      <el-table-column prop="MM" label="密码" width="100"></el-table-column>
                      <el-table-column prop="YHXM" label="用户名称" width="200"></el-table-column>
                      <el-table-column prop="ZW" label="职位" width="100"></el-table-column>
                      <el-table-column prop="SSDW" label="所属单位" width="100"></el-table-column>
                      <el-table-column prop="DWMC" label="单位名称" width="100"></el-table-column>
                      <el-table-column prop="DWXZ" label="单位性质" width="100"></el-table-column>
                      <el-table-column prop="DWHY" label="单位行业" width="100"></el-table-column>
                      <el-table-column prop="GSMC" label="公司名称" width="200"></el-table-column>
                      <el-table-column prop="RZBZ" label="认证标志" width="100">
                        <template #default="scope">
                            <span>
                              <i :class="scope.row.RZBZ === 2 ? 'el-icon-check' : 'el-icon-close'"
                                 :style="{ color: scope.row.RZBZ === 2 ? 'green' : 'red', marginRight: '5px' }"></i>
                              {{ scope.row.RZBZ === 3 ? "已认证" : (scope.row.RZBZ === 1 ? "认证审核中" : "已认证") }}
                            </span>
                        </template>
                      </el-table-column>
                      <el-table-column prop="TYBZ" label="停用标志" width="100">
                        <template #default="scope">
                            <span>
                              <i :class="scope.row.TYBZ === 0 ? 'el-icon-check' : 'el-icon-close'"
                                 :style="{ color: scope.row.TYBZ === 0 ? 'green' : 'red', marginRight: '5px' }"></i>
                              {{ scope.row.TYBZ === 0 ? "启用" : "停用" }}
                            </span>
                        </template>
                      </el-table-column>
                      <el-table-column label="操作" width="180">
                        <template #default="scope">
                          <el-button @click="editUserDw(scope.row)" size="small">编辑</el-button>
                          <el-button @click="deleteUserDw(scope.row)" v-show="scope.row.TYBZ === 0"
                                     size="small" style="color: red;">停用
                          </el-button>

                          <el-button @click="enableUserDw(scope.row)" v-show="scope.row.TYBZ === 1"
                                     size="small" style="color: green;">启用
                          </el-button>
                        </template>
                      </el-table-column>
                    </el-table>
                    <el-pagination
                        @current-change="handleCurrentChangeDw"
                        :current-page="currentPageDw"
                        :page-size="pageSize"
                        :total="filteredUserListDw.length"
                        layout="total, prev, pager, next, jumper"
                        style="margin-top: 20px;"
                    ></el-pagination>
                  </el-card>
                </div>
                <div class="col-md-3">
                  <el-card shadow="never">
                    <el-form ref="userForm" :model="DwForm" :rules="DwEditRule" label-width="100px">
                      <el-form-item prop="YHM" label="单位用户名">
                        <el-input v-model="DwForm.YHM" placeholder="请输入单位用户名"></el-input>
                      </el-form-item>
                      <el-form-item prop="MM" label="密码">
                        <el-input v-model="DwForm.MM" type="password" placeholder="请输入密码"></el-input>
                      </el-form-item>

                      <el-form-item prop="YHXM" label="用户姓名">
                        <el-input v-model="DwForm.YHXM" placeholder="请输入学生姓名"></el-input>
                      </el-form-item>

                      <el-form-item prop="SEX" label="性别">
                        <el-select v-model="DwForm.SEX" placeholder="请选择学生性别" clearable filterable>
                          <el-option label="请选择" value=""></el-option>
                          <el-option label="男" value="男"></el-option>
                          <el-option label="女" value="女"></el-option>
                        </el-select>
                      </el-form-item>

                      <el-form-item prop="DYDW" label="所属单位">
                        <el-select v-model="DwForm.DYDW" placeholder="请选择所属单位" clearable filterable>
                          <el-option label="请选择" value=""></el-option>
                          <el-option v-for="item in DWLIST" :label="item.dwdm+'-'+item.dwmc+'-'+item.gsmc"
                                     :key="item.dwdm"
                                     :value="item.dwdm"></el-option>
                        </el-select>
                      </el-form-item>

                      <el-form-item label="单位信息：">
                        <span>{{
                            (DWLIST.find(dw => dw.dwdm === DwForm.DYDW)) === undefined ? '请选择用户所属单位' : (DWLIST.find(dw => dw.dwdm === DwForm.DYDW)).dwmc + '-' + (DWLIST.find(dw => dw.dwdm === DwForm.DYDW)).gsmc
                          }}</span>
                      </el-form-item>

                      <el-form-item prop="ZW" label="职位">
                        <el-input v-model="DwForm.ZW" placeholder="请输入用户职位"></el-input>
                      </el-form-item>
                      <!--                      认证标志，0 未认证，1 认证审核中 2 已认证-->
                      <el-form-item prop="RZBZ" label="认证标志">
                        <el-select v-model="DwForm.RZBZ" placeholder="请选择认证标志">
                          <el-option label="未认证" value="0"></el-option>
                          <el-option label="认证审核中" value="1"></el-option>
                          <el-option label="已认证" value="2"></el-option>
                        </el-select>
                      </el-form-item>

                      <el-form-item prop="TYBZ" label="停用标志">
                        <el-select v-model="DwForm.TYBZ" placeholder="请选择停用标志">
                          <el-option label="停用" value="1"></el-option>
                          <el-option label="启用" value="0"></el-option>
                        </el-select>
                      </el-form-item>
                      <el-form-item>
                        <el-button type="primary" @click="addUserDw">添加</el-button>
                        <el-button type="primary" @click="BaoCunUserDw">保存</el-button>
                      </el-form-item>
                    </el-form>
                  </el-card>
                </div>
              </div>
            </div>
          </el-tab-pane>
          <el-tab-pane label="教师用户" name="teacher">
            <el-input v-model="searchQueryTeacher" placeholder="搜索教师用户名" style="margin-bottom: 10px;"></el-input>
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-9">
                  <el-card shadow="never">
                    <el-table :data="paginatedUserListTeacher" style="width: 100%">
                      <el-table-column prop="ID" label="编号" width="100"></el-table-column>
                      <el-table-column prop="DLZH" label="用户名" width="200"></el-table-column>
                      <el-table-column prop="DLMM" label="登录密码" width="200"></el-table-column>
                      <el-table-column prop="JSMC" label="教师名称" width="200"></el-table-column>
                      <el-table-column prop="QYDM" label="启用代码" width="200"></el-table-column>
                      <el-table-column label="操作" width="180">
                        <template #default="scope">
                          <el-button @click="editUserTeacher(scope.row)">编辑</el-button>
                          <el-button @click="deleteUserTeacher(scope.row.id)"
                                     style="color: red;">
                            删除
                          </el-button>
                        </template>
                      </el-table-column>
                    </el-table>
                    <el-pagination
                        @current-change="handleCurrentChangeTeacher"
                        :current-page="currentPageTeacher"
                        :page-size="pageSize"
                        :total="filteredUserListTeacher.length"
                        layout="total, prev, pager, next, jumper"
                        style="margin-top: 20px;"
                    ></el-pagination>
                  </el-card>
                </div>
                <div class="col-md-3">
                  <el-card shadow="never">
                    <el-form ref="TeacherForm" :model="TeacherForm" :rules="TeacherEditRule" label-width="100px">
                      <el-form-item prop="DLZH" label="教师登录账号">
                        <el-input v-model="TeacherForm.DLZH" placeholder="请输入教师登录账号"></el-input>
                      </el-form-item>
                      <el-form-item prop="DLMM" label="登录密码">
                        <el-input v-model="TeacherForm.DLMM" type="password" placeholder="请输入密码"></el-input>
                      </el-form-item>
                      <el-form-item prop="JSMC" label="教师姓名">
                        <el-input v-model="TeacherForm.JSMC" placeholder="请输入教师姓名"></el-input>
                      </el-form-item>
                      <el-form-item prop="SEX" label="性别">
                        <el-select v-model="TeacherForm.SEX" placeholder="请选择教师性别" clearable filterable>
                          <el-option label="请选择" value=""></el-option>
                          <el-option label="男" value="男"></el-option>
                          <el-option label="女" value="女"></el-option>
                        </el-select>
                      </el-form-item>
                      <el-form-item prop="QYDM" label="启用代码">
                        <el-select v-model="TeacherForm.QYDM" placeholder="请选择启用代码">
                          <el-option label="启用" value="1"></el-option>
                          <el-option label="停用" value="0"></el-option>
                        </el-select>
                      </el-form-item>
                      <el-form-item>
                        <el-button type="primary" @click="addUserTeacher">添加</el-button>
                        <el-button type="primary" @click="BaoCunUserTeacher">保存</el-button>
                      </el-form-item>
                    </el-form>
                  </el-card>
                </div>
              </div>
            </div>
          </el-tab-pane>
          <el-tab-pane label="管理员" name="admin">
            <el-input v-model="searchQueryAdmin" placeholder="搜索管理员用户名" style="margin-bottom: 10px;"></el-input>
            <el-table :data="paginatedUserListAdmin" style="width: 100%">
              <el-table-column prop="ID" label="编号" width="100"></el-table-column>
              <el-table-column prop="DLZH" label="登录账号" width="100"></el-table-column>
              <el-table-column prop="DLMM" label="登录密码" width="100"></el-table-column>
              <el-table-column prop="MC" label="管理员名称" width="100"></el-table-column>
              <el-table-column prop="QYDM" label="是否启用" width="100"></el-table-column>
              <el-table-column label="操作" width="180">
                <template #default="scope">
                  <el-button @click="editUserAdmin(scope.row)" type="text" size="small">编辑</el-button>
                  <el-button @click="deleteUserAdmin(scope.row.id)" type="text" size="small" style="color: red;">删除
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-pagination
                @current-change="handleCurrentChangeAdmin"
                :current-page="currentPageAdmin"
                :page-size="pageSize"
                :total="filteredUserListAdmin.length"
                layout="total, prev, pager, next, jumper"
                style="margin-top: 20px;"
            ></el-pagination>
          </el-tab-pane>
        </el-tabs>
      </el-card>

      <!--      <el-button type="primary" @click="openAddUserDialog">添加用户</el-button>-->

      <!-- 新建用户对话框-->
      <el-dialog title="添加/编辑用户" :visible.sync="dialogVisible">
        <el-form :model="newUser">
          <el-form-item label="用户名" :label-width="formLabelWidth">
            <el-input v-model="newUser.name"></el-input>
          </el-form-item>
          <el-form-item label="角色" :label-width="formLabelWidth">
            <el-select v-model="newUser.role" placeholder="请选择角色">
              <el-option label="管理员" value="admin"></el-option>
              <el-option label="学生" value="student"></el-option>
              <el-option label="单位用户" value="company"></el-option>
              <el-option label="教师" value="teacher"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="邮箱" :label-width="formLabelWidth">
            <el-input v-model="newUser.email"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="confirmAddOrEditUser">确 定</el-button>
        </span>
      </el-dialog>

      <!-- 编辑学生用户对话框-->
      <el-dialog title="编辑用户" :visible.sync="isShowEiditDialog.student">
        <el-form ref="userForm" :model="studentEditForm" :rules="StudentEditRule" label-width="100px">
          <el-form-item prop="YHM" label="学生用户名">
            <el-input v-model="studentEditForm.YHM" placeholder="请输入学生用户名"></el-input>
          </el-form-item>
          <el-form-item prop="MM" label="密码">
            <el-input v-model="studentEditForm.MM" type="password" placeholder="请输入密码"></el-input>
          </el-form-item>
          <el-form-item prop="XSXM" label="学生姓名">
            <el-input v-model="studentEditForm.XSXM" prop="XSXM" placeholder="请输入学生姓名"></el-input>
          </el-form-item>
          <el-form-item prop="XSXB" label="学生性别">
            <el-select v-model="studentEditForm.XSXB" placeholder="请选择学生性别" clearable filterable>
              <el-option label="请选择" value=""></el-option>
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item prop="SSBJ" label="所在班级">
            <el-select v-model="studentEditForm.SSBJ" placeholder="请选择所在班级" clearable filterable>
              <el-option label="请选择" value=""></el-option>
              <el-option v-for="item in BJDMKList" :label="item.id+'-'+item.bjmc" :key="item.id"
                         :value="item.id"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="班级名称：">
                <span>{{
                    (BJDMKList.find(bj => bj.id === studentEditForm.SSBJ)) === undefined ? '请选择所在班级' : (BJDMKList.find(bj => bj.id === studentEditForm.SSBJ)).bjmc
                  }}</span>
          </el-form-item>
          <el-form-item prop="SSNJ" label="所在年级">
            <el-input v-model="studentEditForm.SSNJ" placeholder="请输入所在年级"></el-input>
          </el-form-item>
          <el-form-item prop="QYDM" label="启用代码">
            <el-select v-model="studentEditForm.QYDM" placeholder="请选择启用代码">
              <el-option label="启用" value="1"></el-option>
              <el-option label="停用" value="0"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="isShowEiditDialog.student = false">取 消</el-button>
          <el-button type="primary" @click="editSubmitStudent">保 存</el-button>
        </span>
      </el-dialog>
      <!-- 编辑单位用户对话框-->
      <el-dialog title="编辑用户" :visible.sync="isShowEiditDialog.dw">
        <el-form ref="DwEditForm" :model="DwEditForm" :rules="DwEditRule" label-width="100px">
          <el-form-item prop="YHM" label="单位用户名">
            <el-input v-model="DwEditForm.YHM" placeholder="请输入单位用户名"></el-input>
          </el-form-item>
          <el-form-item prop="MM" label="密码">
            <el-input v-model="DwEditForm.MM" type="password" placeholder="请输入密码"></el-input>
          </el-form-item>

          <el-form-item prop="YHXM" label="用户姓名">
            <el-input v-model="DwEditForm.YHXM" placeholder="请输入学生姓名"></el-input>
          </el-form-item>

          <el-form-item prop="SEX" label="性别">
            <el-select v-model="DwEditForm.SEX" placeholder="请选择学生性别" clearable filterable>
              <el-option label="请选择" value=""></el-option>
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item prop="DYDW" label="所属单位">
            <el-select v-model="DwEditForm.DYDW" placeholder="请选择所属单位" clearable filterable>
              <el-option label="请选择" value=""></el-option>
              <el-option v-for="item in DWLIST" :label="item.dwdm+'-'+item.dwmc+'-'+item.gsmc"
                         :key="item.dwdm"
                         :value="item.dwdm"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="单位信息：">
              <span>{{
                  (DWLIST.find(dw => dw.dwdm === DwEditForm.DYDW)) === undefined ? '请选择用户所属单位' : (DWLIST.find(dw => dw.dwdm === DwEditForm.DYDW)).dwmc + '-' + (DWLIST.find(dw => dw.dwdm === DwEditForm.DYDW)).gsmc
                }}</span>
          </el-form-item>

          <el-form-item prop="ZW" label="职位">
            <el-input v-model="DwEditForm.ZW" placeholder="请输入用户职位"></el-input>
          </el-form-item>
          <!--                      认证标志，0 未认证，1 认证审核中 2 已认证-->
          <el-form-item prop="RZBZ" label="认证标志">
            <el-select v-model="DwEditForm.RZBZ" placeholder="请选择认证标志">
              <el-option label="未认证" value="0"></el-option>
              <el-option label="认证审核中" value="1"></el-option>
              <el-option label="已认证" value="2"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item prop="TYBZ" label="停用标志">
            <el-select v-model="DwEditForm.TYBZ" placeholder="请选择停用标志">
              <el-option label="停用" value="1"></el-option>
              <el-option label="启用" value="0"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="isShowEiditDialog.dw = false">取 消</el-button>
          <el-button type="primary" @click="editSubmitDw">保 存</el-button>
        </span>
      </el-dialog>

      <!-- 编辑教师用户对话框-->
      <el-dialog title="编辑用户" :visible.sync="isShowEiditDialog.teacher">
        <el-form ref="TeacherEditForm" :model="TeacherEditForm" :rules="TeacherEditRule" label-width="100px">
          <el-form-item prop="DLZH" label="教师登录账号">
            <el-input v-model="TeacherEditForm.DLZH" placeholder="请输入教师登录账号"></el-input>
          </el-form-item>
          <el-form-item prop="DLMM" label="登录密码">
            <el-input v-model="TeacherEditForm.DLMM" type="password" placeholder="请输入密码"></el-input>
          </el-form-item>
          <el-form-item prop="JSMC" label="教师姓名">
            <el-input v-model="TeacherEditForm.JSMC" placeholder="请输入教师姓名"></el-input>
          </el-form-item>
          <el-form-item prop="SEX" label="性别">
            <el-select v-model="TeacherEditForm.SEX" placeholder="请选择教师性别" clearable filterable>
              <el-option label="请选择" value=""></el-option>
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item prop="QYDM" label="启用代码">
            <el-select v-model="TeacherEditForm.QYDM" placeholder="请选择启用代码">
              <el-option label="启用" value="1"></el-option>
              <el-option label="停用" value="0"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="isShowEiditDialog.teacher = false">取 消</el-button>
          <el-button type="primary" @click="editSubmitTeacher">保 存</el-button>
        </span>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import AdminMenu from "@/components/admin/Admin_menu.vue";
import axios from "axios";

export default {
  name: 'AdminUser',
  components: {AdminMenu},
  data() {
    return {
      BJDMKList: [],// 班级代码列表
      DWLIST: [], // 所有单位列表

      isShowEiditDialog: {
        student: false,
        dw: false,
        teacher: false,
        admin: false,
      },


      // 用户操作状态
      UserDoState: {},
      activeName: 'student', // 当前激活的标签页
      userListAdmin: [], // 管理员用户列表
      userListStudent: [], // 学生用户列表
      userListDw: [], // 单位用户列表
      userListTeacher: [], // 教师用户列表

      filteredUserListAdmin: [], // 过滤后的管理员用户列表
      filteredUserListStudent: [], // 过滤后的学生用户列表
      filteredUserListDw: [], // 过滤后的单位用户列表
      filteredUserListTeacher: [], // 过滤后的教师用户列表

      dialogVisible: false, // 控制对话框的显示
      newUser: {name: '', role: '', email: ''}, // 新用户数据
      searchQuery: '', // 搜索查询
      searchQueryDw: '',
      searchQueryTeacher: '',
      searchQueryAdmin: '',
      pageSize: 10, // 每页显示的用户数量
      currentPageStudent: 1,
      currentPageDw: 1,
      currentPageTeacher: 1,
      currentPageAdmin: 1,
      formLabelWidth: '80px', // 表单标签宽度

      studentForm: {
        YHM: '',
        MM: '',
        XSXM: '',
        QYDM: 1, // 启用代码
        SSBJ: null, // 所在班级
        BJMC: '', // 班级名称
        SSNJ: null,// 所在年级
        XSXB: '男' // 学生性别
      },
      // 供修改的学生用户信息
      studentEditForm: {
        ID: null,
        YHM: null,
        MM: null,
        XSXM: null,
        QYDM: null, // 启用代码
        SSBJ: null, // 所在班级
        BJMC: null, // 班级名称
        SSNJ: null,// 所在年级
        XSXB: null // 学生性别
      },
      StudentEditRule: {
        YHM: [
          {required: true, message: '请输入学生用户名', trigger: 'blur'},
          {max: 11, message: '用户名不能超过11个字符', trigger: 'blur'},
          {pattern: /^[a-zA-Z0-9]+$/, message: '用户名只能包含字母和数字', trigger: 'blur'}
        ],
        MM: [
          {required: true, message: '请输入密码', trigger: 'blur'},
          {min: 3, message: '密码至少需要3个字符', trigger: 'blur'},
        ],
        XSXB: [{required: true, message: '请选择学生性别', trigger: 'change'}],
        XSXM: [
          {required: true, message: '请输入学生姓名', trigger: 'blur'},
          {max: 20, message: '姓名不能超过20个字符', trigger: 'blur'}
        ],
        QYDM: [
          {required: true, message: '请选择启用代码', trigger: 'change'}
        ],
        SSBJ: [{required: true, message: '请选择所在班级', trigger: 'change'}],
        SSNJ: [{required: true, message: '请输入所在年级', trigger: 'blur'}]
      },
      // 单位用户表单
      DwForm: {
        "DYDW": null,
        "YHM": "",
        "MM": "",
        "TYBZ": 0,
        "YHXM": "",
        "SEX": "男",
        "ZW": "",
        "SSDW": null,
        "RZBZ": 0,
      },
      // 单位用户表单
      DwEditForm: {
        "DYDW": null,
        "YHM": null,
        "MM": null,
        "TYBZ": null,
        "YHXM": null,
        "SEX": null,
        "ZW": null,
        "SSDW": null,
        "RZBZ": null,
      },
      DwEditRule: {
        "YHM": [
          {required: true, message: '请输入单位用户名', trigger: 'blur'},
          {max: 11, message: '用户名不能超过11个字符', trigger: 'blur'},
          {pattern: /^[a-zA-Z0-9]+$/, message: '用户名只能包含字母和数字', trigger: 'blur'}
        ],
        "MM": [
          {required: true, message: '请输入密码', trigger: 'blur'},
          {min: 3, message: '密码至少需要3个字符', trigger: 'blur'},
        ],
        "SEX": [{required: true, message: '请选择学生性别', trigger: 'change'}],
        "YHXM": [
          {required: true, message: '请输入学生姓名', trigger: 'blur'},
          {max: 20, message: '姓名不能超过20个字符', trigger: 'blur'}
        ],
        "ZW": [
          {required: true, message: '请输入职位', trigger: 'blur'},
          {max: 20, message: '职位不能超过20个字符', trigger: 'blur'}
        ],
        "DYDW": [{required: true, message: '请选择所属单位', trigger: 'change'}],
        "RZBZ": [{required: true, message: '请选择认证标志', trigger: 'change'}],
      },
      TeacherForm: {
        "ID": null, // 用户ID
        "JSMC": null, // 教师姓名
        "SEX": "男",// 性别
        "DLZH": null,//登录账号
        "DLMM": null,// 登录密码
        "QYDM": 1, // 启用代码
      },
      TeacherEditRule: {
        "JSMC": [
          {required: true, message: '请输入教师姓名', trigger: 'blur'},
          {max: 20, message: '姓名不能超过20个字符', trigger: 'blur'}
        ],
        "DLZH": [
          {required: true, message: '请输入登录账号', trigger: 'blur'},
          {max: 11, message: '登录账号不能超过11个字符', trigger: 'blur'},
          {pattern: /^[a-zA-Z0-9]+$/, message: '登录账号只能包含字母和数字', trigger: 'blur'}
        ],
        "DLMM": [
          {required: true, message: '请输入登录密码', trigger: 'blur'},
          {min: 3, message: '密码至少需要3个字符', trigger: 'blur'},
        ],
        "QYDM": [
          {required: true, message: '请选择启用代码', trigger: 'change'}
        ],
      },
      TeacherEditForm: {
        "ID": null, // 用户ID
        "JSMC": null, // 教师姓名
        "SEX": null,// 性别
        "DLZH": null,//登录账号
        "DLMM": null,// 登录密码
        "QYDM": null, // 启用代码
      },
      AdminForm: {},
      AdminEditRule: {},

    };
  },
  mounted() {
    // 获取用户数据
    this.getAllUserData();
    // 获取班级代码列表
    this.getAllBJDMKList();
  },
  methods: {
    // 单击添加用户按钮-- 清空表单
    addUserTeacher() {
      this.TeacherForm = {
        "ID": null, // 用户ID
        "JSMC": null, // 教师姓名
        "SEX": "男",// 性别
        "DLZH": null,//登录账号
        "DLMM": null,// 登录密码
        "QYDM": 1, // 启用代码
      }
    },
    // 单击保存编辑的教师信息
    editSubmitTeacher() {
      console.log("保存编辑的教师信息：");
      console.log(this.TeacherEditForm);
      let postData = new FormData();
      postData.append("id", this.TeacherEditForm.ID); // 用户ID
      postData.append("jsmc", this.TeacherEditForm.JSMC); // 教师姓名
      postData.append("sex", this.TeacherEditForm.SEX);// 性别
      postData.append("dlzh", this.TeacherEditForm.DLZH);//登录账号
      postData.append("dlmm", this.TeacherEditForm.DLMM);// 登录密码
      postData.append("qydm", this.TeacherEditForm.QYDM);// 启用代码
      axios.post("/teacher/updateTeacher", postData).then(res => {
        if (res.data.result) {
          this.$message.success("教师信息修改成功！");
          this.isShowEiditDialog.teacher = false; // 关闭对话框
          this.getAllUserData(); // 更新用户列表
        } else {
          this.$message.error("教师信息修改失败：" + res.data.msg)
        }
      }).catch(err => {
        console.log(err);
        this.$message.error("教师信息修改失败：" + err.message)
      });
    },
    // 单击保存教师按钮
    BaoCunUserTeacher() {
      console.log("保存教师信息：")
      console.log(this.TeacherForm);// 打印表单数据
      let postData = new FormData();
      postData.append("jsmc", this.TeacherForm.JSMC); // 教师姓名
      postData.append("sex", this.TeacherForm.SEX);// 性别
      postData.append("dlzh", this.TeacherForm.DLZH);//登录账号
      postData.append("dlmm", this.TeacherForm.DLMM);// 登录密码
      postData.append("qydm", this.TeacherForm.QYDM);// 启用代码
      axios.post("/teacher/addTeacherAuto", postData).then(res => {
        if (res.data.result) {
          this.$message.success("教师信息保存成功！");
          this.addUserTeacher(); // 清空表单
          this.getAllUserData(); // 更新用户列表
        } else {
          this.$message.error("教师信息保存失败：" + res.data.msg)
        }
      }).catch(err => {
        console.log(err);
        this.$message.error("教师信息保存失败：" + err.message)
      });
    },
    // 单位用户编辑保存
    editSubmitDw() {
      console.log("单位用户编辑保存：");
      console.log(this.DwEditForm);
      let postData = new FormData();
      postData.append("id", this.DwEditForm.ID); // 用户ID
      postData.append("dydw", this.DwEditForm.DYDW); // 所属单位
      postData.append("yhm", this.DwEditForm.YHM); // 用户名
      postData.append("mm", this.DwEditForm.MM);// 密码
      postData.append("tybz", this.DwEditForm.TYBZ); // 停用标志
      postData.append("yhxm", this.DwEditForm.YHXM); // 用户姓名
      postData.append("sex", this.DwEditForm.SEX);// 性别
      postData.append("zw", this.DwEditForm.ZW); // 职位
      postData.append("ssdw", this.DwEditForm.SSDW); // 所属单位
      postData.append("rzbz", this.DwEditForm.RZBZ); // 认证标志
      axios.post("/dwyhk/updateDwyhk", postData).then(res => {
        if (res.data.result) {
          this.$message.success("单位用户信息修改成功！");
          this.getAllUserData();
          this.isShowEiditDialog.dw = false; // 关闭对话框
        } else {
          this.$message.error("单位用户信息修改失败：" + res.data.msg)
        }
      }).catch(err => {
        console.log(err);
        this.$message.error("单位用户信息修改失败：" + err.message)
      });
    },
    // 学生编辑保存
    editSubmitStudent() {
      // 验证通过，保存用户信息
      let postData = new FormData();
      postData.append("id", this.studentEditForm.ID); // 用户ID
      postData.append("yhm", this.studentEditForm.YHM); // 用户名
      postData.append("mm", this.studentEditForm.MM);// 密码
      postData.append("xsxm", this.studentEditForm.XSXM); // 学生姓名
      postData.append("qydm", this.studentEditForm.QYDM); // 启用代码
      postData.append("ssbj", this.studentEditForm.SSBJ); // 所在班级
      postData.append("bjmc", this.BJDMKList.find(bj => bj.id === this.studentEditForm.SSBJ).bjmc);// 班级名称
      postData.append("ssnj", this.studentEditForm.SSNJ); // 所在年级
      postData.append("xsxb", this.studentEditForm.XSXB);// 学生性别

      // 提交数据
      axios.post('/student/updateStudentByEdit', postData).then(response => {
        if (response.data.result) {
          this.$message.success("学生信息修改成功！");
          this.this.isShowEiditDialog.student = false; // 显示对话框
        } else {
          this.$message.error("学生信息修改失败：" + response.data.msg);
        }
      }).catch(error => {
        // 处理错误
        console.log(error);
        this.$message.error("学生信息修改失败：" + error.message);
      });
    },
    // 单击新建 清空表单
    addUserDw() {
      this.DwForm = {
        "DYDW": null,
        "YHM": "",
        "MM": "",
        "TYBZ": 0,
        "YHXM": "",
        "SEX": "男",
        "ZW": "",
        "SSDW": null,
        "RZBZ": 1,
      }
    },
    //保存新建单位信息
    BaoCunUserDw() {
      console.log("保存新建的单位用户信息：");
      console.log(this.DwForm);
      let postData = new FormData();
      postData.append("dydw", this.DwForm.DYDW);
      postData.append("yhm", this.DwForm.YHM);
      postData.append("mm", this.DwForm.MM);
      postData.append("tybz", this.DwForm.TYBZ);
      postData.append("yhxm", this.DwForm.YHXM);
      postData.append("sex", this.DwForm.SEX);
      postData.append("zw", this.DwForm.ZW);
      postData.append("ssdw", this.DwForm.DYDW);
      postData.append("rzbz", this.DwForm.RZBZ);

      axios.post("/dwyhk/addDwyhk", postData).then(res => {
        if (res.data.result) {
          this.getAllUserData();
          this.$message.success("单位用户信息保存成功！");
          this.addUserDw(); // 清空表单
        } else {
          this.$message.error("单位用户信息保存失败：" + res.msg)
        }
      }).catch(err => {
        console.log(err)
        this.$message.error("单位用户信息保存失败：" + err.message)
      })

    },
    // 获取班级代码列表
    getAllBJDMKList() {
      axios.get("/class/getAllClass").then(res => {
        if (res.data.result) {
          this.BJDMKList = res.data.data;
        } else {
          this.$message.error("班级数据获取失败：" + res.data.msg)
        }
      }).catch(err => {
        console.log(err)
        this.$message.error("班级数据获取失败：" + err.message)
      })
    },
    // 获取所有启用单位列表
    getAllQyDwList() {
      axios.get("/dw/getDwByQydm?qydm=1").then((response) => {
        if (response.data.result) {
          this.DWLIST = response.data.data;
        } else {
          this.$message.error('获取单位信息失败,后台错误');
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error('获取单位信息失败,网络错误');
      });
    },
    // 单击添加学生用户按钮，清空表单
    addUserStudent() {
      this.studentForm = {
        YHM: '',
        MM: '',
        XSXM: '',
        QYDM: 1,
      }
    },
    // 单击保存按钮，新增信息
    BaoCunUserStudent() {
      console.log("保存填写的学生用户信息：");
      console.log(this.studentForm);
      // 验证表单
      this.$refs.userForm.validate((valid) => {
        if (valid) {
          // 验证通过，保存用户信息
          let postData = new FormData();
          postData.append("yhm", this.studentForm.YHM);
          postData.append("mm", this.studentForm.MM);
          postData.append("xsxm", this.studentForm.XSXM);
          postData.append("qydm", this.studentForm.QYDM);
          postData.append("ssbj", this.studentForm.SSBJ);
          postData.append("bjmc", this.BJDMKList.find(bj => bj.id === this.studentForm.SSBJ).bjmc);
          postData.append("ssnj", this.studentForm.SSNJ);
          postData.append("xsxb", this.studentForm.XSXB);
          axios.post("/student/addStudentAuto", postData).then(res => {
            if (res.data.result) {
              this.$message.success("学生用户信息保存成功！");
              this.addUserStudent(); // 清空表单
            } else {
              this.$message.error("学生用户信息保存失败：" + res.data.msg);
            }
          }).catch(err => {
            console.log(err)
            this.$message.error("学生用户信息保存失败：" + err.message)
          })
        } else {
          return false;
        }
      });
    },
    getAllUserData() {
      axios.get("/user/getUserAllType?state=1").then((response) => {
        this.userListAdmin = response.data[0];
        this.userListStudent = response.data[1];
        this.userListTeacher = response.data[2];
        this.userListDw = response.data[3];
        this.filterUsers(); // 初始化过滤
      }).catch((error) => {
        console.log(error);
      });
    },
    TabHandleClick(tab, event) {
      console.log(tab.name);
      this.filterUsers(); // 切换标签时更新过滤
      if (tab.name === "dw" && this.DWLIST.length === 0) {
        // 获取新的单位信息
        this.getAllQyDwList();
      } else if (tab.name === "student" && this.BJDMKList.length === 0) {
        // 获取信息的班级信息
        this.getAllBJDMKList();
      }

    },
    openAddUserDialog() {
      this.newUser = {name: '', role: '', email: ''}; // 重置表单
      this.dialogVisible = true; // 显示对话框
    },
    confirmAddOrEditUser() {
      if (this.newUser.name && this.newUser.role && this.newUser.email) {
        if (this.newUser.id) {
          // 编辑用户
          this.updateUser(this.newUser);
        } else {
          // 添加用户
          this.addUser();
        }
        this.dialogVisible = false; // 关闭对话框
      } else {
        this.$message.error('请填写完整的用户信息');
      }
    },
    addUser() {
      const newUserWithId = {id: Date.now(), ...this.newUser}; // 使用时间戳作为ID
      if (this.newUser.role === 'admin') {
        this.userListAdmin.push(newUserWithId);
      } else if (this.newUser.role === 'student') {
        this.userListStudent.push(newUserWithId);
      } else if (this.newUser.role === 'company') {
        this.userListDw.push(newUserWithId);
      } else if (this.newUser.role === 'teacher') {
        this.userListTeacher.push(newUserWithId);
      }
      this.$message.success('用户添加成功');
      this.filterUsers(); // 更新过滤后的用户列表
    },
    updateUser(user) {
      const list = this.getUserListByRole(user.role);
      const index = list.findIndex(u => u.id === user.id);
      if (index !== -1) {
        list.splice(index, 1, user); // 更新用户信息
        this.$message.success('用户信息更新成功');
        this.filterUsers(); // 更新过滤后的用户列表
      }
    },
    editUserAdmin(user) {
      this.newUser = {...user}; // 填充当前用户信息
      this.dialogVisible = true; // 显示对话框
    },
    // 编辑修改学生用户信息打开对话框
    editUserStudent(user) {
      console.log("编辑学生用户信息：")
      console.log(user);
      this.studentEditForm.ID = user.ID;// 填充当前用户信息
      this.studentEditForm.YHM = user.YHM;// 用户名
      this.studentEditForm.MM = user.MM; // 密码
      this.studentEditForm.XSXM = user.XSXM;// 学生姓名
      this.studentEditForm.QYDM = user.QYDM; // 启用代码
      this.studentEditForm.XSXB = user.XSXB; // 学生性别
      this.studentEditForm.SSBJ = user.SSBJ;// 班级代码
      this.studentEditForm.SSNJ = user.SSNJ;// 所在年级
      this.studentEditForm.BJMC = user.BJMC;// 班级名称
      console.log(this.studentEditForm);

      this.isShowEiditDialog.student = true; // 显示对话框
    },
    editUserDw(user) {
      console.log("编辑单位用户信息：")
      console.log(user);
      this.DwEditForm.ID = user.ID;// 填充当前用户信息
      this.DwEditForm.DYDW = user.DYDW;// 所属单位
      this.DwEditForm.YHM = user.YHM;// 用户名
      this.DwEditForm.MM = user.MM; // 密码
      this.DwEditForm.TYBZ = user.TYBZ; // 停用标志
      this.DwEditForm.YHXM = user.YHXM;// 姓名
      this.DwEditForm.SEX = user.SEX; // 性别
      this.DwEditForm.ZW = user.ZW; // 职位
      this.DwEditForm.SSDW = user.SSDW; // 所属单位
      this.DwEditForm.RZBZ = user.RZBZ; // 认证标志
      console.log(this.DwEditForm);

      this.isShowEiditDialog.dw = true; // 显示对话框
    },
    editUserTeacher(user) {
      this.TeacherEditForm = user;
      console.log("编辑教师用户信息：");
      console.log(this.TeacherEditForm);
      this.isShowEiditDialog.teacher = true; // 显示对话框
    },
    // 停用管理员用户
    deleteUserAdmin(userId) {
      this.userListAdmin = this.userListAdmin.filter(user => user.id !== userId);
      this.$message.success('用户已删除');
      this.filterUsers(); // 更新过滤后的用户列表
    },
    // 停用学生用户
    deleteUserStudent(student) {
      /*  his.userListStudent = this.userListStudent.filter(user => user.ID !== student.ID);
            this.$message.success('用户已删除');
            this.filterUsers(); // 更新过滤后的用户列表*/

      this.$confirm('确认要停用该学生用户吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 调用接口停用学生用户
        axios.get("/student/deleteStudentById?id=" + student.ID).then((response) => {
          if (response.data.result) {
            this.$message.success('用户' + student.YHM + ',停用成功');
            // 获取用户数据
            this.getAllUserData();
          } else {
            this.$message.error('停用失败:' + response.data.msg);
          }
        }).catch((error) => {
          console.log(error);
          this.$message.error('停用失败:' + error);
        })
      }).catch(() => {
        this.$message.info('已取消');
      });
    },
    // 启用学生用户
    enableUserStudent(student) {
      console.log(student)
      axios.get(("/student/enableStudentById?id=" + student.ID)).then((response) => {
        if (response.data.result) {
          this.$message.success('启用成功');
          // 获取用户数据
          this.getAllUserData();
        } else {
          this.$message.error('启用失败:' + response.data.msg);
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error('启用失败:' + error);
      })
    },
    // 启用单位用户
    enableUserDw(dw) {
      console.log(dw);
      let postData = new FormData();
      postData.append("yhm", dw.YHM);
      postData.append("tybz", 0);
      // 调用接口停用单位用户
      axios.post("/dwyhk/updateDwyhkQYBZ", postData).then((response) => {
        if (response.data.result) {
          this.$message.success('用户' + dw.YHM + ',停用成功');
          // 获取用户数据
          this.getAllUserData();
        } else {
          this.$message.error('停用失败:' + response.data.msg);
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error('停用失败:' + error);
      })
    },
    // 停用单位用户
    deleteUserDw(dw) {
      /* this.userListDw = this.userListDw.filter(user => user.id !== userId);
       this.$message.success('用户已删除');
       this.filterUsers(); // 更新过滤后的用户列表*/
      this.$confirm('确认要停用单位用户:' + dw.YHM + '吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'

      }).then(() => {
        let postData = new FormData();
        postData.append("yhm", dw.YHM);
        postData.append("tybz", 1);
        // 调用接口停用单位用户
        axios.post("/dwyhk/updateDwyhkQYBZ", postData).then((response) => {
          if (response.data.result) {
            this.$message.success('用户' + dw.YHM + ',停用成功');
            // 获取用户数据
            this.getAllUserData();
          } else {
            this.$message.error('停用失败:' + response.data.msg);
          }
        }).catch((error) => {
          console.log(error);
          this.$message.error('停用失败:' + error);
        })
      }).catch(() => {
        this.$message.info('已取消');
      });

    },
    deleteUserTeacher(userId) {
      this.userListTeacher = this.userListTeacher.filter(user => user.id !== userId);
      this.$message.success('用户已删除');
      this.filterUsers(); // 更新过滤后的用户列表
    },
    filterUsers() {
      this.filteredUserListAdmin = this.userListAdmin.filter(user => {
        return user.DLZH.includes(this.searchQueryAdmin) || user.MC.includes(this.searchQueryAdmin);
      });
      this.filteredUserListStudent = this.userListStudent.filter(user => {
        return user.YHM.includes(this.searchQuery) || user.XSXM.includes(this.searchQuery);
      });
      this.filteredUserListDw = this.userListDw.filter(user => {
        return user.YHM.includes(this.searchQueryDw) || user.YHXM.includes(this.searchQueryDw);
      });
      this.filteredUserListTeacher = this.userListTeacher.filter(user => {
        return user.DLZH.includes(this.searchQueryTeacher) || user.JSMC.includes(this.searchQueryTeacher);
      });
    },
    handleCurrentChangeStudent(page) {
      this.currentPageStudent = page;
    },
    handleCurrentChangeDw(page) {
      this.currentPageDw = page;
    },
    handleCurrentChangeTeacher(page) {
      this.currentPageTeacher = page;
    },
    handleCurrentChangeAdmin(page) {
      this.currentPageAdmin = page;
    },
    getUserListByRole(role) {
      switch (role) {
        case 'admin':
          return this.userListAdmin;
        case 'student':
          return this.userListStudent;
        case 'company':
          return this.userListDw;
        case 'teacher':
          return this.userListTeacher;
        default:
          return [];
      }
    }
  },
  computed: {
    paginatedUserListAdmin() {
      const start = (this.currentPageAdmin - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.filteredUserListAdmin.slice(start, end);
    },
    paginatedUserListStudent() {
      const start = (this.currentPageStudent - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.filteredUserListStudent.slice(start, end);
    },
    paginatedUserListDw() {
      const start = (this.currentPageDw - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.filteredUserListDw.slice(start, end);
    },
    paginatedUserListTeacher() {
      const start = (this.currentPageTeacher - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.filteredUserListTeacher.slice(start, end);
    },
    totalUsers() {
      return this.userListAdmin.length + this.userListStudent.length + this.userListDw.length + this.userListTeacher.length;
    }
  },
  watch: {
    userListAdmin: {
      handler() {
        this.filterUsers(); // 监视用户列表变化
      },
      deep: true
    },
    userListStudent: {
      handler() {
        this.filterUsers(); // 监视用户列表变化
      },
      deep: true
    },
    userListDw: {
      handler() {
        this.filterUsers(); // 监视用户列表变化
      },
      deep: true
    },
    userListTeacher: {
      handler() {
        this.filterUsers(); // 监视用户列表变化
      },
      deep: true
    }
  }
};
</script>

<style scoped>
.content {
  display: flex;
}

.el-table .warning-row {
  background: oldlace;
}

.el-table .success-row {
  background: #f0f9eb;
}

.p-6 {
  padding: 10px !important;
}
</style>