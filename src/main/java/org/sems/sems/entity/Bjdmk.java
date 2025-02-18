package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 班级代码库(Bjdmk)实体类
 *
 * @author makejava
 * @since 2024-12-07 15:31:35
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bjdmk implements Serializable {
    private static final long serialVersionUID = -76693969843275720L;
    /**
     * 班级代码
     */
    private Integer id;

    private String bjmc;
    /**
     * 班主任代码
     */
    private Integer bzrdm;

    private Integer zydm;
    /**
     * 对应专业
     */
    private String dyzy;
}

