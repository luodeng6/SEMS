<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <div class="chat-wrapper">
        <!-- 左侧联系人列表 -->
        <div class="contact-list">
          <div
              v-for="(contact, index) in contacts"
              :key="index"
              :class="{ active: activeContact?.id === contact.id }"
              class="contact-item"
              @click="selectContact(contact)"
          >
            <div class="avatar">
              <img :src="contact.avatar" alt="用户头像" />
            </div>
            <div class="name">{{ contact.name }}</div>
          </div>
        </div>

        <!-- 右侧聊天区域 -->
        <div class="chat-area">
          <header class="chat-header">
            <h2>{{ activeContact ? activeContact.name : '请选择联系人' }}-{{selectHrData.GSMC}}-{{selectHrData.ZW}}</h2>
          </header>
          <div ref="chatBody" class="chat-body">
            <template v-if="activeContact">
              <div
                  v-for="(msg, index) in activeContact.messages"
                  :key="index"
                  :class="{
                  'chat-message--self': msg.sender === currentUser.username,
                  'chat-message--other': msg.sender !== currentUser.username
                }"
                  class="chat-message"
              >
                <div class="avatar">
                  <img
                      :src="msg.sender === currentUser.username
                      ? currentUser.avatar
                      : activeContact.avatar"
                      alt="头像"
                  />
                </div>
                <div class="message-bubble">
                  <p>{{ msg.content }}</p>
                  <span class="timestamp">{{ formatTime(msg.timestamp) }}</span>
                </div>
              </div>
            </template>
          </div>
          <div class="chat-footer">
            <input
                v-model="newMessage"
                placeholder="请输入消息..."
                type="text"
                @keyup.enter="sendMessage"
            />
            <button @click="sendMessage">发送</button>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";
