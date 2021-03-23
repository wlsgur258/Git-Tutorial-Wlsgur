<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.a.b.dto.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script> -->

<title>책 수정</title>
</head>
<body>
	<%-- <%@include file="Top.jsp"%> --%>
	<%--  <%
		String connector = ((Member)session.getAttribute("joinVo")).getbId();
		String contentAuthor = ((Ebook)request.getAttribute("eb")).getbBookname();
	%>  --%>

	<h1 align="center">책수정</h1>
	<div align="right">
		<button type="button" class="btn btn-primary"
			onclick="location.href='main'">메인</button>
	</div>
	<hr>
	<div class="container">
		<table class="table table-bordered" width="500" cellpadding="0"
			cellspacing="0" border="1">
			<form action="Adminmodify" method="post">
				   <input type="hidden" name="bBookno" value="${eb.bBookno}">   
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="bBookname"
						value="${eb.bBookname}"></td>
				</tr>
				
				<tr>사진
				<td>${eb.bUrl}</td>
				</tr>
					
					<tr>
					<td>내용</td>
					<td><textarea class="form-control" rows="10" name="bContent">${eb.bContent}</textarea></td>
				</tr>
				
				<tr>
					<td>가격</td>
					<td><input type="text" class="form-control" name="bPrice"
						value="${eb.bPrice}"></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input type="text" class="form-control" name="bWriter"
						value="${eb.bWriter}"></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" class="form-control" name="bPublisher"
						value="${eb.bPublisher}"></td>
				</tr>
				
				<tr>
					<td>카테고리</td>
					<td><input type="text" class="form-control" name="bCategory"
						value="${eb.bCategory}"></td>
				</tr>
				
				
				
				
				<tr>
				
					<td colspan="2">
					<a class="btn btn-primary" href="AdminBookList">목록</a>
 					<input type="submit" class="btn btn-danger" value="수정">
 					<%
 					
 					%></td>
				</tr>
			</form>
		</table>
	</div>

</body>
</html>