package org.sems.sems.service;

import org.sems.sems.entity.Xmcgk;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface XmcgkService {
    /**
     * 插入新项目
     * @param xmcgk
     * @return
     */
    Map<String, Object> insertXmcgk(Xmcgk xmcgk);
    /**
     * 更新项目信息
     * @param xmcgk
     * @return
     */
    Map<String, Object> updateXmcgk(Xmcgk xmcgk);
    /**
     * 获取项目信息
     * @param  QYDM 学院代码  ISGETALL 是否获取全部项目  STUID 学生ID
     * @return
     */
    Map<String, Object> getXmcgk(int QYDM, int ISGETALL, int STUID);

    /**
     * 上传附件
     * @param id 项目ID
     * @param cgfj 附件文件
     * @return 上传结果
     */
    Map<String, Object> uploadFJFile(Integer id, MultipartFile cgfj);
}
