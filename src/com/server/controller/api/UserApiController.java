package com.server.controller.api;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.server.common.Response;
import com.server.entity.Message;
import com.server.entity.User;
import com.server.service.UserService;

@Controller
@RequestMapping("/user")
public class UserApiController {
	@Autowired
	private UserService userService;

	/**
	 * @Description: 根据用户名查询用户信息
	 *
	 * @param username
	 *            用户名
	 * @return
	 */
	@RequestMapping(value = "/getUser", method = { RequestMethod.POST })
	@ResponseBody
	public Response getUser(@RequestParam(value = "username") String username) {
		if (StringUtils.isBlank(username)) {
			return Response.error("参数username为空！");
		}
		User user = userService.getByUsername(username);
		if (user != null) {
			return Response.success("查询成功", user);
		}
		return Response.error("查询失败，请联系工作人员！");
	}
	
	/**
	 * @Description: 根据用户名查询用户信息
	 *
	 * @param username
	 *            用户名
	 * @return
	 */
	@RequestMapping(value = "/getAllUser", method = { RequestMethod.POST })
	@ResponseBody
	public Response getAllUser(@RequestParam(value = "username") String username) {
		if (StringUtils.isBlank(username)) {
			return Response.error("参数username为空！");
		}
		List<User> userList = userService.getAllUser();
		if (userList.size()>0) {
			return Response.success("查询成功", userList);
		}
		return Response.error("查询失败，请联系工作人员！");
	}
	

	/**
	 * @Description: 修改用户信息
	 *
	 * @param username
	 *            用户帐号
	 * @return
	 * @author LiuYingming
	 * @date 2017年11月25日 下午12:25:00
	 */
	@RequestMapping(value = "/update", method = { RequestMethod.POST })
	@ResponseBody
	public Response update(@RequestParam(value = "username") String username,
			@RequestParam(value = "mobile") String mobile, @RequestParam(value = "address") String address) {
		if (StringUtils.isBlank(username)) {
			return Response.error("参数username为空！");
		}
		User user = userService.getByUsername(username);
		int updateNum = 0;
		if (user != null) {
			if (StringUtils.isNotBlank(mobile)) {
				user.setMobile(mobile);
			}
			if (StringUtils.isNotBlank(address)) {
				user.setAddress(address);
			}
			updateNum = userService.updateUser(user);
		}
		if (updateNum > 0) {
			return Response.success("更新成功");
		}
		return Response.error("查询失败，请联系工作人员！");
	}

	/**
	 * @Description: 修改用户密码
	 *
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return
	 */
	@RequestMapping(value = "/updatePassword", method = { RequestMethod.POST })
	@ResponseBody
	public Response updatePassword(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "newPassword") String newPassword) {
		if (StringUtils.isBlank(username)) {
			return Response.error("参数username为空！");
		}
		if (StringUtils.isBlank(password)) {
			return Response.error("参数password为空！");
		}
		User user = userService.getByUsername(username);
		if (!StringUtils.equals(user.getPassword(), password)) {
			return Response.error("原密码不正确！");
		}
		int updateNum = 0;
		if (user != null) {
			user.setPassword(newPassword);
			updateNum = userService.updateUser(user);
		}
		if (updateNum > 0) {
			return Response.success("更新成功");
		}
		return Response.error("更新失败，请联系工作人员");
	}

	@RequestMapping(value = "/insert", method = { RequestMethod.POST })
	@ResponseBody
	public Response insert(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password, @RequestParam(value = "mobile") String mobile,
			@RequestParam(value = "address", required = false) String address) {
		if (StringUtils.isBlank(username)) {
			return Response.error("用户名为空！");
		}
		if (StringUtils.isBlank(password)) {
			return Response.error("密码为空！");
		}
		if (StringUtils.isBlank(mobile)) {
			return Response.error("电话为空！");
		}
		User user = userService.getByUsername(username);
		if (user != null) {
			return Response.error("用户名已存在！");
		}
		User insertUser = new User();
		insertUser.setAddress(address);
		insertUser.setMobile(mobile);
		insertUser.setPassword(password);
		insertUser.setUsername(username);
		insertUser.setIsadmin(0);
		int insertNum = userService.insertUser(insertUser);
		if (insertNum > 0) {
			return Response.success("注册成功", insertUser);
		}
		return Response.error("注册失败，系统繁忙，请稍后重试");
	}
	
	@RequestMapping(value = "/addmessage", method = { RequestMethod.POST })
	@ResponseBody
	public Response addUserService(@RequestParam(value = "username") String username,
			@RequestParam(value = "message") String message) {
		
		if (StringUtils.isBlank(message)) {
			return Response.error("请填写您的意见!");
		}else if(message.length()<10) {
			return Response.error("请填写十个字符以上的意见!");
		}
		
		Message messageEntity = new Message();
		messageEntity.setMessage(message);
		messageEntity.setUsername(username);
		int insertNum = userService.addMessage(messageEntity);
		
		if (insertNum > 0) {
			return Response.success("投诉成功", messageEntity);
		}
		return Response.error("投诉失败，系统繁忙，请稍后重试");
	}
	
	@RequestMapping(value = "/getAllmessage", method = { RequestMethod.POST })
	@ResponseBody
	public Response getmessage(@RequestParam(value = "username") String username) {
		List<Message> messageList = userService.getAllMessge();
		
		if (messageList.size() > 0) {
			return Response.success("查询成功", messageList);
		}
		return Response.error("查询失败，系统繁忙，请稍后重试");
		
	}
	
	@RequestMapping(value = "/deleteUser", method = { RequestMethod.POST })
	@ResponseBody
	public Response deleteUser(@RequestParam(value = "username") String username) {
		int mount = userService.deleteUser(username);
		
		if (mount > 0) {
			return Response.success("删除成功", mount);
		}
		return Response.error("删除失败，系统繁忙，请稍后重试");
		
	}
}
