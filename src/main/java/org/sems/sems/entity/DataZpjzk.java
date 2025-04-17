package org.sems.sems.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.io.Serializable;

/**
 * 招聘简章库(DataZpjzk)实体类
 *
 * @author makejava
 * @since 2025-04-14 10:55:47
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataZpjzk implements Serializable {
    private static final long serialVersionUID = 682626772828196929L;
    /**
     * 招聘简章代码
     */
    private Integer id;
    /**
     * 单位代码。对应DATA_DWDMK
     */
    private Integer dwdm;
    /**
     * 文本内容
     */
    private String wbnr;

    private String html;

    private String cjrgh;
    /**
     * 创建时间
     */
    private Date cjsj;
    /**
     * 发布标志，1为已发布，0为未发布(默认)
     */
    private Integer fbbz;
    /**
     * 发布时间(FBBZ为0时为空)
     */
    private Date fbsj;
}

