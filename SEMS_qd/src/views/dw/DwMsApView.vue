<template>
  <div class="content">
    <DwMenu/>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header style="margin-left: 28px;" class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">面试管理</h1>

      </header>

      <div class="interview-management">
        <el-tabs v-model="activeTab">
          <!-- 面试管理 -->
          <el-tab-pane label="待安排面试" name="arranged">
            <div class="operation-bar">
              <el-input
                  v-model="searchKeyword"
                  placeholder="搜索学生/岗位"
                  style="width: 300px; margin-left: 20px"></el-input>
            </div>
            <el-table :data="filteredInterviews" border
                      v-loading="isLoading"
                      element-loading-text="加载中..."
                      element-loading-spinner="el-icon-loading"
                      element-loading-background="rgba(255, 255, 255, 0.8)"
                      style="width: 100%"
                      height="500">
              <el-table-column prop="GWMC" label="岗位" width="180"></el-table-column>
              <el-table-column prop="TDSJ" label="时间" width="180">
                <template #default="{row}">
                  {{ formatDate(row.TDSJ) }}
                </template>
              </el-table-column>
              <el-table-column label="图片" width="120" align="center">
                <template #default="{ row }">
                  <el-image
                      style="width: 80px; height: 100px"
                      :src="row.XSZP"
                      :preview-src-list="[row.XSZP]"
                      fit="cover">
                  </el-image>
                </template>
              </el-table-column>
              <el-table-column prop="XSXM" label="学生"></el-table-column>
              <el-table-column prop="BJMC" label="班级"></el-table-column>
              <el-table-column prop="BZRXM" label="班主任"></el-table-column>
              <el-table-column label="操作" width="150">
                <template slot-scope="{ row }">

                </template>
              </el-table-column>
            </el-table>
          </el-tab-pane>
          <!-- 面试管理 -->
          <el-tab-pane label="面试管理" name="management">
            <div class="operation-bar">
              <el-button type="default" @click="showDialog">发布新面试</el-button>
              <el-input
                  v-model="searchKeywordMsgl"
                  placeholder="搜索学生/岗位"
                  style="width: 300px; margin-left: 20px"></el-input>
            </div>
            <!--allInterviews-->
            <el-table :data="FilteredMSdata" border height="700">
              <el-table-column prop="MSJG" label="面试结果" width="80" fixed="left" align="center" >
                <template #default="{ row }">
                  <template v-if="row.MSJG">
                    <el-tag :type="getMSJGType(row).color">{{ getMSJGType(row).text }}</el-tag>
                  </template>
                </template>
              </el-table-column>
              <el-table-column prop="MSDM" label="面试代码" width="80"></el-table-column>
              <el-table-column prop="XSXM" label="学生姓名" width="100"></el-table-column>
              <el-table-column prop="XSZP" label="学生相片" width="110">
                <template #default="{ row }">
                  <el-image
                      style="width: 80px; height: 100px"
                      :src="row.XSZP"
                      :preview-src-list="[row.XSZP]"
                      fit="cover">
                  </el-image>
                </template>
              </el-table-column>
              <el-table-column prop="XSXB" align="center" label="学生性别" width="80"></el-table-column>
              <el-table-column prop="GWMC" label="面试岗位" width="220">
                <template #default="{ row }">
                  <a :href="'/?#/dw/jobDetail?id='+row.GWDM" style="cursor: pointer;color: #0da5c0;">{{ row.GWMC }}</a>
                </template>
              </el-table-column>
              <el-table-column prop="MSSJ" label="计划面试时间" width="200">
                <template #default="{ row }">
                  {{ formatDate(row.MSSJ) }}
                </template>
              </el-table-column>
              <el-table-column prop="MSDD" label="计划面试地点" width="200"></el-table-column>
              <el-table-column prop="BJMC" label="班级" width="200"></el-table-column>
              <el-table-column prop="FZJSMC" label="负责教师名称" width="120"></el-table-column>
              <el-table-column prop="MSZT" label="面试状态" width="120">
                <template slot-scope="{ row }">
                  <el-tag :type="getMSZTType(row).color">{{ getMSZTType(row).text }}</el-tag>
                </template>
              </el-table-column>
              <el-table-column label="操作" width="150">
                <template slot-scope="{ row }">
                  <!-- return {isCanDelete: true, deleteInterviewCGisCanEidt: true,isCanInterResult: false,isCanUpdataResult: false};-->
                  <el-button v-show="row.QYDM===0" type="text" style="color: red;" icon="el-icon-edit"
                             @click="deleteInterviewCG(row)">删除草稿
                  </el-button>
                  <el-button v-show="getisButtonShowData(row).isCanEidt" type="text" style="color: black;"
                             icon="el-icon-edit" @click="editInterview(row)">修改面试信息
                  </el-button>
                  <el-button v-show="getisButtonShowData(row).isCanDelete" icon="el-icon-circle-close"
                             style="color: red;" type="text" @click="deleteInterview(row)">取消面试
                  </el-button>
                  <el-button v-show="getisButtonShowData(row).isCanStart" icon="el-icon-circle-check"
                             style="color: green;" type="text" @click="StartInterview(row)">开始面试
                  </el-button>
                  <el-button v-show="getisButtonShowData(row).isCanInterResult" icon="el-icon-circle-check"
                             style="color: green;" type="text" @click="InterviewResult(row)">录入结果
                  </el-button>
                  <el-button v-show="getisButtonShowData(row).isCanUpdataResult" icon="el-icon-edit"
                             style="color: dodgerblue;" type="text" @click="eidtInterviewResult(row)">修改结果
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-tab-pane>
          <!-- 面试统计 -->
          <el-tab-pane label="面试统计" name="statistics">
            <div class="chart-container">
              <div class="chart-item">
                <h3>最近一周面试数量</h3>
                <div ref="barChart" style="width: 600px; height: 400px"></div>
              </div>
              <div class="chart-item">
                <h3>面试结果分布</h3>
                <div ref="pieChart" style="width: 600px; height: 400px"></div>
              </div>
            </div>
          </el-tab-pane>
          <!-- 面试日历 -->
          <el-tab-pane label="面试日历" name="calendar">
            <div class="calendar-container">
              <div class="calendar-header">
                <h2>{{ currentMonth }}</h2>
                <div class="legend">
                  <span class="dot has-interview"></span> 有面试
                </div>
              </div>
              <div class="calendar-grid">
                <div
                    v-for="(day, index) in calendarDays"
                    :key="index"
                    class="calendar-day"
                    :class="{ 'has-interview': day.count > 0 }"
                    @click="showDayInterviews(day)">
                  <div class="day-number">{{ day.date }}</div>
                  <div v-if="day.count > 0" class="interview-count">{{ day.count }}</div>
                </div>
              </div>
            </div>
          </el-tab-pane>
          <!-- 面试日历 -->
          <el-tab-pane label="录入结果" name="calendar">
          </el-tab-pane>
        </el-tabs>
        <!-- 面试表单对话框-- 新增 -->
        <el-dialog :title="formTitle" :visible.sync="isAddMsDialogVisible">
          <el-form :model="formData" label-width="80px">
            <div style="display: flex">
              <el-form-item label="新增方式">
                <el-select @change="changeAddType" placeholder="可以选择新增方式：" v-model="AddMsForm.addType">
                  <el-option label="参照投递记录" value="1"></el-option>
                  <el-option label="参照现有面试" value="2"></el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="投递记录" v-show="AddMsForm.addType == 1">
                <el-select @change="changeSelectTdjl" placeholder="选择投递记录" v-model="AddMsForm.TDJL">
                  <el-option v-for="(item,index) in AddMsForm.ALLTDJGMS" :key="index"
                             :label="item.ID+'-'+item.GWMC+'-'+item.XSXM" :value="item.ID"></el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="现有面试" class="luodeng" v-show="AddMsForm.addType == 2">
                <el-select placeholder="选择面试记录" v-model="AddMsForm.TDJL">
                  <el-option label="参照投递记录" value="1"></el-option>
                  <el-option label="参照现有面试" value="2"></el-option>
                </el-select>
              </el-form-item>
            </div>
            <el-form-item label="岗位">
              <el-select v-model="FormDataAddMS.GWDM" placeholder="选择您所发布的岗位">
                <el-option v-for="(item,index) in AddMsForm.ALLMYGWDM" :key="index" :label="item.id+'-'+item.gwmc"
                           :value="item.id"></el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="面试时间">
              <el-date-picker
                  v-model="FormDataAddMS.MSSJ"
                  type="datetime"
                  align="right"
                  placeholder="选择预定的日期时间"
                  :picker-options="MSSJPickerOptions"
              ></el-date-picker>
            </el-form-item>

            <!--只能查看已经投递的学生的信息-->
            <el-form-item label="学生">
              <el-select v-model="FormDataAddMS.XSDM" placeholder="选择学生">
                <el-option v-for="(item,index) in AddMsForm.ALLTDJLDATA" :key="index" :label="item.STUID+'-'+item.XSXM"
                           :value="item.STUID"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="地点">
              <el-input v-model="FormDataAddMS.MSDD"></el-input>
            </el-form-item>
            <!--注意QYDM=1时不是草稿，为0时为草稿-->
            <el-form-item label="存为草稿">
              <el-switch @change="changeQydm" v-model="FormDataAddMS.QYDM2"></el-switch>
            </el-form-item>
          </el-form>
          <span slot="footer">
        <el-button @click="isAddMsDialogVisible = false">取消</el-button>
              <el-button type="primary" @click="saveInterview">保存</el-button>
              </span>
        </el-dialog>
        <!-- 面试表单对话框--编辑 -->
        <el-dialog title="编辑面试信息" :visible.sync="isEditMsDialogVisible">
          <el-form :model="EditformData" label-width="80px">
            <el-form-item label="岗位">
              <el-select v-model="EditformData.GWDM" placeholder="选择您所发布的岗位">
                <el-option v-for="(item,index) in AddMsForm.ALLMYGWDM" :key="index" :label="item.id+'-'+item.gwmc"
                           :value="item.id"></el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="面试时间">
              <el-date-picker
                  v-model="EditformData.MSSJ"
                  type="datetime"
                  align="right"
                  placeholder="选择预定的日期时间"
                  :picker-options="MSSJPickerOptions"
              ></el-date-picker>
            </el-form-item>

            <!--只能查看已经投递的学生的信息-->
            <el-form-item label="学生">
              <el-input v-model="EditformData.XSXM" readonly></el-input>
            </el-form-item>
            <el-form-item label="地点">
              <el-input v-model="EditformData.MSDD"></el-input>
            </el-form-item>
            <!-- 只有当学生还没确认时可以改成草稿，确认后不能改成草稿；已经正式发布的面试不能改成草稿 -->
            <el-form-item v-if="EditformData.isShowSwitch" label="存为草稿">
              <el-switch
                  v-model="EditformData.QYDM2"
                  @change="handleSwitchChange"
              ></el-switch>
            </el-form-item>
          </el-form>
          <span slot="footer">
               <el-button @click="isEditMsDialogVisible = false">取消</el-button>
              <el-button type="primary" @click="saveEidtInterview">保存</el-button>
              </span>
        </el-dialog>
          <!-- 开始录入结果对话框 -->
        <el-dialog title="录入面试结果" :visible.sync="isEnterResultDialogVisible">
          <el-form :model="ResultFormData" label-width="80px">
              <el-form-item label="面试结果">
                <el-select v-model="ResultFormData.MSJG" placeholder="选择面试结果">
                  <el-option label="录用" value="100"></el-option>
                  <el-option label="不录用" value="101"></el-option>
                  <el-option label="待定" value="102"></el-option>
                  <el-option label="多轮面试" value="103"></el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="面试评价">
                <el-slider
                    v-model="ResultFormData.MSPJ"
                    :step="10"
                    show-stops>
                </el-slider>
              </el-form-item>
              <el-form-item label="面试总结">
                <el-input type="textarea" rows="5" v-model="ResultFormData.HRZJ"></el-input>
              </el-form-item>
          </el-form>
          <span slot="footer">
               <el-button @click="isEnterResultDialogVisible = false">取消</el-button>
              <el-button type="primary" @click="EnterInterviewResult">保存</el-button>
          </span>
        </el-dialog>
      </div>
    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";
