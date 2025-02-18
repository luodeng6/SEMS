package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 学生简历库(DataXsjlk)实体类
 *
 * @author makejava
 * @since 2025-02-12 22:45:02
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataXsjlk implements Serializable {
    private static final long serialVersionUID = -53717825008740575L;
    /**
     * 简历代码
     */
    private Integer jldm;
    /**
     * 学生ID，对应STUDENT表id
     */
    private Integer xsid;
    /**
     * 发布标志，1发布0未发布(暂存)
     */
    private Integer fbbz;
    /**
     * 发布时间（可空）
     */
    private Date fbsj;
    /**
     * 简历文本
     */
    private String jlwb;
    /**
     * 简历HTML内容
     */
    private String html;
    /**
     * 上次修改时间
     */
    private Date scxgtime;
    /**
     * 简历附件 文档url
     */
    private String jlfj;

}

