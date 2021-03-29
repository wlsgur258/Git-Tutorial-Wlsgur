package com.a.b.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.EDao;
import com.a.b.dao.MDao;
import com.a.b.dto.Ebook;
import com.a.b.dto.Member;

public class EbookListService2 implements IBoarderService{
	
	private SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		MDao dao2 = sqlSession.getMapper(MDao.class);
		ArrayList<Member> dtos2 = dao2.memberList();
		model.addAttribute("list234", dtos2);
		
//		EDao dao2 = sqlSession.getMapper(EDao.class);
//		ArrayList<Ebook> dtos2 = dao2.ebookList();
//		model.addAttribute("list2345", dtos2);
		
		
		
	}
	
	

}
