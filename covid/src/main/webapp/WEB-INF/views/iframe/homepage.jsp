<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<link href="/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

<style>
#body {
	overflow: hidden;
}

.caption{
	color:black;
	margin: 0 0 30px 0;
	font-size: 50px; 
	font-family: 'Noto Sans KR', sans-serif;
}

.tr{
	background-color:#e7eaed;
}

.link{
	margin : 20px;
	text-align: center;
	font-size : 20px;
	font-family: 'Noto Sans KR', sans-serif;
}

.site {
	color : black;
		
}

a:hover{
	color : blue;
	text-decoration : underline;
}

.img{
	margin:10px;
	padding: 10px;
	border-radius: 10%;
	border-color: black;
}
</style>
</head>

<body id="body">

	<!-- header line-->
	<%@ include file = "../main/DropMenu.jsp" %>
	
	<div class="hoc container clear">
		<table class="table table-bordered">
			<caption class="caption">코로나 관련 사이트</caption>
			<tr class="tr">
				<td class="link">
					<a href="http://www.cdc.go.kr/" target="_blank" class="site">질병관리본부
						<img src="/resources/img/site1.jpg" border="1" class="img"/>
					</a>
				</td>
				<td class="link">
					<a href="http://www.mohw.go.kr/react/index.jsp" target="_blank" class="site">보건복지부
						<img src="/resources/img/site2.jpg" border="1" class="img"/>
					</a>
				</td>
				<td class="link">
					<a href="http://www.moef.go.kr/" target="_blank" class="site">기획재정부
						<img src="/resources/img/site3.jpg" border="1" class="img"/>
					</a>
				</td>
			</tr>
		</table>
		
		<table class="table table-bordered">
			<caption class="caption" style="margin-top: 70px;">소스코드 관련 사이트</caption>
			<tr class="tr">
				<td class="link">
					<a href="https://bxslider.com/" target="_blank" class="site">bxSlider
						<img src="/resources/img/sourceSite1.jpg" border="1" class="img"/>
					</a>
				</td>
				<td class="link">
					<a href="https://www.chartjs.org/" target="_blank" class="site">chart.js
						<img src="/resources/img/sourceSite2.jpg" border="1" class="img"/>
					</a>
				</td>
				<td class="link">
					<a href="https://ourworldindata.org/coronavirus" target="_blank" class="site">세계 데이터
						<img src="/resources/img/sourceSite3.jpg" border="1" class="img"/>
					</a>
				</td>
			</tr>
		</table>
	</div>
	
	<%@ include file="../include/main_footer.jsp" %>
</body>

</html>