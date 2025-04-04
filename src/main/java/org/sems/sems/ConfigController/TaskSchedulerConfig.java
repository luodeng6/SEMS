package org.sems.sems.ConfigController;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

/*定义一个 TaskScheduler Bean。这是一个通用的调度器，用于执行异步任务，比如定时心跳。*/
@Configuration
public class TaskSchedulerConfig {

    @Bean
    public ThreadPoolTaskScheduler taskScheduler() {
        ThreadPoolTaskScheduler scheduler = new ThreadPoolTaskScheduler();
        scheduler.setPoolSize(1); // 定义线程池大小，可以根据需要调整  
        scheduler.setThreadNamePrefix("WebSocketHeartbeatThread-"); // 线程名称前缀  
        return scheduler;
    }
}