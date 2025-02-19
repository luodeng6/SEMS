<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">学生信息管理</h1>
      </header>
      <el-container style="height: 600px; border: 1px solid #eee">
        <!-- 左侧联系人列表 -->
        <el-aside width="200px" style="background-color: #f5f5f5">
          <el-menu
              :default-active="currentContact"
              @select="handleContactSelect"
          >
            <el-menu-item
                v-for="contact in contacts"
                :key="contact.id"
                :index="contact.id"
            >
              <el-avatar :size="30" :src="contact.avatar" />
              <span style="margin-left: 10px">{{ contact.name }}</span>
            </el-menu-item>
          </el-menu>
        </el-aside>

        <!-- 右侧聊天区域 -->
        <el-main>
          <!-- 消息展示区域 -->
          <div class="message-container">
            <div
                v-for="message in currentMessages"
                :key="message.id"
                class="message-wrapper"
                :class="[message.sender === 'me' ? 'my-message' : 'other-message']"
            >
              <el-avatar :size="40" :src="message.avatar" />
              <div class="message-content">
                <div v-if="message.type === 'text'" class="text-message">
                  {{ message.content }}
                </div>
                <table
                    v-if="message.type === 'table'"
                    class="data-table"
                    border="1"
                >
                  <tr v-for="(row, index) in message.content" :key="index">
                    <td v-for="(cell, i) in row" :key="i">{{ cell }}</td>
                  </tr>
                </table>
                <div class="time-stamp">{{ message.time }}</div>
              </div>
            </div>
          </div>

          <!-- 消息输入区域 -->
          <div class="input-area">
            <el-button
                type="primary"
                size="mini"
                @click="showTableDialog = true"
            >
              发送表格
            </el-button>
            <el-input
                v-model="inputMessage"
                type="textarea"
                :rows="3"
                placeholder="输入消息"
                @keyup.enter.native="sendTextMessage"
            ></el-input>
            <el-button
                type="primary"
                style="margin-top: 10px"
                @click="sendTextMessage"
            >
              发送
            </el-button>
          </div>

          <!-- 表格输入对话框 -->
          <el-dialog title="输入表格数据" :visible.sync="showTableDialog">
            <el-form>
              <el-form-item label="行数">
                <el-input-number v-model="tableData.rows" :min="1" :max="10" />
              </el-form-item>
              <el-form-item label="列数">
                <el-input-number v-model="tableData.cols" :min="1" :max="10" />
              </el-form-item>
              <div v-for="(row, i) in tableData.data" :key="i">
                <el-input
                    v-for="(col, j) in row"
                    :key="j"
                    v-model="tableData.data[i][j]"
                    style="margin: 5px"
                />
              </div>
            </el-form>
            <span slot="footer">
          <el-button @click="showTableDialog = false">取消</el-button>
          <el-button type="primary" @click="sendTable">发送</el-button>
        </span>
          </el-dialog>
        </el-main>
      </el-container>

    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";

export default {
  name: 'StudentJobHelperView',
  components: { StudentMenu },
  data(){
    return {
    currentContact: '1',
    inputMessage: '',
    showTableDialog: false,
    tableData: {
      rows: 2,
      cols: 2,
      data: [[], []]
    },
    contacts: [
      { id: '1', name: '张三', avatar: 'https://example.com/avatar1.jpg' },
      { id: '2', name: '罗四', avatar: 'https://example.com/avatar2.jpg' },
      {id: '2', name: '李老师', avatar: 'https://example.com/avatar2.jpg'}
    ],
    messages: {
      '1': [
        {
          id: 1,
          type: 'text',
          content: '你好！',
          sender: 'me',
          avatar: 'https://example.com/my-avatar.jpg',
          time: '10:00'
        },
        {
          id: 2,
          type: 'table',
          content: [
            ['姓名', '年龄'],
            ['张三', '25']
          ],
          sender: 'other',
          avatar: 'https://example.com/avatar1.jpg',
          time: '10:05'
        }
      ],
      '2': [
        // 其他联系人消息...
      ]
    }}
  },
  computed: {
    currentMessages() {
      return this.messages[this.currentContact] || []
    }
  },
  methods: {
    handleContactSelect(contactId) {
      this.currentContact = contactId
    },
    sendTextMessage() {
      if (!this.inputMessage.trim()) return

      this.messages[this.currentContact].push({
        id: Date.now(),
        type: 'text',
        content: this.inputMessage,
        sender: 'me',
        avatar: 'https://example.com/my-avatar.jpg',
        time: new Date().toLocaleTimeString()
      })
      this.inputMessage = ''
    },
    sendTable() {
      const tableContent = []
      for (let i = 0; i < this.tableData.rows; i++) {
        tableContent.push(this.tableData.data[i].slice(0, this.tableData.cols))
      }

      this.messages[this.currentContact].push({
        id: Date.now(),
        type: 'table',
        content: tableContent,
        sender: 'me',
        avatar: 'https://example.com/my-avatar.jpg',
        time: new Date().toLocaleTimeString()
      })

      this.showTableDialog = false
      this.tableData = {
        rows: 2,
        cols: 2,
        data: [[], []]
      }
    }
  }
}
</script>

<style scoped>
.message-container {
  height: 400px;
  overflow-y: auto;
  padding: 20px;
}

.message-wrapper {
  display: flex;
  margin: 15px 0;
}

.my-message {
  flex-direction: row-reverse;
}

.message-content {
  max-width: 60%;
  margin: 0 10px;
}

.text-message {
  background: #e0f0ff;
  padding: 10px;
  border-radius: 5px;
}

.other-message .text-message {
  background: #f0f0f0;
}

.data-table {
  border-collapse: collapse;
  background: white;
}

.time-stamp {
  font-size: 12px;
  color: #999;
  margin-top: 5px;
}

.input-area {
  margin-top: 20px;
  border-top: 1px solid #eee;
  padding-top: 20px;
}
</style>