package com.server.service;

import java.util.List;

import com.server.entity.Evaluate;

public interface EvaluateService {

	int insertBooksEvaluate(Evaluate evaluate);

	List<Evaluate> getByBookId(int goodsId);
}