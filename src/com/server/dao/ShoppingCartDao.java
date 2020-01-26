package com.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.server.entity.ShoppingCart;

public interface ShoppingCartDao {
	int deleteByPrimaryKey(Integer id);

	int insert(ShoppingCart record);

	int insertSelective(ShoppingCart record);

	ShoppingCart selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(ShoppingCart record);

	int updateByPrimaryKey(ShoppingCart record);

	List<ShoppingCart> getByUsername(@Param("username") String username);
}