package com.a.b.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.BDao;
import com.a.b.dto.Ebook;

public class AdminModifyService implements IBoarderService {

	private SqlSession sqlSession=Constant.sqlSession;
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = (HttpSession)request.getSession();
		
		
		long bBookno = Long.parseLong(request.getParameter("bBookno"));
		String bBookname =request.getParameter("bBookname");	
		String bContent =request.getParameter("bContent");
		long bPrice =Long.parseLong(request.getParameter("bPrice"));
		String bWriter =request.getParameter("bWriter");
		String bPublisher =request.getParameter("bPublisher");	
		String bCategory =request.getParameter("bCategory");
		
//		String connector = ((Member)(session.getAttribute("joinVo"))).getbId();
//		if(bName.equals(connector)) {
//			BDao dao = sqlSession.getMapper(BDao.class);
//			dao.modify(bId, bName, bTitle, bContent);
//			
//		}else {
//			System.out.println("수정할 권한이 없는 자의 수정 시도!");
//		}
		
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.modify(bBookno, bBookname, bContent, bPrice, bWriter, bPublisher, bCategory);
		
		
	}

}
