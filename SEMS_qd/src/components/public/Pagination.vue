<template>
  <div class="flex justify-center mt-4">
    <button
        class="px-4 py-2 bg-blue-500 text-white rounded-l"
        :disabled="currentPage === 1"
        @click="prevPage"
    >
      上一页
    </button>
    <span class="px-4 py-2">第 {{ currentPage }} 页 / 共 {{ totalPages }} 页</span>
    <button
        class="px-4 py-2 bg-blue-500 text-white rounded-r"
        :disabled="currentPage === totalPages"
        @click="nextPage"
    >
      下一页
    </button>
  </div>
</template>

<script>

// 分页组件
export default {
  name: "Pagination",
  props: {
    totalPosts: {
      type: Number,
      required: true,
    },
    postsPerPage: {
      type: Number,
      default: 10,
    },
    currentPage: {
      type: Number,
      required: true,
    },
  },
  computed: {
    totalPages() {
      return Math.ceil(this.totalPosts / this.postsPerPage);
    },
  },
  methods: {
    prevPage() {
      if (this.currentPage > 1) {
        this.$emit('update:currentPage', this.currentPage - 1);
      }
    },
    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.$emit('update:currentPage', this.currentPage + 1);
      }
    },
  },
};
</script>

<style scoped>
button:disabled {
  background-color: #ccc;
}
</style>