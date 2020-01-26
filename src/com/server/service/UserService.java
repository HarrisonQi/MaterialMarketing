package com.server.service;

import java.util.List;

import com.server.entity.Message;
import com.server.entity.User;

public interface UserService {

	/**
	 * @Description: 用户登录
	 *
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @param isAdmin
	 *            是否是管理员
	 */
	User getByUsername(String username);
	
	/**
	 * @Description: 获取所有会员
	 *
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @param isAdmin
	 *            是否是管理员
	 */
	List<User> getAllUser();

	/**
	 * @Description: 注册帐号
	 *
	 * @param user
	 *            用户
	 * @return
	 */
	int insertUser(User user);

	/**
	 * @Description: 通过用户名和手机查询
	 *
	 * @param username
	 *            用户名
	 * @param mobile
	 *            手机
	 * @return
	 */
	User getByUsernameAndMobile(String username, String mobile);

	/**
	 * @Description: 更新用户信息
	 *
	 * @param user
	 *            用户
	 * @return
	 */
	int updateUser(User user);

	/**
	 * @Description: 增加用户投诉信息
	 * @param message
	 * @return
	 */
	int addMessage(Message message);
	
	/**
	 * 获取所有投诉信息
	 * @return
	 */
	List<Message> getAllMessge();
	
	/**
	 * 
	 */
	int deleteUser(String username);
}
