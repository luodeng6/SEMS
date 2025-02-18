package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 就业状态代码库(Jyztdmk)实体类
 *
 * @author makejava
 * @since 2025-01-11 16:25:31
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Jyztdmk implements Serializable {
    private static final long serialVersionUID = 419265023110105872L;
    /**
     * 状态代码
     */
    private Integer ztdm;
    /**
     * 就业状态
     */
    private String jyzt;
    /**
     * 状态描述
     */
    private String ztms;

    /**
     * 启用代码
     */
    private Integer qydm;
}

