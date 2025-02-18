package org.sems.sems.Controller;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.*;

@RestController
@RequestMapping("/api")
public class FileUploadController {

    // 定义存储目录（根据实际情况修改路径）
    private static final String UPLOAD_DIR = "uploads/";

    // 读取配置文件上传路径
    @Value("${video.upload.dir}")
    private String uploadDir;

    // 读取配置文件浏览器路径
    @Value("${app.domain}")
    private String appDomain;

    @PostMapping("/upload")
    public Map<String, Object> uploadImages(
            @RequestPart("files") MultipartFile[] files,@RequestParam("username") String username ){ // 参数名需与前端formData的key一致


        System.out.println("上传图片的用户名:" + username);
        List<String> filePaths = new ArrayList<>();
        Map<String, Object> result = new HashMap<>();
        try {
            // 获取当前年月日的各自数字
            LocalDate currentDate = LocalDate.now();
            String year = String.valueOf(currentDate.getYear());
            String month = String.valueOf(currentDate.getMonthValue());
            String day = String.valueOf(currentDate.getDayOfMonth());

            System.out.println("年：" + year + "月：" + month + "日：" + day);
            uploadDir=uploadDir+year+"/"+month+"/"+day;


            // 创建存储目录
            Path uploadPath = Paths.get(uploadDir);
            System.out.println("上传目录：" + uploadPath.toString());
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
                System.out.println("目录"+ uploadPath +"不存在，已创建目录成功!");
            }

            // 遍历处理每个文件
            for (MultipartFile file : files) {
                if (file.isEmpty()) {
                    continue; // 跳过空文件
                }

                // 生成唯一文件名（防止重名覆盖）
                String originalFilename = file.getOriginalFilename();// 获取原始文件名

                // 获取当前时间戳
                String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));// 从原始文件名中获取文件扩展名
                String uniqueFileName = String.valueOf(System.currentTimeMillis()) + "_"  + fileExtension;// 加上文件扩展名 UUID.randomUUID()生成唯一的字符串


                // 保存文件到本地
                Path filePath = uploadPath.resolve(uniqueFileName);
                System.out.println("上传文件路径：" + filePath);
                System.out.println("浏览器路径:"+appDomain+year+"/"+month+"/"+day+"/"+uniqueFileName);

                Files.copy(file.getInputStream(), filePath);
                filePaths.add(filePath.toString());
            }

          /*  return ResponseEntity.ok(new UploadResult(true, "上传成功", filePaths));*/

            result.put("result", true);
            result.put("message", "success");
            result.put("data", filePaths);
            return   result;

        } catch (IOException e) {
            /*return ResponseEntity.internalServerError()
                    .body(new UploadResult(false, "上传失败: " + e.getMessage(), null));*/
            result.put("result", false);
            result.put("message", "error: " + e.getMessage());
            result.put("data", null);
            return result;
        }
    }

  /*  // 响应结果封装
    @Data
    private static class UploadResult {
        private boolean success;// 是否成功
        private String message; // 信息
        private List<String> filePaths; // 文件路径

        // 构造函数
        public UploadResult(boolean success, String message, List<String> filePaths) {
            this.success = success;
            this.message = message;
            this.filePaths = filePaths;
        }
    }*/
}