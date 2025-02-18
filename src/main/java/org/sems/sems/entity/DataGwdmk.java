package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.io.Serializable;

/**
 * (DataGwdmk)实体类 -- 岗位代码表
 *
 * @author 罗邓
 * @since 2024-12-05 17:29:16
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataGwdmk implements Serializable {
    private static final long serialVersionUID = -20982551254261959L;
    /**
     * 岗位id
     */
    private Integer id;
    /**
     * 岗位名称
     */
    private String gwmc;
    /**
     * 岗位描述
     */
    private String gwms;
    /**
     * 岗位要求
     */
    private String gwyq;
 /*   *//**
     * 岗位发布时间
     *//*
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date fbsj;
*/

    /**
     * 岗位发布时间
     */
    //@DateTimeFormat(pattern = "EEE MMM dd yyyy HH:mm:ss 'GMT'Z (z)")

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date fbsj;

    /**
     * 投递说明
     */
    private String tdsm;
    /**
     * 最高薪资
     */
    private float zgxz;
    /**
     * 最低薪资
     */
    private float zdxz;
    /**
     * 最低学历要求
     */
    private Integer zdxlyq;
    /**
     * 工作地点
     */
    private String gzdd;
    /**
     * 工作省份，对应SFDMK 省份代码库
     */
    private Integer gzsf;
    /**
     * 实习标志,1为实习岗位，2为正式岗位
     */
    private Integer sxbz;
    /**
     * 专业限制
     */
    private String zyxz;
    /**
     * 单位名称
     */
    private String dwmc;
    /**
     * 单位代码,对应DWDMK
     */
    private Integer dwdm;
    /**
     * 投递次数
     */
    private Integer tdcs;
    /**
     * 投递限制标志，默认0
     */
    private Integer tdxzbz;
    /**
     * 投递限制次数，若TDXZBZ为0则设置为空
     */
    private Integer tdxzcs;
    /**
     * 启用代码
     */
    private Integer qydm;
    /**
     * 招聘人数
     */
    private Integer zprs;
    /**
     * 就业环境(图)
     */
    private Integer jyhj;
    /**
     * 就业环境描述
     */
    private String jyhjms;
    /**
     * 工作职责
     */
    private String gzzz;

    /**
     * 岗位分类
     */
    private String gwfl;

    /**
     * 发布者用户名
     */
    private String fbz;
    /**
     * 发布者用户身份代码，对应YHSFDMK
     */
    private Integer fbzyhsfdm;

}