import axios from "axios";
import { EventBus } from "@/event-bus";
import SockJS from 'sockjs-client';
import Stomp from 'webstomp-client';
import {NOWIP} from '@/NOWIP'
export default {
  name: 'StudentChat',
  components: { StudentMenu },
  data() {
    return {
      stompClient: null,
      currentUser: {
        id: '',
        username: '',
        name: '',
        roleCode: 4,
        avatar: 'https://i.pravatar.cc/150?img=3'
      },
      contacts: [],
      activeContact: null,
      selectHrData: null,
      newMessage: ""
    }
  },
  async created() {
    await this.initializeChat();
    this.connectWebSocket();
  },
  destroyed() {
    // 关闭WebSocket连接：作用是清除定时器，避免内存泄漏
    if (this.stompClient) {
      console.log('关闭WebSocket连接');
      this.stompClient.disconnect();
    }
  },
  methods: {
    // 初始化聊天系统
    async initializeChat() {
      try {
        await this.verifySession();
        await this.loadChatHistory();
        this.autoSelectContact();
      } catch (error) {
        this.handleError('聊天初始化失败', error);
      }
    },

    // 验证会话
    async verifySession() {
      try {
        const response = await axios.get('/user/checkSession');
        if (!response.data.result) {
          EventBus.$emit('show-auth-popup');
          this.redirectToLogin();
          return;
        }

        this.currentUser = {
          ...this.currentUser,
          ...response.data,
          username: response.data.username
        };

        const { data } = await axios.get(`/sstx/getUserInfo?yhm=${this.currentUser.username}&yhsfdm=4`);
        this.currentUser.avatar = data.data.YHZP;
      } catch (error) {
        this.handleError('会话验证失败', error);
        this.redirectToLogin();
      }
    },

    // 加载聊天记录
    async loadChatHistory() {
      try {
        const { data } = await axios.get(`/sstx/getDhjlList?yhm=${this.currentUser.username}&yhsfdm=4`);
        if (!data.result) throw new Error(data.msg);

        if(data.data.length === 0){
          $.alert({
            title: '❌ 提示',
            content: '⚠️ 暂无聊天记录，快去聊天吧！',
            type: 'red',
            icon: 'fa fa-bug',
            backgroundDismiss: true, // 点击空白关闭
            autoClose: '确认|5000',  // 5 秒后自动关闭
            buttons: {
              确认: {
                text: '我知道了',
                btnClass: 'btn-red',
                action:  ()=> {
                 // 跳转
                  this.$router.push({ name: 'StudentIndexView' });
                }
              }
            }
          });

        }

        const contactMap = new Map();
        for (const msg of data.data) {
          const isFromMe = msg.fromyhm === this.currentUser.username;
          const contactKey = isFromMe ? msg.toyhm : msg.fromyhm;

          if (!contactMap.has(contactKey)) {
            const roleCode = isFromMe ? msg.toyhsfdm : msg.fromyhsfdm;
            const info = await this.fetchUserInfo(contactKey, roleCode);

            contactMap.set(contactKey, {
              id: contactKey,
              name: info.YHXM,
              avatar: info.YHZP,
              roleCode,
              messages: []
            });
          }

          contactMap.get(contactKey).messages.push({
            sender: msg.fromyhm,
            content: msg.nr,
            timestamp: new Date(msg.sendtime)
          });
        }

        this.contacts = Array.from(contactMap.values());
      } catch (error) {
        this.handleError('加载聊天记录失败', error);
      }
    },

    // 连接WebSocket
    connectWebSocket() {
      const socket = new SockJS(`http://${NOWIP}:83/chat`);
      this.stompClient = Stomp.over(socket);

      this.stompClient.connect({}, () => {
        this.stompClient.subscribe('/topic/messages', message => {
          const msg = JSON.parse(message.body);
          if (msg.toyhm === this.currentUser.username && msg.toyhsfdm === this.currentUser.roleCode) {
            this.handleIncomingMessage(msg);
          }
        });
      });
    },

    // 处理接收消息
    async handleIncomingMessage(msg) {
      const existingContact = this.contacts.find(c => c.id === msg.fromyhm);

      if (existingContact) {
        existingContact.messages.push({
          sender: msg.fromyhm,
          content: msg.nr,
          timestamp: new Date(msg.sendtime)
        });

        if (this.activeContact?.id !== msg.fromyhm) {
          this.showNotification(existingContact.name, msg.nr);
        }
      } else {
        await this.createNewContact(msg);
      }

      this.scrollToBottom();
    },

    // 创建新联系人
    async createNewContact(msg) {
      try {
        const info = await this.fetchUserInfo(msg.fromyhm, msg.fromyhsfdm);
        const newContact = {
          id: msg.fromyhm,
          name: info.YHXM,
          avatar: info.YHZP,
          roleCode: msg.fromyhsfdm,
          messages: [{
            sender: msg.fromyhm,
            content: msg.nr,
            timestamp: new Date(msg.sendtime)
          }]
        };

        this.contacts.push(newContact);
        this.showNotification(newContact.name, msg.nr);
      } catch (error) {
        this.handleError('创建联系人失败', error);
      }
    },

    // 发送消息
    async sendMessage() {
      if (!this.activeContact || !this.newMessage.trim()) return;

      const newMsg = {
        fromyhm: this.currentUser.username,
        toyhm: this.activeContact.id,
        fromyhsfdm: 4,
        toyhsfdm: this.activeContact.roleCode,
        isqf: 0,
        nr: this.newMessage.trim(),
        sendtime: new Date().getTime()
      };

      // 本地立即显示
      this.activeContact.messages.push({
        sender: this.currentUser.username,
        content: newMsg.nr,
        timestamp: new Date()
      });

      this.newMessage = "";
      this.scrollToBottom();

      try {
        this.stompClient.send("/app/chat", JSON.stringify(newMsg));
      } catch (error) {
        this.handleError('消息发送失败', error);
        this.activeContact.messages.pop();
      }
    },

    // 获取用户信息
    async fetchUserInfo(username, roleCode) {
      const { data } = await axios.get(`/sstx/getUserInfo?yhm=${username}&yhsfdm=${roleCode}`);
      if (!data.result) throw new Error(data.msg);
      return data.data;
    },

    // 自动选择第一个联系人
    autoSelectContact() {
      if (this.contacts.length > 0) {
        this.selectContact(this.contacts[0]);
      }
    },

    // 选择联系人
    selectContact(contact) {
      this.activeContact = contact;
      this.loadHrInfo(contact.id, contact.roleCode);
      this.scrollToBottom();
    },

    // 加载HR信息
    async loadHrInfo(username, roleCode) {
      try {
        const info = await this.fetchUserInfo(username, roleCode);
        this.selectHrData = {
          GSMC: info.GSMC,
          ZW: info.ZW
        };
      } catch (error) {
        this.handleError('加载HR信息失败', error);
      }
    },

    // 滚动到底部
    scrollToBottom() {
      this.$nextTick(() => {
        const container = this.$refs.chatBody;
        if (container) {
          container.scrollTop = container.scrollHeight;
        }
      });
    },

    // 显示通知
    showNotification(title, message) {
      this.$notify.info({
        title: `${title} 发来新消息`,
        message,
        duration: 5000
      });
    },

    // 错误处理
    handleError(context, error) {
      console.error(`${context}:`, error);
      this.$message.error(`${context}: ${error.message}`);
    },

    // 时间格式化
    formatTime(timestamp) {
      return new Date(timestamp).toLocaleTimeString('zh-CN', {
        hour: '2-digit',
        minute: '2-digit'
      });
    },

    // 跳转登录
    redirectToLogin() {
      setTimeout(() => {
        this.$router.push({ name: 'StudentLoginView' });
      }, 1000);
    }
  }
};
</script>

