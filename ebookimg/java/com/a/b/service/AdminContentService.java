package com.a.b.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.BDao;
import com.a.b.dto.Ebook;

public class AdminContentService implements IBoarderService {
	private SqlSession sqlSession=Constant.sqlSession;
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		long bBookno = Long.parseLong( request.getParameter("bBookno"));
		BDao dao = sqlSession.getMapper(BDao.class);
		
		Ebook eb= dao.contentview(bBookno);
		
		model.addAttribute("eb", eb);
		
		
		
	}

}
