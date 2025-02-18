package org.sems.sems.service;


import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * 公共数据服务接口
 *
 * @author makejava
 * @since 2024-12-05 23:23:29
 */
public interface DataService {
    /**
     * 获取所有基础数据
     */
    Map<String, Object> get_JCSJ1();


    @Autowired


    /**
     * 获取所有基础数据2
     */
    Map<String, Object> get_JCSJ2();


    /**
     * 获取学生管理所需数据
     *
     */
    Map<String, Object> get_XSGLDATA();


}
