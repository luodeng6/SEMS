<template>
  <div>
      <public-menu></public-menu>
    <!-- Main Content -->
    <div class="container">
      <div class="row">
        <!-- Sidebar -->
        <aside class="col-md-3 mb-4">
          <div class="list-group">
            <a href="#" class="list-group-item list-group-item-action bg-success text-white">
              <i class="fas fa-building me-2"></i>校园招聘
            </a>
            <router-link to="/dw/login">
              <a  class="list-group-item list-group-item-action bg-primary text-white">
                <i class="fas fa-tasks me-2"></i>就业管理
              </a>
            </router-link>

            <a href="#" class="list-group-item list-group-item-action bg-warning text-white">
              <i class="fas fa-file-alt me-2"></i>手续办理
            </a>
            <router-link to="/stu/Login">
              <a   class="list-group-item list-group-item-action bg-secondary text-white">
                <i class="fas fa-user me-2"></i>学生登录
              </a>
            </router-link>

            <router-link to="/dw/login">
              <a class="list-group-item list-group-item-action bg-danger text-white">
                <i class="fas fa-user-plus me-2"></i>单位登录/注册
              </a>
            </router-link>

          </div>

          <h2>宣讲会</h2>
          <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
              <button class="nav-link active" id="cloud-tab" data-bs-toggle="tab" data-bs-target="#cloud" type="button" role="tab" aria-controls="cloud" aria-selected="true">云宣讲</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="online-tab" data-bs-toggle="tab" data-bs-target="#online" type="button" role="tab" aria-controls="online" aria-selected="false">在线招聘</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="campus-tab" data-bs-toggle="tab" data-bs-target="#campus" type="button" role="tab" aria-controls="campus" aria-selected="false">校内宣讲会</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="off-campus-tab" data-bs-toggle="tab" data-bs-target="#off-campus" type="button" role="tab" aria-controls="off-campus" aria-selected="false">校外宣讲会</button>
            </li>
          </ul>
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="cloud" role="tabpanel" aria-labelledby="cloud-tab">
              <div class="event">
                <div class="event-date">04月23日</div>
                <div class="event-title">【9月读研】南方医科大学...</div>
                <div class="event-meta">湖南中医药大学 线上专场 19:00 237</div>
              </div>
              <div class="event">
                <div class="event-date">06月13日</div>
                <div class="event-title">【最后召集】南方医科大...</div>
                <div class="event-meta">湖南中医药大学 线上专场 10:00 6565</div>
              </div>
              <div class="event">
                <div class="event-date">12月06日</div>
                <div class="event-title">新领先医药2023年...</div>
                <div class="event-meta">湖南中医药大学 线上专场 16:30 14013</div>
              </div>
              <div class="event">
                <div class="event-date">11月10日</div>
                <div class="event-title">普洛药业2023秋季线...</div>
                <div class="event-meta">湖南中医药大学 线上专场 11:12 15125</div>
              </div>
            </div>
            <div class="tab-pane fade" id="online" role="tabpanel" aria-labelledby="online-tab">
              <!-- Online recruitment content -->
            </div>
            <div class="tab-pane fade" id="campus" role="tabpanel" aria-labelledby="campus-tab">
              <!-- On-campus presentation content -->
            </div>
            <div class="tab-pane fade" id="off-campus" role="tabpanel" aria-labelledby="off-campus-tab">
              <!-- Off-campus presentation content -->
            </div>
          </div>
        </aside>

        <!-- Main Section -->
        <main class="col-md-9">
          <div class="row">
            <div class="col-md-8">

              <div id="carouselExampleIndicators" class="carousel slide mb-4" data-bs-ride="carousel">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="http://static.bysjy.com.cn/frontend/public/images/push/push_4.jpg" class="d-block w-100" alt="轮播图1">
                  </div>
                  <div class="carousel-item">
                    <img src="https://o.bysjy.com.cn/notice/1719819395-6178.jpeg@1e_500w_250h_1c_0i_1o_100Q_1x.jpg" class="d-block w-100" alt="轮播图2">
                  </div>
                  <div class="carousel-item">
                    <img src="http://static.bysjy.com.cn/frontend/public/images/push/push_2.jpg" class="d-block w-100" alt="轮播图3">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
            </div>
            <div class="col-md-4">
              <h2>招聘信息</h2>
              <ul class="list-unstyled">
                <li class="news-item mb-2">• "追梦鹏城，创享未来" 第二十八届深圳市全国高校毕业生秋季就业双选会：600+名企荟萃！...</li>
                <li class="news-item mb-2">• 饿了么秋季2025届应届生招聘启动啦！</li>
                <li class="news-item mb-2">• 2024届第28届全国高校毕业生秋季双选会高校对接团</li>
                <li class="news-item mb-2">• 腾讯2024届校园招聘全面启动，多个岗位开放！</li>
                <li class="news-item mb-2">• 阿里巴巴2024届秋季招聘，期待你的加入！</li>
                <li class="news-item mb-2">• 华为2024届全球校园招聘，面向未来的你！</li>
              </ul>
            </div>
          </div>

        </main>
      </div>
    </div>

    <!-- Fixed Sidebar -->
    <div class="fixed-sidebar">
      <a href="tel:123456789"><i class="fas fa-phone"></i></a>
      <a href="mailto:info@example.com"><i class="fas fa-envelope"></i></a>
      <a href="#"><i class="fas fa-map-marker-alt"></i></a>
      <a href="#"><i class="fas fa-comments"></i></a>
    </div>
  </div>
</template>

<script>
import publicMenu  from "@/components/public/public_menu.vue";
export default {
  name: "",
  components: {
    publicMenu,
  },
  data() {
    return {}
  },
  methods: {}
}
</script>

<style scoped>
body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #f8f9fa;
  color: #212529;
}
.navbar {
  border-radius: 0 0 15px 15px;
}
.carousel-item img {
  height: 400px;
  object-fit: cover;
  border-radius: 15px;
}
.list-group-item {
  border-radius: 10px;
  transition: transform 0.3s, box-shadow 0.3s;
}
.list-group-item:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.dropdown-menu {
  border-radius: 10px;
}
.news-item {
  transition: background-color 0.3s;
}
.news-item:hover {
  background-color: #e9ecef;
}
.calendar {
  border-radius: 10px;
  transition: background-color 0.3s;
}
.calendar:hover {
  background-color: #28a745;
}
.fixed-sidebar {
  position: fixed;
  right: 20px;
  top: 50%;
  transform: translateY(-50%);
  z-index: 1000;
}
.fixed-sidebar a {
  display: block;
  margin-bottom: 10px;
  text-align: center;
  color: white;
  background-color: #28a745;
  padding: 10px;
  border-radius: 50%;
  transition: background-color 0.3s;
}
.fixed-sidebar a:hover {
  background-color: #218838;
}
.tab-content {
  border: 1px solid #dee2e6;
  border-top: none;
  padding: 20px;
  border-radius: 0 0 10px 10px;
}
.tab-pane {
  display: flex;
  flex-wrap: wrap;
}
.tab-pane .event {
  flex: 1 1 45%;
  border: 1px solid #dee2e6;
  border-radius: 10px;
  margin: 10px;
  padding: 10px;
  background-color: #f8f9fa;
  transition: transform 0.3s, box-shadow 0.3s;
}
.tab-pane .event:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.event-date {
  font-size: 1.5rem;
  font-weight: bold;
  color: #dc3545;
}
.event-title {
  font-size: 1.2rem;
  font-weight: bold;
  color: #007bff;
}
.event-meta {
  font-size: 0.9rem;
  color: #6c757d;
}
</style>
