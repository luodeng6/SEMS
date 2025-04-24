package org.sems.sems.service;

import org.sems.sems.entity.DataZpjzk;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface DataZpjzkService {
    /**
     * 获取招聘简章数据
     * @return 招聘简章数据
     */
    Map<String, Object> getZpjzk(int fbbz, int isjustone, int zpjzid, int isjustoneyh, String yhm, int yhsfdm, int isjustonedw, int dwdm);
    /**
     * 保存招聘简章数据
     * @param dataZpjzk 招聘简章数据
     * @return 保存结果
     */
    Map<String, Object> saveZpjzk(DataZpjzk dataZpjzk);
    /**
     * 删除招聘简章数据
     * @param id 招聘简章数据ID
     * @return 删除结果
     */
    Map<String, Object> deleteZpjzk(Integer id);
    /**
     * 更新招聘简章数据
     * @param dataZpjzk 招聘简章数据
     * @return 更新结果
     */
    Map<String, Object> updateZpjzk(DataZpjzk dataZpjzk);
    /**
     *  招聘简章内容上传图片
     * @param file 图片文件
     * @return 上传结果
     */
    Map<String, Object> uploadImg(MultipartFile file);


}
