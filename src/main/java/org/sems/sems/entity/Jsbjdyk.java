package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 教师班级对应库(Jsbjdyk)实体类-- 教师班级对应关系表
 *
 * @author makejava
 * @since 2024-12-07 11:52:11
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Jsbjdyk implements Serializable {
    private static final long serialVersionUID = 752325921411863284L;
    /**
     * 班级代码ID，对应BJDMK的id
     */
    private Integer bjid;
    /**
     * 教师编号ID，对应JSDMK .id
     */
    private Integer jsid;
}

