<template>
  <div class="content">
    <StudentMenu></StudentMenu>

    <main class="ml-64 flex-1 p-6">
      <div class="parentdiv">

        <div class="container-fluid my-4">
          <div class="header mb-4">
            <el-page-header style="padding: 10px;" content="岗位页面">
            </el-page-header>

            <div class="d-flex justify-content-between align-items-center">
              <div class="d-flex align-items-center">
                <!--
                                <select v-model="selectedJobType" class="form-select me-2" aria-label="职位类型">
                                  <option value="">职位类型</option>
                                  <option value="full-time">全职</option>
                                  <option value="part-time">兼职</option>
                                </select>
                                <input type="text" v-model="searchQuery" placeholder="搜索职位、公司" class="form-control me-2">
                &lt;!&ndash;                <button class="btn btn-custom" style="width: 145px;background-color: #0b8e4d" @click="searchJobs">搜索
                                </button>&ndash;&gt;
                                <el-button @click="searchJobs" plain><i class="fa fa-search"></i> 搜索</el-button>
                -->
                <el-input placeholder="请输入内容" v-model="keyword" class="input-with-select">
                  <el-select v-model="select" slot="prepend" filterable clearable placeholder="请选择">
                    <el-option label="餐厅名" value="1"></el-option>
                    <el-option label="订单号" value="2"></el-option>
                    <el-option label="用户电话" value="3"></el-option>
                  </el-select>
                  <el-button slot="append" icon="el-icon-search"></el-button>
                </el-input>

              </div>
              <div>
                <el-button @click="showJobDetail" plain><i class="fa fa-filter"></i>岗位详情</el-button>
                <el-button @click="refreshData" plain><i class="fa fa-refresh"></i>刷新</el-button>
                <el-button @click="showMyProcess" plain><i class="fa fa-plus"></i>我的流程</el-button>
                <el-button @click="TdjobButtonClick" plain><i class="fa fa-plus"></i>投递职位</el-button>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-12">
              <el-card>
                <el-tabs v-model="activeName" type="card">
                  <el-tab-pane label="精选职位" name="first">
                    <div class="row g-4">
                      <!-- 搜索筛选区域 -->
                      <el-card shadow="never" class="search-card">
                        <el-form :inline="true">
                          <el-form-item label="岗位名称">
                            <el-input placeholder="请输入岗位名称" clearable></el-input>
                          </el-form-item>
                          <el-form-item label="发布时间">
                            <el-date-picker
                                type="daterange"
                                range-separator="至"
                                start-placeholder="开始日期"
                                end-placeholder="结束日期">
                            </el-date-picker>
                          </el-form-item>
                          <el-form-item>
                            <el-checkbox label="今日发布" v-model="isGetTodayPublish" @change="fillerTodayPublish"
                                         name="type"></el-checkbox>
                          </el-form-item>
                          <el-form-item>
                            <el-checkbox label="我的收藏" v-model="isShowMyCollection" @change="fillerMyCollection"
                                         name="type"></el-checkbox>
                          </el-form-item>
                          <el-form-item label="投递筛选">
                            <el-select v-model="tdztFilter" @change="fillerTdztFilter">
                              <el-option label="全部" value="0"></el-option>
                              <el-option label="我已投递" value="1"></el-option>
                              <el-option label="未投递" value="2"></el-option>
                            </el-select>
                          </el-form-item>
                          <el-form-item>
                            <el-button type="primary">查询</el-button>
                            <el-button>重置</el-button>
                          </el-form-item>
                        </el-form>
                      </el-card>
                      <el-table :data="paginatedData" highlight-current-row :line-height="10"
                                @current-change="handleCurrentChangeTable" stripe
                                border style="width: 100%">
                        <el-table-column type="expand">
                          <template #default="{row}">
                            <div class="expand-content">
                              <p><span class="label">投递说明：</span>{{ row.tdsm }}</p>
                              <p><span class="label">工作地点：</span>{{ row.gzdd }}</p>
                              <p><span class="label">专业限制：</span>{{ row.zyxz }}</p>
                              <p><span class="label">招聘人数：</span>{{ row.zprs }} 人</p>
                              <p v-show="row.tdxzbz===1"><span class="label">投递限制次数：</span>{{ row.tdxzbz }}</p>
                            </div>
                          </template>
                        </el-table-column>
                        <el-table-column prop="id" label="岗位ID" width="100"></el-table-column>
                        <el-table-column prop="id" label="投递状态" fixed="left" width="100">
                          <template slot-scope="scope">
                            <el-tag type="success" v-if="getTzztByGwdm(scope.row.id)">已投递</el-tag>
                            <el-tag type="danger" v-else>未投递</el-tag>
                          </template>
                        </el-table-column>

                        <el-table-column prop="gwmc" label="岗位名称" width="180"
                                         :formatter="formatText"></el-table-column>
                        <el-table-column prop="gwms" label="岗位描述" width="180"
                                         :formatter="formatText"></el-table-column>
                        <el-table-column prop="gwyq" label="岗位要求" width="180"
                                         :formatter="formatText"></el-table-column>
                        <el-table-column prop="gwfl" label="岗位分类" width="100"
                                         :formatter="(row) => getCategoryName(row)"></el-table-column>
                        <el-table-column prop="fbsj" label="岗位发布时间" width="180">
                          <template #default="scope">
                            {{ fbsjToDate(scope.row.fbsj) }}
                          </template>
                        </el-table-column>
                        <el-table-column prop="tdsm" label="投递说明" :formatter="formatText"></el-table-column>
                        <el-table-column prop="zgxz" sortable label="最高薪资" width="100"
                                         :formatter="(row)=>row.zgxz+'元/月'"></el-table-column>
                        <el-table-column prop="zdxz" sortable label="最低薪资" width="100"
                                         :formatter="(row)=>row.zdxz+'元/月'"></el-table-column>
                        <el-table-column prop="zdxlyq" label="最低学历要求">
                          <template slot-scope="scope">
                            {{ XLTTK.find((xl) => xl.id === scope.row.zdxlyq).xlmc }}
                          </template>
                        </el-table-column>
                        <el-table-column prop="gzdd" label="工作地点" :formatter="formatText"></el-table-column>
                        <el-table-column prop="gzsf" label="工作省份">
                          <template slot-scope="scope">
                            {{ SFDMK.find((sf) => sf.sfdm === scope.row.gzsf).sfmc }}
                          </template>
                        </el-table-column>
                        <el-table-column prop="sxbz" label="实习标志">
                          <template slot-scope="scope">
                            {{ scope.row.sxbz === 1 ? "实习标志" : "正式岗位" }}
                          </template>
                        </el-table-column>
                        <el-table-column prop="zyxz" label="专业限制" :formatter="formatText"></el-table-column>
                        <el-table-column prop="dwmc" label="单位名称" :formatter="formatText"></el-table-column>
                        <el-table-column prop="tdcs" label="投递次数" :formatter="formatText"></el-table-column>
                        <el-table-column prop="zprs" label="招聘人数" :formatter="formatText"></el-table-column>
                        <!-- <el-table-column prop="qydm" label="启用代码" :formatter="formatText"></el-table-column>-->
                        <el-table-column label="操作" :width="150" align="right" fixed="right">
                          <template slot-scope="scope">
                            <el-button size="mini" @click="ShowJobDetail(scope.row)">查看岗位详情</el-button>
                            <el-button size="mini" type="danger"  v-show="!getTzztByGwdm(scope.row.id)" @click="TouDiJl(scope.row)">投递简历</el-button>
                          </template>
                        </el-table-column>
                      </el-table>
                      <el-pagination
                          @current-change="handleCurrentChange"
                          :current-page="currentPage"
                          :page-size="pageSize"
                          :total="totalItems"
                          layout="total, prev, pager, next, jumper"
                          class="mt-4">
                      </el-pagination>
                    </div>
                  </el-tab-pane>
                  <el-tab-pane label="职业分类" name="second">

                  </el-tab-pane>
                </el-tabs>
              </el-card>
            </div>
            <div v-show="isShowJobTonji" class="col-md-4">
              <div class="mt-5">
                <select v-model="chartType" class="form-select mb-3" @change="updateChart">
                  <option value="pie">分类饼图</option>
                  <option value="bar">投递排行榜</option>
                </select>
                <div ref="chart" class="chart-container" style="padding-top: 20px"></div>
              </div>
            </div>
          </div>
          <!-- 加载动画 -->
          <div v-if="loading" class="loading-overlay">
            <div class="spinner-border" role="status">
              <span class="visually-hidden">Loading...</span>
            </div>
          </div>
          <!--投递简历弹窗-->
          <el-dialog :visible.sync="isTdjlVisible" title="简历信息：请双击选择：" width="80%">
            <el-table :data="JlData" style="width: 100%" @row-dblclick="SelectResume">
              <el-table-column prop="jldm" label="简历代码" width="180"></el-table-column>
              <el-table-column prop="xsid" label="学生ID" width="180"></el-table-column>
              <el-table-column prop="fbbz" label="发布标志" width="120">
                <template slot-scope="scope">
                  <el-tag :type="scope.row.fbbz === 1 ? 'success' : 'danger'">
                    {{ scope.row.fbbz === 1 ? '已发布' : '未发布' }}
                  </el-tag>
                </template>
              </el-table-column>
              <el-table-column prop="fbsj" label="发布时间" width="180"></el-table-column>
              <el-table-column prop="jlwb" label="简历文本" width="280">
                <template slot-scope="scope">
                  <a href="#"> <span v-html="scope.row.jlwb.slice(0,20)+'...'"></span> </a>
                </template>
              </el-table-column>
              <el-table-column prop="html" label="简历HTML内容" width="180"></el-table-column>
              <el-table-column prop="scxgtime" label="上次修改时间" width="180"></el-table-column>
              <el-table-column prop="jlfj" label="简历附件" width="180">
                <template slot-scope="scope">
                  <el-button type="text" size="small">查看附件</el-button>
                </template>
              </el-table-column>
            </el-table>
            <span slot="footer" class="dialog-footer">
                <el-button @click="isTdjlVisible = false">关闭</el-button>
              </span>
          </el-dialog>
          <!--投递留言文本框弹窗-->
          <el-dialog :visible.sync="isTdLiuYanVisible" title="投递留言编辑：" width="80%">
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <h2>备注信息</h2>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="6"
                              v-model="TdLiuYanData"></textarea>
                    <button class="btn btn-custom mt-3" @click="saveTdLiuYan">保存</button>
                  </div>
                </div>
              </div>
            </div>
            <span slot="footer" class="dialog-footer">
              <el-button @click="isTdLiuYanVisible= false">关闭</el-button>
            </span>
          </el-dialog>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import * as echarts from 'echarts';
