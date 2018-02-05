package com.dyne.maven.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyne.maven.system.dao.UserMapper;
import com.dyne.maven.system.po.User;
import com.dyne.maven.system.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userDao;

    @Override
    public User loginUser(User user) {
        return userDao.loginUser(user);
    }

    @Override
    public User findUserInfo(Long id) {
        return userDao.findUserInfo(id);
    }

}
