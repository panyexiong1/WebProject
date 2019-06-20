package com.shu.user.domain;

/**
 * @author panyexiong
 * @date 2019/4/11 - 11:44
 */
public class User {
    private String uid;
    private String username;
    private String password;
    private Integer root;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRoot() {
        return root;
    }

    public void setRoot(Integer root) {
        this.root = root;
    }
}
