package com.shu.user.service.impl;

import com.shu.user.dao.UserDao;
import com.shu.user.dao.impl.UserDaoImpl;
import com.shu.user.domain.User;
import com.shu.user.service.UserService;
import com.shu.utils.MyStringUtils;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 * @author panyexiong
 * @date 2019/4/11 - 12:14
 */
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User login(User user) {
        //MD5加密
//        String logginPwd = MyStringUtils.getMD5Value(user.getPassword());
//        user.setPassword(logginPwd);
        return userDao.find(user);
    }
}
