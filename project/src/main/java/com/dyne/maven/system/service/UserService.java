package com.dyne.maven.system.service;

import com.dyne.maven.system.po.User;

public interface UserService {
    // 用户登录
    public User loginUser(User user);
    public User findUserInfo(Long id);
}
