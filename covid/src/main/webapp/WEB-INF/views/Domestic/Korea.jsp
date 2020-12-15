<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<style>
.main{
	text-align: center;
	height:400px;
	overflow: auto;
	width:80%;
	margin: 0 auto;
}

.select .form-control{
	margin: 0 auto;
    display: inline-block;
    color: black;
    width: 20%;
}
    
.select #btn{
	display: inline-block;
}

.chart {
	width: 80%;
	margin: 0 auto;
}
</style>

<script>
	var dead = new Array();
	var date = new Array();
	var infect = new Array();
	var check = new Array();
	var negative = new Array();
	var count = 0;
</script>

</head>

<body id="top" style="background-color:#e7eaed;">

	<%@ include file="./QuickMenu.jsp" %>

	<%@ include file ="../main/DropMenu.jsp" %>
	
	<div class="section-01 scroll" style="padding:30px; margin:40px 0;">
	<h2 style="text-align: center; margin:20px;"><b>수치 데이터</b></h2>
		<section class="main">
			<article>
				<table class="table table-striped table-bordered text-center" style="color: black;">
					<tr>
						<th>날짜</th>
						<th>코로나 관련 인원</th>
						<th>총 감염자 수</th>
						<th>확진자</th>
						<th>격리 해제</th>
						<th>사망자</th>
						<th>검사 중</th>
						<th>음성 판정</th>
					</tr>
	
					<c:forEach items="${Korealist}" var="DomesticVO">
	
					<tr>
						<td><fmt:formatDate pattern="yyyy년  MM월  dd일" value="${DomesticVO.today }" /></td>
						<td>${DomesticVO.total }</td>
						<td>${DomesticVO.infect_total }</td>
						<td>${DomesticVO.infected }</td>
						<td>${DomesticVO.released }</td>
						<td>${DomesticVO.dead }</td>
						<td>${DomesticVO.checked }</td>
						<td>${DomesticVO.negative }</td>
					</tr>
					
					<script>
						if(count == 3){
							<fmt:formatDate var="date" pattern="MM-dd" value="${DomesticVO.today}"/>
							date.push("${date}");
							dead.push("${DomesticVO.dead}");
							infect.push("${DomesticVO.infected}");
							check.push("${DomesticVO.checked}");
							negative.push("${DomesticVO.negative}");
							count = 0;
						}
						count++;
					</script>
					
					</c:forEach>
					
				</table>
			</article>
		</section>
	</div>

	<%@ include file = "./KoreaGraph.jsp" %>
	
	<%@ include file = "../include/main_footer.jsp" %>
	
	<!-- 퀵메뉴 스크립트 -->
	<%@ include file="../resources/quickScript.jsp" %> 
	
		<!-- 버튼리스너, get방식의 주소표현가능, 나름 괜찮은듯 -->
	<script>
		$(document).ready(
				function() {
					$("#btn").on("click",function(event) {
						
						self.location = "Korea?Month=" + $("select option:selected").val();
					});
				});
		
	</script>
</body>
</html>