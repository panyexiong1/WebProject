package com.shu.user.dao.impl;

import com.shu.user.dao.UserDao;
import com.shu.user.domain.User;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * @author panyexiong
 * @date 2019/4/11 - 11:46
 */
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
    @Override
    public User find(User user) {
        List<User> user1 = (List<User>) this.getHibernateTemplate().find("from User where username= ?0 and password= ?1", user.getUsername(), user.getPassword());
        if (user1.size() == 1) {
            return user1.get(0);
        }
        return null;
    }
}
