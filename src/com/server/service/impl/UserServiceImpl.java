package com.server.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.server.dao.UserDao;
import com.server.entity.Message;
import com.server.entity.User;
import com.server.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

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
	@Override
	public User getByUsername(String username) {
		User user = userDao.getByUsername(username);
		return user;
	}

	/**
	 * @Description: 注册帐号
	 *
	 * @param user
	 *            用户
	 * @return
	 */
	@Override
	public int insertUser(User user) {
		int insertNum = userDao.insert(user);
		return insertNum;
	}

	/**
	 * @Description: 通过用户名和手机查询
	 *
	 * @param username
	 *            用户名
	 * @param mobile
	 *            手机
	 * @return
	 */
	@Override
	public User getByUsernameAndMobile(String username, String mobile) {
		User user = userDao.getByUsernameAndMobile(username, mobile);
		return user;
	}

	/**
	 * @Description: 更新用户信息
	 *
	 * @param user
	 *            用户
	 * @return
	 */
	@Override
	public int updateUser(User user) {
		int updateNum = userDao.updateByPrimaryKeySelective(user);
		return updateNum;
	}

	/**
	 * @Description: 添加投诉建议
	 *
	 * @param user
	 *            用户
	 * @return
	 */
	@Override
	public int addMessage(Message message) {
		int insertNum = userDao.addCustomServiceMessage(message);
		return insertNum;
	}

	@Override
	public List<Message> getAllMessge() {
		List<Message> messageList = userDao.getAllMessge();
		return messageList;
	}

	@Override
	public List<User> getAllUser() {
		List<User> userList = userDao.getAllUser();
		for (User user : userList) {
			String totalPay = userDao.getTotalPayByUsername(user.getUsername());
			if(totalPay == null)totalPay = "0";
			user.setTotalPay(totalPay);
		}
		return userList;
	}

	@Override
	public int deleteUser(String username) {
		int deleteNum = userDao.deleteUser(username);
		// TODO Auto-generated method stub
		return deleteNum;
	}

}
