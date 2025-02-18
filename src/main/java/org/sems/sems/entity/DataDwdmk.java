package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (DataDwdmk)实体类  -- 单位代码库
 *
 * @author 罗邓
 * @since 2024-12-05 17:29:16
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataDwdmk implements Serializable {
    private static final long serialVersionUID = -92358580534588559L;
    /**
     * 单位代码  ，单位代码库
     */
    private Integer dwdm;
    /**
     * 单位名称
     */
    private Object dwmc;
    /**
     * 单位性质
     */
    private Object dwxz;
    /**
     * 单位性质代码，对应DWXZK 单位性质库
     */
    private Integer dwxzdm;
    /**
     * 单位规模代码，对应DWGMK 单位规模库
     */
    private Integer dwgmdm;
    /**
     * 单位规模，文本，存储
     */
    private Object dwgm;
    /**
     * 单位行业代码,对应DWHYDMK 单位行业代码库
     */
    private Integer dwhydm;
    /**
     * 单位行业
     */
    private Object dwhy;
    /**
     * 公司名称
     */
    private Object gsmc;
    /**
     * 公司简介
     */
    private Object gsjj;
 /*
    GSJJHTML: 岗位介绍HTML代码

     */
    private String gsjjhtml;


    private String qydm; //启用代码

    /**
     * 所在地区
     */
    private String szdq;
    
}

