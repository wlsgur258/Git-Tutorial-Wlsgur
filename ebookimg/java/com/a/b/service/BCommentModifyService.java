package com.a.b.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.BCommentDao;

public class BCommentModifyService implements IBoarderService {
	private SqlSession sqlSession = Constant.sqlSession;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		long bCid = Long.parseLong(request.getParameter("bCid"));
		String bId = request.getParameter("bId");
		String bContent = request.getParameter("bContent");
		
		BCommentDao dao = sqlSession.getMapper(BCommentDao.class);
		dao.bcommentModify(bCid, bId, bContent);
		
		}

	}