import axios from "axios";
import {EventBus} from "@/event-bus";

export default {
  name: "StudentJobView",
  components: {StudentMenu},
  data() {
    return {
      // 投递状态筛选，默认全部！
      tdztFilter: 0, // 投递状态筛选
      TdLiuYanData: "", // 投递留言数据
      TdGwData: null, // 投递岗位数据
      isTdLiuYanVisible: false, // 投递留言弹窗

      isGetTodayPublish: false, // 是否获取今日发布的职位
      isShowMyCollection: false, // 是否显示我的收藏

      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      JlData: [], // 投递简历数据
      // 投递简历弹窗
      isTdjlVisible: false,
      // 岗位详情弹窗
      isJobDetailVisible: false,
      // 当前选中的岗位
      currentJobSelectRow: null,
      select: "1",
      keyword: '',
      isShowJobTonji: false,// 是否显示统计图
      XLTTK: [],// 学历数据
      DATADWDMK: [],// 单位数据
      SFDMK: [],// 省份数据
      gwflList: [],// 岗位分类数据
      activeName: 'first',
      tableData: [],
      paginatedData: [],
      currentPage: 1,
      pageSize: 5,
      totalItems: 0,
      chartType: 'pie',
      chartInstance: null,
      loading: false,
      selectedJobType: '',
      searchQuery: '',
      selectJL: {},// 选择的简历信息
      TDDATA: [],// 投递数据
    };
  },
  mounted() {
    // 获取登录用户信息
    this.getLoginUserInfo(); // 获取登录用户信息
    this.getAllGwflList(); // 获取所有岗位分类
    this.getXueLiData(); // 获取学历数据
    this.GetDwdmData(); // 获取单位数据
    this.GetAllSfdmk(); // 获取省份数据
    this.getAllJob();    // 获取所有岗位数据
    this.initChart();  // 初始化统计图
    this.updateChart();  // 更新统计图

  },
  methods: {
    // 获取投递信息
    getTzztByGwdm(gwdm){
      // 遍历投递数据，找到对应岗位的投递状态
      for(let i=0;i<this.TDDATA.length;i++){
        if(this.TDDATA[i].GWDM === gwdm){
            return true;
        }
      }
      return false;
    },
    // 通过学生用户名 获取投递数据
    getTdInfoByStuUsername(username) {
      axios.get(`/tdjlk/getTdjlk?Style=2&YHM=${this.UserInfo.username}&GWDM=1`).then((response) => {
        if (response.data.result) {
          // 假设接口返回数据结构为 { records: [], total: 100 }
          this.TDDATA = response.data.data;
        } else {
          this.$message.error('加载失败，请重试!')
        }
        this.loading = false
      }).catch(() => {
        this.loading = false
        this.$message.error('加载失败，请重试!')
      })
    },
    // 筛选投递状态
    fillerTdztFilter() {
      console.log("投递状态筛选：" + this.tdztFilter);
    },
    // 获取所有岗位分类
    fillerMyCollection() {
      console.log("获取我的收藏：" + this.isShowMyCollection);
    },
    // 过滤出今日发布的职位
    fillerTodayPublish() {
      console.log("获取今日发布的职位：" + this.isGetTodayPublish);
    },
    // 单击投递职位按钮
    TdjobButtonClick() {
      // 如果还没简历数据，先获取简历列表
      if (this.JlData.length === 0) {
        this.getMyResumeList(this.UserInfo.id);
      }
      this.TdGwData = this.currentJobSelectRow;// 投递岗位数据
      this.isTdjlVisible = true;
    },

    // 保存投递留言
    saveTdLiuYan() {
      console.log("保存留言：");
      console.log(this.TdLiuYanData);
      console.log("岗位代码：");
      console.log(this.TdGwData);
      console.log("用户信息：")
      console.log(this.UserInfo);
      console.log("所选简历：")
      console.log(this.selectJL);
      let postData = new FormData();
      postData.append("stuid", this.UserInfo.id);// 学生id
      postData.append("jldm", this.selectJL.jldm);// 简历代码
      postData.append('lynr', this.TdLiuYanData);// 留言内容
      postData.append('gwdm', this.TdGwData.id)// 岗位代码
      axios.post("/tdjlk/TdJl", postData).then(response => {
        if (response.data.result) {
          this.$message.success("投递成功！");
      /*    this.getAllJob();// 刷新数据*/
          this.isTdLiuYanVisible = false;
        } else {
          this.$message.error("投递失败：" + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("投递失败," + error.msg);
      });

    },
    //双击选择简历
    SelectResume(row) {
      console.log(row);
      this.$confirm('是否确认选择该简历？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log('确定');
        this.isTdjlVisible = false;
        this.selectJL = row;// 选择的简历信息
        this.isTdLiuYanVisible = true;
      }).catch(() => {
        console.log('取消');
      });
    },
    // 时间转换
    fbsjToDate(fbsj) {
      return new Date(fbsj).toLocaleDateString()
    },
    //刷新数据
    refreshData() {
    },
    // 展示我的流程
    showMyProcess() {
    },
    // 获取学生信息
    getStudentDataByUsername(yhm) {
      axios.get(`/student/getStudentByUsernameOrId?usernameOrId=${yhm}&type=username`).then(response => {
        if (response.data.result) {
          this.UserInfo.id = response.data.data.id;
        } else {
          this.$message.error("获取学生信息失败:" + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取学生信息失败，网络错误！");
      });
    },
    getLoginUserInfo() {
      axios.get('/user/checkSession').then(response => {
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({name: 'Login'});
          }, 1000);
        } else {
          console.log('登录成功-----！');
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          // 获取学生id
          this.getStudentDataByUsername(this.UserInfo.username);
          console.log(this.UserInfo);
          this.getTdInfoByStuUsername(this.UserInfo.username); // 获取投递数据
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'Login'});
        }, 1000);
      });
    },
    // 获取本学生简历列表
    getMyResumeList(stuId) {
      axios.get("/xsjlk/getStuResumeByStuId?stuId=" + stuId).then(res => {
        if (res.data.result) {
          console.log("获取简历列表成功！")
          this.JlData = res.data.data;
          console.log(this.JlData);
        } else {
          this.$message.error("获取简历列表失败:" + res.data.msg);
        }
      }).catch(err => {
        console.log(err);
        this.$message.error("获取简历列表失败:" + err.msg);
      })

    },
    TouDiJl(row) {
      console.log("投递简历:")
      console.log(row);
      // 如果还没简历数据，先获取简历列表
      if (this.JlData.length === 0) {
        this.getMyResumeList(this.UserInfo.id);
      }
      this.TdGwData = row;// 投递岗位数据
      this.isTdjlVisible = true;
    },
    setCurrent(row) {
      this.$refs.singleTable.setCurrentRow(row);
    },
    handleCurrentChangeTable(val) {
      this.currentJobSelectRow = val;
      console.log("当前行数据：");
      console.log(val);
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
    // 获取分类名称
    getCategoryName(categoryId) {
      // console.log("传入的分类数据gwfl：");
      // console.log(categoryId.gwfl);
      const category = this.gwflList.find(cat => cat.id === Number(categoryId.gwfl));
      //  console.log("找到的分类名称：");
      //  console.log(category);
      return category ? category.flmc : '未知分类'; // 如果找不到对应的分类，返回 '未知分类'
    },
    // 格式化文本
    formatText(row, column, cellValue) {
      return cellValue.length > 15 ? cellValue.slice(0, 15) + '...' : cellValue;
    },
    // 获取所有岗位数据
    getAllJob() {
      this.loading = true; // 开始加载
      axios.get("/dataGwdmk/getGwdmkDataByisQy?isQy=1").then(res => {
        this.loading = false; // 结束加载
        if (res.data.result) {
          this.tableData = res.data.data;
          this.totalItems = this.tableData.length;
          console.log("获取岗位数据成功:");
          console.log(this.tableData);
          this.updatePaginatedData();
          this.updateChart(); // 数据获取后更新图表
        } else {
          console.log("获取岗位数据失败：后台数据库错误！");
        }
      }).catch(err => {
        this.loading = false; // 结束加载
        console.log(err);
      });
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
    // 更新分页数据
    updatePaginatedData() {
      const filteredData = this.tableData.filter(job => {
        const matchesType = this.selectedJobType ? job.type === this.selectedJobType : true;
        const matchesQuery = job.gwmc.includes(this.searchQuery) || job.dwmc.includes(this.searchQuery);
        return matchesType && matchesQuery;
      });
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      this.paginatedData = filteredData.slice(start, end);
      this.totalItems = filteredData.length; // 更新总项目数
    },
    // 切换分页
    handleCurrentChange(page) {
      this.currentPage = page;
      this.updatePaginatedData();
    },
    // 搜索职位
    searchJobs() {
      this.currentPage = 1; // 重置为第一页
      this.updatePaginatedData();
    },
    // 初始化图表
    initChart() {
      this.chartInstance = echarts.init(this.$refs.chart);
    },
    // 更新图表
    updateChart() {
      let option;
      if (this.chartType === 'pie') {
        const jobTypeCounts = this.tableData.reduce((acc, job) => {
          acc[job.type] = (acc[job.type] || 0) + 1;
          return acc;
        }, {});
        const data = Object.entries(jobTypeCounts).map(([name, value]) => ({value, name}));

        option = {
          title: {
            text: '职位分类',
            subtext: '数据来源于职位列表',
            left: 'center'
          },
          tooltip: {
            trigger: 'item'
          },
          series: [
            {
              name: '职位类型',
              type: 'pie',
              radius: '50%',
              data,
              emphasis: {
                itemStyle: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            }
          ]
        };
      } else if (this.chartType === 'bar') {
        const jobCounts = this.tableData.reduce((acc, job) => {
          acc[job.gwmc] = (acc[job.gwmc] || 0) + job.tdcs; // 假设TDCS是投递次数
          return acc;
        }, {});
        const data = Object.entries(jobCounts);
        const names = data.map(([name]) => name);
        const values = data.map(([, value]) => value);

        option = {
          title: {
            text: '职位投递排行榜'
          },
          tooltip: {},
          xAxis: {
            type: 'category',
            data: names
          },
          yAxis: {
            type: 'value'
          },
          series: [{
            name: '投递数量',
            type: 'bar',
            data: values
          }]
        };
      }
      this.chartInstance.setOption(option);
    },
    // 跳到岗位的详情页面
    showJobDetail() {
      // 获取当前行数据
      if (this.currentJobSelectRow === null) {
        //使用 Jquery confirm 弹窗提示
        this.currentJobSelectRow = null;
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
        console.log(this.currentJobSelectRow.id);
        this.$router.push({path: '/stu/jobDetail', query: {id: this.currentJobSelectRow.id}})
      }
    },

    ShowJobDetail(row) {
      console.log("跳转到岗位详情页面");
      console.log(row.id);
      this.$router.push({path: '/stu/jobDetail', query: {id: row.id, title: '岗位列表', from: '/stu/job'}})
    }
  }
}
</script>

<style scoped>


.el-table__body tr.current-row > td.el-table__cell, .el-table__body tr.selection-row > td.el-table__cell {
  background-color: #1f344c !important;
}

.mt-5 {
  margin-top: 0px !important;
}

.p-6 {
  padding-top: 0px !important;
}

.parentdiv {
  font-family: Arial, sans-serif;
}

.header {
  background-color: #ffffff;
  padding: 20px;
  border-radius: 15px;
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

.job-card {
  border-radius: 20px;
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
  transition: transform 0.3s;
  background: linear-gradient(135deg, #e0f7fa, #ffffff);
}

.job-card:hover {
  transform: translateY(-8px);
}

.job-title {
  font-size: 1.2rem;
  font-weight: bold;
  color: #333;
}

.salary {
  color: #28a745;
  font-weight: bold;
}

.btn-custom {
  background-color: #007bff;
  color: white;
  border-radius: 25px;
}

.btn-custom:hover {
  background-color: #0056b3;
}

.chart-container {
  width: 100%;
  height: 400px;
  border-radius: 15px;
  background-color: #ffffff;
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

.loading-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(255, 255, 255, 0.8);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999;
}

/* 设置表格行高 */
.el-table .el-table__body tr {
  height: 10px !important; /* 设置行高 */
}

.el-table .el-table__body td {
  line-height: 10px !important; /* 设置单元格内容的行高 */
}

/* 设置表格行高 */
.table tr {
  height: 10px !important;
}

.p-6 {
  padding: 0px !important;
}


.el-table .cell {
  cursor: pointer; /* 鼠标悬停时呈手形态 */
}

.demo-table-expand {
  font-size: 0;
}

.label {
  width: 90px;
  color: #99a9bf !important;
}

.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}
</style>