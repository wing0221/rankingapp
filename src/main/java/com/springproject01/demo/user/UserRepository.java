package com.springproject01.demo.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserRepository {

    @Select("select * from user")
    List<UserEntity> findAll();

    @Select("select * from user where user_id = #{user_id}")
    UserEntity findById(int user_id);

}
