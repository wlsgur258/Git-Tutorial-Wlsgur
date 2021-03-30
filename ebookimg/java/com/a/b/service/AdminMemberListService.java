package com.a.b.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.a.b.dao.BDao;
import com.a.b.dao.MDao;
import com.a.b.dto.Ebook;
import com.a.b.dto.Member;

public class AdminMemberListService implements IBoarderService {
	private SqlSession sqlSession=Constant.sqlSession;
	public static final int messageCountPerPage = 7;
	public AdminMemberListService() {}
	@Override
	public void execute(Model model) {
		
		
		BDao mdao = sqlSession.getMapper(BDao.class);
		ArrayList<Member> dtos = mdao.Memberlist();
		model.addAttribute("ADmember",dtos);

	}

	public List<Member> selectList(int a , int z) throws SQLException {
		BDao mdao = sqlSession.getMapper(BDao.class);
		ArrayList<Member> dtos = mdao.Memberlist();
		return dtos.subList(a-1, z);
	}
	
	public MemberListViewAdmin getMemberListViewAdmin(int pageNumber) throws SQLException {
		int currentPageNumber = pageNumber;
		BDao mdao = sqlSession.getMapper(BDao.class);
		int messageTotalCount = mdao.Memberlist().size(); // 햇갈림
		List<Member> messageList = null;
		int firstRow = 0;
		int endRow = 0;
		if(messageTotalCount>0) {
			firstRow = (pageNumber-1)*messageCountPerPage+1;
			endRow = firstRow+messageCountPerPage-1;
			if(endRow>messageTotalCount)endRow=messageTotalCount;
			messageList =selectList(firstRow,endRow);
		}else{
			currentPageNumber =0;
			messageList = Collections.emptyList();
		}
		return new MemberListViewAdmin(messageList,messageTotalCount,currentPageNumber,messageCountPerPage,firstRow,endRow);
	}
}
