<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.a.b.dto.*" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link rel="stylesheet" href="resources/css/main_css.css">
</head>
<body>
	<%
		List<Board> board = (List<Board>)session.getAttribute("sear_result");
	%>
	<header>

	

	<%@include file="./home.jsp"%>

	</header>
	<br>
	<h1 align="center">검색결과</h1>
	<br>
	<table border='1' width="70" align="center">
	<%
		if(board.equals(null)){
	%>
	
	<h3 align="center">찾으시는 글이 없습니다.</h3>
	
	<%
		}else{
	%>
	
	<tr>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
	</tr>
	<%
		for (Board x: board){
	%>
	
	<tr>
		<td align="center"><a href="boardContentview?bId=${book.getbTitle}"><%=x.getbTitle() %></td>
		<td align="center"><%=x.getbContent() %></td>
		<td align="center"><%=x.getbId() %></td>
	<%
		}}
	%>
	
	</table>
	<footer>
		<div class="fixed">

	<%@include file="./bottom.jsp"%>
		</div>
	</footer>
</body>
</html>