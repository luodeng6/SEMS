package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 招聘简章库(DataZpjzk)实体类
 *
 * @author makejava
 * @since 2025-04-21 22:42:35
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataZpjzk implements Serializable {
    private static final long serialVersionUID = 868730766506185530L;
    /**
     * 招聘简章代码
     */
    private Integer id;
    /**
     * 单位代码。对应DATA_DWDMK
     */
    private Integer dwdm;
    /**
     * 文本内容
     */
    private String wbnr;

    private String html;
    /**
     * 发布者
     */
    private String fbz;
    /**
     * 创建时间
     */
    private Date cjsj;
    /**
     * 发布标志，1为已发布，0为未发布(默认)
     */
    private Integer fbbz;
    /**
     * 发布时间(FBBZ为0时为空)
     */
    private Date fbsj;
    /**
     * 发布者身份代码
     */
    private Integer fbzsfdm;
    /**
     * 简章附件文件
     */
    private String jzfj;
    /**
     * 创建者
     */
    private String cjz;
    /**
     * 创建者身份代码
     */
    private Integer cjzsfdm;

}