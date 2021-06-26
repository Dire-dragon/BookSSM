package com.maktub.dao;

import com.maktub.bean.User;

public interface UserMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    User selectBySelective(User user);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);


}