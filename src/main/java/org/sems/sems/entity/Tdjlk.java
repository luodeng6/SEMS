package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 投递记录库(Tdjlk)实体类
 *
 * @author makejava
 * @since 2025-02-14 20:21:57
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tdjlk implements Serializable {
    private static final long serialVersionUID = 336648778301759677L;
    /**
     * 投递代码
     */
    private Integer id;
    /**
     * 学生代码ID DATA_STUDENG.ID
     */
    private Integer stuid;
    /**
     * 岗位代码
     */
    private Integer gwdm;
    /**
     * 投递时间
     */
    private Date tdsj;
    /**
     * 投递否是生效 ，0：未生效，1：已生效  撤销就变成0
     */
    private Integer qydm;
    /**
     * 单位用户确认代码，默认0，一旦确认就无法撤销
     */
    private Integer qrdm;
    /**
     * 留言内容
     */
    private String lynr;

    /**
     * 简历代码
     */
    private Integer jldm;

    /**
     * 回应时间
     */
    private Date hysj;

    /**
     * 回应的单位用户
     */
    private String dwyh;
}

