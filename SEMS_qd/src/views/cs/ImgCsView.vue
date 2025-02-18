<template>
  <div>
    <!-- 图片上传组件
       <el-upload
        action="#"  // 禁用默认上传地址
        list-type="picture-card"
        :auto-upload="false"  // 关闭自动上传
        :on-change="handleFileChange"
        :file-list="fileList"
        :limit="9"  // 最大上传数量
        multiple
        :before-upload="beforeUpload">
    -->
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
      <!-- 自定义文件列表显示 -->
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

    <!-- 预览对话框 -->
    <el-dialog :visible.sync="dialogVisible" append-to-body>
      <img width="100%" :src="dialogImageUrl" alt="预览大图"/>
    </el-dialog>

    <!-- 手动上传按钮 -->
    <el-button type="primary" @click="submitUpload">立即上传</el-button>
  </div>
</template>

<script>
import { mapActions } from "vuex";
import axios from "axios";
export default {
  data() {
    return {
      fileList: [],        // 文件列表
      dialogVisible: false, // 预览对话框状态
      dialogImageUrl: ""   // 预览图片地址
    };
  },
  methods: {
    // 文件状态改变时的回调
    handleFileChange(file, fileList) {
      this.fileList = fileList;
    },

    // 文件校验（在添加文件时触发）
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

    // 删除文件
    handleRemove(file) {
      const index = this.fileList.indexOf(file);
      this.fileList.splice(index, 1);
    },

    // 预览图片
    handlePreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },

    // 手动上传
    async submitUpload() {
      if (this.fileList.length === 0) {
        this.$message.warning("请先选择要上传的图片！");
        return;
      }

      const formData = new FormData();
      this.fileList.forEach(file => {
        formData.append("files", file.raw);  // 注意使用 raw 原始文件对象
        console.log(file.raw);
      });
      // 添加发布者信息
      formData.append("username", "luo");


      try {
        // 替换为你的上传接口
        await axios.post("/api/upload", formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        });

        this.$message.success("上传成功！");
        this.fileList = [];  // 清空文件列表
      } catch (error) {
        this.$message.error("上传失败！");
        console.error("上传错误:", error);
      }
    }
  }
};
</script>

<style>
.el-upload-list__item-thumbnail {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>