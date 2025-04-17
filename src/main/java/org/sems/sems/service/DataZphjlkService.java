package org.sems.sems.service;


import org.sems.sems.entity.DataZphjlk;

import java.util.Map;

/**
 * 招聘会记录库(DataZphjlk)表服务接口
 *
 * @author makejava
 * @since 2024-12-05 23:23:30
 */
public interface DataZphjlkService {

    /**
     * 获取招聘会记录库(DataZphjlk)表数据
      @QYDM int ,-- 启用代码 1.0 。2全部

     @ISJUSTONE int ,--是否只获取一条招聘会数据，@ISJUSTONE为1时，其他参数（除了@ZPHID）无用
     @ZPHID int ,-- 招聘会ID，当@ISJUSTONE为1时有用

     @ISJUSTONEYH int, --是否只获取一个用户发布的，
     @YHM nvarchar ,-- 当@ISJUSTYH为1时，会用到此参数！
     @YHSFDM int,

     @getBySHR int , --是否通过审核人获取招聘会
     @SHR nvarchar  ,--审核人用户名
     @SHRSFDM int  --审核人用户SFDM
     * @return 招聘会记录库(DataZphjlk)表数据
     */
    Map<String, Object> getDataZphjlk(int QYDM, int ISJUSTONE, int ZPHID, int ISJUSTONEYH, String YHM, int YHSFDM, int getBySHR, String SHR, int SHRSFDM);

    /**
     * 新增招聘会记录库(DataZphjlk)表数据
     *
     * @param dataZphjlk 招聘会记录库(DataZphjlk)表数据
     * @return 新增结果
     * @throws Exception 异常
     */
    Map<String, Object> insertDataZphjlk(DataZphjlk dataZphjlk);
    /**
     * 修改招聘会记录库(DataZphjlk)表数据
     *
     * @param dataZphjlk 招聘会记录库(DataZphjlk)表数据
     * @return 修改结果
     * @throws Exception 异常
     */
    Map<String, Object> updateDataZphjlk(DataZphjlk dataZphjlk);
    /**
     * 删除招聘会记录库(DataZphjlk)表数据
     *
     * @param id 主键id
     * @return 删除结果
     * @throws Exception 异常
     */
    Map<String, Object> deleteDataZphjlk(int id);

}
