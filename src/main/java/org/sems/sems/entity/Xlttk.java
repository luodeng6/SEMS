package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (Xlttk)实体类-- 学历天梯库
 *
 * @author 罗邓
 * @since 2024-12-05 17:29:15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Xlttk implements Serializable {
    private static final long serialVersionUID = 724575207974171060L;
    /**
     * 学历id
     */
    private Integer id;
    /**
     * 学历名称
     */
    private String xlmc;
    /**
     * 学历描述
     */
    private String xlms;
}

