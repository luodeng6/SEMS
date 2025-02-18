<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <div class="header animated-header">
        <div class="user-info">
          <div class="user-dropdown">

            <el-badge :value="12" class="item" style="margin-right: 20px;">
              <el-button size="small" plain>待处理面试</el-button>
            </el-badge>
            <el-badge is-dot class="item" style="margin-right: 20px;color: #0d0d0d;">新消息</el-badge>
            <el-badge is-dot class="item" style="margin-right: 20px;">
              <el-button class="share-button" icon="el-icon-share" type="primary"></el-button>
            </el-badge>


            <img src="@/assets/avatar.png" alt="用户头像" class="avatar animated-avatar"/>
            <span class="text-dark"> 用户: {{ UserInfo.name }}</span>
            <el-dropdown trigger="click" style="margin-left: 10px;">
              <span class="el-dropdown-link text-dark">点我查看<i
                  class="el-icon-caret-bottom el-icon--right"></i></span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item class="clearfix">评论
                  <el-badge class="mark" :value="12"/>
                </el-dropdown-item>
                <el-dropdown-item class="clearfix">回复
                  <el-badge class="mark" :value="3"/>
                </el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </div>
        </div>
      </div>

      <el-card shadow="never">
        <el-form
            ref="form"
            :model="form"
            :rules="rules"
            label-position="top">

          <el-steps :space="1000" :active="currentStep" finish-status="success">
            <el-step title="1-基本信息"></el-step>
            <el-step title="2-学籍信息">
            </el-step>
            <el-step title="3-账户信息"></el-step>
            <el-step title="4-修改完成"></el-step>
          </el-steps>

          <!-- 基本信息 -->
          <div v-show="currentStep === 0">
            <div class="col-span-1">
              <h3 class="text-lg font-medium mb-4">基本信息</h3>
              <el-form-item label="学生照片">
                <el-upload
                    action="#"
                    :show-file-list="false"
                    :before-upload="beforeAvatarUpload"
                    :on-change="handleAvatarChange">
                  <img v-if="form.xszp" :src="form.xszp" class="w-32 h-40 object-cover border rounded">
                  <el-button v-else size="small" type="primary">上传照片</el-button>
                </el-upload>
              </el-form-item>
            </div>

            <div class="col-span-2">
              <el-form-item label="学号" prop="xsxh">
                <el-input v-model="form.xsxh" disabled></el-input>
              </el-form-item>

              <el-form-item label="学生姓名" prop="xsxm">
                <el-input v-model="form.xsxm"></el-input>
              </el-form-item>

              <el-form-item label="性别" prop="xsxb">
                <el-select v-model="form.xsxb" class="w-full">
                  <el-option label="男" value="1"></el-option>
                  <el-option label="女" value="0"></el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="出生日期" prop="birth">
                <el-date-picker
                    v-model="form.birth"
                    type="date"
                    value-format="yyyy-MM-dd"
                    class="w-full"
                ></el-date-picker>
              </el-form-item>

              <el-form-item label="身份证号" prop="sfzh">
                <el-input v-model="form.sfzh" maxlength="18"></el-input>
              </el-form-item>

              <el-form-item label="民族" prop="mz">
                <el-select v-model="form.mz" class="w-full" clearable filterable>
                  <el-option label="请选择民族" value=""></el-option>
                  <el-option v-for="( item, index ) in MZDMK" :key="index" :label="index+'-'+item"
                             :value="item"></el-option>
                </el-select>
              </el-form-item>
            </div>
          </div>
          <!-- 学籍信息 -->
          <div v-show="currentStep ===1">
            <h3 class="text-lg font-medium col-span-full">学籍信息</h3>

            <el-form-item label="所属班级" prop="ssbj">
              <el-select v-model="form.ssbj" class="w-full" clearable filterable>
                <el-option label="请选择班级" value=""></el-option>
                <el-option v-for="(item, index) in classList" :key="index" :label="item.id+'-'+item.bjmc"
                           :value="item.id"></el-option>
              </el-select>
            </el-form-item>


            <el-form-item label="专业代码" prop="zydm">
              <el-select v-model="form.zydm" class="w-full" clearable filterable>
                <el-option label="请选择专业" value=""></el-option>
                <el-option v-for="(item, index) in majorList" :key="index" :label="item.id+'-'+item.zymc"
                           :value="item.id"></el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="所属年级" prop="ssnj">
              <el-date-picker
                  v-model="form.ssnj"
                  type="year"
                  value-format="yyyy"
                  class="w-full"
              ></el-date-picker>
            </el-form-item>

            <el-form-item label="学制" prop="xz">
              <el-input-number v-model="form.xz" :min="2" :max="5"></el-input-number>
            </el-form-item>
            <el-form-item label="学历代码" prop="xldm">
              <el-select v-model="form.xldm" class="w-full" clearable filterable>
                <el-option label="请选择学历" value=""></el-option>
                <el-option v-for="(item, index) in XLTTK" :key="index" :label="item.id+'-'+item.xlmc"
                           :value="item.id"></el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="政治面貌" prop="zzmm">
              <el-select v-model="form.zzmm" class="w-full" clearable filterable>
                <el-option label="请选择政治面貌" value=""></el-option>
                <el-option v-for="(item, index) in zymmList" :key="index" :label="index+'-'+item"
                           :value="item"></el-option>
              </el-select>
            </el-form-item>
          </div>
          <!-- 账户信息 -->
          <div v-show="currentStep ===2">
            <h3 class="text-lg font-medium col-span-full">账户信息</h3>

            <el-form-item label="用户名" prop="yhm">
              <el-input v-model="form.yhm" disabled></el-input>
            </el-form-item>

            <el-form-item label="密码" prop="mm">
              <el-input v-model="form.mm" show-password></el-input>
            </el-form-item>

            <el-form-item label="就业状态" prop="jyz">
              <el-select v-model="form.jyzt" class="w-full">
                <el-option v-for="(item, index) in JyZtList" :key="index" :label="item.jyzt" :value="item.ztdm"></el-option>
              </el-select>
            </el-form-item>

          </div>
