package org.sems.sems.ConfigController;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
public class CorsConfig {

    // 当前跨域请求最大有效时长，默认1天
    private static final long MAX_AGE = 24 * 60 * 60;
    //读取配置文件内容

    @Value("${nowip}")
    private String nowip;

    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        // 允许携带凭证（Cookie等），注意此时不能使用 "*" 作为 allowed origin
        corsConfiguration.setAllowCredentials(true);
        // 指定允许的源为前端地址
        corsConfiguration.addAllowedOriginPattern("*"); // 或者用 addAllowedOrigin("*")
      //  corsConfiguration.addAllowedOrigin("http://"+nowip+":8080");
        corsConfiguration.addAllowedHeader("*");
        corsConfiguration.addAllowedMethod("*");
        corsConfiguration.setMaxAge(MAX_AGE);
        source.registerCorsConfiguration("/**", corsConfiguration);
        return new CorsFilter(source);
 
    }
}
