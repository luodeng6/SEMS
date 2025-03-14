<template>
  <div>

    <!-- 职位头图 -->
    <header class="job-header">
      <div class="job-meta">
        <h1 class="job-title">{{JobData.GWMC}}</h1>
        <p class="company">{{JobData.GSMC}}</p>

        <div class="meta-grid">
          <div class="meta-item">
            <img alt="薪资" src="https://img.icons8.com/ios-filled/50/ffffff/money.png">
            <div>
              <p>薪资范围</p>
              <h3>¥{{ JobData.ZDXZ }} - ¥ {{ JobData.ZGXZ }} / 月</h3>
            </div>
          </div>
          <div class="meta-item">
            <img alt="地点" src="https://img.icons8.com/ios-filled/50/ffffff/marker.png">
            <div>
              <p>工作地点</p>
              <h3>{{ JobData.SFMC }} · {{ JobData.GZDD }}</h3>
            </div>
          </div>
          <div class="meta-item">
            <img alt="时间" src="https://img.icons8.com/ios-filled/50/ffffff/clock.png">
            <div>
              <p>工作类型</p>
              <h3>{{ JobData.FLMC }}-  {{JobData.SXBZ===1?"实习":"全职" }} </h3>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- 主要内容 -->
    <main class="container-detail">
      <!-- 左侧详情 -->
      <div class="job-content">
        <section class="detail-section">
          <h2 class="section-title">职位描述</h2>
          <h3>岗位职责</h3>
          <div v-html="JobData.GZZZ.replace(/\n/g, '<br>')"></div>

          <h3>岗位描述</h3>
          <div v-html="JobData.GWMS.replace(/\n/g, '<br>')"></div>

          <h3>工作职责</h3>
          <div v-html="JobData.GZZZ.replace(/\n/g, '<br>')"></div>

          <h3> 就业环境</h3>
          <div v-html="JobData.JYHJMS.replace(/\n/g, '<br>')"> </div>
          <div>
            <div class="gallery">
              <img v-for="item in JyhjkList" :key="item.id" @click="showImg(ServerIP()+item.imgurl)" :src="ServerIP()+item.imgurl" :alt="item.imgurl">
            </div>
          </div>


          <h3> 投递说明</h3>
          <div v-html="JobData.TDSM.replace(/\n/g, '<br>')"></div>
        </section>

        <section class="detail-section">
          <h2 class="section-title">公司介绍</h2>
          <p v-html="JobData.GSJJHTML">
           </p>
        </section>
      </div>

      <!-- 右侧侧边栏 -->
      <aside class="job-sidebar">
        <div class="highlight-box">
          <h3>快速申请</h3>
          <a class="apply-btn" href="#">立即申请</a>
          <p>或发送简历至：hr@techpioneer.com</p>
        </div>

        <div class="highlight-box">
          <h3>职位标签</h3>
          <div class="tag-list">
            <span class="tag">前端开发</span>
            <span class="tag">Vue.js</span>
            <span class="tag">React</span>
            <span class="tag">互联网</span>
          </div>
        </div>

        <div class="highlight-box">
          <h3>公司福利</h3>
          <ul>
            <li v-for="(item,index) in GWXQFLLIST" :key="index">{{item.flmc}}</li>
          </ul>
        </div>
      </aside>
    </main>

    <!-- 移动端底部申请栏 -->
    <footer class="apply-footer">
      <div class="apply-container">
        <div>
          <h3>前端开发工程师</h3>
          <p>¥25k - ¥40k / 月</p>
        </div>
        <a class="apply-btn" href="#">立即申请</a>
      </div>
    </footer>
    <!--            预览大图弹窗-->
    <el-dialog
        :visible.sync="YuLanDialogVisible"
        :title="JobData.GWMC + ' 就业环境预览大图'"
        append-to-body
        top="20px">
      <img height="70%" :src="dialogImageUrl" alt="预览大图"/>
    </el-dialog>
    <el-backtop  ></el-backtop>
  </div>

</template>

