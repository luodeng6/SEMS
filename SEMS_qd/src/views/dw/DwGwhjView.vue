<template>
  <div class="content">
    <new-year-loading :isLoading="isLoading"/>
    <div>
      <DwMenu/>
    </div>
    <main class="ml-64 flex-1 p-6 bg-gray-50 min-h-screen">
      <el-card style="margin-bottom: 10px">
        <header class="flex justify-between items-center mb-6">
          <div>
            <h1 class="text-3xl font-bold text-gray-800">岗位就业环境管理</h1>
            <p class="text-sm text-gray-500 mt-1">当前有效岗位
              {{ AllDATAGWDMK.filter(item => item.qydm === 1).length }} 个</p>
          </div>
          <div class="flex items-center space-x-4">
            <el-button type="text" icon="el-icon-plus">我的发布</el-button>
            <el-button type="text" icon="el-icon-edit">岗位环境编辑</el-button>
            <!--            <el-button type="text" icon="el-icon-search" @click="lookGw"></el-button>-->
            <el-dropdown trigger="click">
              <el-button icon="el-icon-download"></el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item>导出当前列表</el-dropdown-item>
                  <el-dropdown-item>导出全部数据</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </div>
        </header>
        <div class="mb-4 p-4  rounded-md">
          <!--          <h3 class="text-lg font-semibold">页面介绍</h3>-->
          <p>此页面用于岗位就业环境管理，包括发布岗位环境、编辑岗位环境、查看岗位环境、导出数据等功能。</p>
        </div>
      </el-card>
      <!-- 页面介绍 -->

      <el-card>

        <el-tabs type="border-card">
          <el-tab-pane label="发布动态">
            <span slot="label"><i class="el-icon-date"></i> 发布动态</span>

            <div class="container-fluid">
              <div class="row">
                <div class="col-md-3">
                  <el-card class="box-card" shadow="never">
                    <el-timeline :reverse="reverse">
                      <el-timeline-item
                          v-for="(activity, index) in activities"
                          :key="index"
                          :timestamp="activity.timestamp">
                        {{ activity.content }}
                      </el-timeline-item>
                    </el-timeline>
                  </el-card>
                </div>

                <div class="col-md-9">
                  <el-card class="box-card" shadow="never">

                    <span>{{ loginUser.name }}，发布的所有图片！</span>
                    <!--                      <el-button style="float: right; padding: 3px 0" type="text">操作按钮</el-button>-->

                    <div class="simple-carousel">
                      <!-- 轮播容器 -->
                      <div class="carousel-container" style="height:400px;width:100%;">
                        <!-- 轮播图片 -->
                        <transition name="fade" mode="out-in">

                          <img

                              style="object-fit:contain; cursor: pointer;border-radius:100px"
                              :key="currentIndex"
                              :src="imgList[currentIndex]"
                              class="carousel-image"
                              @click="ShowImgYuLan(imgList[currentIndex])">/>
                        </transition>

                        <!-- 左右切换按钮 -->
                        <button class="carousel-prev" @click="prev">‹</button>
                        <button class="carousel-next" @click="next">›</button>
                      </div>
                    </div>
                  </el-card>

                </div>
              </div>
            </div>
          </el-tab-pane>
          <el-tab-pane label="岗位环境发布">
            <span slot="label"><i class="el-icon-message"></i> 岗位环境发布</span>
            <div style="margin-bottom: 20px;">
              <label class="block text-gray-700 text-sm font-bold mb-2">清先选择岗位:</label>
              <el-select v-model="selectGWinfomationId" placeholder="请选择岗位信息" clearable filterable
                         prefix-icon="el-icon-briefcase">
                <el-option v-for="item in AllDATAGWDMK" :key="item.id"
                           :label="`${item.id}-${item.gwmc}-${luodengTime(item.fbsj)}`"
                           :value="item.id"/>
              </el-select>
            </div>
            <el-upload
                action="#"
                list-type="picture-card"
                :auto-upload="false"
                :on-change="handleFileChange"
                :file-list="fileList"
                :limit="9"
                multiple
                :before-upload="beforeUpload">
              <i class="el-icon-plus"></i>
              <div slot="file" slot-scope="{ file }">
                <img
                    class="el-upload-list__item-thumbnail"
                    :src="file.url"
                    alt="预览图"/>
                <span class="el-upload-list__item-actions">
              <span
                  class="el-upload-list__item-preview"
                  @click="handlePreview(file)">
                <i class="el-icon-zoom-in"></i>
              </span>
              <span
                  class="el-upload-list__item-delete"
                  @click="handleRemove(file)">
                <i class="el-icon-delete"></i>
              </span>
            </span>
              </div>
            </el-upload>
            <el-button style="margin-top: 20px;" type="primary" @click="submitUpload">立即上传</el-button>
          </el-tab-pane>
          <el-tab-pane label="岗位环境预览">
            <div class="container job-container">
              <div
                  v-for="job in AllDATAGWDMK"
                  :key="job.id"
                  class="job-item card mb-4">
                <!-- 标题区域 -->
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                  <h3 class="mb-0">{{ job.gwmc }}</h3>
                  <span class="text-muted">{{ fbsjToDate(job.fbsj) }}</span>
                </div>

                <!-- 图片列表 -->
                <div class="card-body p-3">
                  <div class="row">
                    <div
                        v-for="(img, index) in AllJYHJK.filter(item => item.gwdm === job.id)"
                        :key="index"
                        class="col-6 col-md-4 col-lg-3 mb-3">
                      <div
                          class="image-wrapper"
                          @click="handlePreview2(AllJYHJK.filter(item => item.gwdm === job.id), index)">
                        <img
                            :src="img.imgurl"
                            class="img-fluid rounded"
                            style="object-fit: cover; height: 200px"
                            :alt="'环境图' + (index + 1)">
                        <div class="hover-mask">
                          <i class="el-icon-zoom-in"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- 图片预览对话框 -->
              <el-dialog
                  :visible.sync="previewVisible"
                  top="5vh"
                  width="80%">
                <img
                    :src="currentImage.imgurl"
                    class="img-fluid w-100"
                    style="max-height: 80vh; object-fit: contain">
                <div class="text-center mt-3">
                  <el-button
                      icon="el-icon-arrow-left"
                      @click="prevImage"
                  ></el-button>
                  <span class="mx-3">{{ currentIndex2 + 1 }} / {{ previewList.length }}</span>
                  <el-button
                      icon="el-icon-arrow-right"
                      @click="nextImage"
                  ></el-button>
                </div>
              </el-dialog>
            </div>
          </el-tab-pane>
          <el-tab-pane label="就业环境管理">
            <span slot="label"><i class="el-icon-star-on"></i> 就业环境管理</span>
            <el-table :data="paginatedPositions" style="width: 100%">
              <!-- 编号列 -->
              <el-table-column prop="ID" label="编号" width="80" align="center"></el-table-column>

              <!-- 图片列 -->
              <el-table-column label="图片" width="120" align="center">
                <template #default="{ row }">
                  <el-image
                      style="width: 80px; height: 60px"
                      :src="row.IMGURL"
                      :preview-src-list="[row.IMGURL]"
                      fit="cover">
                  </el-image>
                </template>
              </el-table-column>

              <!-- 岗位信息 -->
              <el-table-column prop="GWMC" label="岗位名称" width="150"></el-table-column>
              <el-table-column prop="GWDM" label="岗位代码" width="100" align="center"></el-table-column>

              <!-- 单位信息 -->
              <el-table-column prop="DWMC" label="所属单位" width="100"></el-table-column>
              <el-table-column prop="DWDM" label="单位代码" width="100" align="center"></el-table-column>

              <!-- 公司信息 -->
              <el-table-column prop="GSMC" label="公司名称" min-width="100"></el-table-column>

              <!-- 提交时间 -->
              <el-table-column prop="TJSJ" label="提交时间" width="180" align="center">
                <template #default="{ row }">
                  {{ luodengTime(row.TJSJ) }}
                </template>
              </el-table-column>

              <!-- 备注信息 -->
              <el-table-column prop="JYHJMS" label="备注" :formatter="formatText">
              </el-table-column>

              <el-table-column
                  align="right" width="190">
                <template slot="header" slot-scope="scope">
                  <el-select v-model="selectGwdm" placeholder="请选择岗位信息">
                    <el-option v-for="item in AllDATAGWDMK" :key="item.id" :label="item.id+'-'+item.gwmc"
                               :value="item.id"></el-option>
                  </el-select>
                </template>
                <template slot-scope="row">
                  <!--传入的是环境id-->
                  <el-button
                      type="danger"
                      size="mini"
                      @click="handleDeleteJyhjk(row.row.ID)">
                    删除
                  </el-button>
                  <el-button
                      type="primary"
                      size="mini"
                      @click="handleEditJyhjk(row.row)">
                    修改
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-pagination
                background
                layout="total, sizes, prev, pager, next"
                :total="total"
                :page-sizes="[5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]"
                :current-page.sync="currentPage"
                :page-size.sync="pageSize"
                @current-change="handleCurrentChange"
                @size-change="handleSizeChange">
            </el-pagination>
          </el-tab-pane>
        </el-tabs>
      </el-card>


      <el-dialog :visible.sync="dialogVisible" append-to-body>
        <img width="100%" :src="dialogImageUrl" alt="预览大图"/>
      </el-dialog>


    </main>
  </div>
