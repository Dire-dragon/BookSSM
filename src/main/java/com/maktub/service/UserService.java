package com.maktub.service;

import com.maktub.bean.User;
import com.maktub.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Ddr
 * @create 2021-06-26 11:10
 */
@Service
public class UserService {

    @Autowired
    UserMapper userMapper;


    /**
     * 判断用户是否存在
     * @param isUser
     * @return  存在则返回用户ID，不存在则返回-1
     */
    public int isExist(User isUser) {
        User user = userMapper.selectBySelective(isUser);
        if(user == null){
            return -1;
        }
        return user.getId();
    }

}
