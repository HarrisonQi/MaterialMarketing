/*package com.server.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.server.dao.FollowUpDao;
import com.server.entity.FollowUp;
import com.server.service.FollowUpService;

@Service
public class FollowUpServiceImpl implements FollowUpService {

	@Autowired
	private FollowUpDao followUpDao;

	*//**
	 * @Description: 添加评论
	 *
	 * @param followUp
	 * @return
	 *//*
	@Override
	public int insert(FollowUp followUp) {
		int insertNum = followUpDao.insert(followUp);
		return insertNum;
	}

	*//**
	 * @Description: 根据楼主帖子查询所有跟帖
	 *
	 * @param parentId
	 *            夫帖ID
	 * @return
	 *//*
	@Override
	public List<FollowUp> getByParentId(int parentId) {
		List<FollowUp> followUps = followUpDao.getByParentId(parentId);
		return followUps;
	}

}
*/