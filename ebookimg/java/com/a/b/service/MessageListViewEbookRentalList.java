package com.a.b.service;

import java.util.ArrayList;
import java.util.List;

import com.a.b.dto.Board;
import com.a.b.dto.Ebook;
import com.a.b.dto.RentalList;


// 게시글의 리스트를 페이징 처리하기 위한 클래스 입니다. ,,, 이북리스트의 페이징처리를 위함임
public class MessageListViewEbookRentalList {
	private int messageTotalCount;
	private int currentPageNumber;
	private List<RentalList> messageList;
	private int pageTotalCount;
	private int messageCountPerPage;
	private int firstRow;
	private int endRow;

	public MessageListViewEbookRentalList(List<RentalList> messageList2, int messageTotalCount, int currentPageNumber,
			int messageCountPerPage, int firstRow, int endRow) {

		this.messageList = messageList2;
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}
	
	

	private void calculatePageTotalCount() {
		if(messageTotalCount == 0 ){
			pageTotalCount =0;
		}else{
			pageTotalCount = messageTotalCount / messageCountPerPage;
			if(messageTotalCount % messageCountPerPage>0){
				pageTotalCount++;
			}
		}
	}

	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<RentalList> getMessageList() {
		return messageList;
	}
		
	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty(){
		return messageTotalCount==0;
	}
}
