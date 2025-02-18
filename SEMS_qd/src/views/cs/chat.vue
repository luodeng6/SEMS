<template>
  <div>
    <el-select v-model="currentUser" placeholder="选择用户">
      <el-option label="用户A" value="userA"></el-option>
      <el-option label="用户B" value="userB"></el-option>
    </el-select>

    <div class="chat-box">
      <div v-for="(msg, index) in messages" :key="index">
        [{{ msg.sender }}]: {{ msg.content }}
      </div>
    </div>

    <el-input v-model="newMessage" @keyup.enter.native="sendMessage"></el-input>
    <el-button @click="sendMessage">发送</el-button>
  </div>
</template>

<script>
import SockJS from 'sockjs-client';
import Stomp from 'webstomp-client';

export default {
  data() {
    return {
      currentUser: 'userA',
      newMessage: '',
      messages: [],
      stompClient: null
    };
  },
  mounted() {
    this.connectWebSocket();
  },
  methods: {
    connectWebSocket() {
      const socket = new SockJS('http://localhost:8080/chat');
      this.stompClient = Stomp.over(socket);

      this.stompClient.connect({}, frame => {
        this.stompClient.subscribe('/topic/messages', message => {
          this.messages.push(JSON.parse(message.body));
        });
      });
    },
    sendMessage() {
      if (this.newMessage.trim()) {
        const chatMessage = {
          sender: this.currentUser,
          content: this.newMessage,
          timestamp: new Date()
        };

        this.stompClient.send("/app/chat", JSON.stringify(chatMessage));
        this.newMessage = '';
      }
    }
  }
};
</script>