<!--          将在daoshu秒后自动跳转到修改完成页面-->
          <div v-show="currentStep ===3">
            <h1 class="text-lg font-medium col-span-full">  将在：   {{danshu}}秒后自动跳转页面！！！</h1>
          </div>
          <el-form-item class="mt-6">
            <el-button type="default" @click="currentStep--" v-show="currentStep!== 0">上一步</el-button>
            <el-button type="default" @click="currentStep++" v-show="currentStep !== 2">下一步</el-button>
            <el-button type="primary" v-show="currentStep === 2" @click="submitForm">保存信息</el-button>
          </el-form-item>
        </el-form>
      </el-card>

    </main>
  </div>
</template>

<script>

import StudentMenu from "@/components/student/Student_menu.vue";
import {EventBus} from "@/event-bus";
import axios from 'axios';

export default {
  name: 'StudentZhglView',
  components: {StudentMenu},
  data() {
    return {
      currentStep: 0,
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      form: null,
      rules: {
        xsxm: [{required: true, message: '请输入学生姓名', trigger: 'blur'}],
        sfzh: [
          {required: true, message: '请输入身份证号', trigger: 'blur'},
          {pattern: /^\d{17}[\dXx]$/, message: '身份证格式不正确', trigger: 'blur'}
        ],
        mm: [
          {required: true, message: '请输入密码', trigger: 'blur'},
          {min: 1, message: '密码长度不能小于1位', trigger: 'blur'}
        ],
        zydm: {required: true, message: '请选择专业', trigger: 'change'},
        xldm: {required: true, message: '请选择学历', trigger: 'change'}
      },

      // 政治面貌
      zymmList: [
        '中共党员',         // 共产党员
        '中共预备党员',     // 预备党员
        '入党积极分子',
        '共青团员',// 积极分子
        '群众',             // 群众
        '民主党派成员',     // 民主党派成员
        '无党派人士',       // 无党派人士
        '其他'              // 其他
      ],// 政治面貌列表
      MZDMK: ["汉族", "壮族", "满族", "回族", "藏族", "维吾尔族", "苗族", "彝族", "土家族", "蒙古族", "侗族", "布依族", "黎族", "瑶族", "傣族", "哈尼族", "土族", "仫佬族", "撒拉族", "维吾尔族", "景颇族", "畲族", "拉祜族", "水族", "白族", "乌兹别克族", "俄罗斯族", "布朗族", "达斡尔族", "鄂温克族", "鄂伦春族", "景颇族", "朝鲜族", "佤族", "纳西族", "赫哲族", "珞巴族", "基诺族", "塔吉克族"]

      , majorList: [], // 专业列表
      classList: [], // 班级列表
      XLTTK: null, // 学历列表
      profile: null, // 学生照片文件流
      danshu:5,// 倒数秒数
      JyZtList: [], // 就业状态列表
    }
  },
  computed: {},
  created() {
    this.getLoginUserInfo();
    this.getXSGLData();
    this.getJyztData();
  },
  methods: {
    // 获取就业状态数据
    getJyztData() {
        axios.get("/jyztdmk/getAllJyztdmk").then(response => {
            if (response.data.result) {
              this.JyZtList = response.data.data;
            } else {
              this.$message.error('获取就业状态数据失败:'+response.data.msg);
            }
        }).catch(error => {
            console.log(error);
            this.$message.error('获取数据失败：'+error.message);
        });
    },

    getXSGLData() {
      axios.get("/data/getAllStuGLData").then(response => {
        if (response.data.result) {
          this.majorList = response.data.data.ZYDMK;//专业列表
          this.classList = response.data.data.BJDMK;//班级列表
          // this.xmzList=response.data.data.MZ;//民族列表
          this.XLTTK = response.data.data.XLTTK;//学历列表
        } else {
          this.$message.error('获取数据失败，灾难性错误');
        }
      }).catch(error => {
        console.log(error);
        this.$message.error('获取数据失败, 网络连接错误！');
      });
    },
    async getLoginUserInfo() {
      await axios.get('/user/checkSession').then(response => {
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
          console.log(this.UserInfo);
          // this.loadData(this.UserInfo.username);
          this.loadData(); // 获取学生信息
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      });
    },
    // 获取学生信息
    async loadData() {
      axios.get(`/student/getStudentByUsernameOrId?usernameOrId=${this.UserInfo.username}&type=username`).then(response => {
        if (response.data.result) {
          this.form = response.data.data;
        } else {
          this.$message.error('获取学生信息失败:'+ response.data.msg);
        }
      }).catch(error => {
        this.$message.error('获取学生信息失败,网络错误！');
        console.error('获取学生信息失败,网络错误！', error);
      })
    },

    submitForm() {
      console.log("submitForm提交");
      this.$refs.form.validate(valid => {
        if (valid) {
          /* console.log('提交数据:', {
             ...this.form,
             BIRTH: this.formatDate(this.form.BIRTH)
           });*/


          if (this.profile === null) {
            //不调用接口上传图片
          } else {
            let profileData = new FormData();
            profileData.append('yhm', this.UserInfo.username);
            profileData.append('file', this.profile);
            axios.post('/student/uploadStudentPhoto', profileData).then(response => {
              if (response.data.result) {
                this.$message.success('头像上传成功');
              } else {
                this.$message.error('信息保存失败');
              }
            }).catch(error => {
              console.error('信息保存失败,网络错误！', error);
              this.$message.error('信息保存失败,网络错误！');
            });}

          let studetnData = new FormData();
          studetnData.append('id', this.form.id);// 学生id
          studetnData.append('xsxh', this.form.xsxh);// 学号
          studetnData.append('xsxm', this.form.xsxm); // 学生姓名
          studetnData.append('xsxb', this.form.xsxb); // 学生性别
          studetnData.append('birth', this.form.birth); // 学生出生日期
          studetnData.append('sfzh', this.form.sfzh); // 身份证号
          studetnData.append('mz', this.form.mz); // 学生民族
          studetnData.append('ssbj', this.form.ssbj); // 所属班级
          studetnData.append('zydm', this.form.zydm);    // 专业代码
          studetnData.append('ssnj', this.form.ssnj);    // 所属年级
          studetnData.append('xz', this.form.xz);    // 学制
          studetnData.append('xldm', this.form.xldm);   // 学历代码
          studetnData.append('zzmm', this.form.zzmm);   // 政治面貌
          studetnData.append('jyzt', this.form.jyzt); // 就业状态
          studetnData.append('yhm', this.UserInfo.username);  // 用户名
          studetnData.append('mm', this.form.mm);  // 密码


          axios.post('/student/updateStudentByEdit', studetnData).then(response => {
            if (response.data.result) {
              this.$message.success('信息保存成功');
              this.currentStep=3;
             let timer= setInterval(() => {
                  if (this.danshu === 0){
                    //销毁定时器
                    clearInterval(timer);
                    this.$router.push({name: 'StudentIndexView'});
                  }
                  this.danshu--;
                }, 1000);
            } else {
              this.$message.error('信息保存失败');
            }
          }).catch(error => {
            console.error('信息保存失败,网络错误！', error);
            this.$message.error('信息保存失败,网络错误！');
          });
        } else {
          this.$message.error('请完善输入项');
        }
      });
    },
    beforeAvatarUpload(file) {
      const isImage = file.type.startsWith('image/');
      const isLt5M = file.size / 1024 / 1024 < 5;

      if (!isImage) {
        this.$message.error('只能上传图片文件');
      }
      if (!isLt5M) {
        this.$message.error('图片大小不能超过5MB');
      }
      return isImage && isLt5M;
    },
    handleAvatarChange(file) {
      this.profile =file.raw;
      this.form.xszp = URL.createObjectURL(file.raw);
    },
    formatDate(date) {
      // 日期格式化逻辑
    }
  }
};
</script>
<style scoped>
.el-form-item__label {
  font-weight: 500;
}