</template>

<script>
import DwMenu from "@/components/dw/Dw_menu.vue";
import axios from "axios";
import NewYearLoading from "@/components/public/NewYearLoading.vue";

export default {
  name: 'DwGwhjView',
  components: {DwMenu, NewYearLoading},

  data() {
    return {
      total: 0,
      currentPage: 1,
      pageSize: 5,

//
      isLoading: false,

      // 筛选表格数据，岗位信息
      selectGwdm: null,
      jobs: [
        {
          id: 1,
          title: '前端开发工程师',
          postTime: '2024-03-15 发布',
          images: [
            'https://example.com/img1.jpg',
            'https://example.com/img2.jpg',
            'https://example.com/img3.jpg'
          ]
        },
        {
          id: 2,
          title: 'UI设计师',
          postTime: '2024-03-14 发布',
          images: [
            'https://example.com/design1.jpg',
            'https://example.com/design2.jpg'
          ]
        }
      ],
      previewVisible: false,  // 预览对话框状态
      previewList: [],  // 预览图片列表
      currentIndex2: 0,
      JyhjkTableData: null,
      interval: 5000,
      currentIndex: 0, timer: null,
      imgList: ['http://localhost:83/img/upload//1738569231005_.JPG', 'http://localhost:83/img/upload//1738569231005_.JPG'],
      reverse: true,
      activities: [{
        content: '为岗位 实施 岗位添加了5张图片',
        timestamp: '2018-04-15'
      }, {
        content: '为岗位 实施 岗位添加了5张图片',
        timestamp: '2018-04-13'
      }, {
        content: '为岗位 实施 岗位添加了5张图片',
        timestamp: '2018-04-11'
      }],


      fileList: [],        // 文件列表
      dialogVisible: false, // 预览对话框状态
      dialogImageUrl: "",   // 预览图片地址
      selectGWinfomationId: null,
      DATADWDMK: null, // 单位数据  获得当前登录用户的单位信息
      AllDATAGWDMK: null,// 所有岗位信息数据--- 此用户发布的所有岗位信息
      // 登录用户信息
      loginUser: {
        username: null,// 用户名
        name: null,// 用户姓名
        YHSFDM: null,// 用户身份代码
      },
      AllJYHJK: null, // 所有图片数据
    }
  },
  computed: {
    filteredPositions() {
      /* return this.JyhjkTableData.filter(item => {
         return (
             (!this.searchKey || item.gwmc.includes(this.searchKey)) &&
             (!this.filterStatus || (item.qydm === this.filterStatus))
         );
       });*/
      return this.JyhjkTableData;
    },
    paginatedPositions() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.filteredPositions.slice(start, end);
    },
    currentImage() {
      return this.previewList[this.currentIndex2] || '';
    }
  },
  beforeDestroy() {
    clearInterval(this.timer);
  },
  async mounted() {
    this.isLoading = true;
    await this.getLoginUser();
    // 自动播放
    this.timer = setInterval(() => {
      this.currentIndex = (this.currentIndex + 1) % this.imgList.length;
    }, this.interval);
    setTimeout(() => {
      this.isLoading = false;
    }, 5000);
  },
  methods: {

    fbsjToDate(fbsj){
      return new Date(fbsj).toLocaleDateString()
    },
    handleCurrentChange(newPage) {
      this.currentPage = newPage;
    },
    handleSizeChange(newSize) {
      this.pageSize = newSize;
      this.currentPage = 1; // 重置到第一页
    },
    // 就业环境管理表格- 删除
    handleDeleteJyhjk(id) {
      // 确认弹窗
      this.$confirm('确认删除该条记录吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log("删除id:", id);
        // 发送请求
        axios.get("/jyhjk/deleteJyhjk?id=" + id).then(response => {
          if (response.data.result) {
            this.$message.success("删除成功！");
            this.getJyhjkTableData();
          } else {
            this.$message.error("删除失败！");
          }
        }).catch(error => {
          console.log(error);
          this.$message.error("删除失败！");
        });
      }).catch(() => {
        // 取消删除
        this.$message.info('已取消删除');
      });


    },
    // 就业环境管理表格- 修改
    handleEditJyhjk(row) {
      console.log("修改行数据:");
      console.log(row);
    },
    formatText(row, column, cellValue) {
      if (cellValue.length === 0) {
        return '-';
      } else {
        return cellValue.length > 25 ? cellValue.slice(0, 10) + '...' : cellValue;
      }
    },
    timeStampToTime(dateString) {
      // 创建一个 Date 对象
      const date = new Date(dateString);

      // 获取 UTC 时间的 ISO 字符串
      const isoString = date.toISOString();

      // 将 ISO 字符串转换为带时区的格式
      const localOffset = date.getTimezoneOffset(); // 获取本地时区偏移（分钟）
      const offsetHours = String(Math.abs(localOffset) / 60).padStart(2, '0'); // 计算小时
      const offsetMinutes = String(Math.abs(localOffset) % 60).padStart(2, '0'); // 计算分钟
      const timezone = (localOffset > 0 ? '-' : '+') + offsetHours + ':' + offsetMinutes; // 生成时区字符串

      // 将 ISO 字符串和时区字符串结合
      const finalISO = isoString.replace('Z', timezone); // 替换末尾的 'Z' 为时区

      return finalISO;
    },
    // 获取就业环境管理数据：岗位，单位，就业环境
    getJyhjkTableData() {
      axios.get("/jyhjk/getGwAndDwAndJhByFbzYhm?fbzyhm=" + this.loginUser.username).then(response => {
        if (response.data.result) {
          /*
          {
            "ID": 1,
            "IMGURL": "/img/upload//1738560492166_.JPG",
            "GWDM": 15,
            "TJSJ": "2025-02-03T05:28:12.423+00:00",
            "GWMC": "实施工程师",
            "DWDM": 1,
            "DWMC": "卫宁",
            "GSMC": "卫宁健康科技集团有限公司",
            "JYHJMS": "时间："
          },
          * */
          this.JyhjkTableData = response.data.data;
          this.total = this.filteredPositions.length; // 设置总数
        } else {
          this.$message.error("获取就业环境管理表数据失败：后台错误！");
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取就业环境管理表数据失败：网络错误！");
      });
    },
    handlePreview2(list, index) {
      this.previewList = list;
      this.currentIndex2 = index;
      this.previewVisible = true;
    },
    prevImage() {
      this.currentIndex2 = (this.currentIndex2 - 1 + this.previewList.length) % this.previewList.length;
    },
    nextImage() {
      this.currentIndex2 = (this.currentIndex2 + 1) % this.previewList.length;
    },
    ShowImgYuLan(url) {
      /*this.dialogImageUrl = url;
      this.dialogVisible = true;*/
    },
    // 提交上传
    async submitUpload() {
      if (this.fileList.length === 0) {
        this.$message.warning("请先选择要上传的图片！");
        return;
      }
      if (this.selectGWinfomationId === null) {
        this.$message.warning("请先选择要上传的图片对应的岗位信息！");
        return;
      }

      const formData = new FormData();
      this.fileList.forEach(file => {
        formData.append("files", file.raw);  // 注意使用 raw 原始文件对象
        console.log(file.raw);
      });
      // 添加发布者信息
      formData.append("gwdm", this.selectGWinfomationId);
      try {
        // 替换为你的上传接口
        await axios.post("/jyhjk/uploadJyhjk", formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        });

        this.$message.success("上传成功！");
        this.currentStep++;// 跳转到下一步
        this.fileList = [];  // 清空文件列表
      } catch (error) {
        this.$message.error("上传失败！");
        console.error("上传错误:", error);
      }
    },
    // 获取当前用户发布的所有图片
    getAllImg() {
      axios.get("/jyhjk/getAllJyhjkByFbzYhm?fbzYhm=" + this.loginUser.username).then(response => {
        if (response.data.result) {
          this.AllJYHJK = response.data.data;
          // 遍历所有图片获取链接
          for (let i = 0; i < response.data.data.length; i++) {
            this.imgList.push(response.data.data[i].imgurl);
          }
          console.log("获取图片成功:");
          console.log(this.imgList);
        } else {
          this.$message.error("获取图片失败！后台错误");
        }
      }).catch(error => {
        console.log(error);
        this.$message.error("获取图片失败！网络错误！");
      });
    },
    prev() {
      this.currentIndex = (this.currentIndex - 1 + this.imgList.length) % this.imgList.length;
    },
    next() {
      this.currentIndex = (this.currentIndex + 1) % this.imgList.length;
    },
    getAllGwByFbzyhm(fbzyhm) {
      axios.get(`/dataGwdmk/getGwdmkDataByFbz?fbzyhm=${fbzyhm}`).then(res => {
        if (res.data.result) {
          this.AllDATAGWDMK = res.data.data;
        } else {
          this.$message.error("获取岗位数据失败！，后台错误");
        }
      }).catch(err => {
        this.$message.error("获取岗位数据失败！，网络错误");
      });
    },
    // 获取登录用户信息
    getLoginUser() {
      axios.get('/user/checkSession').then(response => {
        if (response.data.result) {
          this.loginUser.username = response.data.username;
          this.loginUser.YHSFDM = response.data.YHSFDM;
          this.loginUser.name = response.data.name;//
          // 登录的用户信息:
          console.log("登录的用户信息:")
          console.log(this.loginUser);
          this.getDwYhmDyDw(this.loginUser.username);// 获取单位信息
          // 获取所有岗位信息数据--- 此用户发布的所有岗位信息
          this.getAllGwByFbzyhm(this.loginUser.username);
          this.getAllImg();// 获取当前用户发布的所有图片
          this.getJyhjkTableData(response.data.username);
        } else {
          this.$message.error("当前用户未登录，请先登录！");
          this.$router.push('/dw/login');
        }
      }).catch(error => {
        console.log(error);
      });
    },
    // 通过发布者用户名获取单位信息
    getDwYhmDyDw(yhm) {
      axios.get('/dw/getDwDataByDwUserName?dwUserName=' + yhm).then(response => {
        if (response.data.result) {
          this.DATADWDMK = response.data.data;
        } else {
          this.$message.error("获取单位信息失败！");
          setTimeout(() => {
            this.$router.push('/dw/login');
          }, 3000);
        }
      }).catch(error => {
        console.log(error);
      });
    },
    luodengTime(date) {
      const dateObj = new Date(date);
      const year = dateObj.getFullYear();
      const month = dateObj.getMonth() + 1; // getMonth() 返回的月份是从 0 开始的
      const day = dateObj.getDate();

      const formattedDate = `${year}-${month}-${day.toString().padStart(2, '0')}`;
      //console.log(formattedDate); // 输出: 2025-2-01
      return formattedDate;
    },
    handleFileChange(file, fileList) {
      this.fileList = fileList;
    },
    beforeUpload(file) {
      const isImage = file.type.startsWith("image/");
      const isLt5M = file.size / 1024 / 1024 < 5;

      if (!isImage) {
        this.$message.error("只能上传图片文件！");
        return false;
      }
      if (!isLt5M) {
        this.$message.error("图片大小不能超过5MB！");
        return false;
      }
      return true;
    },
    handleRemove(file) {
      const index = this.fileList.indexOf(file);
      this.fileList.splice(index, 1);
    },
    // 预览图片
    handlePreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
  }
};
</script>

