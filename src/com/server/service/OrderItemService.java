package com.server.service;

import java.util.List;

import com.server.entity.OrderItem;

public interface OrderItemService {

	// 根据用户名获取订单
	List<OrderItem> getByUername(String username);

	// 根据订单号查询数据
	OrderItem getByOrderItemNo(int orderItemNo);

	// 更新订单
	int updateOrderItem(OrderItem orderItem);

	// 插入数
	int insertOrderItem(OrderItem orderItem);
}
