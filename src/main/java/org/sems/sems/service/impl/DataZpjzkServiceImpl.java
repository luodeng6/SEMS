package org.sems.sems.service.impl;
import org.sems.sems.Mapper.DataZpjzkMapper;
import org.sems.sems.entity.DataZpjzk;
import org.sems.sems.service.DataZpjzkService;
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
public class DataZpjzkServiceImpl implements DataZpjzkService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private DataZpjzkMapper dataZpjzkMapper;


    /**
     * 获取招聘简章数据
     *
     * @return 招聘简章数据
     */
    @Override
    public Map<String, Object> getZpjzk(int fbbz, int isjustone, int zpjzid, int isjustoneyh, String yhm, int yhsfdm, int isjustonedw, int dwdm) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            // 处理获取投递简历列表逻辑
            List<Map<String, Object>> resultList = new ArrayList<>();
            /*
                @FBBZ int ,-- 发布标志 1.0 。2全部

                @ISJUSTONE int ,--是否只获取一条招聘简章数据，@ISJUSTONE为1时，其他参数（除了@ZPJZID）无用
                @ZPJZID int ,-- 招聘简章ID，当@ISJUSTONE为1时有用

                @ISJUSTONEYH int, --是否只获取一个用户发布的，
                @YHM nvarchar(50) ,-- 当@ISJUSTYH为1时，会用到此参数！
                @YHSFDM int,

                @ISJUSTONEDW int ,--是否通过单位代码的招聘简章
                @DWDM int  -- 单位代码
            */
            resultList = jdbcTemplate.queryForList(
                    "{call usp_GetZpjz(?,?,?,?,?,?,?,?)}", fbbz, isjustone, zpjzid, isjustoneyh, yhm, yhsfdm, isjustonedw, dwdm);
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
     * 保存招聘简章数据
     *
     * @param dataZpjzk 招聘简章数据
     * @return 保存结果
     */
    @Override
    public Map<String, Object> saveZpjzk(DataZpjzk dataZpjzk) {
        // TODO:  保存招聘简章数据表数据
        Map<String, Object> result = new HashMap<>();
        try {
            if (dataZpjzkMapper.insertDataZphjlk(dataZpjzk) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", dataZpjzk);
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", dataZpjzk);
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
     * 删除招聘简章数据
     *
     * @param id 招聘简章数据ID
     * @return 删除结果
     */
    @Override
    public Map<String, Object> deleteZpjzk(Integer id) {
        // TODO:  保存招聘简章数据表数据
        Map<String, Object> result = new HashMap<>();
        try {
            if (dataZpjzkMapper.deleteDataZphjlk(id) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", id);
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", id);
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
     * 更新招聘简章数据
     *
     * @param dataZpjzk 招聘简章数据
     * @return 更新结果
     */
    @Override
    public Map<String, Object> updateZpjzk(DataZpjzk dataZpjzk) {
        // TODO:  保存招聘简章数据表数据
        Map<String, Object> result = new HashMap<>();
        try {
            if (dataZpjzkMapper.updateDataZphjlk(dataZpjzk) > 0) {
                result.put("code", 200);
                result.put("msg", "success");
                result.put("data", dataZpjzk);
                result.put("result", true);
            } else {
                result.put("code", 504);
                result.put("msg", "database error");
                result.put("data", dataZpjzk);
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


    // 读取配置文件上传路径
    @Value("${video.upload.dir}")
    private String uploadDir;

    // 读取配置文件浏览器路径
    @Value("${app.domain}")
    private String appDomain;

    @Value("${app.WenJianJiaName}")
    private String WenJianJiaName;

    /**
     * 招聘简章内容上传图片
     *
     * @param file 图片文件
     * @return 上传结果
     */
    @Override
    public Map<String, Object> uploadImg(MultipartFile file) {
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
            System.out.println("最终上场地址：" + uploadPath.toString() + "/" + "ZPJZK/" + uniqueFileName);

            String ZuiZhongUrl = uploadPath.toString() + "/" + "ZPJZK/" + uniqueFileName;
            System.out.println("最终上场地址2组合：" + ZuiZhongUrl);

            if (!Files.exists(Path.of(uploadPath.toString() + "/" + "ZPJZK/"))) {
                Files.createDirectories(Path.of(uploadPath.toString() + "/" + "ZPJZK/"));
                System.out.println("目录" + uploadPath.toString() + "/" + "ZPJZK/" + "不存在，已创建目录成功!");
            }
            // 保存文件到本地
            Path filePath = Paths.get(ZuiZhongUrl);
            System.out.println("上传文件路径：" + filePath);
            System.out.println("浏览器路径:" + appDomain + "ZPJZK/" + uniqueFileName);
            Files.copy(file.getInputStream(), filePath);
            result.put("code", 200);
            result.put("result", true);
            result.put("message", "success");
            result.put("data", WenJianJiaName + "ZPJZK/" + uniqueFileName);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", false);
            result.put("code", 500);
            result.put("message", e.getMessage());
        }
        return result;
    }

}