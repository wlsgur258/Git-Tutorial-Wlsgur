<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
</head>
<body>
	<%@include file="../home.jsp"%>

	<%
		String vo = (String) session.getAttribute("id");
	%>

	<style type="text/css">
#title {
	height: 16;
	font-family: '돋움';
	font-size: 12;
	text-align: center;
}
</style>
	<br>
	<b><font size="6" color="gray">글쓰기</font></b>
	<br>

	<table width="700" border="3" bordercolor="lightgray" align="center">
		<form action="boardModify" method="post">

			<input type="hidden" name="bBid" value="${boardContent_view.bBid}">
			<%
				if (vo != null) {
			%>
			<tr>
				<td>작성자</td>
				<td>${boardContent_view.bId}</td>

				<td>작성일</td>
				<td>${boardContent_view.bDate}</td>
			</tr>

			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle"
					value="${boardContent_view.bTitle}"></td>

				<td>조회수</td>
				<td>${boardContent_view.bHit}</td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea rows="10" name="bContent">${boardContent_view.bContent}</textarea></td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td>작성자</td>
				<td>${boardContent_view.bId}</td>

				<td>작성일</td>
				<td>${boardContent_view.bDate}</td>
			</tr>
		<tr>
			<td>제목</td>
			<td>${boardContent_view.bTitle}</td>

			<td>조회수</td>
			<td>${boardContent_view.bHit}</td>
		</tr>

		<tr>
			<td>내용</td>
			<td>${boardContent_view.bContent}</td>
		</tr>

			<%
				}
			%>

		<tr>
				<%
					if (vo != null) {
				%>
		
			<td colspan="2"><input class="btn btn-primary" type="submit"
				value="수정"> &nbsp;&nbsp;

				<button type="button" class="btn btn-danger">
					<a href="boardDelete?bBid=${boardContent_view.bBid}">삭제</a>
				</button> &nbsp;&nbsp;

				<button type="button" class="btn btn-success">
					<a href="boardList">목록보기</a>
				</button> &nbsp;&nbsp; 
			</td>
		<%
 	} else {
		 %>
			<td colspan="2">
				<button type="button" class="btn btn-success">
					<a href="boardList">목록보기</a>
				</button> 
			</td>	
	<%
 		}
 	%>
			
		</tr>
	</table>
	<br>
	<b><font size="6" color="gray">댓글</font></b>
	<br>
	<!-- 댓글 -->
	<table width="700" border="3" bordercolor="lightgray" align="center">
		<form action="commentWrite" method="post">
			<%
				if (vo != null) {
			%>
			<tr>
				<td>작성자</td>
				<td><%=id %></td>
			</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" name="bContent"></textarea></td>
		</tr>

			<%
			}else{
			%>

		<tr>
			<td>로그인후 작성하실 수 있습니다.</td>
		</tr>

			<% 
			}
			%>
		<tr>

				<%
					if (vo != null) {
				%>

			<td colspan="2">
			<input class="btn btn-primary" 
				type="submit"
				value="등록"> 
			</td>	
	<% 
 	} else {
	 %>
 	<td>
 		<button type="button" class="btn btn-success">
			<a href="login">로그인</a>
		</button>
	</td>
 		<%
 	}
 		%>
		</tr>
		</form>
	</table>
</body>
</html>
