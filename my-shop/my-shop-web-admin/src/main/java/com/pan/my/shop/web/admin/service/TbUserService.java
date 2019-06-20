package com.pan.my.shop.web.admin.service;

import com.pan.my.shop.commons.dto.BaseResult;
import com.pan.my.shop.domain.TbUser;

import java.util.List;

/**
 * @author panyexiong
 * @date 2019/6/7 - 23:03
 */
public interface TbUserService {
    public List<TbUser> selectAll();

    BaseResult save(TbUser tbUser);

    void delete(Long id);

    TbUser getById(Long id);

    void update(TbUser tbUser);

    List<TbUser> selectByUsername(String username);

    /**
     * 用户登录
     * @param email
     * @param password
     * @return
     */
    TbUser login(String email, String password);
}
