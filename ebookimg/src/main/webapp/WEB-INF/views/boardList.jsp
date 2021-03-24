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
	<%@include file="../home.jsp"%>

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
		<div id="pageForm">
			Page<%
			for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
		%>
			<a href="boardList?xpage=<%=i%>">[<%=i%>]
			</a>
			<%
				}
			%>
		</div>
		<br>

		<!-- 검색 부분 -->
		<div id="searchForm">
			<form method="post" action="search.jsp">
				<select name="opt">
					<option value="0">제목</option>
					<option value="1">내용</option>
					<option value="2">제목+내용</option>
					<option value="3">작성자</option>
				</select> <input type="text" size="20" name="searchWord" />&nbsp; <input
					type="submit" value="검색" />
			</form>
		</div>
	</div>

</body>
</html>


