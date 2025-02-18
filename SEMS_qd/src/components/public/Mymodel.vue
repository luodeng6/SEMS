<!-- src/components/AuthPopup.vue -->
<template>
  <div v-if="visible" class="popup-overlay" @click="closePopup">
    <div class="popup" @click.stop> <!-- 阻止点击事件向上传递 -->
      <h2 class="popup-title">{{ title }}</h2>
      <p class="popup-message">{{ message }}</p>
      <button class="popup-button" @click="closePopup">关闭</button>
    </div>
  </div>
</template>

<script>
import { EventBus } from '@/event-bus';

export default {
  data() {
    return {
      title: '', // 弹窗标题
      message: '', // 弹窗消息
      visible: false, // 弹窗的可见性
    };
  },
  created() {
    // 监听 show-auth-popup 事件
    EventBus.$on('show-auth-popup', this.showPopup);
  },
  beforeDestroy() {
    // 在组件销毁前取消监听，避免内存泄漏
    EventBus.$off('show-auth-popup', this.showPopup);
  },
  methods: {
    showPopup() {
      this.visible = true; // 显示弹窗
    },
    closePopup() {
      this.visible = false; // 隐藏弹窗
    },
  },
};
</script>

<style scoped>
.popup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.7); /* 背景遮罩 */
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999; /* 确保弹窗位于顶部 */
  transition: opacity 0.3s ease; /* 渐变效果 */
}

.popup {
  background: #fff;
  border-radius: 8px; /* 圆角 */
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25); /* 阴影效果 */
  padding: 20px;
  max-width: 400px; /* 最大宽度 */
  width: 90%; /* 适应小屏幕 */
  text-align: center; /* 文本居中 */
  animation: fadeIn 0.3s; /* 弹入动画 */
}

.popup-title {
  margin: 0 0 10px;
  font-size: 1.5em; /* 标题字体大小 */
  font-weight: bold; /* 粗体 */
  color: #333; /* 标题颜色 */
}

.popup-message {
  margin-bottom: 20px;
  font-size: 1em; /* 消息字体大小 */
  color: #666; /* 消息颜色 */
}

.popup-button {
  background-color: #007bff; /* 蓝色按钮 */
  color: white; /* 字体颜色 */
  border: none;
  border-radius: 5px; /* 圆角 */
  padding: 10px 20px;
  cursor: pointer; /* 鼠标样式 */
  font-size: 1em; /* 按钮字体大小 */
  transition: background-color 0.3s; /* 背景色渐变 */
}

.popup-button:hover {
  background-color: #0056b3; /* 悬停状态 */
}

@keyframes fadeIn {
  from {
    opacity: 0; /* 开始时透明 */
  }
  to {
    opacity: 1; /* 结束时不透明 */
  }
}
</style>
