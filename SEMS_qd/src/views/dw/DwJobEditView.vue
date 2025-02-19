<template>
  <div class="content">
    <div>
      <DwMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 min-h-screen">
      <header style="background-color: steelblue;" padding="20px;">
        <div class="  mx-auto px-4">
          <div class="flex justify-between items-center h-16" style="margin-bottom: 27px;">
            <!-- 左侧品牌和导航 -->
            <div class="flex items-center space-x-8">
              <!-- 品牌Logo -->
              <div class="flex items-center">
                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                </svg>
                <span class="ml-2 text-xl font-bold text-white">岗位信息管理</span>
              </div>
            </div>

            <!-- 右侧功能区域 -->
            <div class="flex items-center space-x-6">
              <!-- 通知按钮 -->
              <button class="text-gray-200 hover:text-white relative">
                <i class="el-icon-bell text-xl"></i>
                <span class="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full"></span>
              </button>

              <!-- 用户头像和下拉菜单 -->
              <el-dropdown trigger="click" @command="handleCommand">
                <div class="flex items-center cursor-pointer">
                  <el-avatar
                      src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
                      class="border-2 border-white"></el-avatar>
                  <span class="ml-2 text-gray-200 hover:text-white">{{ UserInfo.name }}</span>
                  <i class="el-icon-arrow-down el-icon--right text-gray-200"></i>
                </div>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item>
                    <i class="el-icon-user mr-2"></i>个人中心
                  </el-dropdown-item>
                  <el-dropdown-item command="ZHSZ">
                    <i class="el-icon-setting mr-2"></i>账户设置
                  </el-dropdown-item>
                  <el-dropdown-item command="logout" divided>
                    <i class="el-icon-switch-button mr-2"></i>退出登录
                  </el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>

              <!-- 发布按钮 -->
              <el-button
                  @click="goToNewjobView()"
                  type="text"
                  icon="el-icon-plus">
                发布新职位
              </el-button>

              <!-- 发布按钮 -->
              <el-button
                  @click="saveJob"
                  type="text"
                  icon="el-icon-check">
                保存修改
              </el-button>
            </div>
          </div>
        </div>
      </header>
      <el-form :model="form" ref="form" :rules="editRule" label-width="120px">
        <div class="hangBd">
          <el-form-item label="岗位名称" prop="gwmc">
            <el-input v-model="form.gwmc" placeholder="请输入岗位名称"></el-input>
          </el-form-item>
          <el-form-item label="单位名称" prop="dwmc">
            <!--              <el-input v-model="form.dwmc" placeholder="请输入单位名称"></el-input>-->
            <el-select filterable clearable v-model="form.dwmc" placeholder="请选择单位">
              <el-option label="请选择" value=""></el-option>
              <el-option  :label="DATADWDMK.dwdm+'-'+DATADWDMK.dwmc+'-'+DATADWDMK.gsmc"
                         :value="DATADWDMK.dwmc"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="单位名称" prop="tdcs">
            <el-input v-model="DATADWDMK.dwmc" placeholder="请输入投递次数"></el-input>
          </el-form-item>
        </div>

        <el-form-item label="岗位描述">
          <el-input type="textarea" rows="5" v-model="form.gwms" placeholder="请输入岗位描述"></el-input>
        </el-form-item>

        <el-form-item label="工作职责">
          <el-input type="textarea" rows="4" v-model="form.gzzz" placeholder="请输入工作职责"></el-input>
        </el-form-item>

        <el-form-item label="岗位要求">
          <el-input type="textarea" rows="3" v-model="form.gwyq" placeholder="请输入岗位要求"></el-input>
        </el-form-item>

        <div class="hangBd">
          <el-form-item label="岗位分类">
            <el-select filterable clearable v-model="form.gwfl" placeholder="请选择岗位分类">
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
          <el-input type="textarea" rows="4" v-model="form.tdsm" placeholder="请输入投递说明"></el-input>
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
            <el-select  filterable clearable v-model="form.zdxlyq" placeholder="请选择最低学历要求">
              <el-option label="请选择" value=""></el-option>
              <el-option v-for="(item,index) in XLTTK" :label="item.id+'-'+item.xlmc" :key="index"
                         :value="item.id"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="工作地点">
            <el-input v-model="form.gzdd" placeholder="请输入工作地点"></el-input>
          </el-form-item>

          <el-form-item label="工作省份" prop="gzsf">
            <el-select  filterable clearable v-model="form.gzsf" placeholder="请选择工作省份">
              <el-option label="请选择" value=""></el-option>
              <el-option v-for="(item,index) in SFDMK" :label="item.sfdm+'-'+item.sfmc" :key="index"
                         :value="item.sfdm"></el-option>
            </el-select>
          </el-form-item>
        </div>

        <div class="hangBd">
          <el-form-item label="实习标志">
            <el-select filterable clearable v-model="form.sxbz" placeholder="请选择实习标志">
              <el-option label="实习岗位" :value="1"></el-option>
              <el-option label="正式岗位" :value="2"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="专业限制">
            <el-input v-model="form.zyxz" placeholder="请输入专业限制"></el-input>
          </el-form-item>
        </div>
        <div class="hangBd">
          <el-form-item label="投递限制标志">
            <el-select filterable clearable v-model="form.tdxzbz" placeholder="请选择投递限制标志">
              <el-option label="无投递限制" :value="0"></el-option>
              <el-option label="有投递限制" :value="1"></el-option>
            </el-select>
          </el-form-item>

          <!-- 仅在选择“有投递限制”时显示投递限制次数 -->
          <el-form-item label="投递限制次数" v-if="form.tdxzbz === 1">
            <el-input v-model="form.tdxzcs" placeholder="请输入投递限制次数"></el-input>
          </el-form-item>

          <el-form-item label="招聘人数">
            <el-input v-model="form.zprs" placeholder="请输入招聘人数"></el-input>
          </el-form-item>

          <el-form-item label="启用代码">
            <!--            <el-input v-model="form.qydm" placeholder="请输入启用代码"></el-input>-->
            <el-select filterable clearable v-model="form.qydm" placeholder="请选择岗位启用状态" prop="qydm">
              <el-option label="请选择" value=""></el-option>
              <el-option label="启用" :value="1"></el-option>
              <el-option label="关闭" :value="0"></el-option>
            </el-select>
          </el-form-item>
        </div>


        <el-form-item label="就业环境描述">
          <el-input type="textarea" rows="4" v-model="form.jyhjms" placeholder="请输入就业环境描述"></el-input>
        </el-form-item>
      </el-form>
    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";
