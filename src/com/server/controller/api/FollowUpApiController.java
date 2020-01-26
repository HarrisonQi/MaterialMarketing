/*package com.server.controller.api;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.server.common.Response;
import com.server.entity.FollowUp;
import com.server.service.FollowUpService;

@Controller
@RequestMapping("/followUp")
public class FollowUpApiController {

	@Autowired
	private FollowUpService followUpService;

	*//**
	 * @Description: 跟帖
	 *
	 * @param parentId
	 *            父帖ID
	 * @param followSender
	 *            跟帖人
	 * @param followContext
	 *            跟帖内容
	 * @return
	 *//*
	@RequestMapping(value = "/insert", method = { RequestMethod.POST })
	@ResponseBody
	public Response insert(@RequestParam(value = "parentId") int parentId,
			@RequestParam(value = "followSender") String followSender,
			@RequestParam(value = "followContext") String followContext) {
		FollowUp followUp = new FollowUp();
		followUp.setCreateTime(new Date());
		followUp.setFollowContext(followContext);
		followUp.setFollowSender(followSender);
		followUp.setParentId(parentId);
		followUp.setUpdateTime(new Date());
		int insertNum = followUpService.insert(followUp);
		if (insertNum > 0) {
			return Response.success("添加成功！");
		}
		return Response.error("添加失败！请联系工作人员！");
	}

	*//**
	 * @Description: 查询所有跟帖信息
	 *
	 * @param parentId
	 * @return
	 *//*
	@RequestMapping(value = "/getByParentId", method = { RequestMethod.POST })
	@ResponseBody
	public Response getByParentId(@RequestParam(value = "parentId") int parentId) {
		List<FollowUp> followUpList = followUpService.getByParentId(parentId);
		return Response.success("查询成功！", followUpList);
	}
}
*/