package com.server.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.server.dao.ShoppingCartDao;
import com.server.entity.ShoppingCart;
import com.server.service.ShoppingCartService;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

	@Autowired
	private ShoppingCartDao shoppingCartDao;

	/**
	 * @Description: 通过用户名获取数据
	 *
	 * @param username
	 * @return
	 */
	@Override
	public List<ShoppingCart> getByUsername(String username) {
		List<ShoppingCart> shoppingCarts = shoppingCartDao.getByUsername(username);
		return shoppingCarts;
	}

	/**
	 * @Description: 删除
	 *
	 * @param id
	 * @return
	 */
	@Override
	public int deleteShoppingCart(int id) {
		int deleteNum = shoppingCartDao.deleteByPrimaryKey(id);
		return deleteNum;
	}

	/**
	 * @Description: 添加购物车
	 *
	 * @param shoppingCart
	 * @return
	 */
	@Override
	public int insertShoppingCart(ShoppingCart shoppingCart) {
		int insertNum = shoppingCartDao.insertSelective(shoppingCart);
		return insertNum;
	}

}