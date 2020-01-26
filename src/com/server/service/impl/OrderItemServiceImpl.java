package com.server.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.server.dao.OrderItemDao;
import com.server.entity.OrderItem;
import com.server.service.OrderItemService;

@Service
public class OrderItemServiceImpl implements OrderItemService {

	@Autowired
	private OrderItemDao orderItemDao;

	/**
	 * @Description: 通过用户名获取订单
	 *
	 * @param username
	 *            用户名
	 * @return
	 */
	@Override
	public List<OrderItem> getByUername(String username) {
		List<OrderItem> orderItems = orderItemDao.getByUsername(username);
		return orderItems;
	}

	/**
	 * @Description: 通过订单编号获取数据
	 *
	 * @param orderItemNo
	 * @return
	 */
	@Override
	public OrderItem getByOrderItemNo(int orderItemNo) {
		OrderItem orderItem = orderItemDao.selectByPrimaryKey(orderItemNo);
		return orderItem;
	}

	/**
	 * @Description: 更新数据
	 *
	 * @param orderItem
	 * @return
	 */
	@Override
	public int updateOrderItem(OrderItem orderItem) {
		int updateNum = orderItemDao.updateByPrimaryKeySelective(orderItem);
		return updateNum;
	}

	/**
	 * @Description: 添加订单
	 *
	 * @param orderItem
	 * @return
	 */
	@Override
	public int insertOrderItem(OrderItem orderItem) {
		int insertNum = orderItemDao.insertSelective(orderItem);
		return insertNum;
	}

}