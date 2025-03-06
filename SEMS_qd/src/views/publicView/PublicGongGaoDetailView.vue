<template>
  <div class="announcement-container">


    <transition-group name="fade" tag="div" class="announcement-list">
      <div
          v-for="(item, index) in announcements"
          :key="item.id"
          class="announcement-card"
          @click="handleCardClick(item)"
          :style="{ 'transition-delay': `${index * 0.1}s` }"
      >
        <div class="card-header">
          <span class="badge">NEW</span>
          <h2 class="card-title">{{ item.title }}</h2>
          <span class="date">
            <i class="el-icon-time"></i>
            {{ formatDate(item.date) }}
          </span>
        </div>
        <div class="card-content">
          <p>{{ item.content }}</p>
        </div>
        <div class="card-footer">
          <span class="author">
            <i class="el-icon-user"></i>
            {{ item.author }}
          </span>
          <el-tag
              v-for="tag in item.tags"
              :key="tag"
              type="info"
              size="mini"
          >
            {{ tag }}
          </el-tag>
        </div>
      </div>
    </transition-group>
  </div>
</template>

<script>
export default {
  data() {
    return {
      announcements: [
        {
          id: 1,
          title: '系统升级维护通知',
          content: '为提高服务质量，我们将于2023年8月15日0:00至6:00进行系统升级维护...',
          date: new Date(),
          author: '系统管理员',
          tags: ['重要', '维护']
        },
        {
          id: 2,
          title: '关于夏季作息时间调整',
          content: '自2023年7月1日起，公司实行夏季作息时间，具体安排如下...',
          date: new Date('2023-06-28'),
          author: '人事部',
          tags: ['通知']
        }
      ]
    }
  },
  methods: {
    formatDate(date) {
      // 日期格式化逻辑
      return date.toLocaleDateString()
    },
    handleCardClick(item) {
      // 处理卡片点击事件
      console.log('查看公告详情:', item)
    }
  }
}
</script>

<style lang="scss" scoped>
.announcement-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;

  .title {
    color: #2c3e50;
    font-size: 2rem;
    margin-bottom: 2rem;
    display: flex;
    align-items: center;

    .icon {
      color: #409EFF;
      margin-right: 0.5rem;
    }
  }
}

.announcement-list {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1.5rem;
}

.announcement-card {
  background: white;
  border-radius: 12px;
  padding: 1.5rem;
  box-shadow: 0 2px 12px rgba(0,0,0,0.1);
  transition: all 0.3s ease;
  cursor: pointer;
  position: relative;
  overflow: hidden;

  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
  }

  .card-header {
    border-bottom: 1px solid #eee;
    padding-bottom: 1rem;
    margin-bottom: 1rem;

    .badge {
      background: #f56c6c;
      color: white;
      padding: 2px 8px;
      border-radius: 4px;
      font-size: 0.8rem;
      position: absolute;
      top: 0;
      right: 0;
      transform: translate(30%, -50%) rotate(45deg);
    }

    .card-title {
      color: #303133;
      font-size: 1.2rem;
      margin-bottom: 0.5rem;
    }

    .date {
      color: #909399;
      font-size: 0.9rem;
      display: flex;
      align-items: center;

      i {
        margin-right: 4px;
      }
    }
  }

  .card-content {
    color: #606266;
    line-height: 1.6;
    margin-bottom: 1rem;
    font-size: 0.95rem;
  }

  .card-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;

    .author {
      color: #909399;
      font-size: 0.9rem;
      display: flex;
      align-items: center;

      i {
        margin-right: 4px;
      }
    }

    .el-tag {
      margin-left: 0.5rem;
    }
  }
}

.fade-enter-active, .fade-leave-active {
  transition: opacity 0.5s, transform 0.5s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
  transform: translateY(20px);
}

@media (max-width: 768px) {
  .announcement-list {
    grid-template-columns: 1fr;
  }
}
</style>