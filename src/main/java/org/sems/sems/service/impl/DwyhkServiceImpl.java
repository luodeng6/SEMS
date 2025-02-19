package org.sems.sems.service.impl;

import org.sems.sems.Mapper.DwyhkMapper;
import org.sems.sems.entity.Dwyhk;
import org.sems.sems.service.DwyhkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcOperations;
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
public class DwyhkServiceImpl implements DwyhkService {
    @Autowired
    private DwyhkMapper dwyhkMapper;

    /**
     * 获取所有单位用户信息
     *
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getAllDwyhk() {
        Map<String, Object> result = new HashMap<>();
        // TODO: 获取所有单位用户信息
        try {
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dwyhkMapper.selectAllDwyhk());
            result.put("result", true);

        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", null);
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 更新单位用户信息:停用标志
     *
     * @param yhm  用户名
     * @param tybz 停用标志
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> updateDwyhkTYBZ(String yhm, int tybz) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 更新单位用户信息:停用标志
        try {
            if (dwyhkMapper.updateDwyhkTYBZ(yhm, tybz) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database failed");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 新增单位用户信息
     *
     * @param dwyhk
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> addDwyhk(Dwyhk dwyhk) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 新增单位用户信息
        try {
            if (dwyhkMapper.addDwyhk(dwyhk) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database failed");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 更新单位用户信息
     *
     * @param dwyhk 单位用户信息实体类
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> updateDwyhk(Dwyhk dwyhk) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 更新单位用户信息
        try {
            if (dwyhkMapper.AdminUpdateDwyhkData(dwyhk) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database failed");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            e.printStackTrace();
        }
        return result;
    }

    @Autowired
    private JdbcTemplate jdbcTemplate;


    /**
     * 根据位用户名 获取单位用户全部数据+单位信息+发布岗位数量
     *
     * @param yhm 用户名
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getDwyhkAndDwDataAndPostCountByYhm(String yhm) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 根据位用户名 获取单位用户全部数据+单位信息+发布岗位数量
        try {
            List<Map<String, Object>> userList = jdbcTemplate.queryForList("{call usp_GetDwyhData(?)}", yhm);
            System.out.println("执行存储过程:单位用户数据接口成功！");
            if (userList.size() > 1) {
                result.put("code", 504);
                result.put("msg", "database get so many data!");
                result.put("data", userList);
                result.put("result", false);
            } else {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", userList.get(0));
                result.put("result", true);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("data", null);
            result.put("result", false);
            e.printStackTrace();
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
     * 上传单位照片
     *
     * @param file 头像数据
     * @param yhm  用户名
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> uploadPhoto(MultipartFile file, String yhm) {
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
            System.out.println("最终上场地址：" + uploadPath.toString() + "/"+"Userpofile/" + uniqueFileName);

            String ZuiZhongUrl=uploadPath.toString() + "/"+"Userpofile/"+yhm+"_"+  uniqueFileName;
            System.out.println("最终上场地址2组合：" + ZuiZhongUrl);

            if (!Files.exists(Path.of(uploadPath.toString() + "/"+"Userpofile/"))) {
                Files.createDirectories(Path.of(uploadPath.toString() + "/" + "Userpofile/"));
                System.out.println("目录" + uploadPath.toString() + "/"+"Userpofile/" + "不存在，已创建目录成功!");
            }

            // 保存文件到本地
            Path filePath = Paths.get(ZuiZhongUrl);
            System.out.println("上传文件路径：" + filePath);
            System.out.println("浏览器路径:" + appDomain  +"Userpofile/" + yhm+"_"+uniqueFileName);
            Files.copy(file.getInputStream(), filePath);

            if (dwyhkMapper.updateDwPhoto(yhm,WenJianJiaName+"Userpofile/" +yhm+"_"+uniqueFileName) != 0) {
                result.put("code", 200);
                result.put("result", true);
                result.put("msg", "success");
                result.put("data", WenJianJiaName+"Userpofile/" +yhm+"_"+uniqueFileName);

            } else {
                result.put("code", 504);
                result.put("result", false);
                result.put("msg", "database error");
                result.put("data", null);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", false);
            result.put("code", 500);
            result.put("msg", e.getMessage());

        }
        return result;
    }
}
