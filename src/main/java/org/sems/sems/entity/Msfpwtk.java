package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 面试复盘问题库：对应MSFPK的问题(Msfpwtk)实体类
 *
 * @author makejava
 * @since 2025-03-08 19:39:08
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Msfpwtk implements Serializable {
    private static final long serialVersionUID = 801955480782711076L;

    private Integer id;
    /**
     * 问题描述
     */
    private String wtms;
    /**
     * 我的回答
     */
    private String wdhd;
    /**
     * 改进回答
     */
    private String gjhd;
    /**
     * 自我评分，-1表示没评分
     */
    private Integer zwpf;
    /**
     * 问题的录入时间
     */
    private Date lrsj;
    /**
     * 问题对应的面试复盘ID
     */
    private Integer fpdm;
}

