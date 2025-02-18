<template>
  <div>
    <admin-menu></admin-menu>
    <main class="ml-64 flex-1 p-6">


      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold text-gray-800">单位管理</h1>

        <div class="flex space-x-3">
          <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600" @click="addUnit">
            <i class="fas fa-plus"></i> 新增单位
          </button>
          <button class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
            <i class="fas fa-file-export"></i> 导出
          </button>
        </div>
      </header>


      <div class="container mx-auto p-6 flex  ">
        <div class="flex-1 mr-4">


          <!-- 页面介绍 -->
          <div class="mb-4 p-4 bg-gray-100 rounded-md">
            <h3 class="text-lg font-semibold">页面介绍</h3>
            <p>此页面用于管理单位信息，包括查看、添加、编辑和删除单位。您可以通过统计图和卡片快速了解单位的相关数据。</p>
          </div>

          <!-- 单位信息表格    row-dblclick	当某一行被双击时会触发该事件	row, column, event -->
          <el-card class="w-full">
            <el-table :data="paginatedUnits" style="width: 100%" :highlight-current-row="true"
                      @row-dblclick="openDwDetail">
              <el-table-column label="单位代码" prop="dwdm"></el-table-column>
              <el-table-column label="单位名称" prop="dwmc"></el-table-column>
              <el-table-column label="单位性质" prop="dwxz"></el-table-column>
              <el-table-column label="单位规模" prop="dwgm"></el-table-column>
              <el-table-column label="单位行业" prop="dwhy"></el-table-column>
              <el-table-column label="公司名称" prop="gsmc"></el-table-column>
              <el-table-column label="公司简介" prop="gsjj">
                <template slot-scope="scope">
                  <div @dblclick="openEditor(scope.row)">  <!-- 双击打开编辑器 -->
                    {{ truncatedText(scope.row.gsjj) }}
                  </div>
                </template>
              </el-table-column>
              <el-table-column label="操作" align="right">
                <template slot-scope="scope">
                  <el-button size="mini" @click="editUnit(scope.row)">编辑</el-button>
                  <el-button size="mini" type="danger" @click="deleteUnit(scope.row)">停用</el-button>
                  <el-button size="mini" @click="viewJobs(scope.row)">查看岗位</el-button>
                </template>
              </el-table-column>
            </el-table>

            <!-- 分页组件 -->
            <el-pagination
                @current-change="handlePageChange"
                :current-page="currentPage"
                :page-size="pageSize"
                :total="units.length"
                layout="total, prev, pager, next"
                style="text-align: right; margin-top: 10px;"
            />
          </el-card>
        </div>

        <!-- 统计卡片区 -->
        <div class="w-1/3 bg-white shadow-md p-4 rounded-md">
          <h2 class="text-lg font-semibold mb-2">单位统计</h2>

          <el-card class="mb-4">
            <h3 class="text-xl font-semibold">单位总数</h3>
            <p class="text-2xl">{{ units.length }}</p>
          </el-card>

          <el-card class="mb-4">
            <h3 class="text-xl font-semibold">活跃单位</h3>
            <p class="text-2xl">{{ activeUnitsCount }}</p>
          </el-card>

          <el-card>
            <h3 class="text-xl font-semibold">单位行业分布</h3>
            <el-select v-model="selectedChartType" @change="updateChart" class="mb-2">
              <el-option label="柱状图" value="bar"></el-option>
              <el-option label="饼图" value="pie"></el-option>
            </el-select>

            <div ref="chart" style="height: 300px;"></div>
          </el-card>
        </div>
      </div>

      <!-- 增加/编辑单位的对话框 -->
      <el-dialog :visible.sync="dialogVisible" title="单位信息(注意单位和公司的区别)" :modal="true" width="700px">
        <el-form :model="currentUnit" :rules="rules" ref="formRef" label-width="100px" class="text-sm">
          <el-form-item label="单位名称" prop="dwmc">
            <el-input v-model="currentUnit.dwmc" prefix-icon="fas fa-building"></el-input>
          </el-form-item>
          <!--          编辑用文本插入代码-->
          <el-form-item label="单位规模" prop="dwgm">
            <el-select v-model="currentUnit.dwgm" placeholder="请选择单位规模" @change="handleSelectDWGMChange">
              <el-option value="" label="请选择"></el-option>
              <el-option v-for="(item, index) in dwgmList" :key="index" :label="item.gmxq"
                         :value="item.gmxq"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="单位性质" prop="dwxz">
            <el-select v-model="currentUnit.dwxz" placeholder="请选择单位规模" @change="handleSelectDWXZChange">
              <el-option value="" label="请选择"></el-option>
              <el-option v-for="(item, index) in dwxzkList" :key="index" :label="index+1+'.'+item.dwxz"
                         :value="item.dwxz"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="单位行业" prop="dwhy">
            <el-select v-model="currentUnit.dwhy" placeholder="请选择单位行业" @change="handleSelectDWHYChange">
              <el-option value="" label="请选择"></el-option>
              <el-option v-for="(item, index) in dwhydmList" :key="index" :label="index+1+'.'+item.hymc"
                         @click="DwHyOptionClick(index)" :value="item.hymc"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="公司名称">
            <el-input v-model="currentUnit.gsmc" prefix-icon="fas fa-building"></el-input>
          </el-form-item>
          <el-form-item label="所在地区">
            <el-input v-model="currentUnit.szdq" prefix-icon="fas fa-map-marker-alt"></el-input>
          </el-form-item>
          <el-form-item label="公司简介">
            <el-input type="textarea" v-model="currentUnit.gsjj"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveUnit">确 定</el-button>
        </span>
      </el-dialog>

      <!-- WangEditor 编辑器 -->
      <el-dialog :visible.sync="editorVisible" title="编辑公司简介" width="500px">
        <div id="editor" ref="editor" style="height: 300px;"></div>
        <span slot="footer" class="dialog-footer">
          <el-button @click="editorVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveDescription">确 定</el-button>
        </span>
      </el-dialog>
      <!-- 查看岗位对话框 -->
      <el-dialog :visible.sync="jobsDialogVisible" title="查看岗位" top="1vh" width="1400px">
        <el-table :data="paginatedJobs" style="width: 100%" :highlight-current-row="true" @current-change="handleSelectJobChange">
          <el-table-column label="岗位ID" prop="id"></el-table-column>
          <el-table-column label="岗位名称" prop="gwmc">

          </el-table-column>
          <el-table-column label="岗位描述" prop="gwms">
              <template slot-scope="scope">
                <div>
                  {{ truncatedText(scope.row.gwms) }}
                </div>
              </template>
          </el-table-column>
          <el-table-column label="岗位要求" prop="gwyq">
            <template slot-scope="scope">
              <div>
                {{ truncatedText(scope.row.gwyq) }}
              </div>
            </template>
          </el-table-column>
          <el-table-column label="发布时间" prop="fbsj">
              <template slot-scope="scope">
                <div>
