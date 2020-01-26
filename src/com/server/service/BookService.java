package com.server.service;

import java.util.List;

import com.server.entity.Book;

public interface BookService {

	/**
	 * @Description: 获取所有图书
	 *
	 * @return
	 */
	List<Book> getAll();

	/**
	 * @Description: 通过书名获取数据
	 *
	 * @param title
	 *            书名
	 * @return
	 */
	List<Book> getBytitle(String title);

	/**
	 * @Description: 通过作者查询数据
	 *
	 * @param author
	 *            作者
	 * @return
	 */
	List<Book> getByAuthor(String author);

	/**
	 * @Description: 通过id获取数据
	 *
	 * @param id
	 * @return
	 */
	Book getById(int id);

	/**
	 * @Description: 添加图书
	 *
	 * @param book
	 *            图书对象
	 * @return
	 */
	int insert(Book book);

	/**
	 * @Description: 删除图书
	 *
	 * @param id
	 *            图书ID
	 * @return
	 */
	int delete(int id);

	/**
	 * @Description: 修改图书
	 *
	 * @param book
	 *            图书对象
	 * @return
	 */
	int update(Book book);

	/**
	 * @Description: 通过书名和作者查询
	 *
	 * @param title
	 *            书名
	 * @param author
	 *            作者
	 * @return
	 */
	List<Book> getByAuthorAndTitle(String key);

}
