package com.server.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.server.dao.BookDao;
import com.server.entity.Book;
import com.server.service.BookService;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bookDao;

	/**
	 * @Description: 获取所有图书
	 *
	 * @return
	 */
	@Override
	public List<Book> getAll() {
		List<Book> books = bookDao.getAll();
		return books;
	}

	/**
	 * @Description: 通过书名获取数据
	 *
	 * @param title
	 *            图书名称
	 * @return
	 */
	@Override
	public List<Book> getBytitle(String title) {
		List<Book> books = bookDao.getByTitle(title);
		return books;
	}

	/**
	 * @Description: 通过作者获取图书
	 *
	 * @param author
	 *            作者
	 * @return
	 */
	@Override
	public List<Book> getByAuthor(String author) {
		List<Book> books = bookDao.getByAuthor(author);
		return books;
	}

	/**
	 * @Description: 添加图书
	 *
	 * @param book
	 *            图书对象
	 * @return
	 */
	@Override
	public int insert(Book book) {
		int insertNum = bookDao.insertSelective(book);
		return insertNum;
	}

	/**
	 * @Description: 删除图书
	 *
	 * @param id
	 *            图书ID
	 * @return
	 */
	@Override
	public int delete(int id) {
		int deteleNum = bookDao.deleteByPrimaryKey(id);
		return deteleNum;
	}

	/**
	 * @Description: 更新图书
	 *
	 * @param book
	 *            图书对象
	 * @return
	 */
	@Override
	public int update(Book book) {
		int updateNum = bookDao.updateByPrimaryKeySelective(book);
		return updateNum;
	}

	/**
	 * @Description: 通过id获取图书
	 *
	 * @param id
	 * @return
	 */
	@Override
	public Book getById(int id) {
		Book book = bookDao.selectByPrimaryKey(id);
		return book;
	}

	/**
	 * @Description: 通过作者和书名查询
	 *
	 * @param title
	 *            书名
	 * @param author
	 *            作者
	 * @return
	 */
	@Override
	public List<Book> getByAuthorAndTitle(String key) {
		List<Book> books = bookDao.getByAuthorAndTitle(key);
		return books;
	}

}
