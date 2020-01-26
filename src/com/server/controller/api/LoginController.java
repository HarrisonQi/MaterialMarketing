package com.server.controller.api;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.server.common.Response;
import com.server.entity.User;
import com.server.service.UserService;

@Controller
@RequestMapping("/api")
public class LoginController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login", method = { RequestMethod.POST })
	@ResponseBody
	public Response cmdsetList(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password, @RequestParam(value = "isadmin") int isadmin) {
		if (StringUtils.isBlank(username)) {
			return Response.error("用户名为空！");
		}
		if (StringUtils.isBlank(password)) {
			return Response.error("密码为空！");
		}
		User user = userService.getByUsername(username);
		if (user == null) {
			return Response.error("用户名不存在！");
		}
		if (!StringUtils.equals(password, user.getPassword())) {
			return Response.error("用户名密码错误！");
		}
		if (isadmin != user.getIsadmin()) {
			return Response.error("用户身份错误！");
		}
		return Response.success("登录成功", user);
	}

	/**
	 * 
	 * @Description: 通过手机号和帐号验证
	 *
	 * @param username
	 *            用户名
	 * @param mobile
	 *            手机号
	 * @return
	 */

	@RequestMapping(value = "/verift", method = { RequestMethod.POST })

	@ResponseBody
	public Response verift(@RequestParam(value = "username") String username,

			@RequestParam(value = "mobile") String mobile) {
		if (StringUtils.isBlank(username)) {
			return Response.error("用户名为空！");
		}
		if (StringUtils.isBlank(mobile)) {
			return Response.error("手机号为空！");
		}
		User user = userService.getByUsernameAndMobile(username, mobile);
		if (user == null) {
			return Response.error("验证失败！");
		}
		return Response.success("验证成功", user);
	}

	/**
	 * 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * 
	 * @param username
	 * 
	 * @param mobile
	 * 
	 * @return
	 * 
	 * @author LiuYingming
	 * 
	 * @date 2017年11月23日 下午11:23:16
	 */
	@RequestMapping(value = "/updatePassword", method = { RequestMethod.POST })
	@ResponseBody
	public Response updatePassword(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password) {
		if (StringUtils.isBlank(username)) {
			return Response.error("用户名为空！");
		}
		if (StringUtils.isBlank(password)) {
			return Response.error("密码为空！");
		}
		User user = userService.getByUsername(username);
		if (user == null) {
			return Response.error("修改失败！用户不存在");
		}
		user.setPassword(password);
		int updateNum = userService.updateUser(user);
		if (updateNum <= 0) {
			return Response.error("密码修改失败！请联系工作人员！");
		}
		return Response.success("验证成功", user);
	}
}
