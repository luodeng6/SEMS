package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;
import java.util.Date;
import java.io.Serializable;

/**
 * 推荐岗位库(Tjgwk)实体类
 *
 * @author makejava
 * @since 2025-05-04 16:42:02
 */
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Tjgwk implements Serializable {
    private static final long serialVersionUID = 475587867926990134L;

    private Integer id;
    /**
     * 岗位代码
     */
    private Integer gwdm;
    /**
     * 推荐人用户名
     */
    private String tjr;
    /**
     * 推荐人身份代码
     */
    private Integer tjrsfdm;
    /**
     * 推荐类别，1，推荐到班级，2 推荐到学生
     */
    private Integer yjlb;
    /**
     * 推荐时间
     */
    private Date tjsj;
    /**
     * 推荐等级，多少推荐等级
     */
    private Integer tjdj;
    /**
     * 推荐描述
     */
    private String tjms;
    /**
     * 确认标志，1已被学生确认，0未确认，如果是班级就自动确认
     */
    private Integer qrbz;
    /**
     * 启用代码
     */
    private Integer qydm;
}

