<template>
  <div class="content">
    <StudentMenu/>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold text-gray-800">简历管理</h1>
      </header>

      <el-tabs v-model="activeTab" type="card">
        <!-- 管理标签页 -->
        <el-tab-pane label="简历管理" name="manage">
          <!--  JLDM	简历代码
          XSID	学生ID，对应STUDENT表id
          FBBZ	发布标志，1发布0未发布(暂存)
          FBSJ	发布时间（可空）
          JLWB	简历文本
          HTML	简历HTML内容
          SCXGTIME	上次修改时间
          JLFJ	简历附件 文档url
          CJSJ	创建时间-->
          <el-table
              :data="resumes"
              border
              class="w-full"
              stripe
              @row-dblclick="previewResume"
          >
            <el-table-column label="简历代码" prop="JLDM" width="100"></el-table-column>
            <el-table-column label="学生姓名" prop="XSXM" width="150"></el-table-column>
            <el-table-column label="发布时间" prop="FBSJ" width="180">
              <template #default="{ row }">
                {{ row.FBSJ | dateFormat }}
              </template>
            </el-table-column>
            <el-table-column label="创建时间" prop="FBSJ" width="180">
              <template #default="{ row }">
                {{ row.CJSJ | dateFormat }}
              </template>
            </el-table-column>
            <el-table-column label="上次修改时间" prop="FBSJ" width="180">
              <template #default="{ row }">
                {{ row.SCXGTIME | dateFormat }}
              </template>
            </el-table-column>
            <el-table-column label="阅读次数" prop="YDCS" width="150"></el-table-column>
            <el-table-column label="状态" prop="FBBZ" width="150">
              <template #default="{ row }">
                <el-tag :type="row.FBBZ === 1 ? 'success' : 'info'">
                  {{ row.FBBZ === 1 ? '已发布' : '草稿' }}
                </el-tag>
              </template>
            </el-table-column>
            <!-- 附件上传在表格中完成 -->
            <el-table-column label="附件" width="200">
              <template #default="{ row }">
                <el-upload
                    :file-list="row.uploadList"
                    :limit="1"
                    :on-success="res => handleRowUploadSuccess(row, res)"
                    action="/api/upload"
                    auto-upload
                    class="upload-demo"
                    list-type="text"
                >
                  <el-button size="mini" type="primary">上传附件</el-button>
                </el-upload>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="260">
              <template #default="{ row }">
                <el-button size="mini" @click="editResume(row)">编辑</el-button>
                <el-button
                    :type="row.FBBZ === '1' ? 'danger' : 'success'"
                    size="mini"
                    @click="togglePublish(row)"
                >
                  {{ row.FBBZ === '1' ? '取消发布' : '发布' }}
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>

        <!-- 编辑标签页 -->
        <el-tab-pane label="简历编辑" name="edit">
          <div class="row">

            <div class="col-md-8">
              <el-card shadow="never">
                <el-form style="position: relative;right: 53px;"  ref="form" :model="form" :rules="rules" label-width="100px">
                  <el-form-item>
                    <div ref="editor" class="editor-container"></div>
                  </el-form-item>
                  <el-form-item class="mt-6">
                    <el-button type="primary" @click="submitForm">保存</el-button>
                    <el-button @click="resetForm">重置</el-button>
                  </el-form-item>
                </el-form>
              </el-card>
            </div>

            <div class="col-md-4">
              <el-card shadow="never">
                <div id="chat-container">
                  <form id="chat-form" onsubmit="return false;">
                    <label for="question"><strong>问题：</strong></label>
                    <textarea id="question" name="question" placeholder="在此输入您的问题…" rows="4"></textarea>
                    <button id="askBtn" type="button">提交问题</button>
                  </form>

                  <div id="response-container">
                    <label for="response"><strong>建议：</strong></label>
                    <textarea id="response" placeholder="智能回复会显示在这里…" readonly rows="20"></textarea>
                    <button id="copyBtn" type="button">复制回复</button>
                  </div>
                </div>
              </el-card>
            </div>

          </div>


        </el-tab-pane>
      </el-tabs>

      <!-- 简历预览对话框 -->
      <el-dialog :visible.sync="previewVisible" title="简历预览" width="50%">
        <div v-html="previewContent"></div>
        <span slot="footer" class="dialog-footer">
          <el-button @click="previewVisible = false">关闭</el-button>
        </span>
      </el-dialog>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import E from 'wangeditor';
import dayjs from 'dayjs';
import axios from 'axios';
import {EventBus} from "@/event-bus";

