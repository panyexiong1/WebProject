package com.shu.user.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shu.user.domain.User;
import com.shu.user.service.UserService;
import com.shu.user.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

/**
 * @author panyexiong
 * @date 2019/4/11 - 12:26
 */
public class UserAction extends ActionSupport implements ModelDriven<User> {

    private User user = new User();

    @Override
    public User getModel() {
        return user;
    }

    private UserService userService;


    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    public String login() {
        User findUser = userService.login(user);
        if (findUser != null) {
            //3.1session作用域保存数据
            ActionContext.getContext().getSession().put("loginUser", findUser);
            //3.2 重定向首页 -- xml配置
            return "success";
        }


        this.addFieldError("", "用户名或密码错误");
        return "login";
    }


    public String logout() {
        return "login";
    }
}
