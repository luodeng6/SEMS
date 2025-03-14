package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 学生成绩单库(Xscjdk)实体类
 *
 * @author makejava
 * @since 2025-03-14 12:09:57
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Xscjdk implements Serializable {
    private static final long serialVersionUID = -10084316315169030L;

    private Integer id;

    private Integer stuid;
    /**
     * 课程名称
     */
    private String kcmc;
    /**
     * 课程性质
     */
    private String kcxz;
    /**
     * 学分
     */
    private Float xf;
    /**
     * 绩点
     */
    private Float jd;
    /**
     * 成绩性质
     */
    private String cjxz;
    /**
     * 课程成绩
     */
    private Float kccj;
    /**
     * 授课教师
     */
    private String skjs;
    /**
     * 启用代码
     */
    private Integer qydm;
}

