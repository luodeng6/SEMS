/*
package org.sems.sems.Public;

import com.alibaba.fastjson.JSON;  // 确保你引入了正确的 JSON 库
import org.springframework.stereotype.Component;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

// 使用Component注解将该类注册为Spring Bean
@Component
public class CustomFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 初始化过滤器
        System.out.println("过滤器初始化");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response; // 获取响应对象

        // 获取请求的URI
        String uri = httpRequest.getRequestURI();
        System.out.println("请求的URI：" + uri);

        // 检查请求是否是登录、注册或检查Session的请求
        if (uri.equals("/user/login") || uri.equals("/user/register") || uri.equals("/user/checkSession")) {
            // 直接放行，跳过过滤逻辑
            chain.doFilter(request, response);
            System.out.println("登录、注册或检查Session请求，放行");
            return;
        }

        // 获取session
        HttpSession session = httpRequest.getSession();

        System.out.println("当前登录用户:"+session.getAttribute("username"));

        // 创建结果集
        Map<String, Object> result = new HashMap<>();

        if (session != null && session.getAttribute("username") != null) {
            // 用户已登录，放行
            System.out.println("用户已经登录: " + session.getAttribute("username"));
            chain.doFilter(request, response);  // 继续执行链中的其他过滤器或目标资源
        } else {
            // 用户未登录
            System.out.println("用户未登录！我要拦截请求！！！");
            result.put("result", false);
            result.put("username", null);
            result.put("message", "用户未登录，请先登录"); // 可选的提示信息

            // 拦截请求，返回JSON数据
            httpResponse.setContentType("application/json;charset=UTF-8");
            httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 设置401状态码
            httpResponse.getWriter().write(JSON.toJSONString(result)); // 写出JSON响应


        }
    }

    @Override
    public void destroy() {
        // 清理资源
        System.out.println("过滤器销毁");
    }
}*/
