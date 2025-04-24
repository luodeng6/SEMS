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
                <span class="ml-2 text-xl font-bold text-white">单位信息管理</span>
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
                      :src="IMGURL"
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
      <el-card shadow="never" >
        <el-steps :space="700" :active="currentStep" v-show="currentStep !== 2" finish-status="success">
          <el-step title="1. 单位基本信息"></el-step>
          <el-step title="2. 单位/公司LOGO"></el-step>
          <el-step title="3. 公司简介"></el-step>
          <el-step title="4. 预览保存"></el-step>
        </el-steps>
        <el-form ref="form" :model="form" :rules="rules" label-width="120px">
          <div v-show="currentStep === 0" style="position: relative; left: 7%;  ">
            <!-- 单位基本信息 -->
            <el-form-item label="单位名称" prop="dwmc">
              <el-input v-model="form.dwmc" step="width:200px" placeholder="请输入单位名称"></el-input>
            </el-form-item>
            <el-form-item label="单位性质" prop="dwxzdm">
              <el-select v-model="form.dwxzdm" placeholder="请选择单位性质">
                <el-option
                    v-for="(item,index) in DWXZK"
                    :key="index"
                    :label="item.dwxzdm+'_'+item.dwxz"
                    :value="item.dwxzdm">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="单位规模" prop="DWGMDM">
              <el-select v-model="form.dwgmdm" placeholder="请选择单位规模" clearable filterable>
                <el-option v-for="(item,index) in DWGMK" :key="index" :label="item.gmdm+'_'+item.gmxq"
                           :value="item.gmdm">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="所属行业" prop="DWHYDM">
              <el-select v-model="form.dwhydm" placeholder="请选择所属行业" clearable filterable>
                <el-option v-for="(item,index) in DWHYDMK" :key="index" :label="item.hydm+'_'+item.hymc"
                           :value="item.hydm">
                </el-option>
              </el-select>
            </el-form-item>
            <!-- 公司信息 -->
            <el-form-item label="公司名称" prop="gsmc">
              <el-input v-model="form.gsmc"></el-input>
            </el-form-item>
            <el-form-item label="所在地区" prop="szdq">
              <el-input v-model="form.szdq"></el-input>
            </el-form-item>
          </div>
<!--          <el-form-item label="公司LOGO" >
            <el-upload
                class="avatar-uploader"
                action="/api/upload"
                :show-file-list="false"
                :on-success="handleLogoSuccess"
                :before-upload="beforeLogoUpload">
              <img v-if="form.logo" :src="form.logo" class="avatar">
              <i v-else class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </el-form-item>-->

          <el-form-item v-show="currentStep === 1"  label="公司LOGO" prop="logo">

              <el-upload
                  action="#"
                  class="avatar-uploader"
                  v-model="PhotoFile"
                  :show-file-list="false"
                  :before-upload="beforeAvatarUpload"
                  :on-change="handleAvatarChange">
                <img v-if="form.logo" :src="form.logo" class="w-20 h-20 rounded-full object-cover">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>

          </el-form-item>



          <el-form-item v-show="currentStep === 2" label="公司简介" prop="gsjjhtml">
            <div ref="editorElem" style="text-align:left"></div>
            <!-- 隐藏的真实表单字段用于验证 -->
            <el-input v-show="true" v-model="form.gsjjhtml"></el-input>
          </el-form-item>

          <el-form-item class="mt-6">
            <el-button type="default" @click="currentStep--" v-show="currentStep!== 0">上一步</el-button>
            <el-button type="danger" @click="currentStep++" v-show="currentStep !== 3">下一步</el-button>
            <el-button type="primary" v-show="currentStep === 3" @click="submitForm">保存修改</el-button>
          </el-form-item>
          <el-form-item>
          </el-form-item>
        </el-form>
      </el-card>
    </main>
  </div>
</template>

<script>
import E from 'wangeditor'
import DwMenu from "@/components/dw/Dw_menu.vue"
import axios from "axios";
import {EventBus} from "@/event-bus";