<style scoped>
.job-container {
  max-width: 1200px;
  margin: 20px auto;
}

.job-item {
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
  border: none;
  transition: transform 0.3s;
}

.job-item:hover {
  transform: translateY(-5px);
}

.image-wrapper {
  position: relative;
  cursor: pointer;
  overflow: hidden;
  border-radius: 8px;
}

.hover-mask {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.3);
  opacity: 0;
  transition: opacity 0.3s;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 2rem;
}

.image-wrapper:hover .hover-mask {
  opacity: 1;
}

@media (max-width: 768px) {
  .job-container {
    padding: 0 15px;
  }

  .job-item {
    margin-bottom: 15px;
  }

  .image-wrapper img {
    height: 150px;
  }
}


.el-upload-list__item-thumbnail {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.p-4 {
  padding: 2px !important;
  margin: 2px !important;
}

.p-6 {
  padding: 2px !important;
}

.el-upload-list--picture-card .el-upload-list__item {
  width: 400px !important;
}


.el-carousel__item h3 {
  color: #475669;
  font-size: 18px;
  opacity: 0.75;
  line-height: 300px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n+1) {
  background-color: #d3dce6;
}


.simple-carousel {
  position: relative;
  width: 100%;
}

.carousel-container {
  position: relative;
  overflow: hidden;
}

.carousel-image {
  width: 100%;
  height: 100%;
  object-fit: cover; /* 关键：控制图片填充模式 */
}

/* 过渡动画 */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

/* 切换按钮 */
.carousel-prev,
.carousel-next {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: rgba(0, 0, 0, 0.5);
  color: white;
  border: none;
  padding: 10px 15px;
  cursor: pointer;
  border-radius: 3px;
}

.carousel-prev {
  left: 10px;
}

.carousel-next {
  right: 10px;
}
</style>
