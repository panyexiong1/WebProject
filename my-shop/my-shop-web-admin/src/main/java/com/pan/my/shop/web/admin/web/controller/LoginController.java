package com.pan.my.shop.web.admin.web.controller;

import com.pan.my.shop.commons.contant.ConstantUtils;
import com.pan.my.shop.domain.TbUser;
import com.pan.my.shop.web.admin.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


/**
 * @author panyexiong
 * @date 2019/6/7 - 16:57
 */
@Controller
public class LoginController {

    @Autowired
    private TbUserService tbUserService;


    /**
     * 跳转登录界面
     *
     * @return
     */
    @RequestMapping(value = {"", "login"}, method = RequestMethod.GET)
    public String login() {
        return "/login";
    }

    /**
     * 登录逻辑
     *
     * @param email
     * @param password
     * @return
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@RequestParam(required = true) String email, @RequestParam(required = true) String password, HttpServletRequest httpServletRequest, Model model) {

        TbUser tbUser = tbUserService.login(email, password);
        if (tbUser == null) {
            model.addAttribute("message","用户名或密码错误");
            return login();
        } else {
            httpServletRequest.getSession().setAttribute(ConstantUtils.SESSION_USER, tbUser);
            return "redirect:/home";
        }
    }

    /**
     * 注销
     * @return
     */
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().invalidate();
        return login();
    }
}