.grid div:not(.col-span-full) {
  margin-bottom: 16px;
}


.el-button {
  background-color: #007bff; /* 按钮背景颜色 */
  color: white; /* 按钮字体颜色 */
  border-radius: 4px; /* 按钮圆角 */
  padding: 5px 10px; /* 按钮内边距 */
  transition: background-color 0.3s; /* 按钮悬停效果 */
}

.el-button:hover {
  background-color: #0056b3; /* 悬停时的背景颜色 */
}

.el-card {
  margin-top: 25px !important;
}


.header {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 14px 20px;
  background-color: #e5e7eb; /* 蓝色背景 */
  color: #ffffff; /* 白色文字 */
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.user-info {
  display: flex;
  align-items: center;
}

.user-dropdown {
  position: relative;
  display: flex;
  align-items: center;
}


h1, h2 {
  margin: 0;
  color: #333; /* 深色文字 */
}


.avatar {
  width: 45px;
  height: 45px;
  border-radius: 50%;
  margin-right: 10px;
  transition: transform 0.2s; /* 动画效果 */
}

.animated-avatar:hover {
  transform: rotate(360deg); /* 头像旋转 */
}

.animated-header {
  animation: fade-in 0.5s; /* 渐入动画 */
}


@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes bounce-in {
  from {
    transform: translateY(-30px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}


.announcement-header h2 {
  margin: 0;
  font-size: 18px;
  font-weight: bold;
}

.el-input {
  width: 300px;
}

.el-select {
  width: 300px;
}

.item {
  margin-top: 10px;
  margin-right: 40px;
}
</style>