import * as echarts from 'echarts'
import axios from "axios";
import {EventBus} from "@/event-bus";
export default {
  name: 'DwMsApView',
  components: {DwMenu},
  data() {
    return {
      isLoading:false,
      // 选择的面试记录
      selectedInterResultInterview: null,
      ResultFormData:{
        MSJG: '',
        MSPJ: '',
        HRZJ: '',
      },
      isEnterResultDialogVisible: false,
      // 面试管理查询条件
      searchKeywordMsgl: '',
      // 面试时间选择器配置
      MSSJPickerOptions: {
        disabledDate(time) {
          return time.getTime() <= Date.now(); // 禁用之前的时间
        },
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            picker.$emit('pick', new Date());
          }
        }, {
          text: '后天',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 2);
            picker.$emit('pick', date);
          }
        }, {
          text: '下周',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
            picker.$emit('pick', date);
          }

        }]
      },
      AddMsForm: {
        TDJL: null,//当 addType 为 1 时，TDJL 为投递记录ID
        XYMS: null,//所选的现有面试ID
        addType: null,//新增面试的方式
        ALLTDJLDATA: null,//所有投递记录数据
        ALLMSJLKDATA: null,//所有面试记录数据
        ALLTDJGMS: null,//投递中结果为面试的学生投递信息
        ALLMYGWDM: null,//用户发布的所有可用岗位
      },
      /*MSDM	面试代码--
      XSDM	学生代码 --
      DWDM	单位代码--
      GWDM	岗业代码--
      MSSJ	面试时间**
      MSZT	面试状态--：1单位已安排（待学生确认），2学生已确认，3开始面试（面试中，待单位用户关闭）4 面试关闭（待录入结果） 5已录入结果
      MSJG	面试结果,MSJGDMK.ID--
      FQZ	发起者用户名--
      FQZSFDM	发起者身份代码--
      FQSJ	发起时间，默认(getdate())--
      QYDM	启用代码--  是否为草稿
      QRDM	确认代码，即学生是否确认了面试--
      MSDD	面试地点*/
      FormDataAddMS: {
        XSDM: '',
        QRDM: null,
        DWDM: '',
        GWDM: '',
        MSSJ: '',
        MSZT: '',
        MSJG: '',
        FQZ: '',
        FQZSFDM: '',
        QYDM: '',
        MSDD: '',
        QYDM2: false,
        isShowSwitch:false,
      },
      activeTab: 'arranged',
      searchKeyword: '',
      statusType: {
        0: {color: 'danger', text: '草稿', Type: -1},
        1: {color: 'warning', text: '待学生确认', Type: 1},
        2: {color: 'success', text: '学生已确认，待开始面试', Type: 2},
        3: {color: 'warning', text: '面试中，待录入结果', Type: 3},
        4: {color: 'success', text: '已录入结果', Type: 4},
        5: {color: 'success', text: '面试已结束', Type: 5},
        6: {color: 'danger', text: '未知异常状态', Type: 6}
      },
      statusOptions: ['待面试', '已通过', '未通过'],
      interviews: [
        /* // 假数据示例
         {
           id: 1, jobTitle: '前端开发', time: '2023-07-20 14:00', student: '张三',
           location: '第一会议室', status: '待面试'
         },
         {
           id: 2, jobTitle: 'Java开发', time: '2023-07-21 10:30', student: '李四',
           location: '线上会议', status: '已通过'
         }*/

      ],
      isAddMsDialogVisible: false,// 新增面试对话框
      isEditMsDialogVisible: false, // 编辑面试对话框
      formData: this.emptyForm(),
      EditformData: {
        XSDM: '',
        XSXM: '',
        DWDM: '',
        GWDM: '',
        MSSJ: null,
        MSZT: '',
        MSJG: '',
        FQZ: '',
        FQZSFDM: '',
        QYDM: '',
        MSDD: '',
        QYDM2: false,
      },
      currentEditingId: null,
      calendarDays: [],
      // 面试数据
      allInterviews: [],
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
    }
  },
  computed: {
    // 面试管理业 过滤后的面试数据
    FilteredMSdata() {
      return this.allInterviews.filter(item =>
          item.GWMC.includes(this.searchKeywordMsgl) ||
          item.XSXM.includes(this.searchKeywordMsgl)
      )
    },
    filteredInterviews() {
      return this.interviews.filter(item =>
          item.GWMC.includes(this.searchKeyword) ||
          item.XSXM.includes(this.searchKeyword)
      )
    },
    formTitle() {
      return this.currentEditingId ? '编辑面试' : '发布新面试'
    },
    currentMonth() {
      const date = new Date()
      return `${date.getFullYear()}年${date.getMonth() + 1}月`
    }
  },
  mounted() {
    this.getLoginUserInfo();
    this.initCharts();
    this.generateCalendar();
  },
  methods: {
    // 录入面试结果
    EnterInterviewResult(){
      console.log(this.ResultFormData)
      console.log(this.selectedInterResultInterview)
      let formData = new FormData();
      formData.append("jglrsj", new Date());
      formData.append("msdm", this.selectedInterResultInterview.MSDM);
      formData.append("msjg", this.ResultFormData.MSJG);
      formData.append("mspj", this.ResultFormData.MSPJ);
      formData.append("hrzj", this.ResultFormData.HRZJ);
      formData.append("jglrz",this.UserInfo.username);
      formData.append("jglrzsfdm",3);// 3代表单位

      axios.post("/msdmk/updateInterview", formData).then((response) => {
        if (response.data.result) {
          this.$message.success('录入面试结果成功');
          this.isEnterResultDialogVisible = false;
          this.getInterviews();
        } else {
            this.$message.error('录入面试结果失败:' + response.data.msg);
        }
      }).catch((error) => {
        console.error('录入面试结果失败:', error);
        this.$message.error('录入面试结果失败:' + error.message);
      });
    },
    handleSwitchChange(newval){
      if (newval){
        this.EditformData.QYDM = 0;
      }else{
        this.EditformData.QYDM = 1;
      }
    },
    // 更新面试信息
    saveEidtInterview() {
      if (this.EditformData.QYDM === 0){
         $.confirm({
        title: '警告！',
        content: '您确认保存为草稿吗？学生将无法查看该面试信息！',
        type: 'red',
        typeAnimated: true,
        buttons: {
          ok: {
            text: '确定',
            btnClass: 'btn-red',
            action: () => {
            this.postInterview();
            }
          },
          close: {
            text: '关闭',
            action: () => {
              console.log("关闭！")
              this.$message.info('已取消');
            }
          }
        }
      });
      } else {
        this.postInterview();
      }
    },
    postInterview() {
      console.log(this.EditformData)
      let eidtDat = new FormData();
      eidtDat.append("msdm", this.EditformData.MSDM);
      eidtDat.append("gwdm", this.EditformData.GWDM);
      eidtDat.append("mssj",new Date(this.EditformData.MSSJ));
      eidtDat.append("msdd", this.EditformData.MSDD);
      eidtDat.append("qydm", this.EditformData.QYDM);
      console.log(eidtDat)
      axios.post("/msdmk/updateInterview", eidtDat).then((response) => {
        if (response.data.result) {
          this.$message.success('保存成功');
          this.isEditMsDialogVisible = false;
          this.getInterviews();// 获取面试数据
        } else {
          this.$message.error('保存失败:' + response.data.msg);
        }
      }).catch((error) => {
        console.error('保存失败,网络错误！', error);
        this.$message.error('保存失败:' + error.message);
      });
    },
    // 删除草稿--- 直接删除MSDMK记录
    deleteInterviewCG(row) {
      $.confirm({
        title: '警告！',
        content: '确定要删除该草稿面试吗？',
        type: 'red',
        typeAnimated: true,
        buttons: {
          ok: {
            text: '确定',
            btnClass: 'btn-red',
            action: () => {
              axios.get("/msdmk/deletemsdmk?msdm=" + row.MSDM).then((response) => {
                if (response.data.result) {
                  this.$message.success('删除成功');
                  this.allInterviews = this.allInterviews.filter(item => item.MSDM !== row.MSDM)
                } else {
                  this.$message.error('删除失败:' + response.data.msg);
                }
              }).catch((error) => {
                console.error('删除失败,网络错误！', error);
                this.$message.error('删除失败:' + error.message);
              });
            }
          },
          close: {
            text: '关闭',
            action: () => {
              console.log("关闭！")
              this.$message.info('已取消');
            }
          }
        }
      });
    },
    // 获取面试状态信息
    getMSZTType(row) {
      if (row.QYDM === 1) {
        // 正式发布,待学生确认
        if (row.QRDM === 0 && row.MSZT === 1) {
          return this.statusType['1'];
          // 正式发布,学生已确认，待开始面试
        } else if (row.MSZT === 2) {
          return this.statusType['2'];
          // 正式发布,面试中，待录入结果
        } else if (row.MSZT === 3) {
          // 正式发布,已录入结果
          return this.statusType['3'];
        } else if (row.MSZT === 4) {
          // 正式发布,面试已结束
          return this.statusType['4'];
        } else if (row.MSZT === 5) {
          // 正式发布,面试关闭
          return this.statusType['5'];
        } else {
          return this.statusType['6'];
        }
      } else {
        // 草稿
        return this.statusType['0'];
      }
    },
    // 开始面试
    StartInterview(row){
      console.log(row);
      $.confirm({
        title: '提示！',
        content: '确定要开始面试吗？',
        type: 'blue',
        typeAnimated: true,
        buttons: {
          ok: {
            text: '确定',
            btnClass: 'btn-blue',
            action: () => {
              axios.get("/msdmk/startInterview?msdm=" + row.MSDM).then((response) => {
                if (response.data.result) {
                  this.$message.success('开始面试成功');
                  this.getInterviews();
                } else {
                  this.$message.error('开始面试失败:' + response.data.msg);
                }
              }).catch((error) => {
                console.error('开始面试失败:', error);
                this.$message.error('开始面试失败:' + error.message);
              });
            }
          },
          close: {
            text: '关闭',
            action: () => {
              console.log("关闭！")
              this.$message.info('已取消');
            }
          }
        }});
    },
    // 按钮是否显示
    getisButtonShowData(row) {
      if (row.QYDM === 1) {
        if (row.QRDM === 0 && row.MSZT === 1) {
          // 正式发布,待学生确认:可删除、可编辑、不可面试结果、不可更新结果、不可开始面试
          return {isCanDelete: true, isCanEidt: true, isCanInterResult: false, isCanUpdataResult: false, isCanStart: false};
        } else if (row.MSZT === 2) {
          // 正式发布,学生已确认，待开始面试:可删除、可编辑、不可面试结果、不可更新结果、可开始面试
          return {isCanDelete: true, isCanEidt: false, isCanInterResult: false, isCanUpdataResult: false,isCanStart: true};
        } else if (row.MSZT === 3) {
          // 正式发布,面试中，待录入结果:可删除、可编辑、可面试结果、不可更新结果、不可开始面试
          return {isCanDelete: false, isCanEidt: false, isCanInterResult: true, isCanUpdataResult: false, isCanStart: false};
        } else if (row.MSZT === 4) {
          // 正式发布,已录入结果:不可删除、不可编辑、不可面试结果、可更新结果、不可开始面试
          return {isCanDelete: false, isCanEidt: false, isCanInterResult: false, isCanUpdataResult: true, isCanStart: false};
        } else if (row.MSZT === 5) {
          // 正式发布,面试已结束:不可删除、不可编辑、不可面试结果、不可更新结果、不可开始面试
          return {isCanDelete: false, isCanEidt: false, isCanInterResult: false, isCanUpdataResult: true, isCanStart: false};
        } else {
          // 未知异常状态:不可删除、不可编辑、不可面试结果、不可更新结果、不可开始面试
          return {isCanDelete: false, isCanEidt: false, isCanInterResult: false, isCanUpdataResult: false, isCanStart: false};
        }
      } else {
        // 草稿:可删除、可编辑、不可面试结果、不可更新结果,不可开始面试
        return {isCanDelete: false, isCanEidt: true, isCanInterResult: false, isCanUpdataResult: false, isCanStart: false};
      }
    },
    changeQydm(newVal) {
      console.log(newVal)
      if (newVal) {
        this.FormDataAddMS.QYDM = 0;
      } else {
        this.FormDataAddMS.QYDM = 1;
      }
    },
    changeQydm2(newVal) {
      console.log(newVal)
      if (newVal) {
        this.EditformData.QYDM = 0;
      } else {
        this.EditformData.QYDM = 1;
      }
    },
    // 获取用户发布的所有可用岗位
    getALLUseingGwData() {
      axios.get("/dataGwdmk/getGwdmkDataByFbz?fbzyhm=" + this.UserInfo.username).then((response) => {
        if (response.data.result) {
          this.AddMsForm.ALLMYGWDM = response.data.data.filter(item => item.qydm === 1);
        } else {
          this.$message.error('获取用户发布的所有可用岗位失败:' + response.data.msg);
        }
      }).catch((error) => {
        console.error('获取用户发布的所有可用岗位失败,网络错误！', error);
      })
    },
    // 用户选择投递记录：加载信息
    changeSelectTdjl(newVal) {
      console.log(newVal);// 选择的投递记录ID
      // 从投递记录中获取信息
      let tdjlData = this.AddMsForm.ALLTDJGMS.find(item => item.ID === newVal)
      // 从投递记录中获取信息
      this.FormDataAddMS.XSDM = tdjlData.STUID;
      this.FormDataAddMS.GWDM = tdjlData.GWDM;
      console.log(this.FormDataAddMS);
    },
    InterviewResult(row){
      this.selectedInterResultInterview = row;
      this.isEnterResultDialogVisible = true;
    },
    // 用户选择新增方式修改时触发
    changeAddType(newVal) {
      console.log(newVal)
      // 加载所有可用岗位
      if (this.AddMsForm.ALLMYGWDM === null) {
        this.getALLUseingGwData();
      }

      if (newVal == 1) {
        // 获取投递记录--单位获取
        axios.get(`/tdjlk/getTdjlk?Style=4&YHM=${this.UserInfo.username}&GWDM=1`).then((response) => {
          if (response.data.result) {
            this.AddMsForm.ALLTDJLDATA = response.data.data;
            // 过滤数据，只获取待面试的投递记录:方式就是TDJG=2
            this.AddMsForm.ALLTDJGMS = this.AddMsForm.ALLTDJLDATA.filter(item => item.TDJG === 2)
            console.log(this.AddMsForm.ALLTDJLDATA)
          } else {
            this.$message.error('加载投递激励失败:' + response.data.msg);
          }
        }).catch((error) => {
          this.$message.error('加载投递激励失败:' + error.message);
        })

      } else if (newVal == 2) {
        // 获取现有面试
        axios.get(`/msdmk/getAllInterviews?yhsfdm=3&YHM=${this.UserInfo.username}`).then((response) => {
          if (response.data.result) {
            this.AddMsForm.ALLMSJLKDATA = response.data.data;
          } else {
            this.$message.error('加载面试记录数据失败:' + response.data.msg);
          }
        }).catch((error) => {
          this.$message.error('加载面试记录数据失败:' + error.message);
        })
      }

    },
    formatDate(dateStr) {
      return dateStr ? new Date(dateStr).toLocaleString() : '-'
    },
    async getLoginUserInfo() {
      this.isLoading=true;
      await axios.get('/user/checkSession').then(response => {
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({name: 'StudentLoginView'});
          }, 1000);
        } else {
          console.log('登录成功-----！');
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.getArrangedInterviews();// 获取待安排的面试列表
          this.getInterviews();// 获取面试数据
        }
        this.isLoading=false;
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'StudentLoginView'});
        }, 1000);
      });
    },
    // 获取待安排的面试列表
    getArrangedInterviews() {
      this.isLoading=true;
      axios.get('/msdmk/getWaitApms?yhm=' + this.UserInfo.username).then(response => {
        if (response.data.result) {
          this.interviews = response.data.data;
        } else {
          this.$message.error('获取待安排的面试列表失败:' + response.data.message);
        }
        this.isLoading=false;
      }).catch(error => {
        console.error('获取待安排的面试列表失败,网络错误！', error);
        this.$message.error('获取待安排的面试列表失败:' + error.message);
      });
    },
    // 获取面试数据
    getInterviews() {
      axios.get(`/msdmk/getAllInterviews?yhm=${this.UserInfo.username}&yhsfdm=3`).then(response => {
        if (response.data.result) { // 成功获取数据
          this.allInterviews = response.data.data;
          console.log("获取面试数据成功：")
          console.log(this.allInterviews)
        } else {
          this.$message.error('获取面试数据失败:' + response.data.message);
        }
      }).catch(error => {
        console.error('获取面试数据失败,网络错误！', error);
        this.$message.error('获取面试数据失败:' + error.message);
      });
    },
    getMSJGType(row) {
      if (!row.MSJG) return null; // 为空时不显示

      const statusMap = {
        录用: { color: "success", text: "通过" },
        不录用: { color: "danger", text: "未通过" },
        待定: { color: "warning", text: "待定" },
        多轮面试: { color: "info", text: "多轮面试" },
      };

      return statusMap[row.MSJG] || { color: "info", text: "未知" };
    },
    // 初始化图表
    initCharts() {
      const barChart = echarts.init(this.$refs.barChart)
      const pieChart = echarts.init(this.$refs.pieChart)

      // 柱状图配置
      barChart.setOption({
        xAxis: {type: 'category', data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']},
        yAxis: {type: 'value'},
        series: [{data: [5, 8, 6, 7, 4, 2, 3], type: 'bar', color: '#409EFF'}]
      })

      // 饼图配置
      pieChart.setOption({
        tooltip: {trigger: 'item'},
        series: [{
          type: 'pie',
          data: [
            {value: 12, name: '待面试'},
            {value: 8, name: '已通过'},
            {value: 5, name: '未通过'}
          ],
          itemStyle: {
            colors: ['#E6A23C', '#67C23A', '#F56C6C']
          }
        }]
      })
    },
    // 生成日历数据
    generateCalendar() {
      const days = []
      const daysInMonth = new Date().getDate()
      for (let i = 1; i <= daysInMonth; i++) {
        days.push({
          date: i,
          count: Math.random() > 0.7 ? Math.floor(Math.random() * 5) : 0
        })
      }
      this.calendarDays = days
    },
    // 打开新增面试对话框
    showDialog() {
      this.isAddMsDialogVisible = true
      this.formData = this.emptyForm()
      this.currentEditingId = null
    },
    emptyForm() {
      return {jobTitle: '', time: '', student: '', location: '', status: '待面试'}
    },
    // 单击修改面试信息
    editInterview(row) {
      if (this.AddMsForm.ALLMYGWDM === null) {
        this.getALLUseingGwData();
      }
      this.isEditMsDialogVisible = true
      this.EditformData.XSDM = row.XSDM;
      this.EditformData.XSXM = row.XSXM;
      this.EditformData.DWDM = row.DWDM;
      this.EditformData.GWDM = row.GWDM;
      this.EditformData.MSSJ = row.MSSJ;
      this.EditformData.MSDD = row.MSDD;
      this.EditformData.QRDM = row.QRDM;
      this.EditformData.QYDM = row.QYDM;
      this.EditformData.MSDM = row.MSDM;
      this.EditformData.QYDM2 = row.QYDM == 0 ? true : false;
      this.EditformData.isShowSwitch =row.QYDM == 0 ? true : false; // 为
      console.log(this.EditformData)
    },
    // 保存新增的面试信息
    saveInterview() {
      /*
      XSDM	学生代码 --
      DWDM	单位代码--
      GWDM	岗业代码--
      MSSJ	面试时间**
      FQZ	发起者用户名--
      FQZSFDM	发起者身份代码--
      FQSJ	发起时间，默认(getdate())--
      QYDM	启用代码--  是否为草稿
      MSDD	面试地点**
      */
      if (this.FormDataAddMS.QYDM2 === false) {
        this.FormDataAddMS.QYDM = 1;
      } else {
        this.FormDataAddMS.QYDM = 0;
      }

      console.log(this.FormDataAddMS.QYDM)
      if (this.FormDataAddMS.QYDM === 0) {
        console.log('保存面试信息为草稿');
        $.confirm({
          title: '确认',
          content: '确认保存为草稿吗？',
          buttons: {
            confirm: {
              text: '确认',
              btnClass: 'el-button el-button--error',
              action: () => {
                console.log(this.FormDataAddMS);
                this.postAddInterview();
              }
            },
            cancel: {
              text: '取消',
              btnClass: 'el-button el-button--primary',
              action: () => {
                this.$message.info('已取消');
              }
            }
          }
        });
      } else {
        this.postAddInterview();
      }
    },
    postAddInterview() {
      let addFormData = new FormData();
      addFormData.append('xsdm', this.FormDataAddMS.XSDM);//
      addFormData.append('dwdm', this.AddMsForm.ALLMYGWDM.find(item => item.id === this.FormDataAddMS.GWDM).dwdm);
      addFormData.append('gwdm', this.FormDataAddMS.GWDM);//
      addFormData.append('mssj', new Date(this.FormDataAddMS.MSSJ));//
      addFormData.append('qydm', this.FormDataAddMS.QYDM);//
      addFormData.append('msdd', this.FormDataAddMS.MSDD);
      addFormData.append('fqz', this.UserInfo.username);//
      addFormData.append('fqzsfdm', '3');//
      axios.post("/msdmk/addInterview", addFormData).then((response) => {
        if (response.data.result) {
          this.$message.success('保存面试信息成功！');
          this.isAddMsDialogVisible = false
          this.getInterviews()
        } else {

        }
      }).catch((error) => {
        console.error('保存面试信息失败,网络错误！', error);
        this.$message.error('保存面试信息失败:' + error.message);
      });
    },
    deleteInterview(row) {
    $.confirm({
        title: '警告！',
        content: '确定要取消面试该面试？',
        type: 'red',
        typeAnimated: true,
        buttons: {
          ok: {
            text: '确定',
            btnClass: 'btn-red',
            action: () => {
              axios.get("/msdmk/deletemsdmk?msdm=" + row.MSDM).then((response) => {
                if (response.data.result) {
                  this.$message.success('取消成功');
                  this.allInterviews = this.allInterviews.filter(item => item.MSDM !== row.MSDM)
                } else {
                  this.$message.error('取消失败:' + response.data.msg);
                }
              }).catch((error) => {
                console.error('取消失败,网络错误！', error);
                this.$message.error('取消失败:' + error.message);
              });
            }
          },
          close: {
            text: '关闭',
            action: () => {
              console.log("关闭！")
              this.$message.info('已取消操作');
            }
          }
        }
      });

    },
    showDayInterviews(day) {
      if (day.count > 0) {
        // 这里可以显示当天的面试列表
      }
    }
  }
}
</script>

<style scoped>
.luodeng {
  width: 520px;
}

.el-form-item__label {
  width: 160px !important;
}

.interview-management {
  padding: 20px;
}

.operation-bar {
  margin-bottom: 20px;
}

.chart-container {
  display: flex;
  justify-content: space-around;
}

.calendar-container {
  max-width: 1000px;
  margin: 0 auto;
}

.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.calendar-grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 10px;
}

.calendar-day {
  border: 1px solid #ebeef5;
  border-radius: 4px;
  height: 100px;
  padding: 8px;
  position: relative;
  cursor: pointer;
  transition: all 0.3s;
}

.calendar-day:hover {
  background-color: #f5f7fa;
}

.has-interview {
  background-color: #f0f9eb;
}

.day-number {
  font-weight: bold;
  margin-bottom: 5px;
}

.interview-count {
  background-color: #409EFF;
  color: white;
  border-radius: 50%;
  width: 24px;
  height: 24px;
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  bottom: 8px;
  right: 8px;
}

.legend .dot {
  display: inline-block;
  width: 12px;
  height: 12px;
  border-radius: 50%;
  margin-right: 5px;
}

.has-interview.legend .dot {
  background-color: #409EFF;
}
</style>