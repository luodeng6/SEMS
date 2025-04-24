package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 面试代码库(Msdmk)实体类
 *
 * @author makejava
 * @since 2025-04-22 14:48:18
 */
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Msdmk implements Serializable {
    private static final long serialVersionUID = -12983382044303686L;
    /**
     * 面试代码
     */
    private Integer msdm;
    /**
     * 学生代码
     */
    private Integer xsdm;
    /**
     * 单位代码
     */
    private Integer dwdm;
    /**
     * 岗业代码
     */
    private Integer gwdm;
    /**
     * 面试时间
     */
    private Date mssj;
    /**
     * 面试状态：1单位已安排（待学生确认），2学生已确认，3开始面试（面试中，待录入结果） 4已录入结果（关闭面试）    5 面试关闭（无法修改任何信息）
     */
    private Integer mszt;
    /**
     * 面试结果,MSJGDMK.ID
     */
    private Integer msjg;
    /**
     * 发起者用户名
     */
    private String fqz;
    /**
     * 发起者身份代码
     */
    private Integer fqzsfdm;
    /**
     * 发起时间，默认(getdate())
     */
    private Date fqsj;
    /**
     * 启用代码
     */
    private Integer qydm;
    /**
     * 确认代码，即学生是否确认了面试
     */
    private Integer qrdm;
    /**
     * 面试地点
     */
    private String msdd;
    /**
     * 面试轮数，默认是1，第二次面试就是2.。。
     */
    private Integer msls;
    /**
     * 学生是否拒绝了面试
     */
    private Integer isjj;
    /**
     * 面试开始时间
     */
    private Date mskssj;
    /**
     * 面试评价
     */
    private Integer mspj;
    /**
     * HR总结内容
     */
    private String hrzj;
    /**
     * 面试结果录入时间
     */
    private Date jglrsj;
    /**
     * 面试结果录入者用户名
     */
    private String jglrz;
    /**
     * 结果录入者身份代码
     */
    private Integer jglrzsfdm;
}