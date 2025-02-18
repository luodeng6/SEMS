package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 单位性质库(Dwxzk)实体类-- 单位性质库
 *
 * @author 罗邓
 * @since 2024-12-05 17:29:15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dwxzk implements Serializable {
    private static final long serialVersionUID = -20860802543925668L;
    /**
     * 单位性质代码
     */
    private Integer dwxzdm;
    /**
     * 单位性质
     */
    private Object dwxz;
    /**
     * 单位性质描述
     */
    private Object xzms;

 
}

