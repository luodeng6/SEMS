<template>
  <div class="content">
    <div>
      <StudentMenu></StudentMenu>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <header class="flex justify-between items-center mb-4">
        <h1 class="text-2xl font-semibold">学生信息管理</h1>
      </header>


    </main>
  </div>
</template>

<script>
import StudentMenu from "@/components/student/Student_menu.vue";

export default {
  name: 'StudentInfo',
  components: { StudentMenu },

};
</script>

