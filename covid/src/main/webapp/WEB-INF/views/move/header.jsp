<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from https://bootdey.com  -->
<!--  All snippets are MIT license https://bootdey.com/license -->

<title>COVID19.test</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

<style type="text/css">
body {
	margin-top: 0px;
	backgroundColor: #eee;
}

.home-5-bg {
	background: #1E90FF;
	position: relative;
	background-size: cover;
	height: 150px;
	background-position: center center;
}

.section {
	position: relative;
}

.home-5-content {
	z-index: 1;
	position: relative;
}

.bg-overlay {
	background-color: #000;
	opacity: 0.7;
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	
}

.home-center {
	display: table;
	width: 100%;
	height: 100%;
}

.home-desc-center {
	display: table-cell;
	vertical-align: middle;
}

.home-5-content {
	z-index: 1;
	position: relative;
}

.text-white-70 {
	color: rgba(255, 255, 255, 0.8);
}

.f-15 {
	font-size: 15px;
}

.home-5-bg #particles-js {
	z-index: 1 !important;
	position: absolute;
	width: 80%;
	height: 100%;
}

.bg-overlay .img-right { /* 상단 배너 그림*/
	width: 40vh;
	height: 150px;
	position: absolute;
	right: 0;
}

.m-0{
	background-color: #9a9a9a;
	height: 1px;
}

.blink{
	color: red;
	text-decoration: none;
	transition: 1s;
	display:inline-block;
}

.blink:hover{
	text-shadow: 0.1em 0.1em, 0 0.1em;
}
</style>
</head>
<body>
	<header class="main-header">
		<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
		<section class="section home-5-bg" id="home">
			<div id="particles-js"></div>
			<div class="home-center">
				<div class="bg-overlay">
					<img src="${pageContext.request.contextPath}/resources/img/COVID19-2.jpg" class="img-right">
				</div>
				<div class="home-desc-center">
					<div class="container">
						<div class="justify-content-center row">
							<div class="col-lg-7">
								<div class="mt-40 text-center home-5-content">
									<div class="home-icon mb-4">
										<i class="mdi mdi-pinwheel mdi-spin text-white h1"></i>
									</div>
									<h1 class="blink" >긴급 상황 </h1>
									<h1 class="text-white font-weight-normal home-5-title mb-0" style="display:inline-block">COVID19</h1>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- 파티션 스프립트 import -->
		<%@include file="../resources/particlesJS.jsp" %>
	</header>
	<hr class="m-0">
	