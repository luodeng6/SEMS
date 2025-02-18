package org.sems.sems.service;

import org.sems.sems.entity.Tdjlk;

import java.util.Map;

// 投递简历库服务接口
public interface TdjlkService {
    /**
     * 投递简历
     * @param tdjlk 投递简历实体类
     * @return Map<String, Object> 返回结果
     */
    Map<String, Object> tdJl(Tdjlk tdjlk);




    /**
     *  获取投递简历列表
     * @param style 获取方式
     * @param yhm 用户名
     * @param gwdm 岗位代码
     * @return Map<String, Object> 返回结果
     */
    Map<String, Object> getTdjlk(int style, String yhm, int gwdm);

    /**
     *  根据id获取投递记录
     * @param id 投递记录id
     * @return Map<String, Object> 返回结果
     */
    Map<String, Object> getTdjlkById(int id);



    /**
     *  取消/继续使用 投递简历
     * @param id 投递记录id
     * @return Map<String, Object> 返回结果
     */
    Map<String, Object> UpdateTdjlkQyztById(int id, int qyzt);

    /**
     *  单位确认收到投递记录
     * @param id 投递记录id
     * @return Map<String, Object> 返回结果
     */
    Map<String, Object> dwqr(int id);

    /**
     *  删除投递记录
     * @param id 投递记录id
     * @return Map<String, Object> 返回结果
     * @throws Exception 投递记录不存在异常
     */
    Map<String, Object> deleteTdjlkById(int id);

    /**
     *  单位确认回应投递记录
     * @param id 投递记录id , hynr 回应内容, dwyh 单位用户, hyjg 回应结果 ： 0 不录用，2 安排面试  3 录用 4 待定
     * @return Map<String, Object> 返回结果
     */
    Map<String, Object> huiying(int id, String hynr, String dwyh,int hyjg);
}
