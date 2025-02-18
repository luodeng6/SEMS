<template>
  <!-- 岗位详情弹窗 -->
  <transition name="fade">
    <div v-if="isVisible" class="popup-overlay" @click="closePopup">

      <div class="popup-large" @click.stop>

        <div class="container mx-auto px-4 py-8 max-w-4xl" v-html="HtmlText">
        </div>
        <div class="flex justify-end mt-4">
          <button class="bg-gray-500 text-white px-3 py-1 rounded hover:bg-gray-600" @click="closePopup">
            关闭
          </button>
        </div>
      </div>
    </div>

  </transition>
</template>

<script>
//
/*
调用方式：
<JobDetailPopup
   :isVisible="isPopupVisible"
  :HtmlText="HtmlText"
  @update:isVisible="isPopupVisible = $event"
    />
 */


export default {
  name: "HtmlShowBox",
  props: {
    isVisible: {
      // 是否显示弹窗
      type: Boolean,
      //required的作用是，如果父组件没有传isVisible这个属性，则会报错
      required: true,
    },
    //
    HtmlText: {
      type: String,
      required: true,
    },
  },
  mounted() {
    console.log("子组件获取参数:")
    console.log(this.HtmlText)
  },
  methods: {
    // 关闭弹窗
    closePopup() {
      this.$emit('update:isVisible', false);
    },
  },
}
</script>

<style scoped>
.popup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
}

.popup-large {
  background: white;
  padding: 20px;
  border-radius: 8px;
  max-width: 600px;
  width: 100%;
}

.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s;
}

.fade-enter, .fade-leave-to {
  opacity: 0;
}
</style>
