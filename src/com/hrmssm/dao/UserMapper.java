package com.hrmssm.dao;

import com.hrmssm.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User findUserByNameAndPwd(@Param ("username") String username, @Param ("password") String password);

    Integer insertByObject(User user);

    User selectUserByName(@Param ("username") String username);
}
