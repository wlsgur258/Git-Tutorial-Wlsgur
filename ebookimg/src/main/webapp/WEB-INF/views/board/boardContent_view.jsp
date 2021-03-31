<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<table width="700" border="3" bordercolor="lightgray" align="center">
		<form action="boardModify" method="post" enctype="multipart/form-data">
		
			
			<input type="hidden" name="bBid" value="${boardContent_view.bBid}">
			<%
				if (vo != null) {
			%>
			<tr>
				<td>${boardContent_view.bId}</td>

				<td>${boardContent_view.bDate}</td>
			</tr>

			<tr>
			<c:if test="${sessionScope.id == boardContent_view.bId}">
				<td><input type="text" name="bTitle"
					value="${boardContent_view.bTitle}"></td>

				<td>${boardContent_view.bHit}</td>
			</c:if>	
			</tr>
			
			<tr>
			<c:if test="${sessionScope.id == boardContent_view.bId}">
				<td><textarea rows="10" name="bContent">${boardContent_view.bContent}</textarea></td>
			</c:if>
			</tr>
			
			<tr>
			<c:if test="${sessionScope.id == boardContent_view.bId && boardContent_view.bBurl != null}">
				
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
				
				<td>
					<input name="file" type="file" size="50"> 
				</td>
			</c:if>	
			</tr>
			
			<tr>
			<c:if test="${sessionScope.id != boardContent_view.bId}">
				<td>${boardContent_view.bTitle}</td>

				<td>${boardContent_view.bHit}</td>
			</c:if>	
			</tr>
			
			<tr>
			<c:if test="${sessionScope.id != boardContent_view.bId}">
				<td rowspan="40">${boardContent_view.bContent}</td>
			</c:if>	
			</tr>
			<tr>
			<c:if test="${sessionScope.id != boardContent_view.bId && boardContent_view.bBurl != null}">
					
					<td>
						<img src="<spring:url 
						value ='http://121.153.134.167/ebook/${boardContent_view.bBurl}'  />" 
						height="50" >
					</td>
			</c:if>	
			</tr>
				
			<c:if test="${sessionScope.id != boardContent_view.bId && boardContent_view.bBurl == null}">
					
					<td>
					</td>
			</c:if>	
			</tr>
			
			<%
				} else {
			%>
			<tr>
				<td>${boardContent_view.bId}</td>

				<td>${boardContent_view.bDate}</td>
			</tr>
		<tr>
			<td>${boardContent_view.bTitle}</td>

			<td>${boardContent_view.bHit}</td>
		</tr>

		<tr>
			<td>${boardContent_view.bContent}</td>
		</tr>
		
			<tr>		
			<c:if test="${boardContent_view.bBurl != null}">
					<td>
						<img src="<spring:url 
						value ='http://121.153.134.167/ebook/${boardContent_view.bBurl}'  />" 
						height="50" >
					</td>
			</c:if>		
			</tr>
			
			<tr>
			<c:if test="${boardContent_view.bBurl == null}">
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

	<%
	String pageNumberStr = request.getParameter("xpage");
	BCommentListService service = new BCommentListService(); 

int pageNumber = 1;
if (pageNumberStr != null) {
	pageNumber = Integer.parseInt(pageNumberStr);
}
MessageListView viewData = service.getMessageListView(pageNumber);

List<BComment> subList = viewData.getMessageList1();
%>
	
	<style type="text/css">
#wrap {
	width: 800px;
	margin: 0 auto 0 auto;
}

#bList {
	text-align: center;
}
</style>
	<div id="wrap">
		
		<!-- 댓글 -->
		<div id="comment">

			<table border="3" bordercolor="lightgray">
				<c:forEach items="<%=subList%>" var="dto">
				<input type="hidden" name="bBid" value="${boardContent_view.bBid}">
						
						<th width="150">
							<div>
								${dto.bId}<br>
								<font size="2" color="lightgray">${dto.bDate}</font>								
							</div>
						</th>
					
						<td width="550">
							<div class="text_wrapper">
								${dto.bContent}
							</div>
						</td>
						
						<td width="100">
					<c:if test="${sessionScope.id == bcommentContent_view.bId}">
						<div id = "btn" style="text-align:center;">
							
								<a href="bcommentDelete?bBid=${bcommentContent_view.bBid}">삭제</a>
							 &nbsp;&nbsp;	
							
								<a href="bcommentModify?bBid=${bcommentContent_view.bBid}">수정</a>
							 &nbsp;&nbsp;
						</div>
					</c:if>	
						</td>
						
				</c:forEach>

			</table>
		</div>
	</div>	
	
	<br>
	<br>
	<br>
	
	<!-- 댓글작성 -->
	<table border="3" bordercolor="lightgray" align="center">
		<form action="bcommentWrite" method="post">
			<%
				if (vo != null) {
			%>
			<div id="disqus_thread"></div>
<script>
    /**
    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
    /*
    var disqus_config = function () {
    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
    };
    */
    (function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');
    s.src = 'https://disquskbc1.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
    })(); 
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
			<%
			}else{
			%>
		<th width="150">
					<div>
					</div>				
				</th>
		
		<<th width="550">
					<div>
						로그인 후 작성하실 수 있습니다.
					</div>
				</th>

			<th width="100">
 				<button type="button" class="btn btn-success">
					<a href="login">로그인</a>
				</button>
			</th>
	
		
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
