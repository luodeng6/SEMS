package org.sems.sems.service;

import org.sems.sems.entity.Gzjlk;
import org.sems.sems.entity.Gzjlsxk;

import java.util.Map;

public interface GzjlkService {
    /**
     * 获取所有工作经历列表
     * @return
     */
    Map<String, Object> getAllGzjlk(String YHM);
    /**
     * 添加工作经历
     * @param gzjlk 工作经历实体
     * @return Map<String, Object>
     */
    Map<String, Object> addGzjlk(Gzjlk gzjlk);
    /**
     * 更新工作经历
     * @param  gzjlk 工作经历实体
     * @return Map<String, Object>
     */
    Map<String, Object> updateGzjlk(Gzjlk gzjlk);
    /**
     * 删除工作经历
     * @param id 工作经历id
     * @return Map<String, Object>
     */
    Map<String, Object> deleteGzjlk(Integer id);

    /**
     *  新增工作经历事项库
     * @param gzjlsxk
     * @return
     */
    Map<String, Object> addGzjlsxK(Gzjlsxk gzjlsxk);
    /**
     * 删除工作经历事项库
     * @param id
     * @return
     * @return Map<String, Object>
     */
    Map<String, Object> deleteGzjlsxK(Integer id);
}