export default {
  name: 'StudentResume',
  components: {StudentMenu},
  filters: {
    dateFormat(val) {
      return val ? dayjs(val).format('YYYY-MM-DD HH:mm') : '--';
    }
  },
  data() {
    return {
      UserInfo: {
        id: '',
        name: '',
        role: '',
        username: '',
      },
      activeTab: 'manage',
      // 模拟后端数据，初始化几条简历记录
      resumes: [
        {
          JLDM: '001',
          JLMC: '简历样本1',
          FBSJ: new Date().toISOString(),
          FBBZ: '0',
          HTML: '<p>这是简历样本1的内容</p>',
          uploadList: []
        },
        {
          JLDM: '002',
          JLMC: '简历样本2',
          FBSJ: new Date().toISOString(),
          FBBZ: '1',
          HTML: '<p>这是简历样本2的内容</p>',
          uploadList: []
        }
      ],
      form: {
        JLDM: null,
        JLMC: '',
        HTML: ''
      },
      rules: {
        JLMC: [
          {required: true, message: '请输入简历名称', trigger: 'blur'}
        ]
      },
      editor: null,
      previewVisible: false,
      previewContent: ''
    };
  },
  mounted() {
    this.getLoginUserInfo();// 获取登录用户信息
    this.initEditor();
  },
  beforeDestroy() {
    if (this.editor) {
      this.editor.destroy();
      this.editor = null;
    }
  },
  methods: {
    async getLoginUserInfo() {
      try {
        this.loading = true;
        const response = await axios.get('/user/checkSession');
        if (!response.data.result) {
          this.handleAuthFailure(response.data.msg);
        } else {
          this.UserInfo = {
            name: response.data.name,
            role: response.data.role,
            username: response.data.username
          };
          this.getXsjlData();
        }
      } catch (error) {
        console.error('获取用户信息失败，网络错误！', error);
        this.handleAuthFailure();
      }
    },
    getXsjlData() {
      axios.get("/xsjlk/getXsjlDataAuto?YHM=" + this.UserInfo.username + "&JLDM=-1").then(response => {
        console.log(response.data);
        this.resumes = response.data.data;
      }).catch(error => {
        console.error('获取学生数据失败，网络错误！', error);
        $.confirm({
          title: '提示',
          content: '获取简历数据失败：' + error.message,
          type: 'red', // warning 样式
          buttons: {
            重试: {
              btnClass: 'btn-orange',
              action: () => {
                this.getXsjlData();
              }
            },
            取消: () => {
              this.$message('已取消操作');
            }
          }
        });
      });
    },
    initEditor() {
      this.editor = new E(this.$refs.editor);
      this.editor.config.height = 600
      // 基础配置
      this.editor.config.zIndex = 100
      this.editor.config.onchange = (html) => {
        this.form.HTML = html;
      };

      this.editor.config.lineHeights = ['1', '1.15', '1.6', '2', '2.5', '3']

      // 图片上传配置
      this.editor.config.uploadImgServer = '/dwzpggk/uploaddwzpggkimg'
      this.editor.config.uploadFileName = 'file'
      this.editor.config.uploadImgMaxSize = 100 * 1024 * 1024 // 100MB
      this.editor.config.uploadImgHooks = {
        customInsert: (insertImg, result) => {
          if (result.result) {
            insertImg(result.data)
          }
        }
      }

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


      this.editor.create();
    },
    // 模拟编辑操作：将行数据加载到编辑表单中
    editResume(row) {
      this.form = {...row};
      this.editor.txt.html(row.HTML);
      this.activeTab = 'edit';
    },
    // 模拟表格中上传附件成功后，将附件地址更新到当前行数据中
    handleRowUploadSuccess(row, res) {
      // 假设返回结果中包含 url 字段
      this.$set(row, 'JLFJ', res.url);
      // 更新 fileList 信息
      row.uploadList = [{name: '附件', url: res.url}];
      this.$message.success('附件上传成功');
    },
    // 保存编辑内容（模拟后端数据保存）
    submitForm() {
      this.$refs.form.validate(valid => {
        if (valid) {
          // 若JLDM存在，说明是编辑，否则为新增
          if (this.form.JLDM) {
            const index = this.resumes.findIndex(item => item.JLDM === this.form.JLDM);
            if (index !== -1) {
              // 更新最后修改时间
              this.form.FBSJ = new Date().toISOString();
              this.$set(this.resumes, index, {...this.form, uploadList: this.resumes[index].uploadList || []});
              this.$message.success('保存成功');
            }
          } else {
            // 新增一条记录
            this.form.JLDM = Date.now().toString();
            this.form.FBSJ = new Date().toISOString();
            this.form.FBBZ = '0';
            this.resumes.push({...this.form, uploadList: []});
            this.$message.success('新增成功');
          }
          this.activeTab = 'manage';
        }
      });
    },
    resetForm() {
      this.$refs.form.resetFields();
      this.editor.txt.clear();
    },
    handleAuthFailure() {
      EventBus.$emit('show-auth-popup');
      setTimeout(() => {
        this.$router.push({name: 'StudentLoginView'});
      }, 1000);
    },
    togglePublish(row) {
      row.FBBZ = row.FBBZ === '1' ? '0' : '1';
      this.$message.success('操作成功');
    },
    // 双击表格行时预览简历内容
    previewResume(row) {
      this.previewContent = row.HTML;
      this.previewVisible = true;
    }
  },
  computed: {
    studentId() {
      return this.$store.state.user.id;
    }
  }
};
</script>

<style scoped>
#chat-container {
  /*max-width: 600px;*/
  margin: 2px auto;
  padding: 15px;
  /* border: 1px solid #ccc;
   border-radius: 8px;*/
  font-family: sans-serif;
}

textarea {
  width: 100%;
  box-sizing: border-box;
  padding: 8px;
  margin: 5px 0 10px;
  border: 1px solid #aaa;
  border-radius: 4px;
  resize: vertical;
  font-size: 14px;
}

button {
  padding: 6px 12px;
  margin-right: 8px;
  border: none;
  border-radius: 4px;
  background-color: #007bff;
  color: #fff;
  cursor: pointer;
  font-size: 14px;
}

button:hover {
  background-color: #0056b3;
}


.editor-container {
  /*border: 1px solid #dcdfe6;*/
  border-radius: 4px;
  padding: 10px;
  /* 设置编辑器高度 */
  min-height: 300px;
}

.w-e-toolbar {
  /* border-bottom: 1px solid #dcdfe6 !important;*/
}

.w-e-text-container {
  height: 300px !important;
}

.form-container {
  padding: 2px;
  background: #ffffff;
  border-radius: 0px;
  /*  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, .1);*/
}
</style>
