package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 福利代码库(Fldmk)实体类
 *
 * @author makejava
 * @since 2025-01-25 10:18:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Fldmk implements Serializable {
    private static final long serialVersionUID = 348259032759989191L;
    /**
     * 福利代码
     */
    private Integer fldm;
    /**
     * 福利名称
     */
    private String flmc;
    /**
     * 福利描述
     */
    private String flms;

}

