<template>
  <div class="content">
    <div>
      <DwMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-3xl font-semibold">岗位智能咨询</h1>
      </header>
      <iframe src="https://chat.deepseek.com/a/chat/s/c0edd635-668d-42fe-aab9-9de13d4aac49" frameborder="0"  class="luodengAi" ></iframe>

    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";

export default {
  name: 'AI',
  components: {DwMenu},
  data() {
    return {}
  },
  computed: {},
  methods: {}
};
</script>
<style scoped>

.luodengAi {
  width: 1396px;
  height: 708px;
}


</style>