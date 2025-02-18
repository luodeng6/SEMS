package org.sems.sems.Controller;

import org.sems.sems.Mapper.DataMapper;
import org.sems.sems.Public.PublicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private HttpSession session;
    @Autowired
    private DataMapper dataMapper;
    @Autowired
    private PublicService publicService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Map<String, Object> login(String username, String password, HttpServletRequest request) {
       /* System.out.println("执行登录接口成功！");
        result.put("code",200);
        result.put("result",userList.get(0).get("RESULT") );
        result.put("Msg",userList.get(0).get("Msg") );
        result.put("YHM",userList.get(0).get("YHM") );
        result.put("UserRole",userList.get(0).get("UserRole") );
        result.put("YHMC", userList.get(0).get("YHMC") );*/

        Map<String, Object> result = publicService.LoginInterface(username, password, "admin");
        if (result.get("result").equals(true)) {
            System.out.println("登录成功，将把用户信息存储到 Session");
            // 登录成功，创建 Session
            HttpSession session = request.getSession();
            session.setAttribute("username", username); // 将用户信息存储到 Session
            session.setAttribute("role", result.get("UserRole"));
            session.setAttribute("name", result.get("YHMC"));
            session.setAttribute("YHSFDM", result.get("YHSFDM"));
        } else {
            System.out.println("登录失败，清除 Session");
            // 登录失败，清除 Session
            session.invalidate();
        }
        return result;
    }

    @RequestMapping(value = "/StuLogin", method = RequestMethod.POST)
    public Map<String, Object> StuLogin(String username, String password, HttpServletRequest request) {
        Map<String, Object> result = publicService.LoginInterface(username, password, "student");
        if (result.get("result").equals(1)) {
            System.out.println("登录成功，将把用户信息存储到 Session");
            // 登录成功，创建 Session
            HttpSession session = request.getSession();
            session.setAttribute("username", username); // 将用户信息存储到 Session
            session.setAttribute("role", result.get("UserRole"));
            session.setAttribute("name", result.get("YHMC"));
            session.setAttribute("YHSFDM", result.get("YHSFDM"));
        } else {
            System.out.println("登录失败，清除 Session");
            // 登录失败，清除 Session
            session.invalidate();
        }
        return result;
    }

    @RequestMapping(value = "/DwLogin", method = RequestMethod.POST)
    public Map<String, Object> DwLogin(String username, String password, HttpServletRequest request) {
        Map<String, Object> result = publicService.LoginInterface(username, password, "dw");
        if (result.get("result").equals(1)) {
            System.out.println("登录成功，将把用户信息存储到 Session");
            // 登录成功，创建 Session
            HttpSession session = request.getSession();
            session.setAttribute("username", username); // 将用户信息存储到 Session
            session.setAttribute("role", result.get("UserRole"));
            session.setAttribute("name", result.get("YHMC"));
            session.setAttribute("YHSFDM", result.get("YHSFDM"));
        } else {
            System.out.println("登录失败，清除 Session");
            // 登录失败，清除 Session
            session.invalidate();
        }
        return result;


    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public Map<String, Object> logout() {
        Map<String, Object> result = new HashMap<>();
        if (session != null) {
            session.invalidate(); // 使当前 Session 无效  
            result.put("message", "登出成功");
            result.put("result", true);
        } else {
            result.put("message", "未登录");
            result.put("result", false);
        }
        return result;
    }

    @RequestMapping(value = "/checkSession", method = RequestMethod.GET)
    public Map<String, Object> checkSession() {
        Map<String, Object> result = new HashMap<>();
        if (session != null && session.getAttribute("username") != null) {
            // 用户已登录  
            result.put("result", true);
            result.put("role", session.getAttribute("role"));
            result.put("name", session.getAttribute("name"));
            result.put("username", session.getAttribute("username"));
            result.put("YHSFDM", session.getAttribute("YHSFDM"));
            System.out.println("用户已经登录:");
            System.out.println(result);
        } else {
            System.out.println("用户未登录！:");
            // 用户未登录
            result.put("result", false);
            result.put("username", null);
            result.put("role", null);
            result.put("name", null);
            result.put("YHSFDM", null);
        }
        return result;
    }


    // 获取用户接口调用:存储过程：usp_GetAllSystemUser
   /* @userRole INT, -- 1 管理员，2 学生，3 教师，4 单位，5 全部用户角色
    @state INT -- 1 获取全部，2 仅获取启用的用户，3 仅获取关闭的用户*/
    /*@RequestMapping(value = "/getUser", method = RequestMethod.GET)
    public List<Map<String, Object>> getUser(int userRole, int state) {
        return publicService.getUser(userRole, state);
    }*/

    // 获取所有类型的用户接口调用:存储过程： getUserAllType
    @RequestMapping(value = "/getUserAllType", method = RequestMethod.GET)
    List<List<Map<String, Object>>> getUserAllType(int state) {
        return publicService.getUserAllType(state);
    }
    // 只获取一种类型的用户接口调用:存储过程
    @RequestMapping(value = "/getUserOneType", method = RequestMethod.GET)
    public List<Map<String, Object>> getUserOneType(int userRole, int state) {
        return publicService.getUserOneType(userRole, state);
    }
}