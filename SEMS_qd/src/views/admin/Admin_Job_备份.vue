<template>
  <div>
    <admin-menu></admin-menu>
    <main class="ml-64 flex-1 p-6">
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold text-gray-800">岗位信息管理</h1>
        <div class="flex space-x-3">
          <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600" @click="showAddPostPopup">
            <i class="fas fa-plus"></i> 新增岗位
          </button>
          <button class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
            <i class="fas fa-file-export"></i> 导出
          </button>
        </div>
      </header>

      <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
        <!--岗位列表展示-->
        <div class="bg-white p-4 rounded-lg shadow">
          <div class="flex justify-between items-center mb-4">
            <h2 class="text-lg font-semibold">岗位列表</h2>
            <div class="flex space-x-2 text-sm">
              <span class="text-gray-600">总岗位：{{ posts.length }}</span>
              <span class="text-green-600">开放岗位：{{ posts.filter(p => p.status === '开启').length }}</span>
            </div>
          </div>
          <input
              v-model="searchQuery"
              type="text"
              placeholder="搜索岗位..."
              class="border mb-4 p-2 rounded w-full"/>
          <div>
            <table class="w-full text-left">
              <thead>
              <tr class="bg-gray-100 border-b">
                <th class="p-3">岗位名称</th>
                <th class="p-3">单位名称</th>
                <th class="p-3">公司名称</th>
                <th class="p-3">岗位类别</th>
                <th class="p-3">招聘人数</th>
                <th class="p-3">岗位状态</th>
                <th class="p-3">操作</th>
              </tr>
              </thead>
              <tbody>
              <tr
                  v-for="post in paginatedPosts"
                  :key="post.id"
                  class="border-b hover:bg-gray-50 cursor-pointer"
                  @click="showPostDetails(post)">
                <td class="p-3 flex items-center">
                  <div class="w-10 h-10 bg-blue-100 rounded-full mr-3 flex items-center justify-center">
                    <i class="fas fa-briefcase text-blue-500"></i>
                  </div>
                  {{ post.gwmc }}
                </td>
                <td class="p-3">{{ post.dwmc }}</td>
                <td class="p-3">{{ DATADWDMK.find(item => item.dwdm === post.dwdm).gsmc }}</td>
                <td class="p-3">
            <span class="bg-purple-100 text-purple-600 px-2 py-1 rounded-full text-xs">
              {{ post.sxbz === 1 ? '实习' : (post.sxbz === 2 ? '正式' : '未知') }}
            </span>
                </td>
                <td class="p-3">
            <span class="bg-green-100 text-green-600 px-2 py-1 rounded-full text-xs">
              {{ post.zprs }}人
            </span>
                </td>
                <td class="p-3">
            <span :class="post.qydm == 1 ? 'bg-green-100 text-green-600' : 'bg-red-100 text-red-600'"
                  class="px-2 py-1 rounded-full text-xs">
              {{ post.qydm == 1 ? '启用' : '关闭' }}
            </span>
                </td>
                <td class="p-3 flex space-x-2">
                  <button class="text-blue-500 hover:text-blue-700" @click.stop="editPost(post)">
                    <i class="fas fa-edit"></i>
                  </button>
                  <button class="text-red-500 hover:text-red-700" v-if="post.qydm"
                          @click.stop="endUsingGangWei(post.id)">
                    <i class="fas fa-trash"></i>
                  </button>
                  <button class="text-blue-500 hover:text-green-700" v-else @click.stop="startUsingGangWei(post.id)">
                    <i class="el-icon-check"></i> 启用
                  </button>
                </td>
              </tr>
              </tbody>
            </table>
            <Pagination
                :totalPosts="filteredPosts.length"
                :postsPerPage="postsPerPage"
                :currentPage.sync="currentPage"/>
          </div>
        </div>

        <!--火热岗位展示-->
        <div class="bg-white rounded-lg shadow p-4">
          <div class="flex justify-between items-center mb-4">
            <h2 class="text-lg font-semibold">火热岗位 & 最近发布</h2>
            <a href="#" class="text-blue-500 text-sm hover:underline">查看更多</a>
          </div>
          <div class="space-y-3">
            <div
                v-for="(post,index) in hotPosts"
                :key="post.id"
                class="bg-gray-50 rounded-lg p-3 flex justify-between items-center hover:bg-blue-50 cursor-pointer"
                @click="showPostDetails(post)">
              <div>
                <div class="font-semibold">{{ post.gwmc }} <span
                    style="font-size: 20px; color: red;position:relative; left: 20px;" v-if="index===0">最多投递</span>
                </div>
                <div class="text-sm text-gray-500">{{ post.dwmc }}</div>
              </div>
              <span class="bg-blue-100 text-blue-600 px-2 py-1 rounded-full text-xs">
                热招中
              </span>
            </div>
          </div>
        </div>
      </div>

      <!-- 岗位详情弹窗 -->
      <transition name="fade">
        <div v-if="isDetailPopupVisible" class="popup-overlay">
          <div class="popup-large bg-white rounded-lg shadow-lg p-4 max-w-lg mx-auto">
            <h2 class="text-2xl font-bold mb-4 text-center">
              {{ selectedPost.gwmc }} - {{ selectedPost.dwmc }}
            </h2>

            <div class="mb-4">
              <h3 class="text-lg font-semibold mb-2">
                <i class="bi bi-file-earmark-text me-2"></i> 岗位描述
              </h3>
              <p class="text-gray-700">{{ selectedPost.gwms || "暂无岗位描述" }}</p>
            </div>

            <div class="mb-4">
              <h3 class="text-lg font-semibold mb-2">
                <i class="bi bi-check-circle me-2"></i> 岗位要求
              </h3>
              <p class="text-gray-700"
                 v-html="selectedPost.gwyq ? selectedPost.gwyq.replace(/\n/g, '<br>') : '暂无岗位要求'"></p>
            </div>
            <div class="mb-4">
              <h3 class="text-lg font-semibold mb-2">
                <i class="bi bi-check-circle me-2"></i> 工作职责
              </h3>
              <p class="text-gray-700"
                 v-html="selectedPost.gzzz ? selectedPost.gzzz.replace(/\n/g, '<br>') : '暂无岗位职责描述'"></p>
            </div>

            <div class="mb-4">
              <h3 class="text-lg font-semibold mb-2">
                <i class="bi bi-calendar-date me-2"></i> 岗位发布时间
              </h3>
              <p class="text-gray-700">
                {{ selectedPost.fbsj ? new Date(selectedPost.fbsj).toLocaleDateString() : "暂无发布时间" }}</p>
            </div>

            <div class="mb-4">
              <h3 class="text-lg font-semibold mb-2">
                <i class="bi bi-info-circle me-2"></i> 投递说明
              </h3>
              <p class="text-gray-700"
                 v-html="selectedPost.tdsm ? selectedPost.tdsm.replace(/\n/g, '<br>') : '暂无投递说明'"></p>
            </div>

            <h3 class="text-lg font-semibold mb-3">
              <i class="bi bi-cash-stack me-2"></i> 薪资详情
            </h3>
            <table class="table table-bordered table-striped mb-4">
              <tbody>
              <tr>
                <th scope="row">最低薪资</th>
                <td>{{ selectedPost.zdxz }} 元/月</td>
              </tr>
              <tr>
                <th scope="row">最高薪资</th>
                <td>{{ selectedPost.zgxz }} 元/月</td>
              </tr>
              <tr>
                <th scope="row">最低学历要求</th>
                <td>{{ selectedPost.zdxlyq }}</td>
              </tr>
              <tr>
                <th scope="row">工作地点</th>
                <td>{{ selectedPost.gzdd }}</td>
              </tr>
              <tr>
                <th scope="row">工作省份</th>
                <td>{{ selectedPost.gzsf }}</td>
              </tr>
              <tr>
                <th scope="row">实习标志</th>
                <td>{{ selectedPost.sxbz === 1 ? "实习岗位" : "正式岗位" }}</td>
              </tr>
              <tr>
                <th scope="row">专业限制</th>
                <td>{{ selectedPost.zyxz }}</td>
              </tr>
              <tr>
                <th scope="row">投递次数</th>
                <td>{{ selectedPost.tdcs }}</td>
              </tr>
              <tr>
                <th scope="row">投递限制标志</th>
                <td>{{ selectedPost.tdxzbz === 0 ? "无投递限制" : "有投递限制" }}</td>
              </tr>
              <tr>
                <th scope="row">投递限制次数</th>
                <td>{{ selectedPost.tdxzcs || "暂无投递限制次数" }}</td>
              </tr>
              </tbody>
            </table>

            <div class="mb-4">
              <h3 class="text-lg font-semibold mb-2">
                <i class="bi bi-house me-2"></i> 就业环境
              </h3>
              <p class="text-gray-700"
                 v-html="selectedPost.jyhjms ? selectedPost.jyhjms.replace(/\n/g, '<br>') : '暂无就业环境描述'"></p>
              <img v-if="selectedPost.jyhj" :src="selectedPost.jyhj" alt="就业环境图"
                   class="mt-2 rounded shadow-md w-full h-auto"/>
            </div>

            <div class="d-flex justify-content-end mt-4">
              <button class="btn btn-secondary" @click="closeDetailPopup">
                <i class="bi bi-x-circle me-2"></i> 关闭
              </button>
            </div>
          </div>
        </div>
      </transition>

      <!-- 编辑弹窗   isEditPopupVisible-->
      <el-dialog :visible.sync="isEditPopupVisible" title="编辑岗位信息" width="900px">
        <el-form :model="form" ref="form" :rules="editRule" label-width="120px">
          <div class="hangBd">
            <el-form-item label="岗位名称" prop="gwmc">
              <el-input v-model="form.gwmc" placeholder="请输入岗位名称"></el-input>
            </el-form-item>
            <el-form-item label="单位名称" prop="dwmc">
              <!--              <el-input v-model="form.dwmc" placeholder="请输入单位名称"></el-input>-->
              <el-select v-model="form.dwmc" placeholder="请选择单位">
                <el-option label="请选择" value=""></el-option>
                <el-option v-for="(item,index) in DATADWDMK" :label="item.dwdm+'-'+item.dwmc" :key="index"
                           :value="item.dwmc"></el-option>
              </el-select>
            </el-form-item>
          </div>

          <el-form-item label="岗位描述">
            <el-input type="textarea" v-model="form.gwms" placeholder="请输入岗位描述"></el-input>
          </el-form-item>

          <el-form-item label="工作职责">
            <el-input type="textarea" v-model="form.gzzz" placeholder="请输入工作职责"></el-input>
          </el-form-item>

          <el-form-item label="岗位要求">
            <el-input type="textarea" v-model="form.gwyq" placeholder="请输入岗位要求"></el-input>
          </el-form-item>

          <div class="hangBd">
            <el-form-item label="岗位分类">
              <el-select v-model="form.gwfl" placeholder="请选择岗位分类" >
                <el-option label="请选择" value=""></el-option>
                <el-option v-for="(item,index) in gwflList" :label="item.id+'-'+item.flmc" :key="index"
                           :value="item.id"></el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="岗位发布时间">
              <!--            <el-date-picker v-model="form.fbsj" type="date" placeholder="选择日期"></el-date-picker>-->
              <el-date-picker
                  v-model="form.fbsj"
                  align="right"
                  type="date"
                  placeholder="选择日期"
                  :picker-options="pickerOptions">
              </el-date-picker>

            </el-form-item>
          </div>
          <el-form-item label="投递说明">
            <el-input v-model="form.tdsm" placeholder="请输入投递说明"></el-input>
          </el-form-item>

          <div class="hangBd">
            <el-form-item label="最低薪资">
              <el-input v-model="form.zdxz" placeholder="请输入最低薪资"></el-input>
            </el-form-item>

            <el-form-item label="最高薪资">
              <el-input v-model="form.zgxz" placeholder="请输入最高薪资"></el-input>
            </el-form-item>
          </div>

          <div class="hangBd">

            <el-form-item label="最低学历要求">
              <el-select v-model="form.zdxlyq" placeholder="请选择最低学历要求">
                <el-option label="请选择" value=""></el-option>
                <el-option v-for="(item,index) in XLTTK" :label="item.id+'-'+item.xlmc" :key="index"
                           :value="item.id"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="工作地点">
              <el-input v-model="form.gzdd" placeholder="请输入工作地点"></el-input>
            </el-form-item>

            <el-form-item label="工作省份" prop="gzsf">
              <el-select v-model="form.gzsf" placeholder="请选择工作省份">
                <el-option label="请选择" value=""></el-option>
                <el-option v-for="(item,index) in SFDMK" :label="item.sfdm+'-'+item.sfmc" :key="index"
                           :value="item.sfdm"></el-option>
              </el-select>
            </el-form-item>
          </div>

          <div class="hangBd">
            <el-form-item label="实习标志">
              <el-select v-model="form.sxbz" placeholder="请选择实习标志">
                <el-option label="实习岗位" :value="1"></el-option>
                <el-option label="正式岗位" :value="2"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="专业限制">
              <el-input v-model="form.zyxz" placeholder="请输入专业限制"></el-input>
            </el-form-item>
          </div>
          <!--          <el-form-item label="投递次数">
                      <el-input v-model="form.tdcs" placeholder="请输入投递次数"></el-input>
                    </el-form-item>-->

          <div class="hangBd">
            <el-form-item label="投递限制标志">
              <el-select v-model="form.tdxzbz" placeholder="请选择投递限制标志">
                <el-option label="无投递限制" :value="0"></el-option>
                <el-option label="有投递限制" :value="1"></el-option>
              </el-select>
            </el-form-item>

            <!-- 仅在选择“有投递限制”时显示投递限制次数 -->
            <el-form-item label="投递限制次数" v-if="form.tdxzbz === 1">
              <el-input v-model="form.tdxzcs" placeholder="请输入投递限制次数"></el-input>
            </el-form-item>
          </div>

          <el-form-item label="招聘人数">
            <el-input v-model="form.zprs" placeholder="请输入招聘人数"></el-input>
          </el-form-item>

          <el-form-item label="启用代码">
            <!--            <el-input v-model="form.qydm" placeholder="请输入启用代码"></el-input>-->
            <el-select v-model="form.qydm" placeholder="请选择岗位启用状态" prop="qydm">
              <el-option label="请选择" value=""></el-option>
              <el-option label="启用" :value="1"></el-option>
              <el-option label="关闭" :value="0"></el-option>
            </el-select>
          </el-form-item>


          <el-form-item label="就业环境描述">
            <el-input type="textarea" v-model="form.jyhjms" placeholder="请输入就业环境描述"></el-input>
          </el-form-item>

          <el-form-item label="就业环境图">
            <!--            <el-input v-model="form.jyhj" placeholder="请输入就业环境图 URL"></el-input>-->
            <el-input-number v-model="form.jyhj" placeholder="请输入就业环境代码"></el-input-number>
          </el-form-item>
        </el-form>

        <div slot="footer" class="dialog-footer">
          <el-button @click="closeEditPopup">取 消</el-button>
          <el-button type="primary" @click="submitForm(true)">确 定</el-button>
        </div>
      </el-dialog>

      <!--      新增弹窗-->
      <el-dialog :visible.sync="isPopupVisible" title="编辑岗位信息" width="900px">
        <el-form :model="form" ref="form" :rules="editRule" label-width="120px">
          <div class="hangBd">
            <el-form-item label="岗位名称" prop="gwmc">
              <el-input v-model="form.gwmc" placeholder="请输入岗位名称"></el-input>
            </el-form-item>
            <el-form-item label="单位名称" prop="dwmc">
              <!--              <el-input v-model="form.dwmc" placeholder="请输入单位名称"></el-input>-->
              <el-select v-model="form.dwmc" placeholder="请选择单位">
                <el-option label="请选择" value=""></el-option>
                <el-option v-for="(item,index) in DATADWDMK" :label="item.dwdm+'-'+item.dwmc" :key="index"
                           :value="item.dwmc"></el-option>
              </el-select>
            </el-form-item>
          </div>

          <el-form-item label="岗位描述">
            <el-input type="textarea" v-model="form.gwms" placeholder="请输入岗位描述"></el-input>
          </el-form-item>

          <el-form-item label="工作职责">
            <el-input type="textarea" v-model="form.gzzz" placeholder="请输入工作职责"></el-input>
          </el-form-item>

          <el-form-item label="岗位要求">
            <el-input type="textarea" v-model="form.gwyq" placeholder="请输入岗位要求"></el-input>
          </el-form-item>

          <div class="hangBd">
            <el-form-item label="岗位分类">
              <el-select v-model="form.gwfl" placeholder="请选择岗位类别">
                <el-option v-for="item in gwflList" :key="item.id" :label="item.id+'-'+ gwflList.find(i => i.id === item.id).flmc"
                           :value="item.id"></el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="岗位发布时间">
              <el-date-picker v-model="form.fbsj" type="date" placeholder="选择日期"></el-date-picker>
            </el-form-item>
          </div>
          <el-form-item label="投递说明">
            <el-input type="textarea" v-model="form.tdsm" placeholder="请输入投递说明"></el-input>
          </el-form-item>

          <div class="hangBd">
            <el-form-item label="最低薪资">
              <el-input v-model="form.zdxz" placeholder="请输入最低薪资"></el-input>
            </el-form-item>

            <el-form-item label="最高薪资">
              <el-input v-model="form.zgxz" placeholder="请输入最高薪资"></el-input>
            </el-form-item>
          </div>

          <div class="hangBd">

            <!-- id : 1
            xlmc : "学前教育"
            xlms : "为幼儿提供基础教育，通常为一到三年。"-->

            <el-form-item label="最低学历要求">
              <el-select v-model="form.zdxlyq" placeholder="请选择最低学历要求">
                <el-option label="请选择" value=""></el-option>
                <el-option v-for="(item,index) in XLTTK" :label="item.id+'-'+item.xlmc" :key="index"
                           :value="item.id"></el-option>
              </el-select>

            </el-form-item>
            <el-form-item label="工作地点">
              <el-input v-model="form.gzdd" placeholder="请输入工作地点"></el-input>
            </el-form-item>
            <el-form-item label="工作省份" prop="gzsf">
              <el-select v-model="form.gzsf" placeholder="请选择工作省份">
                <el-option label="请选择" value=""></el-option>
                <el-option v-for="(item,index) in SFDMK" :label="item.sfdm+'-'+item.sfmc" :key="index"
                           :value="item.sfdm"></el-option>
              </el-select>
            </el-form-item>
          </div>

          <div class="hangBd">

            <el-form-item label="实习标志" prop="sxbz">
              <el-select v-model="form.sxbz" placeholder="请选择实习标志">
                <el-option label="实习岗位" :value="1"></el-option>
                <el-option label="正式岗位" :value="2"></el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="专业限制">
              <el-input v-model="form.zyxz" placeholder="请输入专业限制"></el-input>
            </el-form-item>
          </div>
          <!--          <el-form-item label="投递次数">
                      <el-input v-model="form.tdcs" placeholder="请输入投递次数"></el-input>
                    </el-form-item>-->

          <div class="hangBd">
            <el-form-item label="投递限制标志">
              <el-select v-model="form.tdxzbz" placeholder="请选择投递限制标志">
                <el-option label="无投递限制" :value="0"></el-option>
                <el-option label="有投递限制" :value="1"></el-option>
              </el-select>
            </el-form-item>

            <!-- 仅在选择“有投递限制”时显示投递限制次数 -->
            <el-form-item label="投递限制次数" v-if="form.tdxzbz === 1">
              <el-input v-model="form.tdxzcs" placeholder="请输入投递限制次数"></el-input>
            </el-form-item>
          </div>
          <div class="hangBd">
            <el-form-item label="招聘人数">
              <el-input v-model="form.zprs" placeholder="请输入招聘人数"></el-input>
            </el-form-item>

            <el-form-item label="启用代码" prop="qydm">
              <!--            <el-input v-model="form.qydm" placeholder="请输入启用代码"></el-input>-->
              <el-select v-model="form.qydm" placeholder="请选择岗位启用状态">
                <el-option label="请选择" value=""></el-option>
                <el-option label="启用" :value="1"></el-option>
                <el-option label="关闭" :value="0"></el-option>
              </el-select>
            </el-form-item>

          </div>
          <el-form-item label="就业环境描述">
            <el-input type="textarea" v-model="form.jyhjms" placeholder="请输入就业环境描述"></el-input>
          </el-form-item>

          <el-form-item label="就业环境图">
            <el-input-number v-model="form.jyhj" placeholder="请输入就业环境代码"></el-input-number>
          </el-form-item>
        </el-form>

        <div slot="footer" class="dialog-footer">
          <el-button @click="closeEditPopup">取 消</el-button>
          <el-button type="primary" @click="submitForm(false)">确 定</el-button>
        </div>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import AdminMenu from "@/components/admin/Admin_menu.vue";
