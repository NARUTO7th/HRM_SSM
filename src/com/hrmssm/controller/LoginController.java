package com.hrmssm.controller;

import com.hrmssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public String login(String userName, String password,
                        HttpServletRequest request,
                        Map<String,Object> map){
        boolean isLogin = userService.checkLogin(userName, password);
        if (!isLogin){
            //map.put("errorInfo","用户名密码错误！");
            return "failure";
        }else{
            request.getSession().setAttribute("user",userName);
            return "success";
        }
    }
}
