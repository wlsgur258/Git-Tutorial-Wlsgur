<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="com.a.b.dto.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.a.b.dao.EDao" %>
<%@ page import="com.a.b.dao.MDao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">

<title>책 세부 내용</title>
<link rel="stylesheet" href="resources/css/main_css.css">
</head>

<body>

<%@include file="../home.jsp"%>
<%  System.out.println("컨텐츠뷰페이지시작 ");%>


<% 
	String boo2;
	try
	{long boo1 = (Integer)request.getAttribute("ebook_view3");
	boo2 = String.valueOf(boo1);
	System.out.println("트라이 나오나");
	}
	catch (NullPointerException e)
	{boo2 = "1";
	System.out.println("켓치문 나오나");
	}
	
	
%>	

<%
	
	Integer coin = (Integer)session.getAttribute("cash");
	
	if(coin == null){
		coin = 0;
	}

	String vo = (String)session.getAttribute("id");
	if (vo == null) {
	vo = "GUEST";
}
	String Rno1 = request.getParameter("Rno");
	System.out.println("갑자기:"+Rno1);
	String Rno2 = "Rno";
	
	String Ryes1 = request.getParameter("Ryes");
	String Ryes2 = "Ryes";

	if(Rno1 != null){
	 	if (Rno1.equals(Rno2)) { 
		%>
		<script>
			alert('캐쉬가 부족하여 대여가 불가능합니다.');
		</script>
		<%}
	 	}%>
	 	
	<% if(Ryes1 != null){
	 	if (Ryes1.equals(Ryes2)) { 
		%>
		<script>
			alert('캐쉬를 3소모하여 대여를 완료했음');
		</script>
		<%}
	 	}
	
%>
<%-- 
<p>현재 세부내용 페이지 책 이름 : ${ebook_view.bBookname}</p> 
<p>현재 세부내용 페이지책이름 2 :${ebook_view.getbBookname()}</p> --%>

<p><br></p>

	
<table border="1" align = "center" style ="width:60%">
	<tr>
		<td>${ebook_view.bBookno}</td>
		<td>대여 필요 캐쉬 : 3</td>
		<td >${ebook_view.getbBookname()}</td>
		</tr>
		
		<tr>
			<td colspan="2" rowspan="1"><img src="<spring:url 
				value ='http://121.153.134.167/ebook/${ebook_view.bUrl}'/>" 
				height="300"></td>
			<td>${ebook_view.bContent}</td>
		</tr>
		<tr>
		<td>저자 : ${ebook_view.bWriter}</td>
		<td>출판사 : ${ebook_view.bPublisher}</td>
		<td>장르 : ${ebook_view.bCategory}</td>
		</tr>
		

</table>
	
	
	
	
<div align = "center">
<p>접속자의 캐쉬보유 : <%= coin %></p>
<p>이용자들의 도서 총 대출횟수 : ${ebook_view2} </p>

</div>

			<div align = "center">
<%	if (vo.equals("GUEST")) { %>
 			<button class="btn btn-primary">로그인후 대여기능이 활성화됩니다</button>
 		<%	} else {
					
		if (boo2.equals("0")) {%>
			<form name = "rental" action="rentaldo" method = "POST">
				<input type="hidden" name = "bBookno1" value = "${ebook_view.bBookno}">
				<input type="hidden" name = "bId1" value = "<%= vo %>">
				<input type="hidden" name = "cash1" value = "<%= coin %>">
				<input type="hidden" name = "bBookname1" value = "${ebook_view.getbBookname()}">
				<button type="submit" class="btn btn-primary">대여하기</button>
			</form>
			<%	}else {	%>
				<button class="btn btn-primary">이미 대여된 책입니다</button>
				
			<form name = "textgo" action= "textdo" method = "POST">
				<input type="hidden" name = "bBookno1" value = "${ebook_view.bBookno}">
				<input type="hidden" name = "bBookname1" value = "${ebook_view.bBookname}">
				<button class="btn btn-primary" type="submit">책내용 보러가기!</button>
			</form>
			<% } } %>
				</div>
		
			
			
	<footer>
		<div class="fixed">
	<%@include file="../bottom.jsp"%>
		</div>
	</footer>					
</body>
</html>
