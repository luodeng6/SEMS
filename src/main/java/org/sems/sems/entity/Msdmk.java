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
 * @since 2025-02-20 18:13:34
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Msdmk implements Serializable {
    private static final long serialVersionUID = -63425259854488520L;
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
     * 面试状态：1单位已安排（待学生确认），2学生已确认，3开始面试（面试中，待单位用户关闭）4 面试关闭（待录入结果） 5已录入结果
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

}

