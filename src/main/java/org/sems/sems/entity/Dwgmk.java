package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (Dwgmk)实体类-- 单位规模库
 *
 * @author 罗邓
 * @since 2024-12-05 17:29:15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dwgmk implements Serializable {
    private static final long serialVersionUID = -29650334970670807L;
    /**
     * 规模代码
     */
    private Integer gmdm;
    /**
     * 规模描述
     */
    private String gmxq;
}

