package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.io.Serializable;

/**
 * 学生信息库(DataStudent)实体类 -- 学生信息表`
 *
 * @author makejava
 * @since 2024-12-07 15:31:35
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataStudent implements Serializable {
    private static final long serialVersionUID = 373332833686044047L;
    /**
     * 学号
     */
    private Integer id;
    /**
     * 学生姓名
     */
    private String xsxm;
    /**
     * 学生性别
     */
    private String xsxb;
    /**
     * 出生日期np,
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;
    /**
     * 用户名
     */
    private String yhm;
    /**
     * 密码
     */
    private String mm;
    /**
     * 所属班级
     */
    private Integer ssbj;
    /**
     * 专业代码 对应ZYDMK
     */
    private Integer zydm;
    /**
     * 身份证号
     */
    private String sfzh;
    /**
     * 政治面貌
     */
    private String zzmm;
    /**
     * 所属年级
     */
    private String ssnj;
    /**
     * 学制
     */
    private String xz;
    /**
     * 民族
     */
    private String mz;
    /**
     * 学生学号
     */
    private String xsxh;
    /**
     * 班级名称
     */
    private String bjmc;
    /**
     * 学历代码,对应XLTTK
     */
    private Integer xldm;
    /**
     * 就业状态，
     */
    private Integer jyzt;
    /**
     * 学生照片
     */
    private String xszp;
    /**
     * 启用代码
     */
    private Integer qydm;

    /**
     * 负责教师
     */
    private int fzjs;
}