import Pagination from "@/components/public/Pagination.vue";
import axios from "axios";

export default {
  name: "PostManagement",
  components: {AdminMenu, Pagination},
  data() {
    return {
      currentPage: 1,
      postsPerPage: 6,
      gwflList: [],// 岗位分类数据
      editRule: {
        gwmc: [
          {required: true, message: '岗位名称不能为空', trigger: 'blur'}
        ],
        dwmc: [
          {required: true, message: '单位名称不能为空', trigger: 'blur'}
        ],
        dwdm: [
          {required: true, message: '单位代码不能为空', trigger: 'blur'}
        ],
        tdcs: [
          {required: true, message: '投递次数不能为空', trigger: 'blur'}
        ],
        qydm: [
          {required: true, message: '启用代码不能为空', trigger: 'blur'}
        ],
        gzsf: [
          {required: true, message: '工作省份不能为空', trigger: 'blur'}
        ],
        sxbz: [
          {required: true, message: '实习标志不能为空', trigger: 'blur'}
        ]
      },
      posts: [],
      SFDMK: [],//省份数据
      XLTTK: [],//学历数据
      DATADWDMK: [],//单位数据
      hotPosts: [],
      searchQuery: '',
      isPopupVisible: false,
      isDetailPopupVisible: false,
      isEditMode: false,
      selectedPost: {},
      // 编辑弹窗
      form: {
        gwmc: '',
        dwmc: '',
        gwms: '',
        gwyq: '',
        fbsj: '',
        tdsm: '',
        zdxz: '',
        zgxz: '',
        zdxlyq: '',
        gzdd: '',
        gzsf: '',
        sxbz: 2, // 默认正式岗位
        zyxz: '',
        tdcs: '',
        tdxzbz: 0, // 默认无投递限制
        tdxzcs: '',
        qydm: '',
        zprs: '',
        jyhjms: '',
        jyhj: '',
        gwfl: null,
      },
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now();
        },
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            picker.$emit('pick', new Date());
          }
        }, {
          text: '昨天',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() - 3600 * 1000 * 24);
            picker.$emit('pick', date);
          }
        }, {
          text: '一周前',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', date);
          }
        }]
      },
      postForm: {
        tdxzcs: 0, // 默认无投递限制
      },
      isEditPopupVisible: false,// 编辑弹窗是否可见
    };
  },
  computed: {
    paginatedPosts() {
      const start = (this.currentPage - 1) * this.postsPerPage;
      return this.filteredPosts.slice(start, start + this.postsPerPage);
    },
    filteredPosts() {
      return this.posts.filter(post =>
          post.gwmc.includes(this.searchQuery) ||
          post.dwmc.includes(this.searchQuery) ||
          post.sxbz.includes(this.searchQuery)
      );
    }
  },
  mounted() {
    // 初始化数据
    this.getALLGwData();
    this.GetDwdmData();// 获取单位信息
    this.getHotGwdmkData();
    this.getAllGwflList();
  },

  methods: {
    timeStampToTime(dateString) {
      // 创建一个 Date 对象
      const date = new Date(dateString);

      // 获取 UTC 时间的 ISO 字符串
      const isoString = date.toISOString();

      // 将 ISO 字符串转换为带时区的格式
      const localOffset = date.getTimezoneOffset(); // 获取本地时区偏移（分钟）
      const offsetHours = String(Math.abs(localOffset) / 60).padStart(2, '0'); // 计算小时
      const offsetMinutes = String(Math.abs(localOffset) % 60).padStart(2, '0'); // 计算分钟
      const timezone = (localOffset > 0 ? '-' : '+') + offsetHours + ':' + offsetMinutes; // 生成时区字符串

      // 将 ISO 字符串和时区字符串结合
      const finalISO = isoString.replace('Z', timezone); // 替换末尾的 'Z' 为时区

      return finalISO;
    },

    // 获取单位信息
    GetDwdmData() {
      axios.get("/dw/getAllDw").then((response) => {
        if (response.data.result) {
          console.log("获取单位信息成功！")
          this.DATADWDMK = response.data.data;
          console.log(this.DATADWDMK);
        } else {
          this.$message.error("获取单位信息失败！，后台错误")
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error("获取单位信息失败，网络错误")
      })
    },
    //获取省份数据
    GetAllSfdmk() {
      axios.get("/sfdmk/getAllSfdmks").then((response) => {
        if (response.data.result) {
          console.log("获取省份代码成功：")
          this.SFDMK = response.data.data;
          console.log(this.SFDMK);
        } else {
          this.$message.error("操作失败！，后台错误")
        }
      }).catch((erro) => {
        console.log(erro);
        this.$message.error("操作失败，网络错误")
      })
    },
    // 获取学历数据
    getXueLiData() {
      axios.get("/xlttk/getAllXlttkData").then((response) => {
        if (response.data.result) {
          console.log("获取学历数据成功！")
          this.XLTTK = response.data.data;
          console.log(this.XLTTK);
        } else {
          this.$message.error("获取学历数据失败！，后台错误")
        }
      }).catch((error) => {
        console.log(error);
      })
    },
    // 启用岗位
    startUsingGangWei(id) {
      console.log("启用岗位id:");
      console.log(id);
      this.$confirm('是否启用该岗位?', '温馨提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        axios.get("/dataGwdmk/startUsingGangWei?id=" + id).then((response) => {
          console.log(response)
          if (response.data.result) {
            // 重新加载数据
            this.getALLGwData();
            this.$message.success("启用成功！")
          } else {
            this.$message.error("操作失败！，后台错误")
          }
        }).catch((error) => {
          console.log(error);
          this.$message.error("操作失败，网络错误")
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消操作'
        });
      });
    },
    // 停用岗位
    endUsingGangWei(id) {
      console.log("停用岗位id:");
      console.log(id);

      this.$confirm('是否停用该岗位?', '警告', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let EndUsingForm = new FormData();
        EndUsingForm.set("id", id);
        axios.post("/dataGwdmk/endUsingGangWei", EndUsingForm).then((response) => {
          console.log(response)
          if (response.data.result) {
            // 重新加载数据
            this.getALLGwData();
            this.$message.success("停用成功！")
          } else {
            this.$message.error("操作失败！，后台错误")
          }
        }).catch((error) => {
          console.log(error);
          this.$message.error("操作失败，网络错误")
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });


    },
    // 获取火热岗位7个
    getHotGwdmkData() {
      axios.get("/dataGwdmk/getHotGwdmkData?num=7").then((response) => {
        if (response.data.result) {
          this.hotPosts = response.data.data;
          console.log("获取热门岗位数据成功！：")
          console.log(this.hotPosts)
        } else {
          this.$message.error("火热岗位数据加载失败！，后台错误")
          console.log(this.hotPosts)
        }
      }).catch((error) => {
        console.log(error);
      })
    },
    // 获取所有岗位数据
    getALLGwData() {
      axios.get("/dataGwdmk/getGwdmkData").then((response) => {
        if (response.data.result) {
          this.$message.success("获取数据成功！");
          //前端要显式显示：岗位名称、对应单位名称、实习标志、岗位启用状态
          this.posts = response.data.data;
          console.log(this.posts);
        } else {
          this.$message.error("获取数据失败：后台错误");
        }
      }).catch((error) => {
        this.$message.error("获取数据失败：网络错误");
        console.log(error);
      });
    },
    // 打开岗位详情弹窗
    showPostDetails(post) {
      this.selectedPost = post;
      console.log("打开岗位详情弹窗:");
      console.log(post);
      this.isDetailPopupVisible = true;
    },
    // 获取所有岗位分类数据
    getAllGwflList() {
      axios.get("/gwflk/getAllGwflList").then((response) => {
        if (response.data.result) {
          console.log("获取岗位分类数据成功！")
          this.gwflList = response.data.data;
          console.log(this.gwflList);
        } else {
          this.$message.error("获取岗位分类数据失败！，后台错误")
        }
      }).catch((error) => {
        console.log(error);
      })

    },
    closeDetailPopup() {
      this.isDetailPopupVisible = false;
      this.selectedPost = {};
    },
    // 新增岗位弹窗
    showAddPostPopup() {
      this.isEditMode = false;
      this.postForm = {};// 初始化新增表单
      this.isPopupVisible = true;
      if (this.SFDMK.length === 0) {
        this.GetAllSfdmk();
      }
      if (this.XLTTK.length === 0) {
        this.getXueLiData();
      }
      if (this.DATADWDMK.length === 0) {
        this.GetDwdmData();
      }
      if (this.gwflList.length === 0) {
        this.getAllGwflList();
      }
    },
    closeEditPopup() {
      this.isEditPopupVisible = false;
    },
    submitForm(isEdit) {
      this.$refs.form.validate((valid) => {
        if (valid) {
          if (this.form.tdxzbz === 1 && this.form.tdxzcs === '') {
            this.$message.error("投递限制次数不能为空！");
            return;
          }
          if (this.form.tdxzbz === 1 && !/^[1-9]\d*$/.test(this.form.tdxzcs)) {
            this.$message.error("投递限制次数必须为正整数！");
            return;
          }
          this.form.dwdm = this.DATADWDMK.find(item => item.dwmc === this.form.dwmc).dwdm;

          //是否是编辑
          let PostForm = new FormData();
          /*id	岗位id
           gwmc	岗位名称
           gwms	岗位描述
           gwyq	岗位要求
           fbsj	岗位发布时间
           tdsm	投递说明
           zgxz	最高薪资
           zdxz	最低薪资
           zdxlyq	最低学历要求
           gzdd	工作地点
           gzsf	工作省份，对应sfdmk 省份代码库
           sxbz	实习标志,1为实习岗位，2为正式岗位
           zyxz	专业限制
           dwmc	单位名称
           dwdm	单位代码,对应dwdmk
           tdcs	投递次数
           tdxzbz	投递限制标志，默认0
           tdxzcs	投递限制次数，若tdxzbz为0则设置为空
           qydm	启用代码
           zprs	招聘人数
           jyhj	就业环境(图)
           jyhjms	就业环境吗描述
           gzzz	工作职责
           gwfl 岗位分类
           */
          PostForm.set("gwmc", this.form.gwmc);            // 岗位名称
          PostForm.set("gwms", this.form.gwms);            // 岗位描述
          PostForm.set("gwyq", this.form.gwyq);            // 岗位要求
          PostForm.set("fbsj", this.timeStampToTime(this.form.fbsj));            // 岗位发布时间
          PostForm.set("tdsm", this.form.tdsm);            // 投递说明
          PostForm.set("zgxz", this.form.zgxz);            // 最高薪资
          PostForm.set("zdxz", this.form.zdxz);            // 最低薪资
          PostForm.set("zdxlyq", this.form.zdxlyq);        // 最低学历要求
          PostForm.set("gzdd", this.form.gzdd);            // 工作地点
          PostForm.set("gzsf", this.form.gzsf);            // 工作省份，对应sfdmk 省份代码库
          PostForm.set("sxbz", this.form.sxbz);            // 实习标志,1为实习岗位，2为正式岗位
          PostForm.set("zyxz", this.form.zyxz);            // 专业限制
          PostForm.set("dwmc", this.form.dwmc);            // 单位名称
          PostForm.set("dwdm", this.DATADWDMK.find(item => item.dwmc === this.form.dwmc).dwdm);            // 单位代码,对应dwdmk  ,通过单位名称获取单位代码
          PostForm.set("tdcs", this.form.tdcs);            // 投递次数
          PostForm.set("tdxzbz", this.form.tdxzbz);        // 投递限制标志，默认0
          PostForm.set("tdxzcs", this.form.tdxzbz === 0 ? -1 : parseInt(this.form.tdxzcs));        // 投递限制次数，若tdxzbz为-1则设置为空
          PostForm.set("qydm", this.form.qydm);            // 启用代码
          PostForm.set("zprs", this.form.zprs);            // 招聘人数
          PostForm.set("jyhj", this.form.jyhj);            // 就业环境(图)
          PostForm.set("jyhjms", this.form.jyhjms);        // 就业环境吗描述
          PostForm.set("gzzz", this.form.gzzz);            // 工作职责
          //console.log("岗位分类id:"+this.gwflList.find(item => item.flmc === this.form.gwfl).id)
          console.log("岗位分类名称:"+this.form.gwfl)
          PostForm.set("gwfl", this.form.gwfl);            // 岗位分类
          if (isEdit) {
            PostForm.set("id", this.form.id);                // 岗位id
            // 提交表单逻辑
            console.log("提交编辑表单:");
            console.log(PostForm)

            axios.post("/dataGwdmk/updateGangWei", PostForm).then((response) => {
              console.log(response)
              if (response.data.result) {
                this.getALLGwData(); // 刷新数据
                this.$message.success("更新岗位信息成功！")
                //  this.isPopupVisible = false;
              } else {
                this.$message.error("操作失败！，后台错误")
              }
            }).catch((error) => {
              console.log(error);
              this.$message.error("操作失败，网络错误")
            })

          } else {
            // 调用新增接口
            console.log("提交新增表单")
            console.log(PostForm)
            axios.post("/dataGwdmk/addGangWei", PostForm).then((response) => {
              console.log(response)
              if (response.data.result) {
                this.getALLGwData(); // 刷新数据
                this.$message.success("新增岗位成功！")
                this.isPopupVisible = false;
              } else {
                this.$message.error("操作失败！，后台错误")
              }
            }).catch((error) => {
              console.log(error);
              this.$message.error("操作失败，网络错误")
            })


          }
          console.log("原始数据：")
          console.log(this.form);
          //this.form = {}
        } else {
          console.log('表单验证失败');
          return false;
        }
      });
    },
    // 编辑岗位信息弹窗
    editPost(post) {
      console.log("单击编辑按钮，选择的数据:");
      console.log(post);
      // 将 gwfl 转换为数字
      post.gwfl = Number(post.gwfl); // 替换为数字
      this.isEditMode = true;//  编辑模式
      this.form = {...post};
      console.log("编辑:");
      console.log(this.form);
      //this.isPopupVisible = true;
      if (this.gwflList.length === 0) {
        this.getAllGwflList();
      }
      // 减少请求次数，提高效率
      if (this.SFDMK.length === 0) {
        this.GetAllSfdmk();
      }
      if (this.XLTTK.length === 0) {
        this.getXueLiData();
      }
      if (this.DATADWDMK.length === 0) {
        this.GetDwdmData();
      }

      this.isEditPopupVisible = true;
    },
    closePopup() {
      this.isPopupVisible = false;
    },

    savePost() {
      if (this.isEditMode) {
        const index = this.posts.findIndex(post => post.id === this.postForm.id);
        if (index !== -1) {
          this.posts[index] = {...this.postForm};
        }
      } else {
        this.postForm.id = this.posts.length + 1;
        this.posts.push({...this.postForm});
      }
      this.closePopup();
    },
    deletePost(postId) {
      this.posts = this.posts.filter(post => post.id !== postId);
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
  z-index: 999;
  overflow-y: auto;
}

.popup {
  background: white;
  border-radius: 8px;
  padding: 20px;
  max-width: 800px;
  width: 90%;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
  position: relative;
}

.popup-title {
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 1rem;
  border-bottom: 1px solid #e5e7eb;
  padding-bottom: 0.5rem;
}

.popup-large {
  background: white;
  border-radius: 8px;
  padding: 30px;
  max-width: 1200px;
  width: 90%;
  max-height: 95vh;
  overflow-y: auto;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
}

/* 渐变动画效果 */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

/* 表单输入样式 */
label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 500;
}

input,
select {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #d1d5db;
  border-radius: 0.375rem;
  margin-top: 0.25rem;
  transition: border-color 0.2s ease-in-out;
}

input:focus,
select:focus {
  outline: none;
  border-color: #3b82f6;
  box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
}

/* 按钮悬停和点击效果 */
button {
  transition: all 0.2s ease-in-out;
}

button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
}

button:active {
  transform: translateY(1px);
}

/* 响应式调整 */
@media (max-width: 768px) {
  .popup,
  .popup-large {
    width: 95%;
    margin: 0 auto;
    max-height: 95vh;
  }
}

/* 滚动条样式 */
.popup-large::-webkit-scrollbar {
  width: 8px;
}

.popup-large::-webkit-scrollbar-track {
  background: #f1f1f1;
}

.popup-large::-webkit-scrollbar-thumb {
  background: #888;
  border-radius: 4px;
}

.popup-large::-webkit-scrollbar-thumb:hover {
  background: #555;
}


.popup {
  top: 19%;
  left: 14%;
}

.dialog-footer {
  text-align: right;
}

.hangBd {
  display: flex;
}

</style>
