package com.cqcet.controller;

import com.cqcet.entity.Admin;
import com.cqcet.entity.User;
import com.cqcet.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "admin")
    public String admin(@RequestParam("username") String name, @RequestParam("userpwd") String pwd){
        Admin admin = new Admin();
        admin.setAd_name(name);
        admin.setAd_pwd(pwd);
        if (userService.adminlogin(admin)>0){
            return "adminweb";
        }else if (userService.adminlogin(admin)<0){
            return "admin";
        }else {
            return "admin";
        }
    }
    @RequestMapping(value = "login")
    public String login(@RequestParam("username") String name, @RequestParam("userpwd") String pwd){
        User user = new User();
        user.setName(name);
        user.setPwd(pwd);
        if (userService.login(user) > 0) {
           return "userweb";
        } else if (userService.login(user) < 0) {
            return "login";
        } else {
            return "login";
        }
    }


    @RequestMapping(value = "register")
    public String register(HttpServletResponse resq,@RequestParam("name") String name, @RequestParam("pwd") String pwd, @RequestParam("sex") String sex){
        User user = new User();
        user.setName(name);
        user.setPwd(pwd);
        user.setSex(sex);
        if(userService.register(user)>0){
            return "login";
        }
        else if (userService.register(user)<0){
            return "register";
        }else {
            return "register";
        }
    }


}
