<template>
  <div class="chat-container">
    <div class="chat-messages" ref="messagesContainer">
      <div
          v-for="(message, index) in messages"
          :key="index"
          class="message-wrapper"
          :class="{ 'right': message.sender === 'me' }"
      >
        <div class="message-bubble">
          <div class="message-content">{{ message.content }}</div>
          <div class="message-time">{{ message.time }}</div>
        </div>
      </div>
    </div>

    <div class="input-area">
      <input
          v-model="newMessage"
          @keyup.enter="sendMessage"
          placeholder="输入消息..."
      />
      <button @click="sendMessage">发送</button>
    </div>
  </div>
</template>

<script setup>
import { ref, nextTick } from 'vue'

const messages = ref([
  {
    content: '你好呀！',
    sender: 'friend',
    time: '10:30'
  },
  {
    content: '最近怎么样？',
    sender: 'friend',
    time: '10:31'
  },
  {
    content: '还不错，你呢？',
    sender: 'me',
    time: '10:32'
  }
])

const newMessage = ref('')
const messagesContainer = ref(null)

const sendMessage = () => {
  if (!newMessage.value.trim()) return

  messages.value.push({
    content: newMessage.value,
    sender: 'me',
    time: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })
  })

  newMessage.value = ''
  scrollToBottom()
}

const scrollToBottom = () => {
  nextTick(() => {
    if (messagesContainer.value) {
      messagesContainer.value.scrollTop = messagesContainer.value.scrollHeight
    }
  })
}
</script>

<style scoped>
.chat-container {
  max-width: 1516px;
  height: 745px;
  margin: 20px auto;
/*  border: 1px solid #ccc;*/
  border-radius: 8px;
  overflow: hidden;
}

.chat-messages {
  height: 88%;
  padding: 20px;
  overflow-y: auto;
 /* background: #f5f5f5;*/
}

.message-wrapper {
  display: flex;
  margin-bottom: 15px;
}

.message-wrapper.right {
  justify-content: flex-end;
}

.message-bubble {
  max-width: 70%;
  padding: 12px 16px;
  border-radius: 12px;
  position: relative;
}

.message-wrapper:not(.right) .message-bubble {
 /* background: white;*/
  margin-right: 60px;
}

.message-wrapper.right .message-bubble {
  background: #95ec69;
  margin-left: 60px;
}

.message-content {
  font-size: 14px;
  line-height: 1.5;
}

.message-time {
  font-size: 12px;
  color: #666;
  margin-top: 4px;
  text-align: right;
}

.input-area {
  display: flex;
  padding: 15px;
  background: #fff;
  border-top: 1px solid #ddd;
}

.input-area input {
  flex: 1;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  margin-right: 10px;
}

.input-area button {
  padding: 10px 20px;
  background: #07c160;
  border: none;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}

.input-area button:hover {
  background: #06ae56;
}
</style>