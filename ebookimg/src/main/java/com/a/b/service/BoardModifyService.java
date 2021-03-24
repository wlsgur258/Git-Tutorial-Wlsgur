package com.a.b.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.BoardDao;

public class BoardModifyService implements IBoarderService {
	private SqlSession sqlSession = Constant.sqlSession;
	@Override
	public void execute(Model model) {
	
	Map<String, Object> map = model.asMap();
	HttpServletRequest request = (HttpServletRequest) map.get("request");
	
	long bBid = Long.parseLong(request.getParameter("bBid"));
	String bId = request.getParameter("bId");
	String bTitle = request.getParameter("bTitle");
	String bContent = request.getParameter("bContent");
	
	BoardDao dao = sqlSession.getMapper(BoardDao.class);
	dao.boardModify(bBid, bId, bTitle, bContent);
	
	}

}