<!--                  设置为2025-01-01 的格式-->
                  {{  new Date(scope.row.fbsj).toLocaleDateString() }}
                </div>
              </template>
          </el-table-column>

          <el-table-column label="投递说明" prop="tdsm">
            <template slot-scope="scope">
              <div>
                {{ truncatedText(scope.row.tdsm) }}
              </div>
            </template>
          </el-table-column>
          <el-table-column label="最高薪资" prop="zgxz"></el-table-column>
          <el-table-column label="最低薪资" prop="zdxz"></el-table-column>
          <el-table-column label="最低学历要求" prop="zdxlyq"></el-table-column>
          <el-table-column label="工作地点" prop="gzdd"></el-table-column>
          <el-table-column label="工作省份" prop="gzsf"></el-table-column>
          <el-table-column label="实习标志" prop="sxbz">
            <template v-slot="{ row }">
                <span v-if="row.sxbz === 1">
               实习岗位
                </span>
              <span v-else>
                  正式岗位
                </span>
            </template>
          </el-table-column>
          <el-table-column label="专业限制" prop="zyxz"></el-table-column>
          <el-table-column label="单位名称" prop="dwmc"></el-table-column>
          <el-table-column label="单位代码" prop="dwdm"></el-table-column>
          <el-table-column label="投递次数" prop="tdcs"></el-table-column>
          <el-table-column label="投递限制标志" prop="tdxzbz"></el-table-column>
          <el-table-column label="投递限制次数" prop="tdxzcs"></el-table-column>
        </el-table>

        <!-- 分页组件 -->
        <el-pagination
            @current-change="handleJobsPageChange"
            :current-page="currentJobsPage"
            :page-size="jobsPageSize"
            :total="jobList.length"
            layout="total, prev, pager, next"
            style="text-align: right; margin-top: 10px;"
        />

        <span slot="footer" class="dialog-footer">
           <el-button @click="lookJobDetail">查看岗位详情</el-button>
          <el-button @click="jobsDialogVisible = false">关 闭</el-button>
        </span>
      </el-dialog>
      <!-- 显示单位详情弹窗-->
      <HtmlShowBox
          :HtmlText="selectDwHtml"
          :isVisible="isPopupVisible"
          @update:isVisible="isPopupVisible = $event"/>
    </main>
  </div>


