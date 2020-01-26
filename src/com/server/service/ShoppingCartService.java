package com.server.service;

import java.util.List;

import com.server.entity.ShoppingCart;

public interface ShoppingCartService {

	/**
	 * @Description: 通过用户名获取数据
	 *
	 * @param username
	 * @return
	 */
	List<ShoppingCart> getByUsername(String username);

	/**
	 * @Description: 删除
	 *
	 * @param id
	 * @return
	 */
	int deleteShoppingCart(int id);

	/**
	 * @Description: 添加到购物车
	 *
	 * @param shoppingCart
	 * @return
	 */
	int insertShoppingCart(ShoppingCart shoppingCart);

}