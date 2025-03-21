package org.sems.sems.service.impl;

import org.sems.sems.Mapper.DwzpggkMapper;
import org.sems.sems.entity.Dwzpggk;
import org.sems.sems.service.DwzpggkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DwzpggkServiceImpl implements DwzpggkService {
   

    // 读取配置文件上传路径
    @Value("${video.upload.dir}")
    private String uploadDir;

    // 读取配置文件浏览器路径
    @Value("${app.domain}")
    private String appDomain;

    @Value("${app.WenJianJiaName}")
    private String WenJianJiaName;


    @Autowired
    private DwzpggkMapper dwzpggkMapper;

    /**
     * 上传公告的图片
     *
     * @param file
     * @return
     */
    @Override
    public Map<String, Object> uploadDwZpggkImg(MultipartFile file) {
        Map<String, Object> result = new HashMap<>();
        try {
            // 创建存储目录
            Path uploadPath = Paths.get(uploadDir);
            System.out.println("上传目录：" + uploadPath.toString());

            // 生成唯一文件名（防止重名覆盖）
            String originalFilename = file.getOriginalFilename();// 获取原始文件名

            // 获取当前时间戳
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));// 从原始文件名中获取文件扩展名
            String uniqueFileName = String.valueOf(System.currentTimeMillis()) + "_" + fileExtension;// 加上文件扩展名 UUID.randomUUID()生成唯一的字符串
            System.out.println("唯一文件名：" + uniqueFileName);
            System.out.println("原始文件名：" + originalFilename);
            System.out.println("文件扩展名：" + fileExtension);
            System.out.println("文件大小：" + file.getSize());
            System.out.println("文件类型：" + file.getContentType());
            System.out.println("新文件名：" + uniqueFileName);
            System.out.println("最终上场地址：" + uploadPath.toString() + "/" + "DwzpGg/" + uniqueFileName);

            String ZuiZhongUrl = uploadPath.toString() + "/" + "DwzpGg/" + uniqueFileName;
            System.out.println("最终上场地址2组合：" + ZuiZhongUrl);

            if (!Files.exists(Path.of(uploadPath.toString() + "/" + "DwzpGg/"))) {
                Files.createDirectories(Path.of(uploadPath.toString() + "/" + "DwzpGg/"));
                System.out.println("目录" + uploadPath.toString() + "/" + "DwzpGg/" + "不存在，已创建目录成功!");
            }

            // 保存文件到本地
            Path filePath = Paths.get(ZuiZhongUrl);
            System.out.println("上传文件路径：" + filePath);
            System.out.println("浏览器路径:" + appDomain + "DwzpGg/" + uniqueFileName);
            Files.copy(file.getInputStream(), filePath);
            result.put("code", 200);
            result.put("result", true);
            result.put("message", "success");
            result.put("data", WenJianJiaName + "DwzpGg/" + uniqueFileName);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", false);
            result.put("code", 500);
            result.put("message", e.getMessage());
        }
        return result;
    }

    /**
     * 添加公告
     *
     * @param dwzpggk
     * @return map
     */
    @Override
    public Map<String, Object> addDwZpggk(Dwzpggk dwzpggk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (dwzpggkMapper.insertDwzpggk(dwzpggk) > 0){
                result.put("result",true);
                result.put("code", 200);
                result.put("msg", "success");
            }else{
                result.put("result",false);
                result.put("code", 500);
                result.put("msg", "database error");
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("result", false);
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("error", e.getMessage());
        }
        return result;
    }

    /**
     * 更新公告
     *
     * @param dwzpggk 公告实体
     * @return map
     */
    @Override
    public Map<String, Object> updateDwZpggk(Dwzpggk dwzpggk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (dwzpggkMapper.updateDwzpggk(dwzpggk) > 0){
                result.put("result",true);
                result.put("code", 200);
                result.put("msg", "success");
            }else{
                result.put("result",false);
                result.put("code", 500);
                result.put("msg", "database error");
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("result", false);
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("error", e.getMessage());
        }
        return result;
    }

    @Autowired
    private JdbcTemplate jdbcTemplate;
    /**
     * 用户查询公告
     *
     * @param YHSFDM 用户身份代码
     *               YHM 用户名
     *               QYDM  启用代码
     * @param YHM    用户名
     * @param QYDM   启用代码
     * @return map
     */
    @Override
    public Map<String, Object> getDwZpggk(Integer YHSFDM, String YHM, Integer QYDM,Integer JUSTONE ,Integer GGID) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取待确认面试列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
          /*  System.out.println("YHSFDM:" + YHSFDM);
            System.out.println("YHM:" + YHM);
            System.out.println("QYDM:" + QYDM);
            System.out.println("JUSTONE:" + JUSTONE);
            System.out.println("GGID:" + GGID);*/

            resultList = jdbcTemplate.queryForList(
                    "{call usp_AllUserGetGongGaoData(?,?,?,?,?)}", YHSFDM, YHM, QYDM, JUSTONE , GGID);
            resultMap.put("data", resultList);
            resultMap.put("code", 200);
            resultMap.put("msg", "success");
            resultMap.put("result", true);
        }catch (Exception e){
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }
}
