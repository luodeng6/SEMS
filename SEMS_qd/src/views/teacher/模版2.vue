<template>
  <div class="content">
    <div>
      <teacher_menu></teacher_menu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">

      </header>


    </main>
  </div>
</template>

<script>
import teacher_menu from "@/components/teacher/Teacher_menu.vue";

export default {
  name: 'template2',
  components: { teacher_menu },

};
</script>