<script>
import axios from 'axios'
import {ServerIP} from "@/SystemConfig";
export default {
  name: 'PublicJobDetailView',
  data() {
    return {
      GWXQFLLIST: [],
      dialogImageUrl:null,
      YuLanDialogVisible: false,
      gwdm: null,
      JobData: {},
      JyhjkList: [],
    }
  }, mounted() {
    console.log("获取页面参数：");
    // 获取页面参数：this.$router.push({path: '/dw/jobDetail', query: {id: this.currentJobSelectRow.id}})
    console.log(this.$route.query.id);
    if (this.$route.query.id) {
      this.gwdm = this.$route.query.id;
      this.getJobData(this.gwdm);
      this.getJobImgList(this.gwdm);
      this.getJobWelfareData(this.gwdm);
    } else {
      this.$router.push({path: '/'});
    }
  }, methods: {
    // 获取就业环境图片
    getJobImgList(gwdm) {
      axios.get("/jyhjk/getJyhjkByGwdm?gwdm=" + gwdm).then(response => {
        if (response.data.result) {
          this.JyhjkList=response.data.data;
        }else{
          console.log("获取就业环境图片失败！");
          this.$message.error("获取就业环境图片失败！后台错误！");
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取数据失败：网络错误");
      });

    },
    showImg(url){
      this.dialogImageUrl = url;
      this.YuLanDialogVisible = true;
    },
    // 获取岗位 福利数据
    getJobWelfareData(id) {
      // 获取岗位对应的福利
      axios.get("/fl/getGwflByGWDM?gwdm=" + id).then((response) => {
        if (response.data.result) {
          console.log("获取岗位对应的福利成功:")
          this.GWXQFLLIST = response.data.data;
          console.log(this.GWXQFLLIST);
        } else {
          this.$message.error("获取岗位对应的福利失败！，后台错误")
        }
      }).catch((error) => {
        console.log(error);
        this.$message.error("获取岗位对应的福利失败，网络错误")
      });

    },
    ServerIP() {
      return ServerIP
    },
    getJobData(id) {
      axios.get("/dataGwdmk/getGwdmkDataToInterface?IsJustOne=1&gwdm=" + id).then((response) => {
        if (response.data.result) {
          // this.$message.success("获取数据成功！");
          //前端要显式显示：岗位名称、对应单位名称、实习标志、岗位启用状态
          this.JobData = response.data.data[0];
        } else {
          this.$message.error("获取数据失败：后台错误");
        }
      }).catch((error) => {
        this.$message.error("获取数据失败：网络错误");
        console.log(error);
      });
    },
  }
}
</script>
<style scoped>
/* 复用列表页样式 */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
h3{
  /*加粗*/
  font-weight: bold !important;
}
.navbar, .nav-content, .logo, .nav-links {
  /* 保持与列表页相同的导航样式 */
  /* 此处省略重复样式代码，实际使用时应保留 */
}

/* 详情页专属样式 */
.job-header {
  background: linear-gradient(rgba(44, 62, 80, 0.9), rgba(44, 62, 80, 0.9)),
  url('https://source.unsplash.com/random/1920x600?office');
  background-size: cover;
  background-position: center;
  padding: 8rem 2rem 4rem;
  color: white;
}

.job-meta {
  max-width: 1200px;
  margin: 0 auto;
}

.job-title {
  font-size: 2.5rem;
  margin-bottom: 1rem;
}

.meta-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 2rem;
  margin-top: 2rem;
  background: rgba(255, 255, 255, 0.1);
  padding: 1.5rem;
  border-radius: 10px;
}

.meta-item {
  display: flex;
  align-items: center;
  gap: 0.8rem;
}

.meta-item img {
  width: 24px;
  height: 24px;
}

.container-detail {
  max-width: 1200px;
  margin: 2rem auto;
  padding: 0 20px;
  display: grid;
  grid-template-columns: 3fr 1fr;
  gap: 3rem;
}

.detail-section {
  margin-bottom: 3rem;
}

.section-title {
  color: #2c3e50;
  border-left: 4px solid #3498db;
  padding-left: 1rem;
  margin: 2rem 0;
}

.job-sidebar {
  background: #f8f9fa;
  padding: 2rem;
  border-radius: 10px;
  height: fit-content;
}

.highlight-box {
  background: white;
  padding: 1.5rem;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
}

.tag-list {
  display: flex;
  flex-wrap: wrap;
  gap: 0.8rem;
}

.tag {
  background: #ecf0f1;
  padding: 0.5rem 1rem;
  border-radius: 20px;
  font-size: 0.9rem;
}

.apply-footer {
  position: fixed;
  bottom: 0;
  width: 100%;
  background: white;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
  padding: 1rem;
  display: none;
}

.apply-container {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.gallery {
  display: flex;
  flex-wrap: wrap; /* 允许换行 */
  justify-content: flex-start; /* 图片之间的间距 */
}
.el-dialog__body img{
  height: 520px !important;
}
.gallery img {
  width: 20%; /* 每张图片占据30%的宽度 */
  margin-bottom: 10px; /* 图片底部的间距 */
  margin-right: 5px;
}


@media (max-width: 768px) {
  .container-detail {
    grid-template-columns: 1fr;
  }

  .job-sidebar {
    order: -1;
  }

  .apply-footer {
    display: block;
  }
}
</style>