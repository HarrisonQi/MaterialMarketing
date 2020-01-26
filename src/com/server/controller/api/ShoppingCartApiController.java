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
import com.server.entity.ShoppingCart;
import com.server.service.ShoppingCartService;

@Controller
@RequestMapping("/shoppingCart")
public class ShoppingCartApiController {

	@Autowired
	private ShoppingCartService shoppingCartService;

	/**
	 * @Description: 通过用户名获取数据
	 *
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/getByUsername", method = { RequestMethod.POST })
	@ResponseBody
	public Response getByUsername(@RequestParam(value = "username") String username) {
		if (StringUtils.isBlank(username)) {
			return Response.error("用户名为空！");
		}
		List<ShoppingCart> shoppingCarts = shoppingCartService.getByUsername(username);
		return Response.success("查询成功", shoppingCarts);
	}

	/**
	 * @Description: 删除购物车商品
	 *
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/detele", method = { RequestMethod.POST })
	@ResponseBody
	public Response detele(@RequestParam(value = "id") int id) {
		int deteleNum = shoppingCartService.deleteShoppingCart(id);
		if (deteleNum > 0) {
			return Response.success("删除成功");
		}
		return Response.error("删除失败，请联系工作人员");
	}

	/**
	 * @Description: 添加到购物车
	 *
	 * @param goodsName
	 * @param goodsPrice
	 * @param count
	 * @param username
	 * @param goodsId
	 * @return
	 */

	@RequestMapping(value = "/insert", method = { RequestMethod.POST })
	@ResponseBody
	public Response insert(@RequestParam(value = "title") String title,
			@RequestParam(value = "unitPrice") int unitPrice, @RequestParam(value = "count") int count,
			@RequestParam(value = "username") String username, @RequestParam(value = "bookId") int bookId) {
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setCount(count);
		shoppingCart.setBookId(bookId);
		shoppingCart.setTitle(title);
		shoppingCart.setUnitPrice(unitPrice);
		shoppingCart.setTotalPrice((unitPrice * count));
		shoppingCart.setUsername(username);
		int insertNum = shoppingCartService.insertShoppingCart(shoppingCart);
		if (insertNum > 0) {
			return Response.success("添加成功");
		}
		return Response.error("添加失败，请联系工作人员");
	}
}
