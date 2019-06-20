package com.pan.my.shop.web.admin.dao;

import com.pan.my.shop.domain.TbUser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author panyexiong
 * @date 2019/6/7 - 23:01
 */
@Repository
public interface TbUserDao {

    /**
     * 查询用户表全部信息
     * @return
     */
    List<TbUser> selectAll();

    /**
     * 新增用户
     * @param tbUser
     */
    void insert(TbUser tbUser);

    /**
     * 根据Id删除
     * @param id
     */
    void delete(Long id);

    /**
     * 根据id查询用户信息
     * @param id
     * @return
     */
    TbUser getById(Long id);

    /**
     * 更新用户
     * @param tbUser
     */
    void update(TbUser tbUser);

    /**
     * 根据用户名模糊查询
     * @param username
     * @return
     */
    List<TbUser> selectByUsername(String username);

    /**
     * 根据邮箱查询用户信息
     * @param email
     * @return
     */
    TbUser getByEmail(String email);

}
