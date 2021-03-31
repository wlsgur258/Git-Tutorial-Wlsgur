<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="com.a.b.service.*"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="statisticsR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

.h1 {
	text-align: center;
} 
 

</style>

<%
	String id = (String) session.getAttribute("id");
	
%>

<% if (id =="admin"){ %>
	<script>
		alert('로그인 하세요');
		document.location.href="main";
	</script>
	<%}%>
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script> -->
	<title>Home</title>
	
	
<link href="/b/css1/bootstrap.min.css" rel="stylesheet">
<link href="/b/css1/bootstrap-theme.css" rel="stylesheet">
<link href="/b/css1/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="/b/css1/plugins/dataTables.bootstrap.css" rel="stylesheet">
<link href="/b/css1/sb-admin-2.css" rel="stylesheet">
<link href="/b/css1/morris.css" rel="stylesheet">	 
	
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script>	
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>	 -->
	
<script src="/b/js/jquery-1.9.1.js"></script>
<script src="/b/js/bootstrap.min.js"></script>
<script src="/b/js/plugins/metisMenu/metisMenu.min.js"></script>
<script src="/b/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="/b/js/sb-admin-2.js"></script>
<script src="/b/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="/b/js/morris.min.js"></script>
<script src="/b/js/raphael.js"></script>

<!-- <script src="J:/springworkspace/Git_Tutorial/ebookimg/src/main/webapp/resources/*"></script> -->


	
	
<!-- <style>
#container {
  height: 400px; 
}

.highcharts-figure, .highcharts-data-table table {
  min-width: 310px; 
  max-width: 800px;
  margin: 1em auto;
}

.highcharts-data-table table {
  font-family: Verdana, sans-serif;
  border-collapse: collapse;
  border: 1px solid #EBEBEB;
  margin: 10px auto;
  text-align: center;
  width: 100%;
  max-width: 500px;
}
.highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}
.highcharts-data-table th {
  font-weight: 600;
  padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
  padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}
.highcharts-data-table tr:hover {
  background: #f1f7ff;
}

</style>	 -->
	
<!-- <script type="text/javascript">
$(function() {
		
	Highcharts.chart('container', {
	    chart: {
	        type: 'pie',
	        options3d: {
	            enabled: true,
	            alpha: 45,
	            beta: 0
	        }
	    },
	    title: {
	        text: '회원별 이 대여한 책의 카테고리'
	    },
	    accessibility: {
	        point: {
	            valueSuffix: '%'
	        }
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}</b>'
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            depth: 35,
	            dataLabels: {
	                enabled: true,
	                format: '{point.name}'
	            }
	        }
	    },
	    series: [{
	        type: 'pie',
	        name: '카테고리',
	        data: [
	            ["", 45.0],
	            ['IE', 26.8],
	            {
	                name: 'Chrome',
	                y: 12.8,
	                sliced: true,
	                selected: true
	            },
	            ['Safari', 8.5],
	            ['Opera', 6.2],
	            ['Others', 0.7]
	        ]
	    }]
	});
});
</script> -->	
<script>	
	
	var sort;
	var url;
	
		$(document).ready(function(){
	
		
		
		var objDonut = JSON.parse('${objDonut}');
    	var objBar = JSON.parse('${objBar}');
		sort = '${sort}';
	
	if('${sort}' != null) $("#sort").val(sort);
	
	
	
	
	$("#sort").change(function(){
		sort = $("#sort").val();

		
		
		if(sort == 'category'){
				
		
		}else if(sort == 'publisher'){
						
		}else if(sort == 'author'){		
			
		}

	
		 location.href = sort;
		
		 
	});
	
	
	 Morris.Donut({
            element: 'donutChart',
            data: objDonut,
            resize: true
        });

        Morris.Bar({
            element: 'barChart',
            data: objBar,
            xkey: 'y',
            ykeys: ['a'],
            labels: ['데이터 건수'],
            hideHover: 'auto',
            resize: true
        });


    });

	</script>	
	
	
	
</head>
<body>

		<table width="100%" border="0">
		<tr>		

			<td><a href="adminpage" style="text-decoration: none"><img src="<spring:url value ='/resources/img/LOGO2.png'/>" height="100" alt="로고출력자리"></a>

			</td>		
			<td colspan="3">
			
				<div align ="center">
					<h1>관리자 페이지</h1>
				</div>		
			</td>
			<td align="center" ><h3 class="y"><%=id%>님</h3>
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

<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: white;">
			<h1><font color="black"><strong>통계</strong>&nbsp;<span class="glyphicon glyphicon glyphicon-pencil"></span></font></h1>
		</div>

		<div class="row">
			<div class="col-md-12">
		   		<h1 class="page-header">
			    	<label class="glyphicon glyphicon-list-alt fa-lg"></label>&nbsp;<i><b>종류</b></i>
		        </h1>
	        </div>
	    </div>
		 <div class="row">
		
			<div class="col-md-2">
				<select class="form-control" id="sort" name="sort">
					 <option value="category" ${sort == 'category' ? 'selected="selected"' : '' }>카테고리</option>	
					<option value="publisher"  ${sort == 'publisher' ? 'selected="selected"' : '' }>출판사별</option>
				</select>
			</div>
		
		</div> 
	    <div class="row">
			<div id="donutChart"></div>
	    </div>

		<div class="row">
			<div id="barChart"></div>
	    </div>

		 <<!-- div class="row">
			<div class="col-md-1 col-md-offset-11">
				<button type="button" class="btn btn-success btn-lg"  style="float:right;" onclick="fn_back()">뒤로가기</button>
			</div> 
		</div> -->
	</div>


<%-- <figure class="highcharts-figure">
  	  <div id="container"></div>
   		 <p class="highcharts-description"> 
       ${data}
    </p>
</figure> --%>

<%@ include file="foot.jsp"%>
</body>
</html>

