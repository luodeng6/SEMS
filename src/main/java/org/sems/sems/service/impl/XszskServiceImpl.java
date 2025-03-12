package org.sems.sems.service.impl;

import org.sems.sems.Mapper.XszskMapper;
import org.sems.sems.entity.Xszsk;
import org.sems.sems.service.XszskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class XszskServiceImpl implements XszskService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private XszskMapper xszskMapper;

    /**
     * 获取学生证书
     *
     * @return 学生证书信息
     */
    @Override
    public Map<String, Object> getXszsk(Integer QYDM, Integer ISGETALL, Integer STUID) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 获取学生证书信息
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_GetStudentXSZSK(?,?,?)}", QYDM, ISGETALL, STUID);
            resultMap.put("data", resultList);
            resultMap.put("code", 200);
            resultMap.put("msg", "success");
            resultMap.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 添加学生证书
     *
     * @param xszsk 学生证书信息
     * @return 学生证书信息
     */
    @Override
    public Map<String, Object> addXszsk(Xszsk xszsk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理更新面试信息逻辑
            if (xszskMapper.insertXszsk(xszsk) > 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data", xszsk);
            } else {
                resultMap.put("code", 500);
                resultMap.put("msg", "database error");
                resultMap.put("result", false);
                resultMap.put("data", xszsk);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }


    /**
     * 修改学生证书
     *
     * @param xszsk 学生证书信息
     * @return 学生证书信息
     */
    @Override
    public Map<String, Object> updateXszsk(Xszsk xszsk) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理更新面试信息逻辑
            if (xszskMapper.updateXszsk(xszsk) > 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
            } else {
                resultMap.put("code", 500);
                resultMap.put("msg", "database error");
                resultMap.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 删除学生证书
     *
     * @param id 学生证书ID
     * @return 学生证书信息
     */
    @Override
    public Map<String, Object> deleteXszsk(Integer id) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理更新面试信息逻辑
            if (xszskMapper.deleteXszsk(id) > 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
            } else {
                resultMap.put("code", 500);
                resultMap.put("msg", "database error");
                resultMap.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("data", e.getMessage());
        }
        return resultMap;
    }

    // 保持原始配置项名称不变
    @Value("${video.upload.dir}")
    private String uploadDir;

    @Value("${app.WenJianJiaName}")
    private String folderName;

    public Map<String, Object> uploadFile(Integer id, MultipartFile zszp, MultipartFile zsfj) {
        Map<String, Object> result = new HashMap<>();
        try {
            Map<String, String> urls = new HashMap<>();
            Xszsk xszsk = new Xszsk();
            // 处理证书照片
            if (zszp != null && !zszp.isEmpty()) {
                String photoPath = saveFile(zszp, "photos");
                urls.put("photoUrl", folderName + "XSZSK/photos/" + photoPath);
                // 数据更新
                xszsk.setId(id);
                xszsk.setZszp(urls.get("photoUrl"));
                xszskMapper.updateXszsk(xszsk);
            }else {
                urls.put("photoUrl", "no photo");
            }

            // 处理证书附件
            if (zsfj != null && !zsfj.isEmpty()) {
                String attachmentPath = saveFile(zsfj, "attachments");
                urls.put("attachmentUrl", folderName + "XSZSK/attachments/" + attachmentPath);
                // 数据更新
                xszsk.setId(id);
                xszsk.setZsfj(urls.get("attachmentUrl"));
                xszskMapper.updateXszsk(xszsk);
            }else {
                urls.put("attachmentUrl", "no attachment");
            }

            result.put("code", 200);
            result.put("result", true);
            result.put("data", urls);
        } catch (Exception e) {
            result.put("result", false);
            result.put("code", 500);
            result.put("message", "文件上传失败: " + e.getMessage());
        }
        return result;
    }

    private String saveFile(MultipartFile file, String fileType) throws IOException {
        // 构建存储路径：video.upload.dir + WenJianJiaName + 文件类型目录
        Path storagePath = Paths.get(uploadDir,"XSZSK/" ,fileType);
        if (!Files.exists(storagePath)) {
            Files.createDirectories(storagePath);
        }

        // 生成文件名：时间戳_原始文件名
        String originName = file.getOriginalFilename();
        String fileName = System.currentTimeMillis() + "_" + (originName != null ? originName : "file");

        // 保存文件
        Files.copy(file.getInputStream(), storagePath.resolve(fileName));
        return fileName;
    }
}
