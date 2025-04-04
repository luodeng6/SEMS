package org.sems.sems.entity;

import java.util.Date;

// 使用Java Record简化代码（需要JDK 16+）
public record ChatMessage(
        String fromyhm,// 发送者用户名
        String fromyhxm,// 发送者姓名
        String toyhm,// 接受者用户名
        String toyhxm,// 接受者姓名
        Integer fromyhsfdm,// 发送者身份代码
        Integer toyhsfdm,// 接收者身份代码
        Integer isqf,// 是否全体消息
        String nr,// 消息内容
        Date sendtime // 发送时间

) {
    // 无参构造器（兼容JSON反序列化）
    public ChatMessage() {
        this(null, null, null, null, null, null, null, null, null);
    }

}