package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 工作经历库(Gzjlk)实体类
 *
 * @author makejava
 * @since 2025-03-09 23:55:41
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Gzjlk implements Serializable {
    private static final long serialVersionUID = 134487143213298380L;

    private Integer id;
    /**
     * 学生ID
     */
    private Integer stuid;
    /**
     * 添加时间
     */
    private Date tjsj;

    private String dwmc;
    /**
     * 岗位名称
     */
    private String gwmc;
    /**
     * 开始时间
     */
    private Date kssj;
    /**
     * 结束时间
     */
    private Date jssj;
    /**
     * 经历描述
     */
    private String jlms;
    /**
     * 启用代码
     */
    private Integer qydm;
}

