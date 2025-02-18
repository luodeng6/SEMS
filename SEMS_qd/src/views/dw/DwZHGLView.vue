<template>
  <div class="content">
    <div>
      <DwMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
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
                <span class="ml-2 text-xl font-bold text-white">账号管理</span>
              </div>

              <!-- 导航菜单 -->
              <nav class="hidden md:flex items-center space-x-6">
                <a href="#" class="text-gray-200 hover:text-white flex items-center transition-colors">
                  <i class="el-icon-s-home mr-1"></i>
                  首页
                </a>
                <a href="#" class="text-gray-200 hover:text-white flex items-center transition-colors">
                  <i class="el-icon-s-management mr-1"></i>
                  职位管理
                </a>
                <a href="#" class="text-gray-200 hover:text-white flex items-center transition-colors">
                  <i class="el-icon-user mr-1"></i>
                  候选人
                </a>
              </nav>
            </div>

            <!-- 右侧功能区域 -->
            <div class="flex items-center space-x-6">
              <!-- 通知按钮 -->
              <button class="text-gray-200 hover:text-white relative">
                <i class="el-icon-bell text-xl"></i>
                <span class="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full"></span>
              </button>

              <!-- 用户头像和下拉菜单 -->
              <el-dropdown trigger="click">
                <div class="flex items-center cursor-pointer">
                  <el-avatar
                      src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
                      class="border-2 border-white"
                  ></el-avatar>
                  <span class="ml-2 text-gray-200 hover:text-white">{{ UserInfo.name }}</span>
                  <i class="el-icon-arrow-down el-icon--right text-gray-200"></i>
                </div>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item>
                    <i class="el-icon-user mr-2"></i>个人中心
                  </el-dropdown-item>
                  <el-dropdown-item>
                    <i class="el-icon-setting mr-2"></i>账户设置
                  </el-dropdown-item>
                  <el-dropdown-item divided>
                    <i class="el-icon-switch-button mr-2"></i>退出登录
                  </el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>

              <!-- 发布按钮 -->
              <el-button
                  type="text"
                  icon="el-icon-plus">
                发布职位
              </el-button>
            </div>
          </div>
        </div>
      </header>

      <el-form
          ref="form"
          :model="form"
          label-width="120px"
          class="p-6 bg-white rounded-lg shadow"
          :rules="rules">
        <!-- 第一行 -->
        <div class="flex gap-6">
          <!-- 左列

          {
              "ID": 1000,
              "DYDW": 1,
              "YHM": "luo",
              "MM": "123",
              "TYBZ": 0,
              "YHXM": "罗邓卫宁招聘",
              "SEX": "男",
              "ZW": "人事专员",
              "SSDW": 1,
              "RZBZ": 1,
              "GWFBSL": 4,
              "DWDM": 1,
              "DWMC": "卫宁",
              "DWXZ": "机关",
              "DWXZDM": 1,
              "DWGMDM": 14,
              "DWGM": "10000人以上",
              "DWHYDM": 20,
              "DWHY": "国际组织",
              "GSMC": "卫宁健康科技集团有限公司",
              "GSJJ": "卫宁",
              "GSJJHTML": "",
              "QYDM": 1,
              "SZDQ": "上海市浦东区"
            }
             rules: {
                MM: [
                  {required: true, message: '请输入密码', trigger: 'blur'},
                  {min: 6, message: '密码长度不能小于6位', trigger: 'blur'}
                ],
                YHXM: {required: true, message: '请输入姓名', trigger: 'blur'},
                SSDW: {required: true, message: '请选择所属单位', trigger: 'change'},
                GSMC: {required: true, message: '请输入公司名称', trigger: 'blur'}
              },
          -->
          <div class="flex-1">
            <el-form-item label="用户名" prop="YHM">
              <el-input v-model="form.YHM" disabled></el-input>
            </el-form-item>

            <el-form-item label="密码" prop="MM">
              <el-input v-model="form.MM" show-password></el-input>
            </el-form-item>

            <el-form-item label="姓名" prop="YHXM">
              <el-input v-model="form.YHXM"></el-input>
            </el-form-item>

            <el-form-item label="所属单位" prop="DWDM">
              <el-select v-model="form.DWDM" class="w-full">
                <el-option label="请选择单位" value=""></el-option>
                <el-option v-for="item in DATADWDMK" :key="item.dwdm" :label="item.dwdm + '-' + item.dwmc+'-'+item.gsmc" :value="item.dwdm"></el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="所在地区" prop="SZDQ">
              <el-input v-model="form.SZDQ"></el-input>
            </el-form-item>

            <el-form-item label="性别" prop="SEX">
              <el-radio-group v-model="form.SEX">
                <el-radio label="男">男</el-radio>
                <el-radio label="女">女</el-radio>
              </el-radio-group>
            </el-form-item>
            <!-- 头像上传 -->
            <el-form-item label="用户头像">
              <div class="flex items-center gap-4">
                <el-upload
                    action="#"
                    v-model="PhotoFile"
                    :show-file-list="false"
                    :before-upload="beforeAvatarUpload"
                    :on-change="handleAvatarChange">
                  <el-button size="small" >选择图片</el-button>
                </el-upload>
                <img v-if="imageUrl" :src="imageUrl" class="w-20 h-20 rounded-full object-cover">
              </div>
            </el-form-item>
          </div>

          <!-- 右列 -->
          <div class="flex-1">
            <el-form-item label="公司名称" prop="GSMC">
              <el-input v-model="form.GSMC"></el-input>
            </el-form-item>

            <el-form-item label="职位" prop="ZW">
              <el-input v-model="form.ZW"></el-input>
            </el-form-item>

            <el-form-item label="认证状态" prop="RZBZ">
              <el-tag :type="form.RZBZ ? 'success' : 'danger'">
                {{ form.RZBZ ? '已认证' : '未认证' }}
              </el-tag>
            </el-form-item>

            <el-form-item label="公司简介" prop="GSJJ">
              <el-input
                  type="textarea"
                  :rows="getRows(form.GSJJ)"
                  v-model="form.GSJJ"
                  resize="none"
              ></el-input>
            </el-form-item>
          </div>
        </div>

        <!-- 提交按钮 -->
        <el-form-item class="mt-6">
          <el-button type="primary" @click="submitForm">保存修改</el-button>
        </el-form-item>
      </el-form>
    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";
