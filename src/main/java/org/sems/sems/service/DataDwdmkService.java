package org.sems.sems.service;


import org.sems.sems.entity.DataDwdmk;

import java.util.Map;

/**
 * 单位代码库(DataDwdmk)表服务接口
 *
 * @author makejava
 * @since 2024-12-05 23:23:31
 */
public interface DataDwdmkService {

    /**
     * 获取所有单位代码库(DataDwdmk)表数据
     * */
    Map<String, Object> getAllDataDwdmk();


    /**
     *
     * 停用单位代码库(DataDwdmk)表数据
     * */
    Map<String, Object> disableDataDwdmk(int DWDM);


    /**
     *
     * 获取单位发布的所有岗位
     * */
    Map<String, Object> getDwGangWei(int DWDM);



    /**
     *
     * 更改单位基础信息
     * */
    Map<String, Object> updateDataDwdmk(DataDwdmk dataDwdm);

    /**
     *
     * 新增单位基础信息
     * */
    Map<String, Object> addDataDwdmk(DataDwdmk dataDwdm);


    /**
     *  根据单位用户的用户名获取单位信息
     * @param dwUserName
     * @return
     */
    Map<String, Object> getDwDataByDwUserName(String dwUserName);

    /**
     *  根据单位启用状态 获取单位信息
     * @param qydm 启用代码
     * @return Map<String, Object>
     */
    Map<String, Object> getDwByQydm(int qydm);
}
