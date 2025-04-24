package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 项目成果标签库(Xmcgbqk)实体类
 *
 * @author makejava
 * @since 2025-04-23 15:31:57
 */

@NoArgsConstructor
@AllArgsConstructor
@lombok.Data
public class Xmcgbqk implements Serializable {
    private static final long serialVersionUID = 251602017501409917L;

    private Integer id;
    /**
     * 标签内容
     */
    private String bqnr;
    /**
     * 项目代码
     */
    private Integer xmdm;
}

