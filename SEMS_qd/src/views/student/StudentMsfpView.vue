<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <el-card shadow="never">
        <header class="flex justify-between items-center mb-6">
          <h1 class="text-2xl font-bold text-gray-800">面试复盘系统</h1>
          <el-button type="text" icon="el-icon-s-tools" @click="showHistory">查看历史复盘</el-button>
        </header>
      </el-card>


      <!-- 面试记录表单 -->
      <el-card class="mb-6" shadow="never">
        <div slot="header" class="clearfix">
          <span class="font-semibold">面试记录</span>
        </div>
        <el-form :model="interviewForm" label-width="100px" ref="interviewForm">
          <el-row :gutter="24">
            <el-col :span="8">
              <el-form-item label="面试场次" prop="company" required>
                <el-select v-model="SelectInterviewForm" @change="SelectInterviewChange" style="width: 100%">
                  <el-option v-for="(item, index) in interviewList" :label="item.MSDM+'-'+item.GWMC+'-'+item.GSMC+'-'+item.MSSJ" :key="index" :value="item"></el-option>
                </el-select>
              </el-form-item>
            </el-col>

            <el-col :span="8">
              <el-form-item label="公司名称" prop="company" required>
                <el-input v-model="interviewForm.company"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="面试岗位" prop="position" required>
                <el-input v-model="interviewForm.position"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="面试时间" prop="date" required>
                <el-date-picker
                    v-model="interviewForm.date"
                    type="datetime"
                    style="width: 100%"
                ></el-date-picker>
              </el-form-item>
            </el-col>
          </el-row>

          <el-row :gutter="24">
            <el-col :span="8">
              <el-form-item label="面试形式" prop="type">
                <el-select v-model="interviewForm.type" style="width: 100%">
                  <el-option label="现场面试" value="现场"></el-option>
                  <el-option label="视频面试" value="视频"></el-option>
                  <el-option label="电话面试" value="电话"></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="面试结果" prop="result">
                <el-select v-model="interviewForm.result" style="width: 100%">
                  <el-option label="未出结果" value="noResult"></el-option>
                  <el-option label="通过" value="success"></el-option>
                  <el-option label="待定" value="pending"></el-option>
                  <el-option label="未通过" value="fail"></el-option>
                </el-select>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label="难度评级" prop="difficulty">
                <el-rate
                    v-model="interviewForm.difficulty"
                    :max="5"
                    :colors="['#99A9BF', '#F7BA2A', '#FF9900']"
                ></el-rate>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
      </el-card>

      <!-- 面试问题复盘 -->
      <el-card shadow="never" class="mb-6">
        <div slot="header" class="clearfix">
          <span class="font-semibold">问题复盘</span>
          <el-button
              style="color: #b1dfbb;margin:0 20px; "
              class="float-right"
              type="text"
              color="warning"
              icon="el-icon-s-data"
              @click="AIAnswer"
          >
            智能改进回答
          </el-button>

          <el-button
              class="float-right"
              type="text"
              icon="el-icon-plus"
              @click="addQuestion"
          >
            添加问题
          </el-button>
        </div>

        <div class="flex flex-wrap -mx-3">
          <div
              v-for="(question, index) in interviewForm.questions"
              :key="index"
              class="w-1/2 px-3 mb-6"
          >
            <el-divider v-if="index > 0"></el-divider>
            <div class="flex justify-between items-start mb-2">
              <h3 class="font-medium">问题 {{ index + 1 }}</h3>
              <el-button
                  type="danger"
                  icon="el-icon-delete"
                  circle
                  size="mini"
                  @click="removeQuestion(index)"
              ></el-button>
            </div>

            <el-form :model="question" label-width="80px">
              <el-form-item label="问题描述" required>
                <el-input
                    type="textarea"
                    :rows="2"
                    v-model="question.description"
                    placeholder="记录面试官提出的问题"
                ></el-input>
              </el-form-item>

              <el-row :gutter="20">
                <el-col :span="12">
                  <el-form-item label="我的回答">
                    <el-input
                        type="textarea"
                        :rows="3"
                        v-model="question.answer"
                        placeholder="记录你的回答内容"
                    ></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="改进回答">
                    <el-input
                        type="textarea"
                        :rows="3"
                        v-model="question.improvement"
                        placeholder="写下优化后的回答"
                    ></el-input>
                  </el-form-item>
                </el-col>
              </el-row>

              <el-form-item label="知识点">
                <el-tag
                    v-for="(tag,index) in question.tags"
                    :key="index"
                    closable
                    class="mr-2"
                    @close="removeTag(index, tag)"
                >
                  {{ tag }}
                </el-tag>
                <el-input
                    class="input-new-tag"
                    v-if="question.tagInputVisible"
                    v-model="question.tagInputValue"
                    size="small"
                    @keyup.enter.native="addTag(index)"
                    @blur="addTag(index)"
                ></el-input>
                <el-button v-else size="small" @click="showTagInput(index)">
                  + 添加标签
                </el-button>
              </el-form-item>

              <el-form-item label="自我评分">
                <el-slider
                    v-model="question.score"
                    :step="10"
                    show-stops
                    :marks="{
            0: '0',
            50: '50',
            100: '100'
          }"
                ></el-slider>
              </el-form-item>
            </el-form>
          </div>
        </div>

      </el-card >

      <!-- 总结与附件 -->
      <el-card shadow="never">
        <div slot="header" class="clearfix">
          <span class="font-semibold">总结与资料</span>
        </div>

        <el-form label-width="100px">
          <el-form-item label="整体反思">
            <el-input
                type="textarea"
                :rows="4"
                v-model="interviewForm.summary"
                placeholder="总结本次面试的得失，记录需要改进的地方"
            ></el-input>
          </el-form-item>

          <el-form-item label="相关资料">
            <el-upload
                action="/api/upload"
                multiple
                :file-list="interviewForm.attachments"
                list-type="text"
            >
              <el-button size="small" type="primary">点击上传</el-button>
              <div slot="tip" class="el-upload__tip">
                可上传面试题目、代码题等资料（支持PDF/Word/图片格式，单个文件不超过10M）
              </div>
            </el-upload>
          </el-form-item>
        </el-form>

        <div class="text-center mt-6">
          <el-button type="primary" size="large" @click="submitForm">提交复盘</el-button>
        </div>
      </el-card>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import axios from "axios";

