package org.sems.sems.Public;

import java.util.Map;

public interface ImgService {

    /**
     *
     * 图【上传】接口
     * @param imgFile 图片文件
     * @param imgName 图片名称
     * */
     Map<String, Object> uploadImg(byte[] imgFile, String imgName);
}
