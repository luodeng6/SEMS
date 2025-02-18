<template>
  <div class="content">
    <div>
      <DwMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-8">
        <h1 class="text-2xl font-semibold text-gray-800">
          <i class="el-icon-office-building mr-2"></i>就业信息系统 - 岗位发布
        </h1>
      </header>
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>
          <router-link to="/dw/index">首页</router-link>
        </el-breadcrumb-item>
        <el-breadcrumb-item>
          <router-link to="/dw/job">岗位管理</router-link>
        </el-breadcrumb-item>
        <el-breadcrumb-item>发布岗位</el-breadcrumb-item>
      </el-breadcrumb>

      <el-steps :active="currentStep">
        <el-step title="岗位基础数据编辑" icon="el-icon-edit"></el-step>
        <el-step title="岗位信息编辑" icon="el-icon-edit"></el-step>
        <el-step title="岗位就业环境图上传" icon="el-icon-upload"></el-step>
        <el-step title="预览岗位信息" icon="el-icon-picture"></el-step>
      </el-steps>

      <!-- 第1步： 岗位必填数据（基础数据）编辑 -->
      <el-form v-if="currentStep === 0" :model="form" ref="formRef" :rules="formRules" label-width="140px"
               class="bg-white p-8 rounded-lg shadow-md">
        <div class="grid grid-cols-2 gap-6 mb-6">
          <el-form-item label="岗位名称：" prop="gwmc" class="mb-0">
            <el-input v-model="form.gwmc" placeholder="请输入岗位名称" clearable
                      prefix-icon="el-icon-postcard"></el-input>
          </el-form-item>
          <el-form-item label="单位：" prop="dwdm" class="mb-0">
            <el-select v-model="DATADWDMK.dwdm" filterable placeholder="请选择单位" prefix-icon="el-icon-school">
              <el-option :label="`${DATADWDMK.dwdm}-${DATADWDMK.dwmc}`" :value="DATADWDMK.dwdm"/>
            </el-select>
          </el-form-item>
        </div>


        <div class="grid grid-cols-3 gap-6 mb-6">
          <el-form-item label="岗位分类：" prop="gwfl">
            <el-select v-model="form.gwfl" placeholder="请选择岗位类别" filterable clearable prefix-icon="el-icon-menu">
              <el-option v-for="item in gwflList" :key="item.id" :label="`${item.id}-${item.flmc}`" :value="item.id"/>
            </el-select>
          </el-form-item>

          <el-form-item label="发布时间：" prop="fbsj">
            <!--            <el-date-picker v-model="form.fbsj" type="date" placeholder="选择发布日期" value-format="yyyy-MM-dd"
                                        style="width: 100%"></el-date-picker>-->

            <el-date-picker
                v-model="form.fbsj"
                type="datetime"
                placeholder="选择发布日期"
                align="right"
                style="width: 100%"
                :picker-options="pickerOptions">
            </el-date-picker>

          </el-form-item>

          <el-form-item label="招聘人数：" prop="zprs">
            <el-input-number v-model="form.zprs" :min="1" :precision="0" controls-position="right" placeholder="请输入"
                             class="w-full"></el-input-number>
          </el-form-item>
        </div>
        <div class="grid grid-cols-3 gap-6 mb-6">
          <el-form-item label="最低薪资：" prop="zdxz">
            <el-input-number v-model="form.zdxz" :min="0" :precision="0" controls-position="right" placeholder="请输入"
                             class="w-full"></el-input-number>
          </el-form-item>

          <el-form-item label="最高薪资：" prop="zgxz">
            <el-input-number v-model="form.zgxz" :min="form.zdxz" :precision="0" controls-position="right"
                             placeholder="请输入" class="w-full"></el-input-number>
          </el-form-item>

          <el-form-item label="所在省份：" prop="gzsf">
            <el-select v-model="form.gzsf" placeholder="请选择省份" filterable clearable
                       prefix-icon="el-icon-map-location">
              <el-option v-for="item in SFDMK" :key="item.sfdm" :label="`${item.sfdm}-${item.sfmc}`"
                         :value="item.sfdm"/>
            </el-select>
          </el-form-item>
        </div>
        <div class="grid grid-cols-3 gap-6 mb-6">
          <el-form-item label="工作地点：" prop="gzdd">
            <el-input v-model="form.gzdd" placeholder="请输入详细工作地址" prefix-icon="el-icon-location"></el-input>
          </el-form-item>

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
        <div class="grid grid-cols-3 gap-6 mb-6">
          <el-form-item label="学历要求：" prop="zdxlyq">
            <el-select v-model="form.zdxlyq" placeholder="请选择最低学历" clearable prefix-icon="el-icon-notebook-2">
              <el-option v-for="item in XLTTK" :key="item.id" :label="`${item.id}-${item.xlmc}`" :value="item.id"/>
            </el-select>
          </el-form-item>

          <el-form-item label="专业限制">
            <el-input v-model="form.zyxz" placeholder="请输入专业限制"></el-input>
          </el-form-item>

          <el-form-item label="实习标志：" prop="sxbz">
            <el-select v-model="form.sxbz" placeholder="请选择实习标志" clearable prefix-icon="el-icon-briefcase">
              <el-option label="实习岗位" :value="1"/>
              <el-option label="正式岗位" :value="2"/>
            </el-select>
          </el-form-item>
        </div>
      </el-form>

      <!-- 第2步：   岗位就业信息数据编辑 -->
      <el-form v-if="currentStep === 1" :model="form" ref="formRef" label-width="140px"
               class="bg-white p-8 rounded-lg shadow-md">
        <el-form-item label="岗位描述：" prop="gwms">
          <el-input type="textarea" v-model="form.gwms" :rows="3" placeholder="请详细描述岗位职责和要求" show-word-limit
                    maxlength="500"></el-input>
        </el-form-item>
        <el-form-item label="工作职责">
          <el-input type="textarea" v-model="form.gzzz" placeholder="请输入工作职责"></el-input>
        </el-form-item>

        <el-form-item label="岗位要求">
          <el-input type="textarea" v-model="form.gwyq" placeholder="请输入岗位要求"></el-input>
        </el-form-item>

        <el-form-item label="投递说明">
          <el-input type="textarea" v-model="form.tdsm" placeholder="请输入投递说明"></el-input>
        </el-form-item>

        <el-form-item label="就业环境描述">
          <el-input type="textarea" v-model="form.jyhjms" placeholder="请输入就业环境描述"></el-input>
        </el-form-item>
      </el-form>
      <!-- 第3步：上传岗位就业环境图-->
      <div v-if="currentStep === 2">
        <el-select v-model="selectGWinfomationId" placeholder="请选择岗位信息" clearable filterable
                   prefix-icon="el-icon-briefcase">
          <el-option v-for="item in AllDATAGWDMK" :key="item.id" :label="`${item.id}-${item.gwmc}-${luodengTime(item.fbsj)}`"
                     :value="item.id"/>
        </el-select>
        <el-upload
            action="#"
            list-type="picture-card"
            :auto-upload="false"
            :on-change="handleFileChange"
            :file-list="fileList"
            :limit="9"
            multiple
            :before-upload="beforeUpload">
          <i class="el-icon-plus"></i>
          <div slot="file" slot-scope="{ file }">
            <img
                class="el-upload-list__item-thumbnail"
                :src="file.url"
                alt="预览图"/>
            <span class="el-upload-list__item-actions">
              <span
                  class="el-upload-list__item-preview"
                  @click="handlePreview(file)">
                <i class="el-icon-zoom-in"></i>
              </span>
              <span
                  class="el-upload-list__item-delete"
                  @click="handleRemove(file)">
                <i class="el-icon-delete"></i>
              </span>
            </span>
          </div>
        </el-upload>

        <el-dialog :visible.sync="dialogVisible" append-to-body>
          <img width="100%" :src="dialogImageUrl" alt="预览大图"/>
        </el-dialog>

        <el-button type="primary" @click="submitUpload">立即上传</el-button>
      </div>
      <!-- 第4步：预览岗位信息 -->
      <div v-if="currentStep === 3">
        <h2>预览岗位信息</h2>
        <pre>{{ form }}</pre>
      </div>


      <div class="flex justify-start mt-8">
        <el-button v-if="currentStep > 0" type="info" @click="prevStep">上一步</el-button>
        <el-button v-if="currentStep < 3" type="primary" @click="nextStep" :loading="submitting">下一步</el-button>
        <el-button v-if="currentStep === 3" type="primary" @click="endProcess" v-loading.fullscreen.lock="fullscreenLoading">结束流程
        </el-button>
        <el-button type="info" @click="handleCancel" class="w-32">取消</el-button>
        <el-button type="danger" @click="copydata" class="w-32">复制数据</el-button>
        <el-button v-if="currentStep === 3" type="primary" @click="printSelectedJob">打印所选岗位
        </el-button>
      </div>
    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";
