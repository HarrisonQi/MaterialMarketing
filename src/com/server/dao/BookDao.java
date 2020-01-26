package com.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.server.entity.Book;

public interface BookDao {
	int deleteByPrimaryKey(@Param("id") Integer id);

	int insert(Book record);

	int insertSelective(Book record);

	Book selectByPrimaryKey(@Param("id") Integer id);

	int updateByPrimaryKeySelective(Book record);

	int updateByPrimaryKey(Book record);

	List<Book> getAll();

	List<Book> getByTitle(@Param("title") String title);

	List<Book> getByAuthor(@Param("author") String author);

	List<Book> getByAuthorAndTitle(@Param("keyWord") String keyWord);
}