// 面试管理界面
export default {
  name: 'DwJobEditView',
  components: {DwMenu},
  data() {
    return {
      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
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
      SFDMK: [],//省份数据
      XLTTK: [],//学历数据
      DATADWDMK: {},//单位数据
      gwflList: [], // 岗位分类数据
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
    }
  },
  computed: {
  },
  mounted() {

    // 获取路由参数
    console.log("获取页面参数：");
    // 获取页面参数：this.$router.push({path: '/dw/jobDetail', query: {id: this.currentJobSelectRow.id}})
    console.log(this.$route.query.id);

    this.getLoginUserInfo();
    this.GetAllSfdmk();
    this.getXueLiData();
    this.getAllGwflList();
  },
  methods: {
    // 保存修改
    saveJob() {
      // 使用 jQuery 的确认弹窗
      $.confirm({
        title: '确认',
        content: '确认保存修改吗',
        buttons: {
          confirm: {
            text: '确认',
            btnClass: 'el-button el-button--error',
            action: () => {
              console.log(this.form);
              let postData = new FormData();
              postData.append('id', this.$route.query.id); // 岗位代码
              postData.append('gwmc', this.form.gwmc);  // 岗位名称
              postData.append('dwmc', this.form.dwmc);  // 单位名称
              postData.append('dwdm', this.form.dwdm);  // 单位代码
              postData.append('tdcs', this.form.tdcs);  // 投递次数
              postData.append('qydm', this.form.qydm);  // 启用代码
              postData.append('gzsf', this.form.gzsf);  // 工作省份
              postData.append('sxbz', this.form.sxbz);  // 实习标志
              postData.append('zyxz', this.form.zyxz);  // 专业限制
              postData.append('tdxzbz', this.form.tdxzbz);  // 投递限制标志
              postData.append('tdxzcs', this.form.tdxzbz===0?-1: this.form.tdxzcs);  // 投递限制次数
              postData.append('gzdd', this.form.gzdd);  // 工作地点
              postData.append('fbsj', this.form.fbsj);  // 岗位发布时间
              postData.append('gwms', this.form.gwms);  // 岗位描述
              postData.append('gwyq', this.form.gwyq);  // 岗位要求
              postData.append('zdxz', this.form.zdxz);  // 最低薪资
              postData.append('zgxz', this.form.zgxz);  // 最高薪资
              postData.append('zdxlyq', this.form.zdxlyq);  // 最低学历要求
              postData.append('zprs', this.form.zprs);  // 招聘人数
              postData.append('jyhjms', this.form.jyhjms);  // 就业环境描述
              postData.append('gwfl', this.form.gwfl);  // 岗位分类

              // 这里可以添加 AJAX 请求或其他处理逻辑
              console.log(postData);
              axios.post('/dataGwdmk/updateGangWei', postData).then(response => {
                if (response.data.result) {
                  this.$message.success("修改成功！");
                  setTimeout(() => {
                    this.$router.push('/dw/job');
                  }, 3000);
                } else {
                  this.$message.error("修改失败：" + response.data.message);
                }
              }).catch(error => {
                console.error('修改失败,网络错误！', error);
              });
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
    },
    handleCommand(command){
        console.log(command);
        if (command === 'ZHSZ'){
          $.confirm({
            title: '确认',
            content: '确认离开页面,未保存的修改将会丢失！',
            buttons: {
              confirm: {
                text: '确认',
                btnClass: 'el-button el-button--error',
                action:  ()=> {
                  this.$router.push('/dw/zhgl');
                }
              },
              cancel: {
                text: '取消',
                btnClass: 'el-button el-button--primary',
                action:  ()=> {
                  this.$message.info('已取消');
                }
              }
            }
          });
        }else if (command === 'logout'){
          /*this.$confirm('确认退出登录吗？', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
            }).then(() => {
              axios.get('/user/logout').then(response => {
                if (response.data.result) {
                  this.$message.success('退出登录成功！');
                  setTimeout(() => {
                    this.$router.push({name: 'StudentLoginView'});
                  }, 1000);
                } else {
                  this.$message.error('退出登录失败！');
                }
              }).catch(error => {
                console.error('退出登录失败,网络错误！', error);
              });
            }).catch(() => {
              this.$message.info('已取消');
            }); */
        }
    },
    getJobData(id) {
      axios.get("/dataGwdmk/getGwdmById?id=" + id).then((response) => {
        if (response.data.result) {
          // this.$message.success("获取数据成功！");
          //前端要显式显示：岗位名称、对应单位名称、实习标志、岗位启用状态
          // 检查当前用户是否可以编辑该岗位
          if(response.data.data.fbz === this.UserInfo.username || this.UserInfo.role === 'admin'){
            this.form = response.data.data;
            this.getDwYhmDyDw(this.UserInfo.username);// 获取单位信息
          }else{
            this.$message.error("您没有权限编辑该岗位！");
            setTimeout(() => {
              this.$router.push('/dw/job');
            }, 3000);
          }
        } else {
          this.$message.error("获取数据失败：后台错误");
        }
      }).catch((error) => {
        this.$message.error("获取数据失败："+error.message);
        console.log(error);
      });
    },
    async getLoginUserInfo() {
      await axios.get('/user/checkSession').then(response => {
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({name: 'StudentLoginView'});
          }, 1000);
        } else {
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.getJobData(this.$route.query.id);

        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'StudentLoginView'});
        }, 1000);
      });
    } ,
    // 通过发布者用户名获取单位信息
    getDwYhmDyDw(yhm) {
      axios.get('/dw/getDwDataByDwUserName?dwUserName=' + yhm).then(response => {
        if (response.data.result) {
          this.DATADWDMK = response.data.data;
          console.log(this.DATADWDMK)
        } else {
          this.$message.error("获取单位信息失败！");
          setTimeout(() => {
            this.$router.push('/dw/login');
          }, 3000);
        }
      }).catch(error => {
        console.log(error);
      });
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
    goToNewjobView(){

      //使用jquery的确认弹窗
   $.confirm({
        title: '确认',
        content: '确认离开页面,未保存的修改将会丢失！',
        buttons: {
          confirm: {
              text: '确认',
              btnClass: 'el-button el-button--error',
              action:  ()=> {
                  this.$router.push('/dw/addJob');
              }
          },
          cancel: {
              text: '取消',
              btnClass: 'el-button el-button--primary',
              action:  ()=> {
                 this.$message.info('已取消');
              }
          }
        }
    });
    },

  }
};
</script>

<style scoped>
.el-button_error{
  background-color:red;
}

.p-6 {
  padding: 0.5rem !important;
}
.hangBd {
  display: flex;
}
.el-button--text {
  border-color: transparent;
  color: #f6fbff !important;
  background: 0 0;
  padding-left: 0;
  padding-right: 0;
}
</style>
