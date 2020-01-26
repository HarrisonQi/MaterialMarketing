package com.server.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.server.entity.Book;
import com.server.entity.User;
import com.server.service.BookService;
import com.server.service.UserService;

@Controller
@RequestMapping("/system")
public class SystemController {
	@Autowired
	private UserService userService;

	@Autowired
	private BookService bookService;

	/*
	 * @Autowired private ForumService forumService;
	 * 
	 * @Autowired private FollowUpService followUpService;
	 * 
	 * @Autowired private GoodsService goodsService;
	 */

	/**
	 * @Description: 登录
	 *
	 * @return
	 */
	@RequestMapping("login")
	public String login() {
		return "login";
	}

	/**
	 * @Description: 首页
	 *
	 * @return
	 */
	@RequestMapping("index")
	public String index(@RequestParam(required = false) String username, Model model,
			@RequestParam(required = false) String key, @RequestParam(required = false) String type) {
		List<Book> resultBookList = new ArrayList<Book>();
		List<Book> bookList = bookService.getAll();
		List<Book> recommendBook = new ArrayList<Book>();
		if (bookList.size() > 16) {
			for (int i = 0; i < 16; i++) {
				recommendBook.add(bookList.get(i));
			}
		} else {
			recommendBook.addAll(bookList);
		}
		User user = userService.getByUsername(username);
		if (user != null) {
			model.addAttribute("user", user);
		}
		if (StringUtils.isBlank(key)) {
			resultBookList.addAll(bookList);
		} else {
			if (StringUtils.equals(type, "0")) {
				resultBookList = bookService.getByAuthorAndTitle(key);
			} else if (StringUtils.equals(type, "1")) {
				resultBookList = bookService.getBytitle(key);
			} else {
				resultBookList = bookService.getByAuthor(key);
			}
		}
		model.addAttribute("bookList", resultBookList);
		model.addAttribute("recommendBook", recommendBook);
		return "index";
	}

	/**
	 * @Description: 注册
	 *
	 * @return
	 */
	@RequestMapping("register")
	public String register() {
		return "register";
	}

	/**
	 * @Description: 忘记密码
	 *
	 * @return
	 */
	@RequestMapping("forgetPassword")
	public String forgetPassword() {
		return "forgetPassword";
	}

	/**
	 * @Description: 个人中心进入设置为我的订单
	 *
	 * @return
	 */

	@RequestMapping("personalCenter")
	public String personalCenter(@RequestParam(required = false) String username, Model model) {
		User user = userService.getByUsername(username);
		model.addAttribute("user", user);
		return "personalCenter";
	}
	/**
	 * @Description: 订单管理 查询所有订单
	 *
	 * @return
	 */

	@RequestMapping("orderManage")
	public String orderManage(@RequestParam(required = false) String username, Model model) {
		User user = userService.getByUsername(username);
		model.addAttribute("user", user);
		return "orderManage";
	}

	/**
	 * @Description: 查询个人资料
	 *
	 * @param username
	 *            用户名
	 * @param model
	 * @return
	 */
	@RequestMapping("personalData")
	public String personalData(@RequestParam(required = false) String username, Model model) {
		User user = userService.getByUsername(username);
		model.addAttribute("user", user);
		return "personalData";
	}

	/**
	 * @Description: 购物车
	 * 
	 * @param username
	 *            用户名
	 * @param model
	 * @return
	 */
	@RequestMapping("shoppingCart")
	public String shoppingCart(@RequestParam(required = false) String username, Model model) {
		User user = userService.getByUsername(username);
		model.addAttribute("user", user);
		return "shoppingCart";
	}

	/**
	 * @Description: 商品管理
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("bookControl")
	public String goodsControl(@RequestParam(required = false) String username, Model model) {
		User user = userService.getByUsername(username);
		model.addAttribute("user", user);
		return "bookControl";
	}

	/**
	 * @Description: 立即支付
	 *
	 * @param username
	 * @param model
	 * @return
	 */
	@RequestMapping("payNow")
	public String payNow(@RequestParam(required = false) String username, @RequestParam("bookId") int bookId,
			@RequestParam("count") int count, Model model) {
		User user = userService.getByUsername(username);
		Book book = bookService.getById(bookId);
		model.addAttribute("user", user);
		model.addAttribute("book", book);
		model.addAttribute("count", count);
		return "payNow";
	}

	/**
	 * @Description: 购买图书详细页面
	 *
	 * @param username
	 *            用户名
	 * @param id
	 *            图书id
	 * @param model
	 * @return
	 */
	@RequestMapping("introduce")
	public String introduce(@RequestParam(required = false) String username, @RequestParam("id") int id, Model model) {
		User user = userService.getByUsername(username);
		Book book = bookService.getById(id);
		model.addAttribute("user", user);
		model.addAttribute("book", book);
		return "introduce";
	}
	
	/**
	 * @Description: 用户管理
	 *
	 * @param username
	 *            用户名
	 * @param id
	 *            图书id
	 * @param model
	 * @return
	 */
	@RequestMapping("usersControl")
	public String usersControl(@RequestParam(required = false) String username, Model model) {
		User user = userService.getByUsername(username);
		model.addAttribute("user", user);
		return "usersControl";
	}
	
	
	/**
	 * @Description: 客户服务_增加投诉建议
	 *
	 * @param username
	 *            用户名
	 * @param model
	 * @return
	 */
	@RequestMapping("customerService")
	public String customerService(@RequestParam(required = false) String username, Model model) {
		User user = userService.getByUsername(username);
		model.addAttribute("user", user);
		return "customerService";
	}
	
	/**
	 * @Description: 查询投诉建议列表
	 *
	 * @param username
	 *            用户名
	 * @param model
	 * @return
	 */
	@RequestMapping("customerServiceList")
	public String customerServiceList(@RequestParam(required = false) String username, Model model) {
		User user = userService.getByUsername(username);
		model.addAttribute("user", user);
		return "customerServiceList";
	}
	
	

}
