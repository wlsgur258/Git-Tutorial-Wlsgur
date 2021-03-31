<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.a.b.dao.*"%>
<%@ page import="com.a.b.dto.*"%>
<%@ page import="com.a.b.service.*"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/b/css1/bootstrap.min.css" rel="stylesheet">
<link href="/b/css1/bootstrap-theme.css" rel="stylesheet">
<link href="/b/css1/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="/b/css1/plugins/dataTables.bootstrap.css" rel="stylesheet">
<link href="/b/css1/sb-admin-2.css" rel="stylesheet">
<link href="/b/css1/morris.css" rel="stylesheet">	

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/main_css.css">
<title>게시판</title>
<%
	String pageNumberStr = request.getParameter("xpage");
	BoardListService service = new BoardListService();

int pageNumber = 1;
if (pageNumberStr != null) {
	pageNumber = Integer.parseInt(pageNumberStr);
}
MessageListView viewData = service.getMessageListView(pageNumber);

List<Board> subList = viewData.getMessageList();
%>



</head>
<body>
	<%@ include file="adminpageTop.jsp"%>

	<%
		String vo = (String) session.getAttribute("id");
	%>

	<style type="text/css">
#wrap {
	width: 800px;
	margin: 0 auto 0 auto;
}

#topForm {
	text-align: right;
}

#board, #pageForm, #searchForm {
	text-align: center;
}

#bList {
	text-align: center;
}
</style>


	<div id="wrap">
		<br> <br>
		<div id="topform">
			<br>

			<td colspan="5">
				<button type="button">
					<a href="boardWrite_view">글쓰기</a>
				</button>
			</td>

		</div>
		<br>
		<div id="board">

			<table width="800" border="3" bordercolor="lightgray">
				<tr height="30">
					<td>글번호</td>
					<td>작성자</td>
					<td>제목</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>

				<c:forEach items="<%=subList%>" var="dto">

					<tr>
						<td>${dto.bBid}</td>
						<td>${dto.bId}</td>
						<td><c:forEach begin="1" end="${dto.bIndent}">-</c:forEach> <a
							href="boardContent_view?bBid=${dto.bBid}">${dto.bTitle}</a></td>
						<td>${dto.bDate}</td>
						<td>${dto.bHit}</td>
					</tr>
				</c:forEach>

			</table>
		</div>

		<!-- 페이지 넘버 부분 -->
		<br>
		<div id="pageForm" >
			
				<% if(pageNumber>10){
			int tenNum2 = pageNumber / 10;
			if(pageNumber % 10 == 0 && pageNumber > 9)tenNum2 -= 1;
			%>
				<a href="adminboardList?xpage=<%=(tenNum2*10)-9%>">[이전]</a>
				<% } %>
			
			<%
			//System.out.println(pageNumber);
			//System.out.println(viewData.getPageTotalCount());
			for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
				
				int tenNum = pageNumber / 10;
				if(pageNumber % 10 == 0 && pageNumber > 9)tenNum -= 1;
				if(viewData.getPageTotalCount()==i+(tenNum*10-1))break;
				
				if(11>i){%>
				<a href="adminboardList?xpage=<%=i+(tenNum*10)%>">[<%=i+(tenNum*10)%>]</a>
				<%
				}else{
				%>
				<a href="adminboardList?xpage=<%=i+(tenNum*10)%>">[다음]</a>
				<% break;
				}
			}
			%>
		</div>
		<br>

		<!-- 검색 부분 -->
		<div id="searchForm">
			<form method="post" action="boardsearch">
				<select name="opt">
					<option value="Title">제목</option>
					<option value="Content">내용</option>
					<option value="Id">작성자</option>
				</select> <input type="text" size="20" name="searchWord" />&nbsp; <input
					type="submit" value="검색" />
			</form>
		</div>
	</div>
	<footer>
		<div class="fixed">
	<%@ include file="foot.jsp"%>
		</div>
	</footer>
</body>
</html>


