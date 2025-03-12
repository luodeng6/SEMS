package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 单位招聘公告库(Dwzpggk)实体类
 *
 * @author makejava
 * @since 2025-03-10 22:34:47
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Dwzpggk implements Serializable {
    private static final long serialVersionUID = -23348169689485838L;

    private Integer id;
    /**
     * 发布者
     */
    private String fbz;
    /**
     * 发布者身份代码
     */
    private Integer fbzsfdm;
    /**
     * 启用代码
     */
    private Integer qydm;
    /**
     * 公告内容
     */
    private String ggnr;
    /**
     * 公告内容HTML
     */
    private String ggnrhtml;
    /**
     * 创建时间
     */
    private Date cjsj;
    /**
     * 公告标题
     */
    private String ggbt;
    /**
     * 浏览量
     */
    private Integer lll;
}

