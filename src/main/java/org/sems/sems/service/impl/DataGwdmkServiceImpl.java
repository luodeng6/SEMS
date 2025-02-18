package org.sems.sems.service.impl;

import lombok.AllArgsConstructor;
import org.sems.sems.Mapper.DataGwdmkMapper;
import org.sems.sems.entity.DataGwdmk;
import org.sems.sems.service.DataGwdmkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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


/**
 * 岗位代码库(DataGwdmk)表服务实现类
 *
 * @author makejava
 * @since 2024-12-05 23:23:31
 */
@Service("dataGwdmkService")
public class DataGwdmkServiceImpl implements DataGwdmkService {
    @Autowired
    private DataGwdmkMapper dataGwdmkMapper;

    /**
     * 获取所有岗位代码库数据
     *
     * @return
     */
    @Override
    public Map<String, Object> getDataGwdmk() {
        Map<String, Object> dataGwdmk = new HashMap<>();
        try {
            dataGwdmk.put("code", 200);
            dataGwdmk.put("msg", "success");
            dataGwdmk.put("data", dataGwdmkMapper.getALlGwdmkData());
            dataGwdmk.put("result", true);

        } catch (Exception e) {
            dataGwdmk.put("code", 500);
            dataGwdmk.put("msg", "server error");
            dataGwdmk.put("result", false);
            e.printStackTrace();
        }
        return dataGwdmk;
    }

    /**
     * 获取火热岗位：前7个
     */
    @Override
    public Map<String, Object> getHotDataGwdmk(int num) {
        Map<String, Object> dataGwdmk = new HashMap<>();
        try {
            List<DataGwdmk> allDataGwdmk = dataGwdmkMapper.getHotDataGwdmk();
            dataGwdmk.put("code", 200);
            dataGwdmk.put("msg", "success");
            dataGwdmk.put("data", allDataGwdmk.subList(0, Math.min(num, allDataGwdmk.size())));
            dataGwdmk.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            dataGwdmk.put("code", 500);
            dataGwdmk.put("msg", "server error");
            dataGwdmk.put("result", false);
        }
        return dataGwdmk;
    }

    /**
     * 停用岗位代码
     *
     * @param id 岗位代码id
     */
    @Override
    public Map<String, Object> endUsingGangWei(int id) {
        Map<String, Object> dataGwdmk = new HashMap<>();
        try {
            if (dataGwdmkMapper.endUsingGangWei(id) != 0) {
                dataGwdmk.put("code", 200);
                dataGwdmk.put("msg", "success");
                dataGwdmk.put("result", true);
            } else {
                dataGwdmk.put("code", 504);
                dataGwdmk.put("msg", "database error");
                dataGwdmk.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            dataGwdmk.put("code", 500);
            dataGwdmk.put("msg", "server error");
            dataGwdmk.put("result", false);
        }
        return dataGwdmk;
    }

    /**
     * 启用岗位代码
     *
     * @param id 岗位代码id
     */
    @Override
    public Map<String, Object> startUsingGangWei(Integer id) {
        Map<String, Object> dataGwdmk = new HashMap<>();
        try {
            if (dataGwdmkMapper.startUsingGangWei(id) != 0) {
                dataGwdmk.put("code", 200);
                dataGwdmk.put("msg", "success");
                dataGwdmk.put("result", true);
            } else {
                dataGwdmk.put("code", 504);
                dataGwdmk.put("msg", "database error");
                dataGwdmk.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            dataGwdmk.put("code", 500);
            dataGwdmk.put("msg", "server error");
            dataGwdmk.put("result", false);
        }
        return dataGwdmk;
    }

    /**
     * 新增岗位信息
     *
     * @param dataGwdmk
     */
    @Override
    public Map<String, Object> addGangWei(DataGwdmk dataGwdmk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (dataGwdmkMapper.addGangWei(dataGwdmk) != 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", dataGwdmk);
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("data", dataGwdmk);
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
     * 根据是否启用获取岗位信息
     *
     * @param isQy 是否启用：1启用，0停用
     */
    @Override
    public Map<String, Object> getDataGwdmkByisQy(Integer isQy) {
        Map<String, Object> dataGwdmk = new HashMap<>();
        try {
            List<DataGwdmk> allDataGwdmk = dataGwdmkMapper.getAllGwdmkByQydm(isQy);
            dataGwdmk.put("code", 200);
            dataGwdmk.put("msg", "success");
            dataGwdmk.put("data", allDataGwdmk);
            dataGwdmk.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            dataGwdmk.put("code", 500);
            dataGwdmk.put("msg", "server error");
            dataGwdmk.put("result", false);
        }
        return dataGwdmk;
    }

    /**
     * 根据岗位代码id获取岗位信息
     *
     * @param id 岗位代码id
     */
    @Override
    public Map<String, Object> getGwdmById(Integer id) {
        Map<String, Object> dataGwdmk = new HashMap<>();
        try {
            DataGwdmk dataGwdmkById = dataGwdmkMapper.getGwdmkById(id);
            dataGwdmk.put("code", 200);
            dataGwdmk.put("msg", "success");
            dataGwdmk.put("data", dataGwdmkById);
            dataGwdmk.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            dataGwdmk.put("code", 500);
            dataGwdmk.put("msg", "server error");
            dataGwdmk.put("result", false);
        }
        return dataGwdmk;
    }

    /**
     * 根据发布者用户名获取岗位信息
     *
     * @param fbzyhm
     * @return
     */
    @Override
    public Map<String, Object> getDataGwdmkByFbz(String fbzyhm) {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("result", true);
            result.put("code", 200);
            result.put("data", dataGwdmkMapper.getAllgwByFbzYhm(fbzyhm));
            result.put("msg", "success");
        } catch (Exception e) {
            result.put("code", 500);
            result.put("msg", "server error");
            result.put("result", false);
            result.put("data", null);
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

    /**
     * 上传岗位图片
     *
     * @param files
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> uploadGangWeiHuanJingImg(MultipartFile[] files) {

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
            result.put("result", true);
            result.put("message", "success");
            result.put("data", filePaths);
            return   result;
        } catch (IOException e) {
            result.put("result", false);
            result.put("message", "error: " + e.getMessage());
            result.put("data", null);
            return result;
        }
    }

    /**
     * 更新岗位信息
     *
     * @param dataGwdmk
     */
    @Override
    public Map<String, Object> updateGangWei(DataGwdmk dataGwdmk) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (dataGwdmkMapper.updateGangWei(dataGwdmk) != 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("result", true);
            } else {
                result.put("code", 504);
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
}
