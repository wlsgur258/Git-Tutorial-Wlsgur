package com.a.b.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.CommentDao;


public class CommentDeleteService implements IBoarderService {
	private SqlSession sqlSession=Constant.sqlSession;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		long bCid = Long.parseLong(request.getParameter("bCid"));
		CommentDao dao = sqlSession.getMapper(CommentDao.class);
		dao.commentDelete(bCid);
	}

}
