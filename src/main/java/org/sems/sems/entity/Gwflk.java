package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 岗位分类库(Gwflk)实体类
 *
 * @author makejava
 * @since 2025-01-22 18:20:16
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Gwflk implements Serializable {
    private static final long serialVersionUID = -51446404382364372L;
    /**
     * 岗位分类id
     */
    private Integer id;
    /**
     * 分类名称
     */
    private String flmc;
    /**
     * 分类描述
     */
    private String flms;

}

