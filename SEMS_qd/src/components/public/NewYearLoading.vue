<template>
  <div v-show="isLoading" class="new-year-loading">
    <!-- 灯笼容器 -->
    <div class="lanterns">
      <div
          v-for="(lantern, index) in lanternCount"
          :key="index"
          class="lantern"
          :style="{
          left: `${getRandomPosition()}%`,
          animationDelay: `${index * 0.5}s`
        }"
      ></div>
    </div>

    <!-- 加载文字 -->
    <div class="loading-text">
      <span class="text">加载中</span>
      <div class="dot-flashing"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'NewYearLoading',
  props: {
    isLoading: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      lanternCount: 8 // 灯笼数量
    }
  },
  methods: {
    getRandomPosition() {
      return Math.random() * 90 + 5 // 生成5%-95%之间的随机位置
    }
  },
  watch: {
    isLoading(newVal) {
      if (newVal) {
        document.body.style.overflow = 'hidden'
      } else {
        document.body.style.overflow = ''
      }
    }
  }
}
</script>

<style scoped>
.new-year-loading {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.7);
  z-index: 9999;
  display: flex;
  justify-content: center;
  align-items: center;
}

/* 灯笼动画 */
.lanterns {
  position: absolute;
  width: 100%;
  height: 100%;
  pointer-events: none;
}

.lantern {
  position: absolute;
  width: 30px;
  height: 40px;
  background: linear-gradient(45deg, #ff0000, #ff6b6b);
  border-radius: 15px;
  animation: fall 8s linear infinite;
}

.lantern::before {
  content: '';
  position: absolute;
  top: -5px;
  left: 12px;
  width: 6px;
  height: 10px;
  background: #ffd700;
}

@keyframes fall {
  0% {
    transform: translateY(-100vh) rotate(0deg);
    opacity: 1;
  }
  100% {
    transform: translateY(100vh) rotate(360deg);
    opacity: 0.3;
  }
}

/* 加载文字 */
.loading-text {
  position: relative;
  z-index: 1;
  color: #fff;
  font-size: 24px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.text {
  color: #ffd700;
  text-shadow: 0 0 10px #ff0000;
}

/* 闪烁点动画 */
.dot-flashing {
  position: relative;
  width: 10px;
  height: 10px;
  border-radius: 5px;
  background-color: #ff0000;
  animation: dot-flashing 1s infinite linear alternate;
}

@keyframes dot-flashing {
  0% {
    background-color: #ff0000;
  }
  50% {
    background-color: rgba(255, 0, 0, 0.5);
  }
  100% {
    background-color: #ff0000;
  }
}
</style>