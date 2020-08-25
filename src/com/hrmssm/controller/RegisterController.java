package com.hrmssm.controller;

import com.hrmssm.pojo.User;
import com.hrmssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public String register(String username, String password,
                           HttpServletRequest request,
                           Map<String,Object> map){
        System.out.println ("This is Register Controller!!!");
        if(userService.checkName (username)){
            //map.put("errorInfo","用户名已被注册！");${errorInfo}
            return "failure";
        }else{
            if(userService.registerByObject (new User (username,password))){
                //map.put("errorInfo","注册成功，请登录！");
                return "success";
            }else{
                //map.put("errorInfo","注册失败！");
                return "failure";
            }
        }
    }

    /*@RequestMapping(value = "/register/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Employee */
}
