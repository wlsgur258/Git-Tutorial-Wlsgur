package com.a.b.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.MDao;

public class MDeleteService implements IBoarderService {
	private SqlSession sqlSession=Constant.sqlSession;

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String bid = request.getParameter("bId");
		MDao dao = sqlSession.getMapper(MDao.class);
		dao.memberExit(bid);
	}

}
