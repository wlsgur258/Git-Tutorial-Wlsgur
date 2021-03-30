package com.a.b.dao;

import java.util.ArrayList;
import java.util.List;

import com.a.b.dto.Ebook;
import com.a.b.dto.RentalList;
import com.a.b.dto.RentalingList;

public interface EDao {
	public Ebook ebookView(final String bBookname);//ebook 정보 보기
	
	public ArrayList<Ebook> ebookList(); // ebook 리스트 출력 
	
	public void ebookModify( // ebook 정보수정 // 관리자전용
			final String bBookname,
			final String bContent,
			final long bPrice,
			final String bWriter,
			final String bPublisher,
			final String bCategory
	);
	public void ebookInsert(final String bBookname); // ebook 추가 // 관리자전용
	public void ebookDelet(final String bBookname); // ebook 삭제 // 관리자전용
	
	public int ebookHit(final String bBookname); // ebook 누적대출횟수 조회
	public void ebookRental(final String bId, final long bBookno); // ebook 대여하기
	public void ebookRentalPlus(final String bBookname); // ebook 대여 연장기능
	
	public List<RentalList> ebookRentalList(final String bId); //도서대출기록 조회
	
	public ArrayList<Ebook> namesearch(final String bBookname);
	public ArrayList<Ebook> publishersearch(final String bPublisher);
	public ArrayList<Ebook> writersearch(final String bWriter);
	public ArrayList<Ebook> categorysearch(final String bCategory);
	public ArrayList<Ebook> allsearch(final String bBookname);
	
	public void ebookRentalOverListDelete(final String bId);
	public ArrayList<RentalingList> ebookRentalingList(final String bId);
	public int ebookRentalingCheck(final String bId, final String bBookname);
	
	public int rentalCashdown(final String bId);
	public ArrayList<Ebook> newebook();	
	public ArrayList<Ebook> bestbook();
}
