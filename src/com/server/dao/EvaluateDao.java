package com.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.server.entity.Evaluate;

public interface EvaluateDao {
	int deleteByPrimaryKey(Integer id);

	int insert(Evaluate record);

	int insertSelective(Evaluate record);

	Evaluate selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Evaluate record);

	int updateByPrimaryKey(Evaluate record);

	List<Evaluate> getByBookId(@Param("bookId") Integer bookid);
}