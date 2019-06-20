package com.pan.my.shop.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author panyexiong
 * @date 2019/6/7 - 17:15
 */
@Controller
public class MainController {
    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String main() {
        return "home";
    }
}
