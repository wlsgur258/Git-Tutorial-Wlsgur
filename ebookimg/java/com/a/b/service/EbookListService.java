package com.a.b.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.EDao;
import com.a.b.dto.Ebook;

public class EbookListService implements IBoarderService{
	
	private SqlSession sqlSession = Constant.sqlSession;

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		EDao dao = sqlSession.getMapper(EDao.class);
		ArrayList<Ebook> dtos = dao.ebookList();
		model.addAttribute("list", dtos);
		
	}
	
	

}
