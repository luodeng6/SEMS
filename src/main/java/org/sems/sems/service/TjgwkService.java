package org.sems.sems.service;

import org.sems.sems.entity.Tjdxk;
import org.sems.sems.entity.Tjgwk;

import java.util.Map;

public interface TjgwkService {
    /**
     * 获取推荐岗位信息
     * @param yhm 用户名
     * @param yhsfdm 用户身份代码
     * @return 推荐岗位信息
     */
    Map<String, Object> getTjgwk(String yhm, int yhsfdm);
    /**
     * 插入推荐岗位信息
     * @param tjgwk 推荐岗位信息
     * @return 插入结果
     */
    Map<String, Object> insertTjgwk(Tjgwk tjgwk);
    /**
     * 插入推荐对象信息
     * @param tjdxk 推荐对象信息
     * @return 插入结果
     */
    Map<String, Object> insertTjdxk(Tjdxk tjdxk);
}
