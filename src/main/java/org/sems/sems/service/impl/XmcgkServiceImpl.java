package org.sems.sems.service.impl;

import org.sems.sems.Mapper.XmcgkMapper;
import org.sems.sems.entity.Xmcgk;
import org.sems.sems.entity.Xszsk;
import org.sems.sems.service.XmcgkService;
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
public class XmcgkServiceImpl implements XmcgkService {
    @Autowired
    private XmcgkMapper xmcgkMapper;
    /**
     * 插入新项目
     *
     * @param xmcgk
     * @return
     */
    @Override
    public Map<String, Object> insertXmcgk(Xmcgk xmcgk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if(xmcgkMapper.insertXmcgk(xmcgk) > 0){
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", xmcgk);
                result.put("result", true);
            }else{
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", xmcgk);
                result.put("result", false);
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
        }
        return result;
    }
    /**
     * 更新项目信息
     *
     * @param xmcgk
     * @return
     */
    @Override
    public Map<String, Object> updateXmcgk(Xmcgk xmcgk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if(xmcgkMapper.updateXmcgk(xmcgk) > 0){
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", xmcgk);
                result.put("result", true);
            }else{
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", xmcgk);
                result.put("result", false);
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
        }
        return result;
    }
    @Autowired
    private JdbcTemplate jdbcTemplate;
    /**
     * 获取项目信息
     *
     * @param  QYDM  启用代码
     * @param  ISGETALL  是否获取全部
     *                    1 获取启用的，0 获取不启用的 ，-1获取全部
     * @param STUID 学生ID
     * @return
     */
    @Override
    public Map<String, Object> getXmcgk(int QYDM, int ISGETALL, int STUID) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            /*
                 @QYDM int ,--1 只获取启用的，0 只获取不启用的 ，-1获取全部
                 @JUSTONE int, -- 1 只获取一条，0 获取多一条
                 @GGID int  -- 公告ID，当@JUSTONE为1时才会用到
            * */
            List<Map<String, Object>> resultList = new ArrayList<>();
            resultList = jdbcTemplate.queryForList(
                    "{call usp_GetStudentXmcg(?,?,?)}", QYDM, ISGETALL, STUID);
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
     * 上传附件
     *
     * @param id   项目ID
     * @param cgfj 附件文件
     * @return 上传结果
     */
    @Override
    public Map<String, Object> uploadFJFile(Integer id, MultipartFile cgfj) {
        Map<String, Object> result = new HashMap<>();
        try {
            Map<String, String> urls = new HashMap<>();
            Xmcgk xmcgk = new Xmcgk();
            // 处理证书附件
            if (cgfj != null && !cgfj.isEmpty()) {
                String attachmentPath = saveFile(cgfj, "XMCGK");
                urls.put("url", folderName + "XMCGK/" + attachmentPath);
                // 数据更新
                xmcgk.setId(id);
                xmcgk.setXmfj(urls.get("url"));
                xmcgkMapper.updateXmcgk(xmcgk);
            }else {
                urls.put("url", "file is null or empty!");
            }

            result.put("code", 200);
            result.put("result", true);
            result.put("data", urls.get("url"));
        } catch (Exception e) {
            result.put("result", false);
            result.put("code", 500);
            result.put("message", "file upload error: " + e.getMessage());
        }
        return result;
    }


    // 保持原始配置项名称不变
    @Value("${video.upload.dir}")
    private String uploadDir;

    @Value("${app.WenJianJiaName}")
    private String folderName;

    private String saveFile(MultipartFile file, String fileType) throws IOException {
        // 构建存储路径：video.upload.dir + WenJianJiaName + 文件类型目录
        Path storagePath = Paths.get(uploadDir,"XMCGK/" );
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
