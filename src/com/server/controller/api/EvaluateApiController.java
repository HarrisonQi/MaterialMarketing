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
import com.server.entity.Evaluate;
import com.server.entity.OrderItem;
import com.server.service.EvaluateService;
import com.server.service.OrderItemService;

@Controller
@RequestMapping("/evaluate")
public class EvaluateApiController {

	@Autowired
	private EvaluateService EvaluateService;

	@Autowired
	private OrderItemService orderItemService;

	/**
	 * @Description: 添加图书评论
	 *
	 * @param username
	 *            用户名
	 * @param orderItemNo
	 *            订单编号
	 * @param bookId
	 *            图书ID
	 * @param grade
	 *            评价等级
	 * @param discription
	 *            评价描述
	 * @return
	 */
	@RequestMapping(value = "/insert", method = { RequestMethod.POST })
	@ResponseBody
	public Response insert(@RequestParam(value = "username") String username,
			@RequestParam(value = "orderItemNo") int orderItemNo, @RequestParam(value = "bookId") int bookId,
			@RequestParam(value = "grade") int grade, @RequestParam(value = "discription") String discription,
			@RequestParam(value = "title") String title) {
		if (StringUtils.isBlank(username)) {
			return Response.error("用户名为空！");
		}
		Evaluate Evaluate = new Evaluate();
		Evaluate.setDiscription(discription);
		Evaluate.setBookId(bookId);
		Evaluate.setTitle(title);
		Evaluate.setGrade(grade);
		Evaluate.setUsername(username);
		int insertNum = EvaluateService.insertBooksEvaluate(Evaluate);
		int updateNum = 0;
		OrderItem orderItem = orderItemService.getByOrderItemNo(orderItemNo);
		if (orderItem != null) {
			orderItem.setOrderItemStatus(2);
			updateNum = orderItemService.updateOrderItem(orderItem);
		}
		if (insertNum > 0 && updateNum > 0) {
			return Response.success("插入成功！");
		}
		return Response.error("插入失败！请联系工作人员！");
	}

	/**
	 * @Description: 通过图书id获取评论
	 *
	 * @param bookId
	 * @return
	 */
	@RequestMapping(value = "/getByBookId", method = { RequestMethod.POST })
	@ResponseBody
	public Response getByBookId(@RequestParam(value = "bookId") int bookId) {
		List<Evaluate> Evaluates = EvaluateService.getByBookId(bookId);
		return Response.success("查询成功！", Evaluates);
	}
}
