<!-- src/components/AuthPopup.vue -->
<template>
  <div v-if="visible" class="popup">
    <div class="popup-content">
      <h2>认证失败</h2>
      <p>您需要登录才能访问该页面。</p>
      <button @click="closePopup">关闭</button>
    </div>
  </div>
</template>

<script>
// 在 AuthPopup.vue 或类似的组件中
import { EventBus } from '@/event-bus';

export default {
  data() {
    return {
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

<style>
.popup {
  /* 弹窗样式 */
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 20px;
  background: white;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}
.popup-content {
  /* 弹窗内容样式 */
}
</style>
