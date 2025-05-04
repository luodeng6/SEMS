package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * (Tjdxk)实体类
 *
 * @author makejava
 * @since 2025-05-04 20:05:55
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Tjdxk implements Serializable {
    private static final long serialVersionUID = 157360748254092070L;

    private Integer id;

    private Integer dxlx;

    private Integer dxdm;

    private Integer tjdm;
}

