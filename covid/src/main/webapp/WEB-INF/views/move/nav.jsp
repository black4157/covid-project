<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style>
.nav{
	width: 200px;
	float: left;
}

.nav .MenuBar ul li{			
	list-style: none;			/* 리스트 모양 : 없음 */
	background-color: none;		/* 배경색 : 없음 */
	line-height: 40px;			/* 세로길이 : 40px */
	text-align: center;			/* 텍스트 정렬 : 중앙 */
}

.nav .MenuBar .menu{
	text-decoration:none;						/* 선으로 텍스트를 꾸미지 않음 */
	color: black;								/* 글자색 : 검정색 */
	display: block;								/* 디스플레이 : 블록박스 */
	width: 200px;								/* 가로길이 : 200px */
	font-size: 25px;							/* 글자크기 : 25px */
	font-family: "Jua", sans-serif;				/* 폰트*/
	margin: 20px 0px 20px 0px;					/* 마진 top right bottom left */
	text-shadow: 2px 1px 1px gray; 				/* 글자 그림자*/
}

.nav .MenuBar .menu:hover{		/* 마우스가 올려졌을 때 */
	color:red;					/* 글자색 : 빨간색 */
	background-color: #4d4d4d;	/* 배경색 : 4d4d4d */
}

</style>

<nav class="nav">
	<div class="MenuBar">
		<ul class="mb-0 pl-0">
			<li><a class="menu" data-url="http://ncov.mohw.go.kr/baroView.do?brdId=4&brdGubun=41&dataGubun=&ncvContSeq=&contSeq=&board_id=&gubun=">코로나19 란?</a></li>
			<li><a class="menu" data-url="http://ncov.mohw.go.kr/baroView4.do?brdId=4&brdGubun=44&dataGubun=&ncvContSeq=&contSeq=&board_id=&gubun=">대처법</a></li>
			<li><a class="menu" data-url="http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=11&ncvContSeq=&contSeq=&board_id=&gubun=">국내 상황</a></li>
			<li><a class="menu" data-url="http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=14&ncvContSeq=&contSeq=&board_id=&gubun=">외국 상황</a></li>
			<li><a class="menu" data-url="#">공지사항</a></li>
		</ul>
	</div>
</nav>

<script>
	$(document).ready(function(e){
		$("a").click(function(){
			$("#iframe").attr("src", $(this).attr("data-url"));
		});
	});
</script>
