<template>
  <div class="announcement-container">
    <header class="glass-header">
      <public-menu class="modern-nav"></public-menu>
      <div class="hero-banner">
      </div>
    </header>


    <!-- 标题区 -->
    <div class="header">
<!--      <h1><i class="fas fa-bullhorn"></i> 最新公告</h1>-->
      <div class="filter">
        <span class="filter-item"
              v-for="type in types"
              :key="type.value"
              :class="{active: selectedType === type.value}"
              @click="selectedType = type.value">
          {{ type.label }}
        </span>
      </div>
    </div>


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
    <!-- 公告列表 -->
<!--    <transition-group name="list" tag="div" class="announcement-list">
      <div v-for="item in filteredAnnouncements"
           :key="item.id"
           class="announcement-card"
           :class="[`type-${item.type}`, {sticky: item.sticky}]"
           @click="selectedAnnouncement = item">
        <div class="card-header">
          <span class="type-tag">{{ typeMap[item.type] }}</span>
          <h2 class="title">{{ item.title }}</h2>
          <span class="date"><i class="fas fa-calendar-alt"></i> {{ formatDate(item.date) }}</span>
        </div>
        <div class="card-content">
          {{ item.content }}
        </div>
        <div v-if="item.sticky" class="sticky-tag"><i class="fas fa-thumbtack"></i> 置顶</div>
      </div>
    </transition-group>-->

    <!-- 详情弹窗 -->
<!--    <transition name="fade">
      <div v-if="selectedAnnouncement" class="detail-modal">
        <div class="modal-content">
          <span class="close" @click="selectedAnnouncement = null">&times;</span>
          <h2>{{ selectedAnnouncement.title }}</h2>
          <div class="meta">
            <span class="type">{{ typeMap[selectedAnnouncement.type] }}</span>
            <span class="date">{{ formatDate(selectedAnnouncement.date) }}</span>
          </div>
          <div class="content">
            {{ selectedAnnouncement.content }}
          </div>
        </div>
      </div>
    </transition>-->
  </div>
</template>

<script>
import publicMenu from "@/components/public/public_menu.vue";

export default {
  components: {publicMenu},
  data() {
    return {
      selectedType: 'all',
      selectedAnnouncement: null,
      types: [
        { value: 'all', label: '全部' },
        { value: 'notice', label: '通知' },
        { value: 'update', label: '更新' },
        { value: 'event', label: '活动' },
        { value: 'urgent', label: '紧急' }
      ],
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
    ,
      announcements: [
        // 示例数据
        {
          id: 1,
          title: '系统维护通知',
          content: '将于2023年12月31日凌晨进行系统维护...',
          type: 'urgent',
          date: '2023-12-25',
          sticky: true
        },
        // 更多数据...
      ]
    }
  },
  computed: {
    typeMap() {
      return {
        notice: '一般通知',
        update: '版本更新',
        event: '活动公告',
        urgent: '紧急通知'
      }
    },
    filteredAnnouncements() {
      return this.announcements
          .filter(item =>
              this.selectedType === 'all' ||
              item.type === this.selectedType
          )
          .sort((a, b) => b.sticky - a.sticky)
    }
  },
  methods: {
    formatDate(date) {
      return new Date(date).toLocaleDateString()
    }
  }
}
</script>

<style scoped>
/* 基础样式 */
.announcement-container {
  /*max-width: 1200px;
  margin: 2rem auto;
  padding: 0 20px;*/
}

.header {
  text-align: center;
  margin-bottom: 2rem;
}

h1 {
  color: #2c3e50;
  font-size: 2.5rem;
  margin-bottom: 1rem;
}

/* 卡片样式 */
.announcement-list {
  display: grid;
  gap: 1.5rem;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
}

.announcement-card {
  background: white;
  border-radius: 12px;
  padding: 1.5rem;
  position: relative;
  cursor: pointer;
  transition: transform 0.3s, box-shadow 0.3s;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.announcement-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
}

/* 类型颜色 */
.type-tag {
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 5px 15px;
  border-radius: 20px;
  color: white;
  font-size: 0.9rem;
}

.type-notice .type-tag { background: #3498db; }
.type-update .type-tag { background: #2ecc71; }
.type-event .type-tag { background: #e67e22; }
.type-urgent .type-tag { background: #e74c3c; }

/* 置顶样式 */
.sticky-tag {
  position: absolute;
  bottom: -10px;
  left: 50%;
  transform: translateX(-50%);
  background: #f1c40f;
  padding: 3px 15px;
  border-radius: 15px;
  font-size: 0.8rem;
}

/* 过滤按钮 */
.filter-item {
  display: inline-block;
  margin: 0 10px;
  padding: 8px 20px;
  border-radius: 20px;
  cursor: pointer;
  transition: all 0.3s;
}

.filter-item.active {
  background: #3498db;
  color: white;
}

/* 弹窗样式 */
.detail-modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal-content {
  background: white;
  padding: 2rem;
  border-radius: 12px;
  max-width: 600px;
  width: 90%;
  position: relative;
}

/* 动画 */
.list-move {
  transition: transform 0.5s;
}

.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}

/* 响应式 */
@media (max-width: 768px) {
  .announcement-list {
    grid-template-columns: 1fr;
  }
}














.announcement-container {
  /*max-width: 1200px;*/
  margin: 0 auto;
  padding: 0;

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
  padding: 25px;
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