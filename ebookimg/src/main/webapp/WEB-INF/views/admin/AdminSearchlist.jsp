<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.a.b.dto.*" %>
<!DOCTYPE html>
<html>
<head>

<style>
.container {
text-align: center;

}
</style>
<meta charset="UTF-8">
<title>검색결과</title>
</head>
<%@ include file="adminpage.jsp"%>


<body>
	<%
		List<Ebook> book = (List<Ebook>)session.getAttribute("sear_result");
	%>
	
	
	<h1 align="center">검색결과</h1>
	<table border='1' width="70%" align="center">
	<%if(book.equals(null)){
		%>
		<h3 align="center">찾는 도서가 없습니다.</h3>
		<%
	}else{
		%>
	<tr>
		<th>이미지</th>
		<th>타이틀</th>
		<th>저자</th>
		<th>출판사</th>
		<th>수정</th>
		<th>삭제</th>
		
	</tr>
	<%
		for (Ebook x: book){
	%>
	<tr>
		<th>
			<img src="<spring:url value ='http://localhost:8000/ebook/${x.getbUrl}'  />" height="50" >		
		</th>
		<td align="center"><%=x.getbBookname() %></td>
		<td align="center"><%=x.getbWriter() %></td>	
		<td align="center"><%=x.getbPublisher() %></td>
		<td><a class = "btn btn-primary" href="AdminContent?bBookno=${book.getbBookno}">수정</a></td>	
		<td><a class = "btn btn-primary" href="AdminDelete?bBookno=${x.bBookno}">삭제</a></td>
	
	<%
	}}%>
	</table>
	
<%@ include file="/WEB-INF/views/bottom.jsp"%>
</body>
</html>