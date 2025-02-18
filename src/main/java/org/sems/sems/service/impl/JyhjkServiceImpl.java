package org.sems.sems.service.impl;

import org.sems.sems.Mapper.JyhjkMapper;
import org.sems.sems.entity.Jyhjk;
import org.sems.sems.service.JyhjkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JyhjkServiceImpl implements JyhjkService {

    @Autowired
    private JyhjkMapper jyhjkMapper;

    /**
     * 根据岗位代码获取就业环境库
     *
     * @param gwdm 岗位代码
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getJyhjkByGwdm(int gwdm) {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("code", 200);
            result.put("msg", "success,gwdm:"+gwdm);
            result.put("data", jyhjkMapper.SelectAllJYHJKByGwdm(gwdm));
            result.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("data", e.getMessage());
        }
        return result;
    }

    // 读取配置文件上传路径
    @Value("${video.upload.dir}")
    private String uploadDir;

    // 读取配置文件浏览器路径
    @Value("${app.domain}")
    private String appDomain;

    @Value("${app.WenJianJiaName}")
    private String WenJianJiaName;
    /**
     * 上传就业环境库
     *
     * @param files
     * @param gwdm
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> uploadJyhjk(MultipartFile[] files, String gwdm) {
        System.out.println("上传图片的岗位代码" + gwdm);
        List<String> filePaths = new ArrayList<>();
        Map<String, Object> result = new HashMap<>();
        try {
            // 获取当前年月日的各自数字
          /*  LocalDate currentDate = LocalDate.now();
            String year = String.valueOf(currentDate.getYear());
            String month = String.valueOf(currentDate.getMonthValue());
            String day = String.valueOf(currentDate.getDayOfMonth());*/

         /*   System.out.println("年：" + year + "月：" + month + "日：" + day);*/
           /* uploadDir=uploadDir+year+"/"+month+"/"+day;*/


            // 创建存储目录
            Path uploadPath = Paths.get(uploadDir);
            System.out.println("上传目录：" + uploadPath.toString());
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
                System.out.println("目录"+ uploadPath +"不存在，已创建目录成功!");
            }

            List<String> ImgUrl = new ArrayList<>();

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
                System.out.println("唯一文件名：" + uniqueFileName);
                System.out.println("原始文件名：" + originalFilename);
                System.out.println("文件扩展名：" + fileExtension);
                System.out.println("文件大小：" + file.getSize());
                System.out.println("文件类型：" + file.getContentType());
                System.out.println("新文件名："+uniqueFileName);
                System.out.println("最终上场地址："+uploadPath.toString()+"/"+uniqueFileName);

                // 保存文件到本地
                Path filePath = Paths.get(uploadPath.toString()+"/"+uniqueFileName); /*uploadPath.resolve(uniqueFileName)*/
                System.out.println("上传文件路径：" + filePath);
                System.out.println("浏览器路径:"+appDomain+"/"+uniqueFileName);

                Files.copy(file.getInputStream(), filePath);
                filePaths.add(filePath.toString());
                ImgUrl.add(WenJianJiaName+uniqueFileName);
            }

            for (String ImgUrl1 : ImgUrl){
                jyhjkMapper.InsertJYHJK2(ImgUrl1,gwdm);
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

    /**
     * 通过发布者用户名获取所有就业环境库图片数据
     *
     * @param fbzYhm
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getAllJyhjkByFbzYhm(String fbzYhm) {
        Map<String, Object> result = new HashMap<>();
        try{
            result.put("code", 200);
            result.put("msg", "success,fbzYhm:"+fbzYhm);
            result.put("data", jyhjkMapper.SelectAllJYHJKByFbzYhm(fbzYhm));
            result.put("result", true);
        }catch (Exception e){
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("data", e.getMessage());
        }
        return result;
    }


    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 通过发布者用户名获取岗位、单位、就业环境库
     *
     * @param fbzyhm 发布者用户名
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getGwAndDwAndJhByFbzYhm(String fbzyhm) {
        // queryForList 是 Spring Framework 中 JdbcTemplate 类的一个方法，用于执行 SQL 查询并将结果映射为一个 List。
        // 这个方法非常适合用于从数据库中检索多行数据，并将每一行的数据封装成一个 Map 或者自定义对象
        Map<String, Object> result = new HashMap<>();
        try {
            System.out.println("发布者用户名："+fbzyhm);
            List<Map<String, Object>> JyhjkList = jdbcTemplate.queryForList(
                    "{call usp_GetJyhjkByFbzyhm(?)}", fbzyhm);
            System.out.println("调用usp_GetJyhjkByFbzyhm存储过程成功：");
            System.out.println(JyhjkList);
            result.put("code", 200);
            result.put("msg", "success,fbzYhm:" + fbzyhm);
            result.put("data", JyhjkList);
            result.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("data", e.getMessage());
        }
        return result;
    }

    /**
     * 删除就业环境库 通过id
     *
     * @param id 就业环境库id
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> deleteJyhjkById(int id) {
       Map<String, Object> result = new HashMap<>();
       try{
           if(jyhjkMapper.deleteJYHJKById(id)>0){
               result.put("result", true);
               result.put("message", "success");
               result.put("data", id);
               result.put("code", 200);
           }else{
               result.put("code", 504);
               result.put("data", id);
               result.put("result", false);
               result.put("message", "database error");
           }
       }catch (Exception e){
           e.printStackTrace();
           result.put("result", false);
           result.put("message", "server error: " + e.getMessage());
           result.put("data", id);
           result.put("code", 500);
       }
       return result;
    }
}
