package com.maktub.controller;

import com.google.code.kaptcha.Constants;
import com.maktub.bean.Msg;
import com.maktub.bean.User;
import com.maktub.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Ddr
 * @create 2021-06-26 11:09
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 判断指定的用户是否存在
     * @param user
     * @return  如果存在则返回成功，不存在则失败。
     */
    @RequestMapping("login")
    @ResponseBody
    public Msg login(@RequestParam("verity") String verity, User user, HttpServletRequest request){
        HttpSession session = request.getSession();
        String key = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        System.out.println(verity);
        if(!verity.equalsIgnoreCase(key)){
            return Msg.vertifyError();
        }
        int id =  userService.isExist(user);
        if(id == -1){
            return Msg.fail();
        }
        return Msg.success();
    }

    /**
     * 判断用户是否存在
     * @param user
     * @return  存在则返回成功，不存在则返回失败。
     */
    @RequestMapping("isExist")
    @ResponseBody
    public Msg isExist(User user){
        System.out.println(user);
        int id =  userService.isExist(user);
        if(id == -1){
            return Msg.fail();
        }
        return Msg.success();
    }

    @RequestMapping("regist")
    public String regist(){
        return "user/regist";
    }
}
