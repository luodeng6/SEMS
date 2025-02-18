package org.sems.sems.service;

import org.apache.ibatis.annotations.Select;
import org.sems.sems.entity.DataGwdmk;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * 岗位代码库(DataGwdmk)表服务接口
 *
 * @author makejava
 * @since 2024-12-05 23:23:31
 */
public interface DataGwdmkService {


    /**
     * 获取所有岗位代码
     */
    Map<String, Object> getDataGwdmk();


    /**
     * @param num 前num个火热岗位
     *            获取火热岗位：前7个
     */
    Map<String, Object> getHotDataGwdmk(int num);

    /**
     * 停用岗位代码
     *
     * @param id 岗位代码id
     */
    Map<String, Object> endUsingGangWei(int id);

    /**
     * 启用岗位代码
     *
     * @param id 岗位代码id
     */
    Map<String, Object> startUsingGangWei(Integer id);


    /**
     * 更新岗位信息
     */
    Map<String, Object> updateGangWei(DataGwdmk dataGwdmk);


    /**
     * 新增岗位信息
     */
    Map<String, Object> addGangWei(DataGwdmk dataGwdmk);

    /**
     * 根据是否启用获取岗位信息
     *
     * @param isQy 是否启用：1启用，0停用
     */
    Map<String, Object> getDataGwdmkByisQy(Integer isQy);

    /**
     * 根据岗位代码id获取岗位信息
     *
     * @param id 岗位代码id
     */
    Map<String, Object> getGwdmById(Integer id);

    /**
     *  根据发布者用户名获取岗位信息
     * @param fbzyhm
     * @return
     */
    Map<String, Object> getDataGwdmkByFbz(String fbzyhm);

    /**
    *
    * 上传岗位图片
    * @param files
    * @return Map<String, Object>
    * */
    Map<String, Object> uploadGangWeiHuanJingImg(MultipartFile[] files);
}
