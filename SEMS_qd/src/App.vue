<template>
  <div id="app">
    <router-view/>
    <!--  未登录时显示提示框-->
    <model/>
  </div>
</template>


<script>
import {mapState} from 'vuex';
import model from "@/components/public/model.vue";

export default {
  name: "App",
  components: {
    model
  },
  computed: {

  },
  methods: {
    closeModal() {
      this.$store.dispatch('setModal', false); // 关闭模态框
    }
  },
  mounted() {
    window.addEventListener("unload", () => {
      console.log("页面刷新了！");
      // 页面刷新时 保存状态 ,但是this.$store.state是字符串，需要转化为对象
        sessionStorage.setItem("state", JSON.stringify(this.$store.state));
    })
  },
  data() {
    return {
      showModal: false
    };
  },
};


</script>

<style>
</style>
