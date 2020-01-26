package com.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.server.entity.OrderItem;

public interface OrderItemDao {
	int deleteByPrimaryKey(Integer orderItemNo);

	int insert(OrderItem record);

	int insertSelective(OrderItem record);

	OrderItem selectByPrimaryKey(@Param("orderItemNo") Integer orderItemNo);

	int updateByPrimaryKeySelective(OrderItem record);

	int updateByPrimaryKey(OrderItem record);

	List<OrderItem> getByUsername(@Param("username") String username);
}