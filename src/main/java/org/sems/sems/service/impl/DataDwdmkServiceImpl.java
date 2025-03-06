package org.sems.sems.service.impl;


import org.sems.sems.Mapper.DataDwdmkMapper;
import org.sems.sems.Mapper.DataGwdmkMapper;
import org.sems.sems.entity.DataDwdmk;
import org.sems.sems.entity.DataGwdmk;
import org.sems.sems.service.DataDwdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 单位代码库(DataDwdmk)表服务实现类
 *
 * @author makejava
 * @since 2024-12-05 23:23:31
 */
@Service("dataDwdmkService")
public class DataDwdmkServiceImpl implements DataDwdmkService {

    @Autowired
    private DataDwdmkMapper dataDwdmkMapper;
    @Autowired
    private DataGwdmkMapper dataGwdmkMapper;

    /**
     * 获取所有单位代码库(DataDwdmk)表数据
     */
    @Override
    public Map<String, Object> getAllDataDwdmk() {
        Map<String, Object> result = new HashMap<>();
        // TODO: 获取所有单位代码库(DataDwdmk)表数据
        try {
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dataDwdmkMapper.getAllDataDwdmk());
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("error", e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 停用单位代码库(DataDwdmk)表数据
     *
     * @param DWDM
     */
    @Override
    public Map<String, Object> disableDataDwdmk(int DWDM) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 停用单位代码库(DataDwdmk)表数据
        try {
            if (dataDwdmkMapper.tinyongDataDwdmk(DWDM) != 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 405);
                result.put("msg", "database error");
                result.put("result", false);
                result.put("error", "停用失败");
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("error", e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取单位发布的所有岗位
     *
     * @param DWDM
     */
    @Override
    public Map<String, Object> getDwGangWei(int DWDM) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 获取单位发布的所有岗位
        try {
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dataGwdmkMapper.getALlGwByDwdm(DWDM));
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("error", e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 更新单位基本信息
     *
     * @param dataDwdm
     * @return
     */

    @Override
    @Transactional
    public Map<String, Object> updateDataDwdmk(DataDwdmk dataDwdm) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 更新单位基本信息
        try {
            if (dataDwdmkMapper.updateDataDwdmk(dataDwdm) != 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 405);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
        }
        return result;
    }

    /**
     * 新增单位基础信息
     *
     * @param dataDwdm
     */
    @Override
    public Map<String, Object> addDataDwdmk(DataDwdmk dataDwdm) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 新增单位基础信息
        try {
            if (dataDwdmkMapper.AddDataDwdmk(dataDwdm) != 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", dataDwdm);
                result.put("result", true);
            } else {
                result.put("code", 405);
                result.put("data", dataDwdm);
                result.put("msg", "database error");
                result.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
        }
        return result;
    }

    /**
     * 根据单位用户的用户名获取单位信息
     *
     * @param dwUserName
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getDwDataByDwUserName(String dwUserName) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 根据单位用户的用户名获取单位信息
        try {
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dataDwdmkMapper.getDwDataByDwUserName(dwUserName));
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("error", e.getMessage());
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据单位启用状态 获取单位信息
     *
     * @param qydm 启用代码
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getDwByQydm(int qydm) {
        Map<String, Object> result = new HashMap<>();
        // TODO: 根据单位启用状态 获取单位信息
        try {
            result.put("code", 200);
            result.put("msg", "success");
            result.put("data", dataDwdmkMapper.getAllDwDataByQydm(qydm));
            result.put("result", true);
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("error", e.getMessage());
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
     * 上传单位简介里的图片
     *
     * @param file
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> uploadGsjjImg(MultipartFile file) {
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
            System.out.println("最终上场地址：" + uploadPath.toString() + "/" + "Wangeditor/" + uniqueFileName);

            String ZuiZhongUrl = uploadPath.toString() + "/" + "Wangeditor/" + uniqueFileName;
            System.out.println("最终上场地址2组合：" + ZuiZhongUrl);

            if (!Files.exists(Path.of(uploadPath.toString() + "/" + "Wangeditor/"))) {
                Files.createDirectories(Path.of(uploadPath.toString() + "/" + "Wangeditor/"));
                System.out.println("目录" + uploadPath.toString() + "/" + "Wangeditor/" + "不存在，已创建目录成功!");
            }

            // 保存文件到本地
            Path filePath = Paths.get(ZuiZhongUrl);
            System.out.println("上传文件路径：" + filePath);
            System.out.println("浏览器路径:" + appDomain + "Wangeditor/" + uniqueFileName);
            Files.copy(file.getInputStream(), filePath);
            result.put("code", 200);
            result.put("result", true);
            result.put("message", "success");
            result.put("data", WenJianJiaName + "Wangeditor/" + uniqueFileName);

        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", false);
            result.put("code", 500);
            result.put("message", e.getMessage());
        }
        return result;
    }

    /**
     * 上传视频文件
     *
     * @param videoFile 视频文件
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> uploadVideoFile(MultipartFile videoFile) {

        Map<String, Object> result = new HashMap<>();
        try {
            // 创建存储目录
            Path uploadPath = Paths.get(uploadDir);
            System.out.println("上传目录：" + uploadPath.toString());

            // 生成唯一文件名（防止重名覆盖）
            String originalFilename = videoFile.getOriginalFilename();// 获取原始文件名

            // 获取当前时间戳
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));// 从原始文件名中获取文件扩展名
            String uniqueFileName = String.valueOf(System.currentTimeMillis()) + "_" + fileExtension;// 加上文件扩展名 UUID.randomUUID()生成唯一的字符串
            System.out.println("唯一文件名：" + uniqueFileName);
            System.out.println("原始文件名：" + originalFilename);
            System.out.println("文件扩展名：" + fileExtension);
            System.out.println("文件大小：" + videoFile.getSize());
            System.out.println("文件类型：" + videoFile.getContentType());
            System.out.println("新文件名：" + uniqueFileName);
            System.out.println("最终上场地址：" + uploadPath.toString() + "/" + "Wangeditor/" + uniqueFileName);

            String ZuiZhongUrl = uploadPath.toString() + "/" + "Wangeditor/" + uniqueFileName;
            System.out.println("最终上场地址2组合：" + ZuiZhongUrl);

            if (!Files.exists(Path.of(uploadPath.toString() + "/" + "Wangeditor/"))) {
                Files.createDirectories(Path.of(uploadPath.toString() + "/" + "Wangeditor/"));
                System.out.println("目录" + uploadPath.toString() + "/" + "Wangeditor/" + "不存在，已创建目录成功!");
            }

            // 保存文件到本地
            Path filePath = Paths.get(ZuiZhongUrl);
            System.out.println("上传文件路径：" + filePath);
            System.out.println("浏览器路径:" + appDomain + "Wangeditor/" + uniqueFileName);
            Files.copy(videoFile.getInputStream(), filePath);


            // 6. 构造返回数据，与前端 customInsert 期望的格式匹配
            result.put("code", 200);
            result.put("message", "上传成功");
            // 返回视频的访问路径（这里假设是本地路径，生产环境应返回实际URL）
            result.put("data", WenJianJiaName + "Wangeditor/" + uniqueFileName);

        } catch (IOException e) {
            // 7. 异常处理
            result.put("code", 500);
            result.put("message", "视频上传失败: " + e.getMessage());
        }
        System.out.println(result);
        return result;
    }

    /**
     * 上传单位logo
     *
     * @param file 图片文件
     * @param dwdm 单位代码
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> uploadDwLogo(MultipartFile file, int dwdm) {
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
            System.out.println("最终上场地址：" + uploadPath.toString() + "/" + "DwLogo/" + uniqueFileName);

            String ZuiZhongUrl = uploadPath.toString() + "/" + "DwLogo/" + uniqueFileName;
            System.out.println("最终上场地址2组合：" + ZuiZhongUrl);

            if (!Files.exists(Path.of(uploadPath.toString() + "/" + "DwLogo/"))) {
                Files.createDirectories(Path.of(uploadPath.toString() + "/" + "DwLogo/"));
                System.out.println("目录" + uploadPath.toString() + "/" + "DwLogo/" + "不存在，已创建目录成功!");
            }

            if (dataDwdmkMapper.updateDwLogo(dwdm, WenJianJiaName + "DwLogo/" + uniqueFileName) != 0) {
                // 保存文件到本地
                Path filePath = Paths.get(ZuiZhongUrl);
                System.out.println("上传文件路径：" + filePath);
                System.out.println("浏览器路径:" + appDomain + "DwLogo/" + uniqueFileName);
                Files.copy(file.getInputStream(), filePath);
                result.put("code", 200);
                result.put("result", true);
                result.put("message", "success");
                result.put("data", WenJianJiaName + "DwLogo/" + uniqueFileName);
            } else {
                result.put("code", 504);
                result.put("result", false);
                result.put("message", "database error");
                result.put("data", WenJianJiaName + "DwLogo/" + uniqueFileName);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", false);
            result.put("code", 500);
            result.put("message", e.getMessage());
        }
        return result;
    }


}
