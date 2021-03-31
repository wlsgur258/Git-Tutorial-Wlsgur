<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="com.a.b.service.*"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>

<style>

.h1 {
	text-align: center;
}


</style>

<%
	String id = (String) session.getAttribute("id");
	
%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

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

		<table width="100%" border="0">
		<tr>
			
			<td><a href="adminpage" style="text-decoration: none"><img src="<spring:url value ='/resources/img/LOGO2.png'/>" height="100" alt="로고출력자리"></a>
			</td>		
			<td colspan="4">
			
				<div align ="center">
					<h1>관리자 페이지</h1>
				</div>
				
			</td>
			<td  align="center" ><h3 class="y"><%=id%>님</h3>
				
	<%
 	if (id.equals("admin")) { %>
				
				<%
					}  {
				%>
				<button class="btn btn-primary" onclick="location.href='logout'">로그아웃</button>
				<%
						
				%>
				<button class="btn btn-primary" onclick="location.href='main'">홈으로</button>
				<%
					}
				%></td>
				
		<td colspan="3"><hr/></td>		
				
		</tr>
		<tr height="50" colspan="3">
			<td align="center"><h2><a href="AdminBookList">도서 목록</a></h2></td>	
			<td align="center"><h2><a href="adminboardList">요청 게시판</a></h2></td>
			<td align="center"><h2><a href="AdminMemberList">고객정보</a></h2></td>
		</tr>
</table>
</body>
</html>

