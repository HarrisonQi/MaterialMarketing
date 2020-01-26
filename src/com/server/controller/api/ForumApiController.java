/*package com.server.controller.api;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.server.common.Response;
import com.server.entity.Forum;
import com.server.service.ForumService;

@Controller
@RequestMapping("/forum")
public class ForumApiController {

	@Autowired
	private ForumService forumService;

	@RequestMapping(value = "/getAll", method = { RequestMethod.POST })
	@ResponseBody
	public Response getAll() {
		List<Forum> forums = forumService.getAll();
		return Response.success("查询成功！", forums);
	}

	@RequestMapping(value = "/getByUsername", method = { RequestMethod.POST })
	@ResponseBody
	public Response getAll(@RequestParam(value = "username") String username) {
		List<Forum> forums = forumService.getByUsername(username);
		return Response.success("查询成功！", forums);
	}

	*//**
	 * @Description: 插入帖子
	 *
	 * @param username
	 *            用户名
	 * @param title
	 *            标题
	 * @param context
	 *            内容
	 * @return
	 *//*
	@RequestMapping(value = "/insert", method = { RequestMethod.POST })
	@ResponseBody
	public Response insert(@RequestParam(value = "username") String username,
			@RequestParam(value = "title") String title, @RequestParam(value = "context") String context) {
		if (StringUtils.isBlank(title)) {
			return Response.error("标题不能为空！");
		}
		Forum forum = new Forum();
		forum.setContext(context);
		forum.setCreateTime(new Date());
		forum.setSender(username);
		forum.setTitle(title);
		forum.setUpdateTime(new Date());
		int insertNum = forumService.insert(forum);
		if (insertNum > 0) {
			return Response.success("添加成功！");
		}
		return Response.error("添加失败！请联系工作人员！");
	}

	@RequestMapping(value = "/detele", method = { RequestMethod.POST })
	@ResponseBody
	public Response detele(@RequestParam(value = "id") int id) {
		int deteleNum = forumService.detele(id);
		if (deteleNum > 0) {
			return Response.success("删除成功！");
		}
		return Response.error("删除失败，请联系工作人员！");
	}

}
*/