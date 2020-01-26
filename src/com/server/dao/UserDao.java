package com.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.server.entity.Message;
import com.server.entity.User;

public interface UserDao {
	int deleteByPrimaryKey(Integer id);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	User getByUsername(@Param("username") String username);

	User getByUsernameAndMobile(@Param("username") String username, @Param("mobile") String mobile);
	
	int addCustomServiceMessage(Message message);
	
	List<Message> getAllMessge();
	
	List<User> getAllUser();
	
	String getTotalPayByUsername(String username);
	
	int deleteUser(String username);
}