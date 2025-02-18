<template>
  <div class="notification-bell cursor-pointer" @click="toggleDropdown">
    <i class="el-icon-bell" />
    <span v-if="count > 0" class="notification-count">{{ count }}</span>
    <el-dropdown v-if="dropdownVisible">
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item v-for="notification in notifications" :key="notification.id">
          {{ notification.message }}
        </el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
export default {
  props: {
    count: {
      type: Number,
      default: 0
    },
    notifications: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      dropdownVisible: false
    };
  },
  methods: {
    toggleDropdown() {
      this.dropdownVisible = !this.dropdownVisible;
    }
  }
};
</script>

<style scoped>
.notification-bell {
  position: relative;
}
.notification-count {
  position: absolute;
  top: -5px;
  right: -10px;
  background-color: #f00;
  border-radius: 50%;
  color: #fff;
  padding: 3px 6px;
}
</style>