export default {
  name: 'DwDwXXGLView',
  components: {DwMenu},
  data() {
    return {
      PhotoFile:null,// logo的文件对象
      // 用户信息
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      currentStep: 0,//完成程度
      form: {
        gsjjhtml: '' // 确保初始化字段存在
      },
      SFDMK: [],// 省份
      XLTTK: [],// 学历
      DWXZK: [],// 单位性质
      DWGMK: [],// 单位规模
      DWHYDMK: [],// 所属行业
      editor: null,
      isEditorUpdating: false, // 新增：防止循环更新标志
      rules: {
        dwmc: [{required: true, message: '请输入单位名称', trigger: 'blur'}],
        gsmc: [{required: true, message: '请输入公司名称', trigger: 'blur'}],
        gsjjhtml: [{required: true, message: '请输入公司简介', trigger: 'change'}] // 修改触发方式
      },
      loading:null,
    }
  },
  watch: {
    // 新增：监听HTML内容变化实现双向绑定
    'form.gsjjhtml'(newVal) {
      if (this.isEditorUpdating) return
      this.updateEditorContent(newVal)
    }
  },
  mounted() {
    this.getLoginUserInfo()
    this.get_All_JCSJ()
  },
  beforeDestroy() {
    if (this.editor) {
      this.editor.destroy()
      this.editor = null
    }
  },
  methods: {
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
      this.form.logo = URL.createObjectURL(file.raw);// 设置预览图片
      this.PhotoFile = file.raw;
      console.log("用户切换了头像")
    },
    // 获取基础数据
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
    async getLoginUserInfo() {
      await axios.get('/user/checkSession').then(response => {
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          setTimeout(() => {
            this.$router.push({name: 'DwLoginView'});
          }, 1000);
        } else {
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.getDwYhmDyDw(this.UserInfo.username);
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      });
    },
    // 初始化编辑器（修改后）
    initEditor() {
      this.editor = new E(this.$refs.editorElem)

      // 基础配置
      this.editor.config.zIndex = 100
      this.editor.config.placeholder = '请输入公司简介...'

      // 配置双向同步
      this.editor.config.onchange = html => {
        this.isEditorUpdating = true
        this.$set(this.form, 'gsjjhtml', html)
        this.$set(this.form, 'gsjj', this.editor.txt.text())
        this.$nextTick(() => {
          this.isEditorUpdating = false
        })

        // 触发表单验证
        this.$refs.form.validateField('gsjjhtml')
      }

      // 图片上传配置
      this.editor.config.uploadImgServer = '/dw/uploadGsjjImg'
      this.editor.config.uploadFileName = 'file'
      this.editor.config.uploadImgMaxSize = 5 * 1024 * 1024 // 5MB
      this.editor.config.uploadImgHooks = {
        customInsert: (insertImg, result) => {
          if (result.result) {
            insertImg(result.data)
          }
        }
      }
      // 视频上传配置
      this.editor.config.uploadVideoServer = '/dw/uploadVideo'
      this.editor.config.uploadVideoName = 'videoFile'
      this.editor.config.uploadVideoMaxSize = 300 * 1024 * 1024 //  300MB
      this.editor.config.uploadVideoHooks = {
        before: (video) => {
          this.$message.info('视频上传中...')
          return true
        },
        success: (file, res) => {
          this.$message.success('视频上传成功')
        },
        fail: (file, err, res) => {
          this.$message.error(`视频上传失败: ${err.message || err}`)
        },
        error: (file, err, res) => {
          this.$message.error(`上传错误: ${err.message || err}`)
        },
        customInsert: (insertVideo, res) => {
          if (res.code === 200) {
            insertVideo(res.data)
          } else {
            this.$message.error(res.message || '视频插入失败')
          }
        }
      }
      // 配置行高
      this.editor.config.lineHeights = ['1', '1.15', '1.6', '2', '2.5', '3']

      // 菜单栏配置
      this.editor.config.menus = [
        'head',
        'bold',
        'fontSize',
        'fontName',
        'italic',
        'underline',
        'strikeThrough',
        'indent',
        'lineHeight',
        'foreColor',
        'backColor',
        'link',
        'list',
        'todo',
        'justify',
        'quote',
        'emoticon',
        'image',
        'video',
        'table',
        'code',
        'splitLine',
        'undo',
        'redo',
      ]

      // 支持视频格式
      this.editor.config.videoAccept = '.mp4,.avi,.mov,.wmv,.flv,.mkv'

      // 创建编辑器
      this.editor.create()

      // 初始化内容
      this.$nextTick(() => {
        if (this.form.gsjjhtml) {
          this.editor.txt.html(this.form.gsjjhtml)
        } else {
          this.editor.txt.html('<p>请输入公司简介...</p>')
        }
      })
    },

    // 更新编辑器内容（新增方法）
    updateEditorContent(html) {
      if (!this.editor || this.editor.txt.html() === html) return
      // 保存选区
      const selection = window.getSelection()
      const range = selection.rangeCount > 0 ? selection.getRangeAt(0) : null
      // 更新内容
      this.editor.txt.html(html)

      // 恢复选区
      if (range) {
        selection.removeAllRanges()
        selection.addRange(range)
      }
    },

    // 通过发布者用户名获取单位信息
    getDwYhmDyDw(yhm) {
      axios.get('/dw/getDwDataByDwUserName?dwUserName=' + yhm).then(response => {
        if (response.data.result) {
          this.form = response.data.data

          // 延迟初始化确保DOM渲染完成
          this.$nextTick(() => {
            this.initEditor()
          })
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
    submitForm() {
      this.$refs.form.validate(valid => {
        if (valid) {
          this. loading = this.$loading({
            lock: true,
            text: '提交中...',
            spinner: 'el-icon-loading',
          })

          if(this.PhotoFile!==null){
            // 上传LOGO
            let formData = new FormData();
            formData.append('file', this.PhotoFile);
            formData.append('dwdm', this.form.dwdm);
            axios.post('/dw/uploadDwLogo', formData).then(response => {
              if (response.data.result) {
                this.loading.close();
                this.loading = this.$loading({
                  lock: true,
                  text: '继续提交基础信息...',
                  spinner: 'el-icon-loading',
                })
              } else {
                this.$message.error("上传LOGO失败：server error");
              }
            }).catch(error => {
              console.log(error);
              this.$message.error("上传LOGO失败："+error.message);
            });
          }


          /*
            DWDM	单位代码  ，单位代码库
            DWMC	单位名称
            DWXZ	单位性质
            DWXZDM	单位性质代码，对应DWXZK 单位性质库
            DWGMDM	单位规模代码，对应DWGMK 单位规模库
            DWGM	单位规模，文本，存储
            DWHYDM	单位行业代码,对应DWHYDMK 单位行业代码库
            DWHY	单位行业
            GSMC	公司名称
            GSJJ	公司简介
            GSJJHTML	公司简介HTML
           -- QYDM	启用代码
            SZDQ	所在地区，不匹配其他表，即可以自由编辑
          --  LOGO	单位或公司的LOGO
          */
          let DwDataForm = new FormData();
          DwDataForm.append('dwdm', this.form.dwdm);// 单位代码
          DwDataForm.append('dwmc', this.form.dwmc); // 单位名称
          DwDataForm.append('dwxzdm', this.form.dwxzdm); // 单位性质代码
          DwDataForm.append('dwxz',this.DWXZK.find(item => item.dwxzdm === this.form.dwxzdm).dwxz)
          DwDataForm.append('dwgmdm', this.form.dwgmdm); // 单位规模代码
          DwDataForm.append('dwgm', this.DWGMK.find(item => item.gmdm === this.form.dwgmdm).gmxq); // 单位规模
          DwDataForm.append('dwhydm', this.form.dwhydm); // 单位行业代码
          DwDataForm.append('dwhy', this.DWHYDMK.find(item => item.hydm === this.form.dwhydm).hymc); // 单位行业
          DwDataForm.append('gsmc', this.form.gsmc); // 公司名称
          DwDataForm.append('gsjj', this.form.gsjj); // 公司简介
          DwDataForm.append('gsjjhtml', this.form.gsjjhtml); // 公司简介HTML
          DwDataForm.append('szdq', this.form.szdq); // 所在地区
          axios.post("/dw/updateDw", DwDataForm).then(response => {
            this.loading.close();
            if (response.data.result) {

              this.$message.success("修改成功！");
            } else {
              this.$message.error("修改失败："+response.data.msg);
            }
          }).catch(error => {
            this.loading.close();
            this.$message.error("修改失败："+error.message);
          });
          console.log(this.form)
          console.log(this.PhotoFile);
        }else{
         this.$message.error("请完善信息！");
        }
      })
    },
  }
}
</script>


<style>
.el-steps {
  position: relative;
  left: 9%;
  margin-bottom: 81px;
}
.p-6 {
  padding: 1.5rem 0;
}

.el-card__body, .el-main {
  padding: 40px 50px 50px  !important;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}

.avatar {
  width: 178px;
  height: 178px;
  display: block;
  object-fit: contain;
}

/* WangEditor 样式调整 */
.w-e-toolbar {
  border: 1px solid #DCDFE6 !important;
  border-bottom: none !important;
  background-color: #f8f9fa !important;
  padding: 5px 10px !important;
}

.w-e-text-container {
  border: 1px solid #DCDFE6 !important;
  border-top: none !important;
  min-height: 300px !important;
  z-index: 1 !important;
}

.w-e-menu {
  padding: 8px 10px !important;
}

.w-e-drop-panel {
  z-index: 9999 !important;
}

.w-e-text-container {
  height: 700px !important;
}
</style>