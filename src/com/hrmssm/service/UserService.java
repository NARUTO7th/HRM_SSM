package com.hrmssm.service;

import com.hrmssm.dao.UserMapper;
import com.hrmssm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public boolean checkLogin(String username,String password){
        User user = userMapper.findUserByNameAndPwd (username,password);
        System.out.println (user == null);

        if(user != null){
            return true;
        }
        return false;
    }

    public boolean checkName(String username){
        User user = userMapper.selectUserByName (username);
        //未在tb_user中查到数据
        System.out.println ("This is select user by name!!");
        System.out.println (user == null);

        if(user != null){
            return true;
        }
        return false;
    }

    public boolean registerByObject(User user){
        if(userMapper.insertByObject (user) != 0){
            return true;
        }

        return false;
    }
}
