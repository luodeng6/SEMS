package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 专业代码库(Zydmk)实体类   -- 专业代码表
 *
 * @author makejava
 * @since 2024-12-10 20:37:10
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Zydmk implements Serializable {
    private static final long serialVersionUID = 547007320476684135L;
    /**
     * 专业代码
     */
    private Integer id;
    /**
     * 专业名称
     */
    private String zymc;
    /**
     * 专业类别
     */
    private String zylb;
}

