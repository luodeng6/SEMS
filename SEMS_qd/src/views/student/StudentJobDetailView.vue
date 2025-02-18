<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>

    <main class="ml-64 flex-1 p-6">
      <div>
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/stu/index' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item :to="{ path: fromView.from }">{{fromView.fromTitle}}</el-breadcrumb-item>
          <el-breadcrumb-item>岗位详情</el-breadcrumb-item>
        </el-breadcrumb>

        <div class="mb-4 p-4 bg-gray-100 rounded-md">
          <h3 class="text-lg font-semibold">岗位介绍</h3>
          <p> {{ JobData.gwmc }} - {{ JobData.dwmc }}</p>
        </div>

        <div class="container-fluid">
          <div class="row">
            <div class="col-md-8 luodeng" style="">
              <el-collapse v-model="activeNames">
                <el-collapse-item name="1">
                  <template #title>
                    <span class="item-title">
                      <i class="bi bi-file-earmark-text me-2"></i> 岗位描述
                    </span>
                  </template>
                  <p class="text-gray-700"
                     v-html="JobData.gwms ? JobData.gwms.replace(/\n/g, '<br>') : '暂无岗位要求'"></p>
                </el-collapse-item>

                <el-collapse-item name="2">
                  <template #title>
                    <span class="item-title">
                      <i class="bi bi-file-earmark-person me-2"></i> 岗位要求
                    </span>
                  </template>
                  <p class="text-gray-700"
                     v-html="JobData.gwyq ? JobData.gwyq.replace(/\n/g, '<br>') : '暂无岗位要求'"></p>
                </el-collapse-item>

                <el-collapse-item name="3">
                  <template #title>
                    <span class="item-title">
                      <i class="bi bi-briefcase me-2"></i> 工作职责
                    </span>
                  </template>
                  <p class="text-gray-700"
                     v-html="JobData.gzzz ? JobData.gzzz.replace(/\n/g, '<br>') : '暂无岗位职责描述'"></p>
                </el-collapse-item>

                <el-collapse-item name="4">
                  <template #title>
                    <span class="item-title">
                      <i class="bi bi-calendar me-2"></i> 岗位发布时间
                    </span>
                  </template>
                  <p class="text-gray-700">
                    {{ JobData.fbsj ? new Date(JobData.fbsj).toLocaleDateString() : '暂无发布时间' }}
                  </p>
                </el-collapse-item>

                <el-collapse-item name="5">
                  <template #title>
                    <span class="item-title">
                      <i class="bi bi-info-circle me-2"></i> 投递说明
                    </span>
                  </template>
                  <p class="text-gray-700"
                     v-html="JobData.tdsm ? JobData.tdsm.replace(/\n/g, '<br>') : '暂无投递说明'"></p>
                </el-collapse-item>

                <el-collapse-item name="5">
                  <template #title>
                    <span class="item-title">
                      <i class="bi bi-info-circle me-2"></i> 就业环境
                    </span>
                  </template>
                  <p class="text-gray-700"
                     v-html="JobData.jyhjms ? JobData.jyhjms.replace(/\n/g, '<br>') : '暂无就业环境描述'"></p>
                  <!--图片展示秀：放图片每行3张-->
                  <div class="gallery">
                    <img v-for="item in JyhjkList" :key="item.id" @click="showImg(ServerIP()+item.imgurl)" :src="ServerIP()+item.imgurl" :alt="item.imgurl">
                  </div>
                  <!--图片展示秀：放图片每行3张-->

                </el-collapse-item>
              </el-collapse>
            </div>
            <!--            预览大图弹窗-->
            <el-dialog
                :visible.sync="YuLanDialogVisible"
                :title="JobData.gwmc + ' 就业环境预览大图'"
                append-to-body
                top="20px">
              <img height="70%" :src="dialogImageUrl" alt="预览大图"/>
            </el-dialog>
            <div class="col-md-4">
              <h3 class="text-lg font-semibold mb-3">
                <i class="bi bi-cash-stack me-2"></i> 薪资详情
              </h3>
              <table class="table table-bordered table-striped mb-4">
                <tbody>
                <tr>
                  <th scope="row">最低薪资</th>
                  <td>{{ JobData.zdxz }} 元/月</td>
                </tr>
                <tr>
                  <th scope="row">最高薪资</th>
                  <td>{{ JobData.zgxz }} 元/月</td>
                </tr>
                <tr>
                  <th scope="row">最低学历要求</th>
                  <td>{{ XLTTK.find(item => item.id === JobData.zdxlyq).xlmc }}</td>
                </tr>
                <tr>
                  <th scope="row">工作地点</th>
                  <td>{{ JobData.gzdd }}</td>
                </tr>
                <tr>
                  <th scope="row">工作省份</th>
                  <td>{{ SFDMK.find(item => item.sfdm === JobData.gzsf).sfmc }}</td>
                </tr>
                <tr>
                  <th scope="row">实习标志</th>
                  <td>{{ JobData.sxbz === 1 ? '实习岗位' : '正式岗位' }}</td>
                </tr>
                <tr>
                  <th scope="row">专业限制</th>
                  <td>{{ JobData.zyxz }}</td>
                </tr>
                <tr>
                  <th scope="row">投递次数</th>
                  <td>{{ JobData.tdcs }}</td>
                </tr>
                <tr>
                  <th scope="row">投递限制标志</th>
                  <td>{{ JobData.tdxzbz === 0 ? '无投递限制' : '有投递限制' }}</td>
                </tr>
                <tr v-if="JobData.tdxzcs!==-1">
                  <th scope="row">投递限制次数</th>
                  <td>{{ JobData.tdxzcs }}</td>
                </tr>
                </tbody>
              </table>

              <h3 class="text-lg font-semibold mb-3">
                <i class="bi bi-file-text me-2"></i> 岗位福利
              </h3>
              <!-- 这里可以添加岗位福利的内容 -->
              <el-tag v-for="it in GWXQFLLIST"  :key="it.id" style="margin: 2px" :type="getRandomType()">{{it.flmc }}</el-tag>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>

