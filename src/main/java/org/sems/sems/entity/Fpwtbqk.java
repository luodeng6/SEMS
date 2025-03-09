package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (Fpwtbqk)实体类
 *
 * @author makejava
 * @since 2025-03-08 20:18:26
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Fpwtbqk implements Serializable {
    private static final long serialVersionUID = 962934065164784097L;

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 问题id
     */
    private Integer wtid;

    /**
     * 标签内容
     */
    private String bqnr;
}

