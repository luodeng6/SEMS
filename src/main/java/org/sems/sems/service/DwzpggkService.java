package org.sems.sems.service;

import org.sems.sems.entity.Dwzpggk;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface DwzpggkService {
    /**
     * 上传公告的图片
     * @param file
     * @return
     */
    Map<String, Object> uploadDwZpggkImg(MultipartFile file);
    /**
     * 添加公告
     * @param dwzpggk 公告实体
     * @return map
     */
    Map<String, Object> addDwZpggk(Dwzpggk dwzpggk);
    /**
     * 更新公告
     * @param  dwzpggk 公告实体
     * @return map
     */
    Map<String, Object> updateDwZpggk(Dwzpggk dwzpggk);
    /**
     * 用户查询公告
     * @param   YHSFDM 用户身份代码
     * YHM 用户名
     *  QYDM  启用代码
     * @return map
     */
    Map<String, Object> getDwZpggk(Integer YHSFDM, String YHM, Integer QYDM,Integer JUSTONE ,Integer GGID);
}
