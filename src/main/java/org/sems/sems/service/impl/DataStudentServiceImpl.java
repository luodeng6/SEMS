package org.sems.sems.service.impl;

import org.sems.sems.Mapper.DataStudentMapper;
import org.sems.sems.entity.DataStudent;
import org.sems.sems.service.DataStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 学生信息库(DataStudent)表服务实现类
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
@Service("dataStudentService")
public class DataStudentServiceImpl implements DataStudentService {


    @Autowired
    private DataStudentMapper dataStudentMapper;
    @Autowired
    private HttpSession session;
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 删除学生信息接口(停用)
     *
     * @param id
     * @return
     */
    @Override
    public Map<String, Object> deleteStudentById(int id) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            if (dataStudentMapper.TinYongStudentByID(id) != 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data", "已停用");
            } else {
                resultMap.put("code", 500);
                resultMap.put("msg", "failed");
                resultMap.put("result", false);
                resultMap.put("error", "数据库错误");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("error", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 添加学生信息接口
     *
     * @param dataStudent
     * @return
     */
    @Override
    public Map<String, Object> AddStudentData(DataStudent dataStudent) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            if (dataStudentMapper.AddStudentData(dataStudent) != 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data", dataStudent);
            } else {
                resultMap.put("code", 500);
                resultMap.put("msg", "failed");
                resultMap.put("result", false);
                resultMap.put("error", "database error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("error", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 启用学生信息接口
     *
     * @param id 学生id
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> enableStudentById(int id) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            if (dataStudentMapper.QiYongStudentByID(id) != 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data", "userId:" + id);
            } else {
                resultMap.put("code", 504);
                resultMap.put("msg", "database error");
                resultMap.put("result", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("error", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 智能新增学生信息接口
     *
     * @param dataStudent 学生信息
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> addStudentAuto(DataStudent dataStudent) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            if (dataStudentMapper.AddStudentDataZhiNeng(dataStudent) != 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data", dataStudent);
            } else {
                resultMap.put("code", 500);
                resultMap.put("msg", "failed");
                resultMap.put("result", false);
                resultMap.put("error", "database error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("error", e.getMessage());
        }
        return resultMap;
    }

    /**
     * 根据用户名或id获取学生信息
     *
     * @param usernameOrId 用户名或id
     * @param type         类型 username:用户名 id:id
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> getStudentByUsernameOrId(String usernameOrId, String type) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            DataStudent dataStudent = null;
            if (type.equals("username")) {
                dataStudent = dataStudentMapper.getStudentByYHM(usernameOrId);
            } else if (type.equals("id")) {
                dataStudent = dataStudentMapper.getStudentByID(Integer.parseInt(usernameOrId));
            }

            if (dataStudent != null) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data", dataStudent);
            } else {
                resultMap.put("code", 504);
                resultMap.put("msg", "no data");
                resultMap.put("result", false);
                resultMap.put("data", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("error", e.getMessage());
        }
        return resultMap;
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
     * 上传学生照片接口
     *
     * @param file 照片文件
     * @param yhm  学生学号
     * @return Map<String, Object>
     */
    @Override
    public Map<String, Object> uploadStudentPhoto(MultipartFile file, String yhm) {
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

            if (dataStudentMapper.updateStudentPhoto(yhm,WenJianJiaName+"Userpofile/" +yhm+"_"+uniqueFileName) != 0) {
                result.put("code", 200);
                result.put("result", true);
                result.put("message", "success");
                result.put("data", WenJianJiaName+"Userpofile/" +yhm+"_"+uniqueFileName);

            } else {
                result.put("code", 504);
                result.put("result", false);
                result.put("message", "database error");
                result.put("data", null);
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.put("result", false);
            result.put("code", 500);
            result.put("message", e.getMessage());

        }
        return result;
    }


    /**
     * 获取所有学生信息
     *
     * @return 学生信息Map
     */
    @Override
    public Map<String, Object> getAllStudents() {

        Map<String, Object> studentsData = new HashMap<>();
        try {
            // TODO: 从数据库中获取学生信息并返回
            studentsData.put("code", 200);
            studentsData.put("msg", "success");
            List<DataStudent> data = dataStudentMapper.getAllStudents();

            // TODO: 加密敏感信息
            // 遍历data，将所有密码字段加密
            for (DataStudent item : data) {
                item.setMm("******");
            }
            studentsData.put("data", data);
            studentsData.put("result", true);
        } catch (Exception e) {
            e.printStackTrace();
            studentsData.put("code", 500);
            studentsData.put("msg", "failed");
            studentsData.put("result", false);
            studentsData.put("error", e.getMessage());
        }
        return studentsData;
    }


    @Override
    public Map<String, Object> getStudentByIdentity() {
        // queryForList 是 Spring Framework 中 JdbcTemplate 类的一个方法，用于执行 SQL 查询并将结果映射为一个 List。
        // 这个方法非常适合用于从数据库中检索多行数据，并将每一行的数据封装成一个 Map 或者自定义对象
        List<Map<String, Object>> DataList = jdbcTemplate.queryForList(
                "{call usp_GetAllStudentData(?, ?)}", session.getAttribute("username"), session.getAttribute("role"));
        //  "{call usp_GetAllStudentData(?, ?)}", "lls", "老师");
        System.out.println("执行usp_GetAllStudentData存储过程结果:");
        System.out.println(DataList);
        Map<String, Object> resultMap = new HashMap<>();
        // 获取第一个   错误返回：[{"ISERROR":1,"MSG":"错误内容}]

        if (DataList.isEmpty() || DataList.get(0).get("ISERROR") == null) {
            System.out.println("行，我给你数据：");
            System.out.println(DataList);
            resultMap.put("code", 200);
            resultMap.put("msg", "success");
            resultMap.put("result", true);
            resultMap.put("data", DataList);
        } else {
            System.out.println("不行哦，我不给你数据：");
            System.out.println(DataList.get(0).get("MSG"));
            resultMap.put("code", 500);
            resultMap.put("msg", "failed");
            resultMap.put("result", false);
            resultMap.put("error", DataList.get(0).get("MSG"));
        }

        return resultMap;
    }

    /**
     * 修改学生信息接口
     *
     * @param dataStudent
     */
    @Override
    public Map<String, Object> AdminUpdateStudentData(DataStudent dataStudent) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            if (dataStudentMapper.AdminUpdateStudentData(dataStudent) != 0) {
                resultMap.put("code", 200);
                resultMap.put("msg", "success");
                resultMap.put("result", true);
                resultMap.put("data", dataStudent);
            } else {
                resultMap.put("code", 500);
                resultMap.put("msg", "failed");
                resultMap.put("result", false);
                resultMap.put("error", "database error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "server error");
            resultMap.put("result", false);
            resultMap.put("error", e.getMessage());
        }
        return resultMap;
    }


}
