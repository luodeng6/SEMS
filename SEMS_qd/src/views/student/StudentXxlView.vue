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
            <h2>{{ activeContact ? activeContact.name : '请选择联系人' }}</h2>
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
export default {
  name: 'StudentChat',
  components: { StudentMenu },
  data() {
    return {
      // 当前登录用户信息
      currentUser: {
        id: '',
        username: '',
        name: '',
        role: '',
        avatar: 'https://i.pravatar.cc/150?img=3'
      },
      // 联系人列表
      contacts: [],
      // 当前选中的联系人
      activeContact: null,
      // 新消息内容
      newMessage: ""
    }
  },
  async created() {
    await this.initializeChat();

    // 连接websocket:为啥要链接websocket呢？因为后端已经将消息推送到了websocket上，所以我们只需要订阅websocket就可以收到消息
    if (this.stompClient && this.stompClient.ws.readyState === WebSocket.OPEN) {
      console.log("WebSocket已连接!!!!");
    } else {
      console.log("WebSocket未连接，正在连接....");
      this.connectWebSocket();
    }

  },
  methods: {
    /**
     * 初始化聊天系统
     */
    async initializeChat() {
      try {
        await this.verifySession();
        await this.loadChatHistory();
      } catch (error) {
        console.error('聊天初始化失败:', error);
        this.$message.error('聊天初始化失败');
      }
    },
    connectWebSocket() {
      const socket = new SockJS('http://localhost:83/chat');
      this.stompClient = Stomp.over(socket);

      // 连接服务器
      this.stompClient.connect({}, frame => {
        // 订阅消息
        this.stompClient.subscribe('/topic/messages', message => {
          console.log("接收到了消息！！！：");
          /*console.log(JSON.parse(message.body));*/
          let  responseData = JSON.parse(message.body);
          console.log(responseData);
        });
        console.log("打印数据：");
        console.log(this.messages);
      });
    },
    /**
     * 验证用户会话
     */
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
        const studenInfoDataResponse = await axios.get(`/sstx/getUserInfo?yhm=${this.currentUser.username}&yhsfdm=4`);
        this.currentUser.avatar = studenInfoDataResponse.data.data.YHZP;
      } catch (error) {
        console.error('会话验证失败:', error);
        this.redirectToLogin();
      }
    },

    /**
     * 加载聊天记录和联系人
     */
    async loadChatHistory() {
      try {
        const response = await axios.get(
            `/sstx/getDhjlList?yhm=${this.currentUser.username}&yhsfdm=4`
        );

        if (!response.data.result) {
          throw new Error(response.data.msg);
        }

        await this.processContacts(response.data.data);
      } catch (error) {
        console.error('加载聊天记录失败:', error);
        this.$message.error('加载聊天记录失败');
      }
    },

    /**
     * 处理联系人数据
     * @param {Array} messages - 原始消息记录
     */
    async processContacts(messages) {
      const contactMap = new Map();

      for (const msg of messages) {
        const isFromMe = msg.fromyhm === this.currentUser.username;
        const contactUsername = isFromMe ? msg.toyhm : msg.fromyhm;
        const contactRoleCode = isFromMe ? msg.toyhsfdm : msg.fromyhsfdm;

        if (!contactMap.has(contactUsername)) {
          try {
            const contactInfo = await this.fetchContactInfo(
                contactUsername,
                contactRoleCode
            );

            contactMap.set(contactUsername, {
              id: contactUsername,
              name: contactInfo.ONEXM || '未知用户',
              avatar: contactInfo.YHZP || 'default-avatar.jpg',
              roleCode: contactRoleCode,
              messages: []
            });
          } catch (error) {
            console.error('联系人信息获取失败:', contactUsername, error);
            continue;
          }
        }
        console.log("msg：")
        console.log(msg);

        contactMap.get(contactUsername).messages.push({
          sender: msg.fromyhm,
          content: msg.nr,
          timestamp: new Date(msg.sendtime)
        });
      }

      this.contacts = Array.from(contactMap.values());
      this.autoSelectContact();
    },

    /**
     * 获取联系人详细信息
     * @param {string} username - 联系人用户名
     * @param {number} roleCode - 角色代码
     */
    async fetchContactInfo(username, roleCode) {
      try {
        const response = await axios.get(
            `/sstx/getUserInfo?yhm=${username}&yhsfdm=${roleCode}`
        );

        if (!response.data.result) {
          throw new Error(response.data.msg);
        }

        return {
          ONEXM: response.data.data.YHXM,
          YHZP: response.data.data.YHZP
        };
      } catch (error) {
        console.error('联系人信息获取失败:', error);
        return {
          ONEXM: `${username}（获取失败）`,
          YHZP: 'default-avatar.jpg'
        };
      }
    },

    /**
     * 自动选择第一个联系人
     */
    autoSelectContact() {
      if (this.contacts.length > 0) {
        console.log( this.contacts[0]);
        this.activeContact = this.contacts[0];
        this.$nextTick(this.scrollToBottom);
      }
    },

    /**
     * 选择联系人
     */
    selectContact(contact) {
      this.activeContact = contact;
      this.scrollToBottom();
    },

    /**
     * 发送消息
     */
    async sendMessage() {
      if (!this.activeContact || !this.newMessage.trim()) return;

      try {
        const newMsg = {
          sender: this.currentUser.username,
          content: this.newMessage.trim(),
          timestamp: new Date()
        };

      /*  await axios.post('/sstx/sendMessage', {
          fromyhm: this.currentUser.username,
          toyhm: this.activeContact.id,
          content: this.newMessage.trim(),
          yhsfdm: 4
        });*/

        this.activeContact.messages.push(newMsg);
        this.newMessage = "";
        this.scrollToBottom();
      } catch (error) {
        console.error('消息发送失败:', error);
        this.$message.error('消息发送失败');
      }
    },

    /**
     * 滚动到底部
     */
    scrollToBottom() {
      this.$nextTick(() => {
        const container = this.$refs.chatBody;
        if (container) {
          container.scrollTop = container.scrollHeight;
        }
      });
    },

    /**
     * 格式化时间显示
     */
    formatTime(timestamp) {
      return new Date(timestamp).toLocaleTimeString('zh-CN', {
        hour: '2-digit',
        minute: '2-digit'
      });
    },

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