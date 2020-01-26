package com.server.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.server.dao.EvaluateDao;
import com.server.entity.Evaluate;
import com.server.service.EvaluateService;

@Service
public class EvaluateServiceImpl implements EvaluateService {

	@Autowired
	private EvaluateDao EvaluateDao;

	/**
	 * @Description: 添加评论
	 *
	 * @param Evaluate
	 * @return
	 */
	@Override
	public int insertBooksEvaluate(Evaluate Evaluate) {
		int insertNum = EvaluateDao.insert(Evaluate);
		return insertNum;
	}

	/**
	 * @Description: 通过图书id获取评论
	 *
	 * @param bookId
	 * @return
	 */
	@Override
	public List<Evaluate> getByBookId(int bookId) {
		List<Evaluate> Evaluates = EvaluateDao.getByBookId(bookId);
		return Evaluates;
	}
}