</template>

<script>
import AdminMenu from "@/components/admin/Admin_menu.vue";
import Editor from "wangeditor"; // 引入 WangEditor
import * as echarts from "echarts"; // 引入 ECharts
import HtmlShowBox from "@/components/public/HtmlShowBox.vue";
import axios from "axios";


export default {
  name: "AdminDwgl",
  components: {AdminMenu, HtmlShowBox},
  data() {
    return {
      selectDwHtml: '', // 双击的单位详情内容Html
      isPopupVisible: false, // 显示单位详情弹窗
      activeMenu: '1', // 默认激活的菜单项
      units: [],
      currentUnit: {
        dwdm: "", //单位代码
        dwmc: "", //单位名称
        dwxz: "", //单位性质
        dwxzdm: "", //单位性质代码
        dwgmdm: "", //单位规模代码
        dwgm: "",//单位规模
        dwhydm: "", //单位行业代码
        dwhy: "", //单位行业
        gsmc: "", //公司名称
        gsjj: "", //公司简介
        gsjjhtml: "", //公司简介html
        qydm: "", //启用代码
        szdq: "", //所在地区
      },
      jobList: [], // 岗位列表数据
      currentPage: 1,
      pageSize: 5,
      currentJobsPage: 1, // 当前岗位分页页码
      jobsPageSize: 5, // 每页显示的岗位数量
      dialogVisible: false,
      editorVisible: false,
      jobsDialogVisible: false,
      isEditing: false,
      editor: null,
      selectedChartType: 'bar', // 选中的图表类型
      chartData: {}, // 图表数据
      dwgmList: [],// 单位规模代码列表
      dwxzkList: [], // 单位性质代码列表
      dwhydmList: [], // 单位行业代码列表

      rules: {
        dwmc: [{required: true, message: '请输入单位名称', trigger: 'blur'}],
        dwxz: [{required: true, message: '请选择单位性质', trigger: 'blur'}],
        dwhy: [{required: true, message: '请选择单位行业', trigger: 'blur'}],
        dwgm: [{required: true, message: '请选择单位规模', trigger: 'blur'}],
      },

      selectJob:{},// 选中的岗位信息
    };
  },
  computed: {
    // 分页处理后的单位数据
    paginatedUnits() {
      const start = (this.currentPage - 1) * this.pageSize;
      return this.units.slice(start, start + this.pageSize);
    },
    // 分页处理后的岗位数据
    paginatedJobs() {
      const start = (this.currentJobsPage - 1) * this.jobsPageSize;
      return this.jobList.slice(start, start + this.jobsPageSize);
    },
    // 统计活跃单位数量
    activeUnitsCount() {
      return this.units.filter(unit => unit.dwxz === '活跃').length; // 示例：假设有活跃状态的单位
    },
  },
  mounted() {
    this.getAllDwData(); // 获取单位信息数据
    this.updateChart(); // Initialize the chart on component mount
  },
  methods: {
   // 岗位详情选择行改变事件
    handleSelectJobChange(currentRow){
      console.log("岗位详情选择行改变事件:")
      console.log(currentRow);
      this.selectJob=currentRow;
    },

    // 查看岗位详情
    lookJobDetail(){
      console.log("查看岗位详情:")
      console.log(this.selectJob);
      // 获取当前行数据
      if (this.selectJob === null) {
        //使用 Jquery confirm 弹窗提示
        this.$confirm('请选择需要查看的岗位！', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          console.log('确定');
        }).catch(() => {
          console.log('取消');
        });
      } else {
        console.log("跳转到岗位详情页面");
        console.log(this.selectJob.id);
        this.$router.push({path: '/admin/jobDetail', query: {id: this.selectJob.id}})
      }

    },

    // 单击新增单位按钮事件
    addUnit() {
      this.isEditing = false;
      if (this.dwxzkList.length === 0) {
        this.getAllDwxzData();// 获取单位性质数据
      }
      if (this.dwhydmList.length === 0) {
        this.getAllDwhydm();// 获取单位行业数据
      }
      if (this.dwgmList.length === 0) {
        this.getAllDwgmdm();// 获取单位规模数据
      }
      this.showAddDialog(); // 打开增加单位对话框
    },
    // 获取单位性质数据
    getAllDwxzData() {
      axios.get("/dwxzk/getAllDwxxk").then(response => {
        if (response.data.result) {
          this.dwxzkList = response.data.data;
        } else {
          this.$message.error('获取单位性质失败,后台错误');
        }
      }).catch(error => {
        console.log(error);
        this.$message.error('获取单位性质失败,网络错误');
      });
    },
    // 获取单位规模代码
    getAllDwgmdm() {
      axios.get("/dwgmk/getAllDwgmk").then((response) => {
        if (response.data.result) {
          this.dwgmList = response.data.data;
        } else {
          this.$message.error('获取单位代码失败,后台错误');
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error('获取单位代码失败,网络错误');
      });
    },
    // 获取单位行业代码
    getAllDwhydm() {
      axios.get("/dwhydmk/getAllDwhydmk").then((response) => {
        if (response.data.result) {
          this.dwhydmList = response.data.data;
        } else {
          this.$message.error('获取单位行业代码失败,后台错误');
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error('获取单位行业代码失败,网络错误');
      });

    },

    // 获取指定单位的岗位信息
    getAllGwData(DWDM) {
      axios.get(`/dw/getDwGangWei?dwdm=${DWDM}`).then((response) => {
        if (response.data.result) {
          this.jobList = response.data.data;
          this.currentJobsPage = 1;
          this.jobsDialogVisible = true;// 打开岗位列表弹窗
        } else {
          this.$message.error('获取岗位信息失败,后台错误');
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error('获取岗位信息失败,网络错误');
      });
    },
    // 截断公司简介
    truncatedText(text) {
      // 如果text是undefined或null，返回一个默认值或空字符串
      if (!text) return '无简介'; // 或者返回一个空字符串 ''
      return text.length > 10 ? text.substring(0, 10) + '...' : text;
    },
    // 初始化数据获取数据
    getAllDwData() {
      axios.get("/dw/getAllDw").then((response) => {
        if (response.data.result) {
          this.units = response.data.data;
        } else {
          this.$message.error('获取单位信息失败,后台错误');
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error('获取单位信息失败,网络错误');
      });
    },
    // 打开单位详情弹窗
    openDwDetail(row, column, event) {
      console.log("双击行，列，事件--打开单位详情:")
      console.log(row);
      console.log(column);
      console.log(event);
      this.isPopupVisible = true;
      this.selectDwHtml = row.gsjjhtml;
    },
    // 打开编辑器,编辑公司简介
    refreshUnits() {
      this.$message.success('单位信息已刷新');
    },
    openEditor(unit) {
      this.currentUnit = unit;
      this.editorVisible = true;
      this.$nextTick(() => {
        this.editor = new Editor('#editor');
        this.editor.config.onchange = (html) => {
          this.currentUnit.gsjj = html;
        };
        this.editor.create();
        this.editor.cmd.do('insertHTML', unit.gsjj);
      });
    },
    // 保存公司简介
    saveDescription() {
      this.editorVisible = false;
      this.editor.destroy();
    },
    // 打开增加/编辑单位对话框
    showAddDialog() {
      this.isEditing = false;
     //  this.currentUnit = {dwcode: '', dwname: '', dwxz: '', dwgm: '', dwhy: '', gsmc: '', gsjj: ''};
      this.dialogVisible = true;
    },
    editUnit(unit) {
      this.isEditing = true;
      this.currentUnit = {...unit};
      this.dialogVisible = true;// 打开编辑单位对话框
      this.getAllDwxzData();// 获取单位性质数据
      this.getAllDwgmdm();// 获取单位规模代码
      this.getAllDwhydm();// 获取单位行业代码
    },
    // 删除单位
    deleteUnit(unit) {
      this.units = this.units.filter(u => u !== unit);
      this.$message.success('单位已删除');
    },
    handlePageChange(newPage) {
      this.currentPage = newPage;
    },
    // 单位规模选择修改事件
    handleSelectDWGMChange(value) {

      console.log('规模选中的索引:', value);
      console.log("单位规模代码:" + this.dwgmList.find(item => item.gmxq === value).gmdm)
      this.currentUnit.dwgmdm = this.dwgmList.find(item => item.gmxq === value).gmdm;
    },
    // 单位性质选择修改事件
    handleSelectDWXZChange(value) {
      console.log('单位性质选中的索引:', value);
      console.log("单位性质代码:" + this.dwxzkList.find(item => item.dwxz === value).dwxzdm)
      this.currentUnit.dwxzdm = this.dwxzkList.find(item => item.dwxz === value).dwxzdm
    },
    // 单位行业选择修改事件
    handleSelectDWHYChange(value) {
      console.log('单位行业选中的索引:', value);
      console.log(this.dwhydmList);
      this.currentUnit.dwhydm = this.dwhydmList.find(item => item.hymc === value).hydm
      console.log("单位行业代码:" + this.dwhydmList.find(item => item.hymc === value).hydm)
    },

    // 弃用
    DwHyOptionClick(index) {
      console.log('单位行业选项点击:', index);
      console.log(this.dwhydmList[index]);
    },


    saveUnit() {
      this.$refs.formRef.validate((valid) => {
        if (valid) {
          // 验证通过，保存单位信息-编辑模式
          if (this.isEditing) {
            console.log("更新单位信息:");
            console.log(this.currentUnit);
            let UpdateData = new FormData();
            UpdateData.append('dwdm', this.currentUnit.dwdm);
            UpdateData.append('dwmc', this.currentUnit.dwmc);
            UpdateData.append('dwxz', this.currentUnit.dwxz);
            UpdateData.append('dwxzdm', this.currentUnit.dwxzdm);
            UpdateData.append('dwgmdm', this.currentUnit.dwgmdm);
            UpdateData.append('dwgm', this.currentUnit.dwgm);
            UpdateData.append('dwhydm', this.currentUnit.dwhydm);
            UpdateData.append('dwhy', this.currentUnit.dwhy);
            UpdateData.append('gsmc', this.currentUnit.gsmc);
            UpdateData.append('gsjj', this.currentUnit.gsjj);
            UpdateData.append('szdq', this.currentUnit.szdq);
            //UpdateData.append('gsjjhtml', this.currentUnit.gsjjhtml);
            //  UpdateData.append('qydm', this.currentUnit.qydm);
            /*currentUnit: {
              dwdm: "", //单位代码
                  dwmc: "", //单位名称
                  dwxz: "", //单位性质
                  dwxzdm: "", //单位性质代码
                  dwgmdm: "", //单位规模代码
                  dwgm: "",//单位规模
                  dwhydm: "", //单位行业代码
                  dwhy: "", //单位行业
                  gsmc: "", //公司名称
                  gsjj: "", //公司简介
                  gsjjhtml: "", //公司简介html
                  qydm: "" //启用代码
            }*/
            axios.post("/dw/updateDw", UpdateData).then((response) => {
              this.$message.success('单位信息已更新');
              // 替换当前单位信息
              const index = this.units.findIndex(unit => unit.dwdm === this.currentUnit.dwdm);
              this.units.splice(index, 1, this.currentUnit);

            }).catch((error) => {
              console.log(error);
              this.$message.error('更新单位信息失败,网络错误');
            });
          } else {
            // 新增单位信息-非编辑模式

            console.log("更新单位信息:");
            console.log(this.currentUnit);
            let UpdateData = new FormData();
            /* DWDM	单位代码  ，单位代码库   自动生成
                 DWMC	单位名称
                 DWXZ	单位性质
                 DWXZDM	单位性质代码，对应DWXZK 单位性质库
                 DWGMDM	单位规模代码，对应DWGMK 单位规模库
                 DWGM	单位规模，文本，存储
                 DWHYDM	单位行业代码,对应DWHYDMK 单位行业代码库
                 DWHY	单位行业
                 GSMC	公司名称
                 GSJJ	公司简介
                 GSJJHTML	公司（单位）简介Html内容    富文本编辑器生成
             QYDM	启用代码  默认1
             */
            //   UpdateData.append('dwdm', this.currentUnit.dwdm); // 单位代码
            UpdateData.append('dwmc', this.currentUnit.dwmc); // 单位名称
            UpdateData.append('dwxz', this.currentUnit.dwxz);    // 单位性质
            UpdateData.append('dwxzdm', this.currentUnit.dwxzdm);  // 单位性质代码
            UpdateData.append('dwgmdm', this.currentUnit.dwgmdm);  // 单位规模代码
            UpdateData.append('dwgm', this.currentUnit.dwgm);  // 单位规模
            UpdateData.append('dwhydm', this.currentUnit.dwhydm);  // 单位行业代码
            UpdateData.append('dwhy', this.currentUnit.dwhy);  // 单位行业
            UpdateData.append('gsmc', this.currentUnit.gsmc);  // 公司名称
            UpdateData.append('gsjj', this.currentUnit.gsjj);  // 公司简介
            UpdateData.append('szdq', this.currentUnit.szdq);// 所在地区

            axios.post("/dw/addDw", UpdateData).then((response) => {
              if (response.data.result) {
                this.$message.success('单位信息已新增');
                // 新增单位信息
                this.currentUnit.dwdm = response.data.data.dwdm;
                this.units.push(this.currentUnit);
                this.dialogVisible = false;
              } else {
                this.$message.error('新增单位信息失败,后台错误');
              }
            }).catch((error) => {
              console.log(error);
              this.$message.error('新增单位信息失败,网络错误');
            })

          }
          this.updateChart(); // 更新图表数据
        } else {
          console.log('表单验证失败!');
          return false;
        }
      });
    },
    viewJobs(unit) {
      console.log("查看岗位:")
      console.log(unit);
      console.log(unit.dwdm)

      this.getAllGwData(unit.dwdm);

    }
    ,
    handleJobsPageChange(newPage) {
      this.currentJobsPage = newPage;
    }
    ,
    updateChart() {
      const industries = this.units.map(unit => unit.dwhy);
      const industryCount = {};

      industries.forEach(industry => {
        industryCount[industry] = (industryCount[industry] || 0) + 1;
      });

      const chartData = {
        xAxis: Object.keys(industryCount),
        seriesData: Object.values(industryCount)
      };

      this.chartData = chartData;
      this.renderChart(); // Render the selected chart when data is updated
    }
    ,
    renderChart() {
      const chartDom = this.$refs.chart;
      const myChart = echarts.init(chartDom);

      let option;

      if (this.selectedChartType === 'bar') {
        option = {
          xAxis: {
            type: 'category',
            data: this.chartData.xAxis,
          },
          yAxis: {
            type: 'value'
          },
          series: [{
            data: this.chartData.seriesData,
            type: 'bar',
            emphasis: {
              focus: 'series'
            }
          }]
        };
      } else {
        option = {
          title: {
            text: '单位行业分布',
            subtext: '饼图',
            left: 'center'
          },
          series: [{
            type: 'pie',
            radius: '50%',
            data: this.chartData.xAxis.map((label, index) => ({
              name: label,
              value: this.chartData.seriesData[index]
            })),
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }]
        };
      }

      myChart.setOption(option);
    }
    ,
    beforeDestroy() {
      if (this.editor) {
        this.editor.destroy(); // 在组件销毁时销毁编辑器
      }
    }
  }
}
;
</script>
<style scoped>

.el-form-item.is-error .el-input {
  border-color: red; /* 自定义边框颜色 */
}

.p-6{
  padding: 0px ;
}
</style>
