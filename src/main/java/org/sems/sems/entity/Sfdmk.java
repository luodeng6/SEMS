package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (Sfdmk)实体类 -- 省份代码表
 *
 * @author 罗邓
 * @since 2024-12-05 17:29:15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sfdmk implements Serializable {
    private static final long serialVersionUID = -42621697926668534L;
    /**
     * 省份代码
     */
    private Integer sfdm;
    /**
     * 省份名称
     */
    private String sfmc;
}

