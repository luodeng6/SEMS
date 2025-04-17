package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.io.Serializable;

/**
 * 招聘会记录库(DataZphjlk)实体类
 *
 * @author makejava
 * @since 2025-04-15 22:31:23
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataZphjlk implements Serializable {
    private static final long serialVersionUID = 447720635714964771L;
    /**
     * 招聘会代码   招聘会记录库
     */
    private Integer id;
    /**
     * 招聘会标题
     */
    private String zphbt;
    /**
     * 单位代码
     */
    private Integer dwdm;
    /**
     * 位置标志，1校内，2校外
     */
    private Integer wzbz;
    /**
     * 举办时间
     */
    private Date jbsj;
    /**
     * 对应岗位代码，此次招聘会对应的岗位代码，多个就用+来链接，如1+2+3...
     */
    private String dygwdm;
    /**
     * 所在学校
     */
    private String szxx;
    /**
     * 举办地点
     */
    private String jbdd;
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
     * 专业，可以多个
     */
    private String zy;
    /**
     * 预约人数
     */
    private Integer yyrs;

    private Date cjsj;
    /**
     * 审核代码, 0未处理，1审核通过，2审核不通过
     */
    private Integer shdm;
    /**
     * 审核人用户名
     */
    private String shryhm;
    /**
     * 审核人身份代码
     */
    private Integer shrsfdm;
    /**
     * 审核时间
     */
    private Date shsj;
}

