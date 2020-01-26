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
import com.server.entity.Book;
import com.server.service.BookService;

@Controller
@RequestMapping("/book")
public class BookApiController {

	@Autowired
	private BookService bookService;

	/**
	 * @Description: 添加图书
	 *
	 * @param title
	 *            图书名称
	 * @param introduce
	 *            图书介绍
	 * @param price
	 *            图书价格
	 * @param author
	 *            图书作者
	 * @return
	 */
	@RequestMapping(value = "/insert", method = { RequestMethod.POST })
	@ResponseBody
	public Response insert(@RequestParam(value = "title") String title,
			@RequestParam(value = "introduce") String introduce, @RequestParam(value = "price") int price,
			@RequestParam(value = "author") String author) {
		if (StringUtils.isBlank(title)) {
			return Response.error("物料名称不能为空！");
		}
		if (price <= 0) {
			return Response.error("价格不能小于0");
		}
		Book book = new Book();
		book.setAuthor(author);
		book.setCreateTime(new Date());
		book.setIntroduce(introduce);
		book.setPrice(price);
		book.setTitle(title);
		int insertNum = bookService.insert(book);
		if (insertNum > 0) {
			return Response.success("添加成功", book);
		}
		return Response.error("添加失败，请联系技术人员！");
	}

	/**
	 * @Description: 修改图书
	 *
	 * @param id
	 *            图书ID
	 * @param title
	 *            图书名称
	 * @param introduce
	 *            图书介绍
	 * @param price
	 *            图书价格
	 * @param author
	 *            作者
	 * @return
	 */
	@RequestMapping(value = "/update", method = { RequestMethod.POST })
	@ResponseBody
	public Response update(@RequestParam(value = "id") int id, @RequestParam(value = "title") String title,
			@RequestParam(value = "introduce") String introduce, @RequestParam(value = "price") int price,
			@RequestParam(value = "author") String author) {
		Book book = bookService.getById(id);
		if (book == null) {
			return Response.error("您修改图书不存在！");
		}
		if (StringUtils.isBlank(title)) {
			return Response.error("图书名称为空！");
		}
		if (price <= 0) {
			return Response.error("价格不能小于0");
		}
		Book updateBook = new Book();
		updateBook.setAuthor(author);
		updateBook.setId(id);
		updateBook.setIntroduce(introduce);
		updateBook.setPrice(price);
		updateBook.setTitle(title);
		int updateNum = bookService.update(updateBook);
		if (updateNum > 0) {
			return Response.success("更新成功！");
		}
		return Response.error("更新失败，请联系工作人员！");
	}

	/**
	 * @Description: 删除图书
	 *
	 * @param id
	 *            图书ID
	 * @return
	 */
	@RequestMapping(value = "/detele", method = { RequestMethod.POST })
	@ResponseBody
	public Response detele(@RequestParam(value = "id") int id) {
		Book book = bookService.getById(id);
		if (book == null) {
			return Response.error("您删除图书不存在！");
		}
		int deteleNum = bookService.delete(id);
		if (deteleNum > 0) {
			return Response.success("删除成功！");
		}
		return Response.error("删除失败，请联系工作人员！");
	}

	/**
	 * @Description: 通过ID获取数据
	 *
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getById", method = { RequestMethod.POST })
	@ResponseBody
	public Response getById(@RequestParam(value = "id") int id) {
		Book book = bookService.getById(id);
		if (book == null) {
			return Response.error("图书不存在！");
		}
		return Response.success("查询成功", book);
	}

	/**
	 * @Description: 获取所有图书
	 *
	 * @return
	 */
	@RequestMapping(value = "/getAll", method = { RequestMethod.POST })
	@ResponseBody
	public Response getAll() {
		List<Book> books = bookService.getAll();
		if (books == null) {
			return Response.error("图书不存在！");
		}
		return Response.success("查询成功", books);
	}

}
