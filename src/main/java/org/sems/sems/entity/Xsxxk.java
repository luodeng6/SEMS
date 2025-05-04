package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 学生个人信息库(Xsxxk)实体类
 *
 * @author makejava
 * @since 2025-05-01 13:18:50
 */
@lombok.Data
@NoArgsConstructor
@AllArgsConstructor
public class Xsxxk implements Serializable {
    private static final long serialVersionUID = -97508598071419785L;

    private Integer id;

    private Integer stuid;
    /**
     * 邮箱地址
     */
    private String yxdz;
    /**
     * 省份城市
     */
    private String sfcs;
    /**
     * 联系电话
     */
    private String lxdh;
    /**
     * 显示职业
     */
    private String xszy;
    /**
     * 所在学校，显示学校
     */
    private String szxx;
    /**
     * 入学年份
     */
    private Integer rxnf;
    /**
     * 毕业年份
     */
    private Integer bynf;
    /**
     * 学位
     */
    private String xw;

}

