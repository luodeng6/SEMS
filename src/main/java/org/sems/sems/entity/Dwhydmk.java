package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (Dwhydmk)实体类 -- 单位行业代码库
 *
 * @author 罗邓
 * @since 2024-12-05 17:29:15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dwhydmk implements Serializable {
    private static final long serialVersionUID = -97786264548180772L;
    /**
     * 行业代码
     */
    private Integer hydm;
    /**
     * 单位行业名称
     */
    private String hymc;
    /**
     * 单位行业描述
     */
    private String hyms;
    
}