import axios from "axios";
import {EventBus} from "@/event-bus";

export default {
  name: 'DwZhglView',
  components: {DwMenu},
  mounted() {
    this.getLoginUserInfo(); // 获取登录用户信息
    this.getQyDwdmData();// 获取单位数据
  },
  data() {
    return {
      PhotoFile: null,// 头像文件
      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      form: null,
      imageUrl: '',
      rules: {
        MM: [
          {required: true, message: '请输入密码', trigger: 'blur'},
          {min: 3, message: '密码长度不能小于6位', trigger: 'blur'}
        ],
        SZDQ: {required: true, message: '请输入所在地区', trigger: 'blur'},
        YHXM: {required: true, message: '请输入姓名', trigger: 'blur'},
        SSDW: {required: true, message: '请选择所属单位', trigger: 'change'},
        GSMC: {required: true, message: '请输入公司名称', trigger: 'blur'}
      },
      DATADWDMK: null,// 所有启用的单位
    };
  },
  methods: {
    getRows(GSJJ) {
      // 用case语句获取行数
      switch (true) {
        case GSJJ.length > 100:
          return 12; // 如果数组长度大于 100，返回 20
        case GSJJ.length > 50:
          return 10; // 如果数组长度大于 50，返回 10
        default:
          return 5; // 当数组长度小于等于 50，我们返回 5
      }
    },
    // 获取单位数据：启用的单位
    getQyDwdmData() {
      axios.get('dw/getDwByQydm?qydm=1').then((response) => {
        if (response.data.result) {
          this.DATADWDMK = response.data.data;
          console.log(this.DATADWDMK);
        } else {
          this.$message.error("获取数据失败：" + response.data.msg);
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取数据失败：" + error.message);
      });
    },
    // 获取单位用户管理数据
    loadData(yhm) {
      axios.get(`/dwyhk/getDwyhkAndDwDataAndPostCountByYhm?yhm=${yhm}`).then(res => {
        if (res.data.result) {
          this.form = res.data.data;
          console.log(this.form);
        } else if (res.data.code === 504) {
          this.$message.error("数据冗余，系统错误，请联系管理员:" + res.data.msg);
        } else {
          this.$message.error("获取数据失败：" + res.data.msg);
        }
      }).catch(err => {
        console.log(err);
        this.$message.error("获取数据失败：" + err.message);
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
          this.loadData(this.UserInfo.username);
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      });
    },
    submitForm() {
      this.$refs.form.validate(valid => {
        if (valid) {
          // 打印修改后的数据
          console.log('修改后的数据:', {
            ...this.form,
            avatar: this.imageUrl // 这里实际应上传到服务器后返回的URL
          });

          console.log(this.PhotoFile)
          this.$message.success('修改成功');
        } else {
          this.$message.error('请完善表单信息');
          return false;
        }
      });
    },
    beforeAvatarUpload(file) {
      const isImage = file.type.startsWith('image/');
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isImage) {
        this.$message.error('只能上传图片文件');
      }
      if (!isLt2M) {
        this.$message.error('图片大小不能超过2MB');
      }
      return isImage && isLt2M;
    },
    handleAvatarChange(file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      this.PhotoFile = file.raw;
    },

  }
};
</script>

<style scoped>
.el-form-item__content {
  line-height: normal;
}
</style>