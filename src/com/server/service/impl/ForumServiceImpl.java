/*package com.server.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.server.dao.ForumDao;
import com.server.entity.Forum;
import com.server.service.ForumService;

@Service
public class ForumServiceImpl implements ForumService {
	@Autowired
	private ForumDao forumDao;

	*//**
	 * @Description: 获取所有帖子
	 *
	 * @return
	 *//*
	@Override
	public List<Forum> getAll() {
		List<Forum> forums = forumDao.getAll();
		return forums;
	}

	*//**
	 * @Description: 通过用户名获取帖子
	 *
	 * @param username
	 *            用户名
	 * @return
	 *//*
	@Override
	public List<Forum> getByUsername(String username) {
		List<Forum> forums = forumDao.getByUsername(username);
		return forums;
	}

	*//**
	 * @Description:添加帖子
	 *
	 * @param forum
	 * @return
	 *//*
	@Override
	public int insert(Forum forum) {
		int insertNum = forumDao.insertSelective(forum);
		return insertNum;
	}

	*//**
	 * @Description: 通过Id获取数据
	 *
	 * @param id
	 * @return
	 *//*
	@Override
	public Forum getById(int id) {
		Forum forum = forumDao.selectByPrimaryKey(id);
		return forum;
	}

	*//**
	 * @Description: 删除帖子
	 *
	 * @param id
	 * @return
	 *//*
	@Override
	public int detele(int id) {
		int deteleNum = forumDao.deleteByPrimaryKey(id);
		return deteleNum;
	}

}
*/