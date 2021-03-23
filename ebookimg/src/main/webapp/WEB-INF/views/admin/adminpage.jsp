<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="com.a.b.service.*"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<%
	String id = (String) session.getAttribute("id");
	
%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
	<title>Home</title>
</head>
<body>
<table border="0">
		<table width="100%" border="0">
		<tr>
			<td colspan ="1">
			<a href="main" style="text-decoration: none"><img src="<spring:url value ='/resources/img/LOGO1.png'/>" height="100" alt="로고출력자리"></a>
			</td>		
			<td colspan="2">
			
				<div>
					<h1>관리자 페이지</h1>
				</div>
				
			</td>
			<td align="center" width="200"><h3 class="y"><%=id%>님</h3>
				
	<%
 	if (id.equals("admin")) { %>
				
				<%
					}  {
				%>
				<button onclick="location.href='logout'">로그아웃</button>
				<%
						
				%>
				<button onclick="location.href='memdata'">정보수정</button>
				<%
					}
				%></td>
				
		</tr>
		<tr height="50" colspan="3">
			<td align="center"><h2><a href="AdminBookList">도서 목록</a></h2></td>	
			<td align="center"><h2><a href="QnA">요청 게시판</a></h2></td>
			<td align="center"><h2><a href="">흠... 뭘 추가할까</a></h2></td>
		</tr>
</table>
</body>
</html>

