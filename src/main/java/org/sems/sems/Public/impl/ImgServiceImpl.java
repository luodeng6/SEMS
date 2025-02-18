package org.sems.sems.Public.impl;

import org.sems.sems.Public.ImgService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class ImgServiceImpl  implements ImgService {
    /**
     * 图【上传】接口
     *
     * @param imgFile 图片文件
     * @param imgName 图片名称
     */
    @Override
    public Map<String, Object> uploadImg(byte[] imgFile, String imgName) {
        return null;
    }
}