import axios from "axios";
import DwMenu from "@/components/student/Student_menu.vue";
import {ServerIP} from "@/SystemConfig";
import StudentMenu from "@/components/student/Student_menu.vue";
export default {
  name: 'DwJobDetailView',
  components: {StudentMenu, DwMenu},
  data() {
    return {
      // 类型
      FLTypeList:['success','warning','info','danger'],
      dialogImageUrl:null,
      YuLanDialogVisible: false,
      activeNames: ['1', '2', '4'], // 默认打开第一、第二和第四个手风琴项
      JobData: {
        "id": 23,
        "gwmc": "广西实施工程师 ",
        "gwms": "卫宁软件实施工程师负责医疗信息系统的实施、配置和优化，确保软件解决方案能够满足医疗机构的需求。该职位需要与客户、开发团队和其他相关方密切合作，以确保系统的顺利部署和有效运行",
        "gwyq": "学历要求：\r\n本科及以上学历，计算机科学、信息技术、医疗信息学等相关专业。\r\n工作经验：\r\n\r\n具有医疗软件实施或相关领域的工作经验者优先。\r\n熟悉医疗行业的相关法规和标准。\r\n技能要求：\r\n\r\n熟悉医疗信息系统（如电子病历、医院管理系统等）的实施和配置。\r\n具备良好的沟通能力和团队合作精神。\r\n具备项目管理能力，能够有效协调各方资源。\r\n技术能力：\r\n\r\n熟悉数据库管理（如SQL）和基本的编程知识（如Java、Python等）。\r\n了解网络和系统架构，能够进行基本的故障排除。",
        "fbsj": "2024-12-12T00:00:00.000+00:00",
        "tdsm": "请按照以下说明提交您的申请材料：\r\n1. 申请材料 请准备以下文件并一并提交： 个人简历：请确保简历中包含您的联系方式、教育背景、工作经历、技能和相关证书。 求职信：简要说明您对该职位的兴趣、相关经验以及您能为公司带来的价值。 相关证书（如有）：如项目管理专业人士（PMP）、医疗信息技术认证（CPHIMS）等。\r\n2. 投递方式 电子邮件投递：\r\n请将申请材料发送至以下邮箱：hr@yourcompany.com 邮件主题格式：医疗软件实施工程师申请 - 姓名 附件格式：请将简历和求职信以PDF格式附加在邮件中。 \r\n在线申请： 访问我们的网站：www.yourcompany.com/careers 找到医疗软件实施工程师职位，点击“申请”按钮，按照提示填写申请表并上传相关材料。 3. 申请截止日期 请在2025年2月28日之前提交您的申请。我们将尽快对所有申请进行审核，并与符合条件的候选人联系安排面试。\r\n4. 面试流程 初步筛选后，我们将通过电子邮件或电话与您联系，安排面试时间。 面试将包括技术面试和行为面试，旨在评估您的专业技能和团队合作能力。\r\n5. 联系方式 如有任何疑问，请随时联系： 人力资源部 电话：123-456-7890 邮箱：hr@yourcompany.com 感谢您对我们公司的兴趣，期待您的申请！",
        "zgxz": 90005,
        "zdxz": 5000,
        "zdxlyq": 6,
        "gzdd": "广西南宁",
        "gzsf": 21,
        "sxbz": 1,
        "zyxz": "信息管理与信息系统",
        "dwmc": "广西实施部",
        "dwdm": 13,
        "tdcs": 0,
        "tdxzbz": 1,
        "tdxzcs": 800,
        "qydm": 1,
        "zprs": 900,
        "jyhj": 1,
        "jyhjms": "工作地点：通常在医疗机构（如医院、诊所）或软件公司的办公室工作，可能需要到客户现场进行实施和培训。\r\n工作时间：一般为标准工作时间，但在项目实施期间可能需要加班或出差。\r\n团队合作：与项目经理、开发人员、客户支持团队和医疗机构的工作人员密切合作，形成跨职能团队。",
        "gzzz": "需求分析：\r\n\r\n1、与客户沟通，了解其业务需求和流程，进行需求收集和分析。\r\n撰写需求文档，确保所有需求得到准确记录。\r\n系统配置与实施：\r\n\r\n2、根据客户需求配置医疗软件系统，包括用户权限、数据输入和输出设置等。\r\n负责软件的安装、配置和调试，确保系统正常运行。\r\n培训与支持：\r\n\r\n3、为客户提供系统使用培训，确保用户能够熟练操作软件。\r\n提供技术支持，解决客户在使用过程中遇到的问题。\r\n项目管理：\r\n\r\n4、参与项目计划的制定，跟踪项目进度，确保按时交付。\r\n协调各方资源，确保项目顺利进行。\r\n系统优化与维护：\r\n\r\n5、定期评估系统性能，提出优化建议。\r\n负责系统的日常维护和更新，确保软件的安全性和稳定性。",
        "gwfl": "0"
      },
      DATADWDMK: [],// 单位数据
      SFDMK: [], // 省份数据
      XLTTK: [], // 学历数据
      gwflList: [], // 分类数据
      gwdm: null, // 岗位代码
      JyhjkList: [], // 就业环境图片数据
      GWXQFLLIST: [], // 岗位福利数据
      fromView:{
        from:null, // 来源链接
        fromTitle:null, // 来源标题
      }, // 跳转来源
    };
  },
  mounted() {

    console.log("获取页面参数：");
    // 获取页面参数：this.$router.push({path: '/dw/jobDetail', query: {id: this.currentJobSelectRow.id}})
    console.log(this.$route.query.id);
    console.log(this.$route.query.from);
    this.gwdm = this.$route.query.id;
    this.fromView.from=this.$route.query.from;
    this.fromView.fromTitle=this.$route.query.title;
    this.getJobData(this.$route.query.id);
    //获取省份数据
    this.GetAllSfdmk();
    // 获取学历信息
    this.getXueLiData();
    this.getJobImgList(this.gwdm);
    // 获取岗位福利数据
    this.getJobWelfareData(this.gwdm);
  },
  methods: {
    getRandomType() {
      // 从 FLTypeList 中随机选择一个类型
      const randomIndex = Math.floor(Math.random() * this.FLTypeList.length);
      return this.FLTypeList[randomIndex];
    },
    showImg(url){
      this.dialogImageUrl = url;
      this.YuLanDialogVisible = true;
    },
    ServerIP() {
      return ServerIP
    },
    // 获取就业环境图片
    getJobImgList(gwdm) {
      axios.get("/jyhjk/getJyhjkByGwdm?gwdm=" + gwdm).then(response => {
        if (response.data.result) {
          this.JyhjkList=response.data.data;
        }else{
          console.log("获取就业环境图片失败！");
          this.$message.error("获取就业环境图片失败！后台错误！");
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取数据失败：网络错误");
      });

    },
    // 根据岗位代码获取岗位数据
    getJobData(id) {
      axios.get("/dataGwdmk/getGwdmById?id=" + id).then((response) => {
        if (response.data.result) {
          //this.$message.success("获取数据成功！");
          //前端要显式显示：岗位名称、对应单位名称、实习标志、岗位启用状态
          this.JobData = response.data.data;
        } else {
          this.$message.error("获取数据失败：后台错误");
        }
      }).catch((error) => {
        this.$message.error("获取数据失败：网络错误");
        console.log(error);
      });
    },
    // 获取岗位 福利数据
    getJobWelfareData(id) {
      // 获取岗位对应的福利
      axios.get("/fl/getGwflByGWDM?gwdm=" + id).then((response) => {
        if (response.data.result) {
          console.log("获取岗位对应的福利成功:")
          this.GWXQFLLIST = response.data.data;
          console.log(this.GWXQFLLIST);
        } else {
          this.$message.error("获取岗位对应的福利失败！，后台错误")
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error("获取岗位对应的福利失败，网络错误")
      });

    },
    apply() {
      alert('申请成功，请等待HR联系您');
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
      console.log("传入的分类数据gwfl：");
      console.log(categoryId.gwfl);
      const category = this.gwflList.find(cat => cat.id === Number(categoryId.gwfl));
      console.log("找到的分类名称：");
      console.log(category);
      return category ? category.flmc : '未知分类'; // 如果找不到对应的分类，返回 '未知分类'
    },
  },
};
</script>

<style scoped>
.el-breadcrumb {
  font-size: 20px !important;
  line-height: 4 !important;
}




.el-dialog__body img{
  height: 520px !important;
}
.gallery {
  display: flex;
  flex-wrap: wrap; /* 允许换行 */
  justify-content: flex-start; /* 图片之间的间距 */
}

.gallery img {
  width: 20%; /* 每张图片占据30%的宽度 */
  margin-bottom: 10px; /* 图片底部的间距 */
  margin-right: 5px;
}


.luodeng p {
  font-size: 20px !important;
  line-height: 1.5;
}

.luodeng {
  max-height: 700px; /* 设置最大高度 */
  overflow-y: auto; /* 启用垂直滚动条 */
  border: 1px solid #e0e0e0; /* 可选：添加边框 */
  padding: 10px; /* 可选：添加内边距 */
}

.content {
  padding: 20px;
}

.table {
  width: 100%;
}

.text-gray-700 {
  color: #4a4a4a;
}

.item-title {
  font-size: 17px;
  font-weight: bold; /* 加粗 */
}

/* 设置表格行高 */
.table tr {
  height: 50px;
}

.p-6 {
  padding: 0 !important;
}
</style>