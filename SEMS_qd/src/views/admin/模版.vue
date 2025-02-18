    <template>
      <div class="content">
        <div>
           <AdminMenu></AdminMenu>
        </div>
        <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
          <header class="flex justify-between items-center mb-4">
            <h1 class="text-2xl font-semibold">就业信息系统</h1>
          </header>


        </main>
      </div>
    </template>

    <script>
      import DwMenu from "@/components/admin/Admin_menu.vue";

      export default {
        name: 'Admin',
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
<script setup lang="ts">
</script>