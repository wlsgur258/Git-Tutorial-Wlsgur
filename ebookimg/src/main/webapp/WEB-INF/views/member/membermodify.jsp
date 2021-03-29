<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.a.b.dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<link rel="stylesheet" href="resources/css/main_css.css">
</head>
<body>
		<%@include file="../home.jsp"%>
	<div align="center">
<%
	Member vo = (Member)session.getAttribute("mem_view");
%>
		<br>
		<br>
		<br>
		<h1>회원 정보 수정</h1>
		<table border="1">
			<form action="memmodifydo" method="post">
				<input type="hidden" name="bId" value="<%=vo.getbId() %>">			
				
			
				<tr>
					<th>아이디</th>
					<td><%=vo.getbId() %></td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="2"><input type="text" name="name" value="<%=vo.getbName()%>"></td>
				</tr>
				<!-- password1 -->
				<tr>
					<th>패스워드</th>
					<td colspan="2"><input type="password" name="password"></td>
				</tr>
				<tr>
					<th>패스워드확인</th>
					<td colspan="2"><input type="password" name="password2"></td>
				</tr>
				<tr>
					<td align="center" colspan="3"><input type="submit"
						value="수정" class="btn btn-primary"> &nbsp;&nbsp; <input type="reset"
						value="재입력" class="btn btn-primary"></td>
				</tr>
			</form>
		</table>
	</div>
	<footer>
		<div class="fixed">
	<%@include file="../bottom.jsp"%>
		</div>
	</footer>
</body>
</html>