export default {
  name: 'InterviewReview',
  components: { StudentMenu },
  data() {
    return {
      SelectInterviewForm:null,//用户选择的面试场次
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      interviewList: [], // 面试列表
      interviewForm: {
        company: '',// 公司名称
        position: '',// 面试岗位
        date: '', // 面试时间
        type: '现场', // 面试形式
        result: 'pending', // 面试结果
        difficulty: 3, // 难度评级
        questions: [this.newQuestion()],// 问题列表
        summary: '', // 总结
        attachments: [] // 附件列表
      }
    }
  },
  mounted() {
    this.getLoginUserInfo();
    this.addQuestion();
  },
  methods: {
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
            this.$router.push({name: 'DwLoginView'});
          }, 1000);
        } else {
          console.log('登录成功-----！');
          this.UserInfo.name = response.data.name;
          this.UserInfo.role = response.data.role;
          this.UserInfo.username = response.data.username;
          this.UserInfo.id = response.data.id;
          console.log(this.UserInfo);
          // 获取待确认面试列表
          this.getInterviews();
          this.getStudentDataByUsername(this.UserInfo.username);
        }
      }).catch(error => {
        EventBus.$emit('show-auth-popup');
        console.error('获取用户信息失败,网络错误！', error);
        setTimeout(() => {
          this.$router.push({name: 'DwLoginView'});
        }, 1000);
      });
    },
    // 新方法获取面试列表
    getInterviews() {
      axios.get("/msdmk/getInterviewsMainIdea?Type=3&yhm=" + this.UserInfo.username).then(response => {
        if (response.data.result) {
          this.interviewList = response.data.data;
          console.log(this.interviewList);
        } else {
          this.$message.error("获取面试数据失败:" + response.data.msg);
        }
      }).catch(error => {
        console.error("获取面试列表失败！", error);
        this.$message.error("获取面试数据失败：" + error.message);
      });
    },

    newQuestion() {
      return {
        description: '',// 问题描述
        answer: '', // 我的回答
        improvement: '', // 改进回答
        tags: [], // 标签列表
        score: 50, // 自我评分
        tagInputVisible: false, // 标签输入框是否可见
        tagInputValue: '' // 标签输入框值
      }
    },
    // 选择面试哦场次改变事件--自动填充面试信息
    SelectInterviewChange(value){
      /*{
        "MSDM": 2,
          "XSDM": 1237,
          "DWDM": 1,
          "GWDM": 15,
          "MSSJ": "2025-03-03T16:00:00.000+00:00",
          "MSZT": 1,
          "MSJG": null,
          "FQZ": "luo",
          "FQZXM": "罗邓卫宁招聘",
          "FQZSFDM": 3,
          "FQSJ": "2025-03-03T15:09:07.347+00:00",
          "QYDM": 1,
          "QRDM": 0,
          "MSDD": "教学楼4楼",
          "GWMC": "实施工程师",
          "TDSM": ""
           "GSMC": "卫宁健康科技集团有限公司",
          "DWMC": "卫宁",
          "GZDD": "广西河池",
          "LOGO": "/img/upload/DwLogo/1740402865472_.png"
      }*/
      console.log(value);
      this.interviewForm.company = value.GSMC;
      this.interviewForm.position = value.GWMC;
      this.interviewForm.date = value.MSSJ;

     /* 100	录用
      101	不录用
      102	待定
      103	多轮面试*/
      switch (value.MSJG ) {
        case null:
          this.interviewForm.result = "noResult";
          break;
        case 102:
          this.interviewForm.result = "pending";
          break;
        case 100:
          this.interviewForm.result = "success";
          break;
        case 101:
          this.interviewForm.result= "fail";
          break;
        case 103:
          this.interviewForm.result = "pending";
          break;
      }
    },
    //
    addQuestion() {
      this.interviewForm.questions.push(this.newQuestion())
    },

    removeQuestion(index) {
      this.interviewForm.questions.splice(index, 1)
    },

    showTagInput(index) {
      const q = this.interviewForm.questions[index]
      q.tagInputVisible = true
      this.$nextTick(() => {
        this.$refs[`tagInput${index}`][0].focus()
      })
    },

    addTag(index) {
      const q = this.interviewForm.questions[index]
      if (q.tagInputValue) {
        q.tags.push(q.tagInputValue)
        q.tagInputValue = ''
      }
      q.tagInputVisible = false
    },

    removeTag(index, tag) {
      const q = this.interviewForm.questions[index]
      q.tags = q.tags.filter(t => t !== tag)
    },
    AIAnswer(){
      $.confirm({
        title: '智能改进回答',
        content: '智能改进回答功能暂未开放，敬请期待！',
        buttons: {
          cancel: {
            text: '取消',
            btnClass: 'el-button--primary'
          }
        }}
      )
    },
    submitForm() {
     /* {
          "company": "111",
          "position": "111",
          "date": "2025-03-07T16:20:40.000Z",
          "type": "现场",
          "result": "pending",
          "difficulty": 3,

                    "questions": [{
                    "description": "111",
                    "answer": "11",
                    "improvement": "11",
                    "tags": [
                      "Java"
                    ],
                    "score": 50,
                    "tagInputVisible": false,
                    "tagInputValue": ""
                  }]
      ,
          "summary": "",
          "attachments": []
      }*/
      this.$refs.interviewForm.validate(valid => {
        if (valid) {
          this.$confirm('确定提交面试复盘吗？', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消'
          }).then(() => {
            // 这里添加实际提交逻辑
            console.log('提交数据：', this.interviewForm)
            this.$message.success('复盘记录已保存')


            // 获取面试复盘基本信息：
            /*STUID	学生代码
            GWDM	岗位代码
            GWMC	岗位名称

            MSDM	面试代码
            NDPJ	难度评级
            MSXS	面试形式：现场面试、视频面试、电话面试
            ZTFS	整体反思
            MSSJ	面试时间
            FPSJ	复盘时间*/

            let MsfpFormData=new FormData();
            MsfpFormData.append("stuid",this.UserInfo.id);
            MsfpFormData.append("gwdm",this.SelectInterviewForm.GWDM);
            MsfpFormData.append("gwmc",this.SelectInterviewForm.GWMC);
            MsfpFormData.append("msdm",this.SelectInterviewForm.MSDM);
            MsfpFormData.append("ndpj",this.interviewForm.difficulty);
            MsfpFormData.append("msxs",this.interviewForm.type);
            MsfpFormData.append("ztfs",this.interviewForm.summary);
            MsfpFormData.append("mssj",new Date(this.interviewForm.date));
            axios.post("/msfpk/addMsfpk",MsfpFormData).then(response => {
              if (response.data.result) {
                console.log(response.data.data);
                this.$message.success("面试复盘基本信息保存成功！");

                /*ID
                WTMS	问题描述
                WDHD	我的回答
                GJHD	改进回答
                ZWPF	自我评分，-1表示没评分
                LRSJ	问题的录入时间*/

               /* {
                    "description": "111",
                    "answer": "11",
                    "improvement": "11",
                    "tags": [
                        "Java"
                      ],
                    "score": 50,
                    "tagInputVisible": false,
                    "tagInputValue": ""
                }*/

                let fpwtid;
                for (let i = 0; i < this.interviewForm.questions.length; i++){
                  // 获取面试复盘问题：
                  let MsfpQuestionData=new FormData();
                  MsfpQuestionData.append("wtms",this.interviewForm.questions[i].description);
                  MsfpQuestionData.append("wdhd",this.interviewForm.questions[i].answer);
                  MsfpQuestionData.append("gjhd",this.interviewForm.questions[i].improvement);
                  MsfpQuestionData.append("zwpf",this.interviewForm.questions[i].score);
                  MsfpQuestionData.append("fpdm",response.data.fpdm);


                    axios.post("/msfpk/addMsfpkQuestion",MsfpQuestionData).then(response => {
                      if (response.data.result) {
                        console.log(response.data.data);
                        fpwtid=response.data.data.id;// 获取问题字段的id值用于  标签的插入
                        this.$message.success("面试复盘问题:"+i+",保存成功！");

                          // 插入标签
                        for (let j = 0; j < this.interviewForm.questions[i].tags.length; j++){
                          let MsfpTagData=new FormData();
                          MsfpTagData.append("wtid",fpwtid);
                          MsfpTagData.append("bqnr",this.interviewForm.questions[i].tags[j]);
                          axios.post("/msfpk/addMsfpkTag",MsfpTagData).then(response => {
                            if (response.data.result) {
                              console.log(response.data.data);
                              this.$message.success("面试复盘问题:"+i+",标签:"+j+",保存成功！");
                            } else {
                              console.log("面试复盘问题:"+i+",标签:"+j+",保存失败！");
                            }
                          }).catch(error => {
                            console.error("面试复盘问题:"+i+",标签:"+j+",保存失败！", error);
                          });
                        }

                      } else {
                        console.log("面试复盘问题保存失败！");
                        this.$message.error("面试复盘问题:"+i+",保存失败！");
                      }
                    }).catch(error => {
                      console.error("面试复盘问题保存失败！", error);
                    });

                }

                // 插入标签

              } else {
                console.log("面试复盘基本信息保存失败！");
              }
            }).catch(error => {
              console.error("面试复盘基本信息保存失败！", error);
            });
          })
        }
      })
    },
    showHistory() {
      this.$router.push({name: 'StudentMsfpDetailView'})
    }
  }
}
</script>

<style scoped>
.el-divider--horizontal {
  margin: 20px 0;
}

.p-6 {
  padding: 0.5rem !important;
}
.mb-6 {
  margin-bottom: 0.5rem !important;
}

.input-new-tag {
  width: 100px;
  margin-left: 10px;
}

::v-deep .el-upload-list__item {
  transition: all 0.3s;
}
</style>