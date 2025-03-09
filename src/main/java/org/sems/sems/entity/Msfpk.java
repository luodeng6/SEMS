package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 面试复盘库(Msfpk)实体类
 *
 * @author makejava
 * @since 2025-03-08 18:52:14
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Msfpk implements Serializable {
    private static final long serialVersionUID = -41765018856048514L;

    private Integer id;
    /**
     * 学生代码
     */
    private Integer stuid;
    /**
     * 岗位代码
     */
    private Integer gwdm;
    /**
     * 岗位名称
     */
    private String gwmc;
    /**
     * 启用代码
     */
    private Integer qydm;
    /**
     * 面试代码
     */
    private Integer msdm;
    /**
     * 难度评级
     */
    private Integer ndpj;
    /**
     * 面试形式：现场面试、视频面试、电话面试
     */
    private String msxs;
    /**
     * 整体反思
     */
    private String ztfs;
    /**
     * 面试时间
     */
    private Date mssj;
    /**
     * 复盘时间
     */
    private Date fpsj;
}

