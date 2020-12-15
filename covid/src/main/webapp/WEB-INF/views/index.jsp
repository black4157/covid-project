<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>대한민국은 COVID-19와의 전쟁중</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

<!-- bxslider -->
<link rel="stylesheet" href="resources/bxslider/dist/jquery.bxslider.css"> 
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="resources/bxslider/dist/jquery.bxslider.min.js"></script>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
.NewsLogo{
	width:44px;
	height:44px;
}

.sectiontitle{
	font-family: 'Noto Sans KR', sans-serif;
}

.heading{
	font-family: 'Noto Sans KR', sans-serif;
}

heading .news{
	color: black;
}

</style>
</head>
<body id="top">

	<!-- 퀵메뉴 -->
	<%@ include file = "./main/QuickMenu.jsp" %>
	
	<!-- DropMenu -->
	<%@ include file = "./main/DropMenu.jsp" %>

	<!-- 드롭메뉴 + 이미지 슬라이드(이미지슬라이드 + 공지사항)-->
	<%@ include file = "./main/ImageSlide.jsp" %>

	<!-- 유튜브 뉴스 -->
	<%@ include file = "./main/youtubeNews.jsp" %>
	
	
	<%@ include file = "./include/main_footer.jsp" %>

	<!-- <a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a> -->
	<!-- JAVASCRIPTS -->
	<script src="resources/layout/scripts/jquery.min.js"></script>
	<script src="resources/layout/scripts/jquery.backtotop.js"></script>
	<script src="resources/layout/scripts/jquery.mobilemenu.js"></script>
	
	<%@ include file="./resources/quickScript.jsp" %> 
	
</body>
</html>