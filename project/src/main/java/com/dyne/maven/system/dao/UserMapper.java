package com.dyne.maven.system.dao;

import com.dyne.maven.system.po.User;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    // 用户登录
    public User loginUser(User user);
    
    User findUserInfo(Long id);
}