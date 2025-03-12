package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 工作经历事项库(Gzjlsxk)实体类
 *
 * @author makejava
 * @since 2025-03-10 10:58:12
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Gzjlsxk implements Serializable {
    private static final long serialVersionUID = -32026780061321283L;

    private Integer id;
    /**
     * 工作经历事项
     */
    private String gzjlsx;
    /**
     * 创建时间
     */
    private Date cjsj;
    /**
     * 工作经历代码
     */
    private Integer gzjldm;

}

