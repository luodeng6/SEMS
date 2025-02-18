<template>
  <div class="content">
    <StudentMenu></StudentMenu>

    <main class="ml-64 flex-1 p-6">

      <el-tabs tab-position="left" style="height: 900px;">
        <el-tab-pane label="我的简历">
          <el-card class="box-card" shadow="hover">
            <el-descriptions title="用户信息">
              <el-descriptions-item label="用户名">kooriookami</el-descriptions-item>
              <el-descriptions-item label="手机号">18100000000</el-descriptions-item>
              <el-descriptions-item label="居住地">苏州市</el-descriptions-item>
              <el-descriptions-item label="备注">
                <el-tag size="small">学校</el-tag>
              </el-descriptions-item>
              <el-descriptions-item label="联系地址">江苏省苏州市吴中区吴中大道 1188 号</el-descriptions-item>
            </el-descriptions>
          </el-card>

          <el-card shadow="hover">
            <el-table :data="tableData" style="width: 100%" max-height="760" @row-dblclick="previewResume">
              <el-table-column prop="jldm" label="简历代码" width="150">
              </el-table-column>
              <el-table-column prop="xsid" label="学生ID" width="120">
              </el-table-column>
              <el-table-column prop="fbbz" label="发布标志" width="120">
              </el-table-column>
              <el-table-column prop="fbsj" label="发布时间" width="150">
              </el-table-column>
              <el-table-column prop="jlwb" label="简历文本" width="300">
              </el-table-column>
              <el-table-column prop="html" label="简历HTML内容" width="300">
              </el-table-column>
              <el-table-column prop="scxgtime" label="上次修改时间" width="150">
              </el-table-column>
              <el-table-column prop="jlfj" label="简历附件" width="200">
              </el-table-column>
            </el-table>
          </el-card>
        </el-tab-pane>
        <el-tab-pane label="新建简历">
          <ResumeEditor/>
        </el-tab-pane>
        <el-tab-pane label="简历模版">

        </el-tab-pane>
        <el-tab-pane label="AI简历">
          <JlAi></JlAi>
        </el-tab-pane>
      </el-tabs>

      <el-header>
      </el-header>


      <!--      <el-dialog :visible.sync="dialogVisible" title="编辑简历">
              <div id="editor"></div>
              <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="saveResume">保 存</el-button>
              </span>
            </el-dialog>-->
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
// 引入 WangEditor
import ResumeEditor from "@/components/student/ResumeEditor.vue";
import JlAi from "@/components/student/JlAi.vue";

export default {
  components: {
    JlAi,
    StudentMenu,
    ResumeEditor
  },
  name: "StudentJlView",
  data() {
    return {
      tableData: [
        {
          jldm: 'JL001', // 简历代码
          xsid: '1', // 学生ID
          fbbz: 1, // 发布标志
          fbsj: '2025-01-18', // 发布时间
          jlwb: '简历文本示例', // 简历文本
          html: '<p>简历HTML内容示例</p>', // 简历HTML内容
          scxgtime: '2025-01-18 12:00', // 上次修改时间
          jlfj: 'http://example.com/resume.pdf' // 简历附件
        },
        {
          jldm: 'JL001', // 简历代码
          xsid: '1', // 学生ID
          fbbz: 1, // 发布标志
          fbsj: '2025-01-18', // 发布时间
          jlwb: '简历文本示例', // 简历文本
          html: '<p>简历HTML内容示例</p>', // 简历HTML内容
          scxgtime: '2025-01-18 12:00', // 上次修改时间
          jlfj: 'http://example.com/resume.pdf' // 简历附件
        },
        {
          jldm: 'JL001', // 简历代码
          xsid: '1', // 学生ID
          fbbz: 1, // 发布标志
          fbsj: '2025-01-18', // 发布时间
          jlwb: '简历文本示例', // 简历文本
          html: '<p>简历HTML内容示例</p>', // 简历HTML内容
          scxgtime: '2025-01-18 12:00', // 上次修改时间
          jlfj: 'http://example.com/resume.pdf' // 简历附件
        },
        {
          jldm: 'JL001', // 简历代码
          xsid: '1', // 学生ID
          fbbz: 1, // 发布标志
          fbsj: '2025-01-18', // 发布时间
          jlwb: '简历文本示例', // 简历文本
          html: '<p>简历HTML内容示例</p>', // 简历HTML内容
          scxgtime: '2025-01-18 12:00', // 上次修改时间
          jlfj: 'http://example.com/resume.pdf' // 简历附件
        },
        {
          jldm: 'JL001', // 简历代码
          xsid: '1', // 学生ID
          fbbz: 1, // 发布标志
          fbsj: '2025-01-18', // 发布时间
          jlwb: '简历文本示例', // 简历文本
          html: '<p>简历HTML内容示例</p>', // 简历HTML内容
          scxgtime: '2025-01-18 12:00', // 上次修改时间
          jlfj: 'http://example.com/resume.pdf' // 简历附件
        }
        // 可以添加更多的简历数据...
      ],
      dialogVisible: false,
      currentResumeIndex: null,
      editor: null // WangEditor 实例
    }
  },
    methods: {
      deleteRow(index, rows) {
        rows.splice(index, 1);
      },
      addResume() {
        this.currentResumeIndex = null; // 新增简历时，清空当前索引
        this.dialogVisible = true;
        this.initEditor();
      },
      initEditor() {
        this.editor = new E('#editor');
        this.editor.create();
      },
      saveResume() {
        const content = this.editor.txt.html(); // 获取编辑器内容
        const currentDate = new Date().toISOString().split('T')[0]; // 获取当前日期
        if (this.currentResumeIndex !== null) {
          // 更新已有简历
          this.tableData[this.currentResumeIndex].html = content;
          this.tableData[this.currentResumeIndex].scxgtime = currentDate; // 更新修改时间
        } else {
          // 新增简历
          this.tableData.push({
            jldm: `JL${this.tableData.length + 1}`, // 简历代码
            xsid: '新用户ID', // 学生ID
            fbbz: 0, // 发布标志，初始为未发布
            fbsj: null, // 发布时间
            jlwb: '新简历文本', // 简历文本
            html: content, // 简历HTML内容
            scxgtime: currentDate, // 上次修改时间
            jlfj: null // 简历附件
          });
        }
        this.dialogVisible = false;
        this.editor.destroy(); // 清理编辑器
      },
      previewResume(row) {
        // 预览功能实现
        alert(`预览简历: ${row.jldm}\n内容: ${row.html}`);
      },
      exportToWord() {
        // 导出为 Word 文档的逻辑
        alert('导出为 Word 文档功能尚未实现');
      },
      exportToPDF() {
        // 导出为 PDF 文档的逻辑
        alert('导出为 PDF 文档功能尚未实现');
      }
    },
  mounted() {
    //   this.initEditor();
  }
}
</script>

<style scoped>


h1, h2 {
  text-align: center;
}


button {
  display: block;
  width: 100%;
  padding: 10px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #368d6a;
}




.navbar {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}

.content {
  font-family: 'Arial', sans-serif;
  background-color: #ffffff; /* 白色背景 */
  margin: 0;
  padding: 0;
}

.text {
  font-size: 14px;
}

.item {
  padding: 18px 0;
}


</style>