package com.jayshawn.dao;

import org.apache.ibatis.annotations.*;

import com.jayshawn.model.User;


@Mapper
public interface UserDAO {

	String TABLE_NAME = " user ";
    String INSERT_FIELDS = " name, password, salt, head_url,email ";
    String SELECT_FIELDS = " id, " + INSERT_FIELDS;

    int addUser(User user);

    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where id=#{id}"})
    User selectById(int id);
    
    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where name=#{name}"})
    User selectByName(String name);

    @Update({"update ", TABLE_NAME, " set password=#{password} where id=#{id}"})
    void updatePassword(User user);

    @Delete({"delete from ", TABLE_NAME, " where id=#{id}"})
    void deleteById(int id);
}
