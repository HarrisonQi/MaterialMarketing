package com.server.controller.api;

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
import com.server.entity.OrderItem;
import com.server.service.OrderItemService;
import com.server.service.ShoppingCartService;

@Controller
@RequestMapping("/orderItem")
public class OrderItemApiController {
	@Autowired
	private OrderItemService orderItemService;

	@Autowired
	private ShoppingCartService shoppingCartService;

	/**
	 * @Description: 通过用户名获取数据
	 *
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/getOrderItemByUsername", method = { RequestMethod.POST })
	@ResponseBody
	public Response verift(@RequestParam(value = "username") String username) {
		if (StringUtils.isBlank(username)) {
			return Response.error("参数用户名为空！");
		}
		List<OrderItem> orders = orderItemService.getByUername(username);
		return Response.success("查询成功", orders);
	}
	
	/**
	 * @Description: 获取全部订单
	 *
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/getAllOrderItem", method = { RequestMethod.POST })
	@ResponseBody
	public Response getAllOrders(@RequestParam(value = "username") String username) {
		if (StringUtils.isBlank(username)) {
			return Response.error("参数用户名为空！");
		}
		List<OrderItem> orders = orderItemService.getByUername(null);
		return Response.success("查询成功", orders);
	}

	/**
	 * @Description: 退货
	 *
	 * @param orderItemNo
	 * @return
	 */
	@RequestMapping(value = "/salesReturn", method = { RequestMethod.POST })
	@ResponseBody
	public Response salesReturn(@RequestParam(value = "orderItemNo") int orderItemNo) {
		OrderItem orderItem = orderItemService.getByOrderItemNo(orderItemNo);
		int updaeNum = 0;
		if (orderItem != null) {
			orderItem.setOrderItemStatus(3);
			updaeNum = orderItemService.updateOrderItem(orderItem);
		}
		if (updaeNum > 0) {
			return Response.success("更新成功", orderItem);
		}
		return Response.error("更新失败，请联系工作人员！");
	}

	/**
	 * @Description: 确认收货
	 *
	 * @param orderItemNo
	 * @return
	 */
	@RequestMapping(value = "/confirmReceipt", method = { RequestMethod.POST })
	@ResponseBody
	public Response confirmReceipt(@RequestParam(value = "orderItemNo") int orderItemNo) {
		OrderItem orderItem = orderItemService.getByOrderItemNo(orderItemNo);
		int updaeNum = 0;
		if (orderItem != null) {
			orderItem.setOrderItemStatus(1);
			updaeNum = orderItemService.updateOrderItem(orderItem);
		}
		if (updaeNum > 0) {
			return Response.success("更新成功", orderItem);
		}
		return Response.error("更新失败，请联系工作人员！");
	}

	@RequestMapping(value = "/insert", method = { RequestMethod.POST })
	@ResponseBody
	public Response insert(@RequestParam(value = "title") String title, @RequestParam(value = "price") int price,
			@RequestParam(value = "bookId") int bookId, @RequestParam(value = "receiveAddress") String receiveAddress,
			@RequestParam(value = "receiver") String receiver,
			@RequestParam(value = "receiverMobile") String receiverMobile,
			@RequestParam(value = "username") String username,
			@RequestParam(value = "shoppingCartID") int shoppingCartID, @RequestParam(value = "count") int count) {
		if (StringUtils.isBlank(title)) {
			return Response.error("参数商品名为空！");
		}
		if (StringUtils.isBlank(receiveAddress)) {
			return Response.error("参数接收为空！");
		}
		if (StringUtils.isBlank(receiver)) {
			return Response.error("参数接收者为空！");
		}
		if (StringUtils.isBlank(username)) {
			return Response.error("参数用户为空！");
		}
		OrderItem orderItem = new OrderItem();
		orderItem.setCreateTime(new Date());
		orderItem.setBookId(bookId);
		orderItem.setTitle(title);
		orderItem.setPrice(price);
		orderItem.setReceiveAddress(receiveAddress);
		orderItem.setReceiver(receiver);
		orderItem.setReceiveMobile(receiverMobile);
		orderItem.setOrderItemStatus(0);
		orderItem.setUsername(username);
		orderItem.setSendAddress("XXX物料商店");
		orderItem.setSender("XXX物料商店");
		orderItem.setSendMobile("400-123456");
		orderItem.setCount(count);
		int insertNum = orderItemService.insertOrderItem(orderItem);
		int deteleNum = shoppingCartService.deleteShoppingCart(shoppingCartID);
		if (insertNum > 0 && deteleNum > 0) {
			return Response.success("操作成功", orderItem);
		}
		return Response.error("添加失败，请联系工作人员！");
	}

	@RequestMapping(value = "/insertNowPay", method = { RequestMethod.POST })
	@ResponseBody
	public Response insertNowPay(@RequestParam(value = "title") String title, @RequestParam(value = "price") int price,
			@RequestParam(value = "bookId") int bookId, @RequestParam(value = "receiveAddress") String receiveAddress,
			@RequestParam(value = "receiver") String receiver,
			@RequestParam(value = "receiverMobile") String receiverMobile,
			@RequestParam(value = "username") String username, @RequestParam(value = "count") int count) {
		if (StringUtils.isBlank(title)) {
			return Response.error("参数商品名为空！");
		}
		if (StringUtils.isBlank(receiveAddress)) {
			return Response.error("参数接收为空！");
		}
		if (StringUtils.isBlank(receiver)) {
			return Response.error("参数接收者为空！");
		}
		if (StringUtils.isBlank(username)) {
			return Response.error("参数用户为空！");
		}
		OrderItem orderItem = new OrderItem();
		orderItem.setCreateTime(new Date());
		orderItem.setBookId(bookId);
		orderItem.setTitle(title);
		orderItem.setPrice(price);
		orderItem.setReceiveAddress(receiveAddress);
		orderItem.setReceiver(receiver);
		orderItem.setReceiveMobile(receiverMobile);
		orderItem.setOrderItemStatus(0);
		orderItem.setUsername(username);
		orderItem.setSendAddress("XXX物料商店");
		orderItem.setSender("XXX物料商店");
		orderItem.setSendMobile("400-123456");
		orderItem.setCount(count);
		int insertNum = orderItemService.insertOrderItem(orderItem);
		if (insertNum > 0) {
			return Response.success("操作成功", orderItem);
		}
		return Response.error("添加失败，请联系工作人员！");
	}

}
