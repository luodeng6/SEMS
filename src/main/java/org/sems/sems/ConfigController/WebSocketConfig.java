package org.sems.sems.ConfigController;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    private final ThreadPoolTaskScheduler taskScheduler;
    @Value("${nowip}")
    private String nowip;
    // 使用 Spring 提供的 TaskScheduler
    public WebSocketConfig(ThreadPoolTaskScheduler taskScheduler) {
        this.taskScheduler = taskScheduler;
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/chat")
                // 精确指定允许的源（必须带端口）
                .setAllowedOriginPatterns("http://"+nowip+":8080")
                // 启用凭证支持
                .setAllowedOrigins("http://"+nowip+":8080") // Spring 5.3+ 需要同时
                .withSockJS(); // 开启跨域支持和 SockJS 回退
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        // 启用简单消息代理
        registry.enableSimpleBroker("/topic")
                .setTaskScheduler(taskScheduler) // 指定 TaskScheduler
                .setHeartbeatValue(new long[]{10000, 10000}); // 设置心跳间隔：10秒发送/接收一次
        // 设置客户端向服务端发送消息时使用的应用前缀
        registry.setApplicationDestinationPrefixes("/app");
    }
}