import axios from 'axios';

export default {
  name: 'DwAddJobView',
  components: {DwMenu},
  data() {
    return {
      fullscreenLoading: false,
      pickerOptions: {
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
      // 岗位分类列表
      currentStep: 0, // 当前步骤
      submitting: false,
      selectGWinfomationId: null,
      form: {
        gwmc: '', // 岗位名称1
        dwmc: '', // 单位名称1
        gwms: '', // 岗位描述1
        gwyq: '', // 岗位要求1
        fbsj: '', // 发布时间1
        tdsm: '', // 投递说明
        zdxz: null, // 最低薪资1
        zgxz: null, // 最高薪资1
        zdxlyq: '', // 最低学历要求1
        gzdd: '', // 工作地点1
        gzsf: '', // 所在省份1
        sxbz: 2, // 默认正式岗位1
        zyxz: '', // 专业限制1
        tdcs: '', // 投递次数
        tdxzbz: 0, // 默认无投递限制
        tdxzcs: '', // 投递限制次数
        qydm: 1, // 启用代码
        zprs: '', // 招聘人数
        jyhjms: '', // 就业环境描述
        jyhj: '', // 就业环境(图)
        gwfl: null, // 岗位分类
      },
      fileList: [],        // 文件列表
      dialogVisible: false, // 预览对话框状态
      dialogImageUrl: "",   // 预览图片地址
      formRules: {
        gwmc: [
          {required: true, message: '请输入岗位名称', trigger: 'blur'},
          {min: 2, max: 50, message: '长度在2到50个字符', trigger: 'blur'}
        ],
        dwmc: [{required: true, message: '请选择单位名称', trigger: 'change'}],
        gwfl: [{required: true, message: '请选择岗位分类', trigger: 'change'}],
        fbsj: [{required: true, message: '请选择发布日期', trigger: 'change'}],
        zdxz: [{required: true, message: '请输入最低薪资', trigger: 'blur'}],
        zgxz: [{required: true, message: '请输入最高薪资', trigger: 'blur'}],
        zprs: [{required: true, message: '请输入招聘人数', trigger: 'blur'}],
        gzdd: [{required: true, message: '请输入工作地点', trigger: 'blur'}],
        gzsf: [{required: true, message: '请选择所在省份', trigger: 'change'}],
        zdxlyq: [{required: true, message: '请选择学历要求', trigger: 'change'}],
        sxbz: [{required: true, message: '请选择岗位类型', trigger: 'change'}]
      },
      XLTTK: [], // 学历数据
      SFDMK: [], // 省份数据
      gwflList: [], // 岗位分类列表
      DATADWDMK: null, // 单位数据
      AllDATAGWDMK: null,
      // 登录用户信息
      loginUser: {
        username: null,// 用户名
        name: null,// 用户姓名
        YHSFDM: null,// 用户身份代码
      }
    }
  },
  async created() {
    await this.fetchInitData();
    this.getLoginUser();
    const userInfo = JSON.parse(localStorage.getItem('dwUser'));
    if (userInfo) {
      this.form.dwmc = userInfo.dwmc;
    }
  },
  methods: {
    endProcess(){
      this.fullscreenLoading = true;
      setTimeout(() => {
        this.fullscreenLoading = false;
        this.$router.push({path: '/dw/job'});
      }, 2000);
    },
    luodengTime(date) {
      const dateObj = new Date(date);
      const year = dateObj.getFullYear();
      const month = dateObj.getMonth() + 1; // getMonth() 返回的月份是从 0 开始的
      const day = dateObj.getDate();

      const formattedDate = `${year}-${month}-${day.toString().padStart(2, '0')}`;
      console.log(formattedDate); // 输出: 2025-2-01
      return formattedDate;
    },
    printSelectedJob() {

      console.log("所选岗位打印：")
      console.log(this.selectGWinfomationId);
    },
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
    // 获取当前发布者发布的岗位信息（所有）
    getAllGwByFbzyhm(fbzyhm) {
      this.loading = true;
      axios.get(`/dataGwdmk/getGwdmkDataByFbz?fbzyhm=${fbzyhm}`).then(res => {
        if (res.data.result) {
          this.AllDATAGWDMK = res.data.data;
        } else {
          this.$message.error("获取岗位数据失败！，后台错误");
        }
      }).catch(err => {
        this.$message.error("获取岗位数据失败！，网络错误");
      });
    },
    copydata() {
      this.form = {
        "id": 15,
        "gwmc": "实施工程师",
        "gwms": "卫宁软件实施工程师负责医疗信息系统的实施、配置和优化，确保软件解决方案能够满足医疗机构的需求。该职位需要与客户、开发团队和其他相关方密切合作，以确保系统的顺利部署和有效运行",
        "gwyq": "学历要求：\r\n本科及以上学历，计算机科学、信息技术、医疗信息学等相关专业。\r\n工作经验：\r\n\r\n具有医疗软件实施或相关领域的工作经验者优先。\r\n熟悉医疗行业的相关法规和标准。\r\n技能要求：\r\n\r\n熟悉医疗信息系统（如电子病历、医院管理系统等）的实施和配置。\r\n具备良好的沟通能力和团队合作精神。\r\n具备项目管理能力，能够有效协调各方资源。\r\n技术能力：\r\n\r\n熟悉数据库管理（如SQL）和基本的编程知识（如Java、Python等）。\r\n了解网络和系统架构，能够进行基本的故障排除。",
        "fbsj": "2024-12-11T16:00:00.000+00:00",
        "tdsm": "请按照以下说明提交您的申请材料：\r\n1. 申请材料 请准备以下文件并一并提交： 个人简历：请确保简历中包含您的联系方式、教育背景、工作经历、技能和相关证书。 求职信：简要说明您对该职位的兴趣、相关经验以及您能为公司带来的价值。 相关证书（如有）：如项目管理专业人士（PMP）、医疗信息技术认证（CPHIMS）等。\r\n2. 投递方式 电子邮件投递：\r\n请将申请材料发送至以下邮箱：hr@yourcompany.com 邮件主题格式：医疗软件实施工程师申请 - 姓名 附件格式：请将简历和求职信以PDF格式附加在邮件中。 \r\n在线申请： 访问我们的网站：www.yourcompany.com/careers 找到医疗软件实施工程师职位，点击“申请”按钮，按照提示填写申请表并上传相关材料。 3. 申请截止日期 请在2025年2月28日之前提交您的申请。我们将尽快对所有申请进行审核，并与符合条件的候选人联系安排面试。\r\n4. 面试流程 初步筛选后，我们将通过电子邮件或电话与您联系，安排面试时间。 面试将包括技术面试和行为面试，旨在评估您的专业技能和团队合作能力。\r\n5. 联系方式 如有任何疑问，请随时联系： 人力资源部 电话：123-456-7890 邮箱：hr@yourcompany.com 感谢您对我们公司的兴趣，期待您的申请！",
        "zgxz": 90005,
        "zdxz": 5000,
        "zdxlyq": 6,
        "gzdd": "广西河池",
        "gzsf": 21,
        "sxbz": 1,
        "zyxz": "信息管理与信息系统",
        "dwmc": "卫宁",
        "dwdm": 1,
        "tdcs": 11,
        "tdxzbz": 1,
        "tdxzcs": 800,
        "qydm": 1,
        "zprs": 9000,
        "jyhj": 1,
        "jyhjms": "工作地点：通常在医疗机构（如医院、诊所）或软件公司的办公室工作，可能需要到客户现场进行实施和培训。\r\n工作时间：一般为标准工作时间，但在项目实施期间可能需要加班或出差。\r\n团队合作：与项目经理、开发人员、客户支持团队和医疗机构的工作人员密切合作，形成跨职能团队。",
        "gzzz": "需求分析：\r\n\r\n1、与客户沟通，了解其业务需求和流程，进行需求收集和分析。\r\n撰写需求文档，确保所有需求得到准确记录。\r\n系统配置与实施：\r\n\r\n2、根据客户需求配置医疗软件系统，包括用户权限、数据输入和输出设置等。\r\n负责软件的安装、配置和调试，确保系统正常运行。\r\n培训与支持：\r\n\r\n3、为客户提供系统使用培训，确保用户能够熟练操作软件。\r\n提供技术支持，解决客户在使用过程中遇到的问题。\r\n项目管理：\r\n\r\n4、参与项目计划的制定，跟踪项目进度，确保按时交付。\r\n协调各方资源，确保项目顺利进行。\r\n系统优化与维护：\r\n\r\n5、定期评估系统性能，提出优化建议。\r\n负责系统的日常维护和更新，确保软件的安全性和稳定性。",
        "gwfl": "1",
        "fbz": "luo",
        "fbzyhsfdm": 3
      }
    },
    handleCancel() {
      this.$confirm('确认取消发布？这些信息将不会被保存！')
          .then(() => {
            this.$router.push('/dw/job');
          })
    },
    // 下一步按钮
    nextStep() {
      if (this.currentStep === 0) {
        this.$refs.formRef.validate((valid) => {
          if (valid) {
            this.currentStep++;
          } else {
            this.$message.error('请检查表单');
          }
        });
      } else if (this.currentStep === 1) {
        this.$confirm('确认提交所编辑的岗位信息？')
            .then(() => {
              this.handleSubmit();
              // 准备数据
              if (this.AllDATAGWDMK == null) {
                // 获取单位信息
                this.getAllGwByFbzyhm(this.loginUser.username);
              }
            }).catch(() => {
          // 准备数据
          if (this.AllDATAGWDMK == null) {
            // 获取单位信息
            this.getAllGwByFbzyhm(this.loginUser.username);
          }

          this.currentStep++;
        });

      } else if (this.currentStep === 2) {
        // 就业环境图片处的上传
        this.$confirm('确认上传所选的就业环境图片？').then(() => {
          this.submitUpload();
        }).catch(() => {
          this.currentStep++;
        });
      } else {
        this.currentStep++;
      }
    },
    prevStep() {
      this.currentStep--;
    },
    handleFileChange(file, fileList) {
      this.fileList = fileList;
    },
    beforeUpload(file) {
      const isImage = file.type.startsWith("image/");
      const isLt5M = file.size / 1024 / 1024 < 5;

      if (!isImage) {
        this.$message.error("只能上传图片文件！");
        return false;
      }
      if (!isLt5M) {
        this.$message.error("图片大小不能超过5MB！");
        return false;
      }
      return true;
    },
    handleRemove(file) {
      const index = this.fileList.indexOf(file);
      this.fileList.splice(index, 1);
    },
    // 预览图片
    handlePreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
    // 立即上传
   /* async submitUpload() {
      if (this.fileList.length === 0) {
        this.$message.warning("请先选择要上传的图片！");
        return;
      }

      const formData = new FormData();
      this.fileList.forEach(file => {
        formData.append("files", file.raw);  // 注意使用 raw 原始文件对象
      });

      try {
        // 替换为你的上传接口
        await axios.post("/api/upload", formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        });

        this.$message.success("上传成功！");
        this.fileList = [];  // 清空文件列表
      } catch (error) {
        this.$message.error("上传失败！");
        console.error("上传错误:", error);
      }
    },*/
    async handleSubmit() {
      try {
        this.submitting = true;
        // 创建 FormData 对象
        const PostForm = new FormData();
        /*
         1gwmc: 无123
         1dwmc: 单位名称
         1gwms: 无123
         gwfl: 1
         fbsj: 2025-02-02
         zdxz: 0
         zgxz: 12322
         zdxlyq: 1
         gzdd: 无123
         gzsf: 1
         sxbz: 1
         zprs: 1234
         gzzz: 无123
         gwyq: 无123*/
        PostForm.set("gwmc", this.form.gwmc);            // 岗位名称1
        PostForm.set("gwms", this.form.gwms);            // 岗位描述1
        PostForm.set("gwyq", this.form.gwyq);            // 岗位要求1
        PostForm.set("fbsj", this.timeStampToTime(this.form.fbsj));// 岗位发布时间1
        PostForm.set("tdsm", this.form.tdsm);            // 投递说明1
        PostForm.set("zgxz", this.form.zgxz);            // 最高薪资1
        PostForm.set("zdxz", this.form.zdxz);            // 最低薪资1
        PostForm.set("zdxlyq", this.form.zdxlyq);        // 最低学历要求1
        PostForm.set("gzdd", this.form.gzdd);            // 工作地点1
        PostForm.set("gzsf", this.form.gzsf);            // 工作省份，对应sfdmk 省份代码库1
        PostForm.set("sxbz", this.form.sxbz);            // 实习标志,1为实习岗位，2为正式岗位1
        PostForm.set("zyxz", this.form.zyxz);            // 专业限制1
        PostForm.set("dwmc", this.DATADWDMK.dwmc);       // 单位名称1
        PostForm.set("dwdm", this.DATADWDMK.dwdm);       // 单位代码1
        /* PostForm.set("tdcs", this.form.tdcs);  */          // 投递次数 默认0
        PostForm.set("tdxzbz", this.form.tdxzbz);        // 投递限制标志，默认0    1
        PostForm.set("tdxzcs", this.form.tdxzbz === 0 ? -1 : parseInt(this.form.tdxzcs));        // 投递限制次数，若tdxzbz为-1则设置为空1
        PostForm.set("qydm", this.form.qydm);            // 启用代码
        PostForm.set("zprs", this.form.zprs);            // 招聘人数
        PostForm.set("jyhj", this.form.jyhj);            // 就业环境(图)
        PostForm.set("jyhjms", this.form.jyhjms);        // 就业环境吗描述
        PostForm.set("gzzz", this.form.gzzz);            // 工作职责
        //console.log("岗位分类id:"+this.gwflList.find(item => item.flmc === this.form.gwfl).id)
        console.log("岗位分类名称:" + this.form.gwfl)
        PostForm.set("gwfl", this.form.gwfl);            // 岗位分类
        PostForm.set("fbz", this.loginUser.username);       //发布者用户名
        PostForm.set("fbzyhsfdm", this.loginUser.YHSFDM);        //发布者姓名
        const {data} = await axios.post('/dataGwdmk/addGangWei', PostForm);

        if (data.code === 200) {
          this.$message.success('岗位发布成功');
          this.currentStep++;
        } else {
          this.$message.error(data.msg || '提交失败');
        }
      } catch (error) {
        console.error(error);
        this.$message.error('提交过程中发生错误');
      } finally {
        this.submitting = false;
      }
    },
    async submitUpload() {
      if (this.fileList.length === 0) {
        this.$message.warning("请先选择要上传的图片！");
        return;
      }
      if (this.selectGWinfomationId===null){
        this.$message.warning("请先选择要上传的图片对应的岗位信息！");
        return;
      }

      const formData = new FormData();
      this.fileList.forEach(file => {
        formData.append("files", file.raw);  // 注意使用 raw 原始文件对象
        console.log(file.raw);
      });
      // 添加发布者信息
      formData.append("gwdm", this.selectGWinfomationId);
      try {
        // 替换为你的上传接口
        await axios.post("/jyhjk/uploadJyhjk", formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        });

        this.$message.success("上传成功！");
        this.currentStep++;// 跳转到下一步
        this.fileList = [];  // 清空文件列表
      } catch (error) {
        this.$message.error("上传失败！");
        console.error("上传错误:", error);
      }
    },
    // 获取初始化数据
    async fetchInitData() {
      try {
        const requests = [
          axios.get('/sfdmk/getAllSfdmks'),
          axios.get('/gwflk/getAllGwflList'),
          axios.get('/xlttk/getAllXlttkData')
        ];
        const [SFDMKDATA, GWFLKDATA, XLTTKDATA] = await Promise.all(requests);
        this.SFDMK = SFDMKDATA.data.data;
        this.gwflList = GWFLKDATA.data.data;
        this.XLTTK = XLTTKDATA.data.data;
      } catch (error) {
        this.$message.error('初始化数据加载失败');
      }
    },
    // 获取登录用户信息
    getLoginUser() {
      axios.get('/user/checkSession').then(response => {
        if (response.data.result) {
          this.loginUser.username = response.data.username;
          this.loginUser.YHSFDM = response.data.YHSFDM;
          this.loginUser.name = response.data.name;//
          // 登录的用户信息:
          console.log("登录的用户信息:")
          console.log(this.loginUser);
          this.getDwYhmDyDw(this.loginUser.username);
        } else {
          this.$message.error("当前用户未登录，请先登录！");
          this.$router.push('/dw/login');
        }
      }).catch(error => {
        console.log(error);
      });
    },
    // 通过发布者用户名获取单位信息
    getDwYhmDyDw(yhm) {
      axios.get('/dw/getDwDataByDwUserName?dwUserName=' + yhm).then(response => {
        if (response.data.result) {
          this.DATADWDMK = response.data.data;
        } else {
          this.$message.error("获取单位信息失败！");
          setTimeout(() => {
            this.$router.push('/dw/login');
          }, 3000);
        }
      }).catch(error => {
        console.log(error);
      });
    }
  }
}
</script>

<style scoped>
.el-breadcrumb {
  font-size: 14px;
  line-height: 1;
  margin-bottom: 20px !important;
}

.el-form-item__label {
  font-weight: 500;
}

.el-input__inner,
.el-textarea__inner {
  border-radius: 0.375rem; /* Tailwind CSS rounded-lg */
}

.dialog-footer {
  display: flex;
  justify-content: center;
  margin-top: 2rem;
}

.el-upload-list__item-thumbnail {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>