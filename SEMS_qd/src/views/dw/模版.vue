<template>
  <div class="content">
    <div>
      <DwMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">就业信息系统</h1>
      </header>


    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";
// 面试管理界面
export default {
  name: 'DwMsApView',
  components: {DwMenu},
  data() {
    return {}
  },
  computed: {
  },
  methods: {
  }
};
</script>
