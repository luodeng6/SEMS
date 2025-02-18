package org.sems.sems.service;


import org.sems.sems.entity.DataStudent;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * 学生信息库(DataStudent)表服务接口
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
public interface DataStudentService {

    /**
     * 获取所有学生信息
     *
     * @return 学生信息Map
     */
    Map<String, Object> getAllStudents();


    /**
     * 根据身份获取学生信息
     * */
    Map<String, Object> getStudentByIdentity();

    /**
     * 修改学生信息接口
     * */

    Map<String, Object> AdminUpdateStudentData(DataStudent dataStudent);

    /**
     *  删除学生信息接口(停用)
     *
     * @param id 学生id
     * @return Map<String, Object>
     */
    Map<String, Object> deleteStudentById(int id);

    /**
     *  新增学生信息接口
     *  @param dataStudent 学生信息
     * @return Map<String, Object>
     */
    Map<String, Object> AddStudentData(DataStudent dataStudent);

    /**
     *  启用学生信息接口
     * @param id 学生id
     * @return Map<String, Object>
     */
    Map<String, Object> enableStudentById(int id);

    /**
     *  智能新增学生信息接口
     * @param dataStudent 学生信息
     * @return Map<String, Object>
     */
    Map<String, Object> addStudentAuto(DataStudent dataStudent);

    /**
     *  根据用户名或id获取学生信息
     * @param usernameOrId 用户名或id
     * @param type 类型 username:用户名 id:id
     * @return Map<String, Object>
     */
    Map<String, Object> getStudentByUsernameOrId(String usernameOrId, String type);

    /**
     *  上传学生照片接口
     * @param file 照片文件
     * @param yhm 学生学号
     * @return Map<String, Object>
     */
    Map<String, Object> uploadStudentPhoto(MultipartFile file, String yhm);
}
