package org.sems.sems.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface JyhjkService {


    /**
     * 根据岗位代码获取就业环境库
     * @param gwdm 岗位代码
     * @return  Map<String, Object>
     */
    Map<String, Object> getJyhjkByGwdm(int gwdm);


    /**
     * 上传就业环境库
     * @param files 文件
     * @param gwdm 岗位代码
     * @return Map<String, Object>
     */
    Map<String, Object> uploadJyhjk(MultipartFile[] files, String gwdm);

    /**
     *  通过发布者用户名获取所有就业环境库图片数据
     * @param fbzYhm 发布者用户名
     * @return Map<String, Object>
     */
    Map<String, Object> getAllJyhjkByFbzYhm(String fbzYhm);

    /**
     * 通过发布者用户名获取岗位、单位、就业环境库
     * @param fbzyhm 发布者用户名
     * @return Map<String, Object>
     */
    Map<String, Object> getGwAndDwAndJhByFbzYhm(String fbzyhm);


    /**
     *  删除就业环境库 通过id
     * @param id 就业环境库id
     * @return Map<String, Object>
     */
    Map<String, Object> deleteJyhjkById(int id);
}