<style scoped>
/* 保持原有样式不变 */
.chat-wrapper {
  display: flex;
  height: 100vh;
  border: 1px solid #ddd;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.p-6 {
  padding: 0 !important;
}

.contact-list {
  width: 200px;
  background: #f9f9f9;
  border-right: 1px solid #ddd;
  overflow-y: auto;
}

.contact-item {
  padding: 10px;
  display: flex;
  align-items: center;
  cursor: pointer;
  transition: background 0.3s;
}

.contact-item:hover {
  background: #efefef;
}

.contact-item.active {
  background: #e2e2e2;
}

.contact-item .avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  overflow: hidden;
  margin-right: 10px;
}

.contact-item .avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.contact-item .name {
  font-size: 16px;
  color: #333;
}

.chat-area {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.chat-header {
  padding: 10px 15px;
  background: #5e748b;
  color: #fff;
}

.chat-header h2 {
  margin: 0;
  font-size: 18px;
}

.chat-body {
  flex: 1;
  padding: 10px;
  overflow-y: auto;
  background: #f4f7f9;
}

.chat-message {
  display: flex;
  margin-bottom: 15px;
  align-items: flex-end;
}

.chat-message--self {
  flex-direction: row-reverse;
}

.chat-message .avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  overflow: hidden;
  margin: 0 10px;
}

.chat-message .avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.message-bubble {
  max-width: 70%;
  padding: 10px;
  border-radius: 8px;
  background: #e2e2e2;
  position: relative;
  word-wrap: break-word;
}

.chat-message--self .message-bubble {
  background: #dcf8c6;
}

.message-bubble p {
  margin: 0;
}

.timestamp {
  font-size: 10px;
  color: #999;
  position: absolute;
  bottom: -15px;
  right: 5px;
}

.chat-footer {
  display: flex;
  padding: 10px;
  border-top: 1px solid #ddd;
  background: #f9f9f9;
}

.chat-footer input[type="text"] {
  flex: 1;
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
  outline: none;
}

.chat-footer button {
  margin-left: 10px;
  padding: 8px 16px;
  background: #007bff;
  border: none;
  border-radius: 4px;
  color: #fff;
  cursor: pointer;
}

.chat-footer button:hover {
  background: #0056b3;
}
</style>