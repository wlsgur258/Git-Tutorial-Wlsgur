<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/main_css.css">
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
		<form action="boardModify" method="post" enctype="multipart/form-data">
		
			
			<input type="hidden" name="bBid" value="${boardContent_view.bBid}">
			<%
				if (vo != null) {
			%>
			<tr>
				<th>작성자</th>
				<td>${boardContent_view.bId}</td>

				<th>작성일</th>
				<td>${boardContent_view.bDate}</td>
			</tr>

			<tr>
			<c:if test="${sessionScope.id == boardContent_view.bId}">
				<th>제목</th>
				<td><input type="text" name="bTitle"
					value="${boardContent_view.bTitle}"></td>

				<th>조회수</th>
				<td>${boardContent_view.bHit}</td>
			</c:if>	
			</tr>
			
			<tr>
			<c:if test="${sessionScope.id == boardContent_view.bId}">
				<th>내용</th>
				<td><textarea rows="10" name="bContent">${boardContent_view.bContent}</textarea></td>
			</c:if>
			</tr>
			
			<tr>
			<c:if test="${sessionScope.id == boardContent_view.bId && boardContent_view.bBurl != null}">
				
				<th>이미지</th>
				<td>
					<img src="<spring:url 
					value ='http://121.153.134.167/ebook/${boardContent_view.bBurl}'  />" 
					height="50" >
					<input name="file" type="file" size="50">
				</td>
			</c:if>	
			</tr>
			
			<tr>
			<c:if test="${sessionScope.id == boardContent_view.bId && boardContent_view.bBurl == null}">
				
				<th>이미지</th>
				<td>
					<input name="file" type="file" size="50"> 
				</td>
			</c:if>	
			</tr>
			
			<tr>
			<c:if test="${sessionScope.id != boardContent_view.bId}">
				<th>제목</th>
				<td>${boardContent_view.bTitle}</td>

				<th>조회수</th>
				<td>${boardContent_view.bHit}</td>
			</c:if>	
			</tr>
			
			<tr>
			<c:if test="${sessionScope.id != boardContent_view.bId}">
				<th>내용</th>
				<td>${boardContent_view.bContent}</td>
			</c:if>	
			</tr>
			<tr>
			<c:if test="${sessionScope.id != boardContent_view.bId && boardContent_view.bBurl != null}">
					
				<th>이미지</th>
					<td>
						<img src="<spring:url 
						value ='http://121.153.134.167/ebook/${boardContent_view.bBurl}'  />" 
						height="50" >
					</td>
			</c:if>	
			</tr>
				
			<c:if test="${sessionScope.id != boardContent_view.bId && boardContent_view.bBurl == null}">
					
				<th>이미지</th>
					<td>
					</td>
			</c:if>	
			</tr>
			
			<%
				} else {
			%>
			<tr>
				<th>작성자</th>
				<td>${boardContent_view.bId}</td>

				<th>작성일</th>
				<td>${boardContent_view.bDate}</td>
			</tr>
		<tr>
			<th>제목</th>
			<td>${boardContent_view.bTitle}</td>

			<th>조회수</th>
			<td>${boardContent_view.bHit}</td>
		</tr>

		<tr>
			<th>내용</th>
			<td>${boardContent_view.bContent}</td>
		</tr>
		
			<tr>		
			<c:if test="${boardContent_view.bBurl != null}">
				<th>이미지</th>
					<td>
						<img src="<spring:url 
						value ='http://121.153.134.167/ebook/${boardContent_view.bBurl}'  />" 
						height="50" >
					</td>
			</c:if>		
			</tr>
			
			<tr>
			<c:if test="${boardContent_view.bBurl == null}">
				<th>이미지</th>
					<td>
					</td>
			</c:if>		
			</tr>
			
		<%
			}
		%>
		
		<tr>
			<c:if test="${sessionScope.id == boardContent_view.bId}">
			<td colspan="2"><input class="btn btn-primary" type="submit"
				value="수정"> &nbsp;&nbsp;

				<button type="button" class="btn btn-danger">
					<a href="boardDelete?bBid=${boardContent_view.bBid}">삭제</a>
				</button> &nbsp;&nbsp;
			</td>	
			</c:if>
			<td>
				<button type="button" class="btn btn-success">
					<a href="boardList">목록보기</a>
				</button> &nbsp;&nbsp; 
			</td>

		</tr>
	
		</form>
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
			<input type="hidden" name="bId" value=<%= vo %>>
			<tr>
				<th>작성자</th>
				<td><%= vo %></td>
			</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" name="cContent"></textarea></td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="5">
				<input class="btn btn-success" type="reset" value="작성취소">
				<input class="btn btn-primary" type="submit" value="등록"> 
			</td>
		</tr>		
		
			<%
			}else{
			%>

		<tr>
			<td>로그인 후 작성하실 수 있습니다.</td>
		</tr>
		<tr>
			<td>
 				<button type="button" class="btn btn-success">
					<a href="login">로그인</a>
				</button>
			</td>
		</tr>
		
			<% 
			}
			%>
			
		</form>
	</table>
	<footer>
		<div class="fixed">
	<%@include file="../bottom.jsp"%>
		</div>
	</footer>
</body>
</html>
