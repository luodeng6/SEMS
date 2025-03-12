package org.sems.sems.service;

import org.sems.sems.entity.Xszsk;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface XszskService {
    /**
     * 获取学生证书
     * @return 学生证书信息
     */
    Map<String, Object> getXszsk(Integer QYDM,Integer ISGETALL,Integer STUID);
    /**
     * 添加学生证书
     * @param xszsk 学生证书信息
     * @return 学生证书信息
     */
    Map<String, Object> addXszsk(Xszsk xszsk);

    /**
     * 更新学生证书
     * @param xszsk
     * @return
     */
    Map<String, Object> updateXszsk(Xszsk xszsk);

    /**
     * 删除学生证书
     * @param id 学生证书ID
     * @return 学生证书信息
     */
    Map<String, Object> deleteXszsk(Integer id);
    /**
     * 上传文件
     * @param id 学生证书ID
     * @param zszp 证书照片
     * @param zsfj 证书附件
     * @return 学生证书信息
     */
    Map<String, Object> uploadFile(Integer id, MultipartFile zszp, MultipartFile zsfj);
}
