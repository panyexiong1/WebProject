package com.shu.user.dao;

import com.shu.user.domain.User;

/**
 * @author panyexiong
 * @date 2019/4/11 - 11:45
 */
public interface UserDao {
    public User find(User user);
}
