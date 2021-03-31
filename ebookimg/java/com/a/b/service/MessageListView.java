package com.a.b.service;

import java.util.List;

import com.a.b.dto.BComment;
import com.a.b.dto.Board;


// 게시글의 리스트를 페이징 처리하기 위한 클래스 입니다.
public class MessageListView {
	private int messageTotalCount;
	private int currentPageNumber;
	private List<Board> messageList;
	private List<BComment> messageList1;
	private int pageTotalCount;
	private int messageCountPerPage;
	private int firstRow;
	private int endRow;

	public MessageListView(List<Board> messageList, List<BComment> messageList1, int messageTotalCount, int currentPageNumber,
			int messageCountPerPage, int firstRow, int endRow) {

		this.messageList = messageList;
		this.messageList1 = messageList1;
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

	public List<Board> getMessageList() {
		return messageList;
	}
	
	public List<BComment> getMessageList1() {
		return messageList1;
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
