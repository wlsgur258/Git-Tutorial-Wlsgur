package com.a.b.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.MDao;
import com.a.b.dto.Member;

public class MModifyService implements IBoarderService {

	
	private SqlSession sqlSession = Constant.sqlSession;
	
	private String bId;
	
	public void setbId(String bId) {
		this.bId = bId;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		MDao dao = sqlSession.getMapper(MDao.class);
		Member member = dao.memberView(bId);
		session.setAttribute("mem_view", member);
		model.addAttribute("request",request);
		model.addAttribute("session", session);
	}

}
