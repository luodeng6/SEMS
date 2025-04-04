package org.sems.sems.ConfigController;
import org.sems.sems.entity.ChatMessage;
import org.sems.sems.entity.Dhjlk;
import org.sems.sems.service.SstXService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import java.util.Map;

@Controller
public class ChatController {

    @Autowired
    private SimpMessagingTemplate messagingTemplate;
    @Autowired
    private SstXService ssttXService;

    // 处理发送到/app/chat的消息
    @MessageMapping("/chat")
    public void handleChat(ChatMessage message) {
        System.out.println(message);
        /*ChatMessage[fromyhm=20213260021, toyhm=ozf, fromyhsfdm=4, toyhsfdm=3, isqf=0, nr=888, sendtime=Sun Mar 23 17:19:24 CST 2025]*/
        // 插入对话记录
        Dhjlk dhjlk = new Dhjlk();
        dhjlk.setFromyhm(message.fromyhm());
        dhjlk.setToyhm(message.toyhm());
        dhjlk.setFromyhsfdm(message.fromyhsfdm());
        dhjlk.setToyhsfdm(message.toyhsfdm());
        dhjlk.setQydm(1);
        dhjlk.setIsqf(message.isqf());
        dhjlk.setNr(message.nr());



       Map<String, Object> result =  ssttXService.addNewlxr(dhjlk);



        // 将消息广播到/topic/messages
        messagingTemplate.convertAndSend("/topic/messages", message);
    }


}


