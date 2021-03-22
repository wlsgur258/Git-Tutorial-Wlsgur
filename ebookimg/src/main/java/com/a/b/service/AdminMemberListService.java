package com.a.b.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.BDao;
import com.a.b.dao.MDao;
import com.a.b.dto.Ebook;
import com.a.b.dto.Member;

public class AdminMemberListService implements IBoarderService {
	private SqlSession sqlSession=Constant.sqlSession;
	
	public AdminMemberListService() {}
	@Override
	public void execute(Model model) {
		
		
		BDao mdao = sqlSession.getMapper(BDao.class);
		ArrayList<Member> dtos = mdao.Memberlist();
		
		model.addAttribute("ADmember",dtos);

	}

}
