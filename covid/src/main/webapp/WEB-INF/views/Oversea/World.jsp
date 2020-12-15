<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<style>
.section-01{
	margin: 40px 0 0 0;
}

.main {
	text-align: center;
	margin: 0 auto;
	padding: 20px;
	width: 80%;
}

.main .select{
	margin: 0 0 20px 0;
}

.main .select .form-control{
	margin: 0 auto;
    display: inline-block;
    color: black;
    width: 20%;
}
    
.main .select #btn{
	display: inline-block;
}

#listPrint {
	height: 400px;
	overflow: auto;
}

.chart {
	width: 80%;
	margin: 0 auto;
}
</style>

<script>
	var date = new Array();
	var total_deaths = new Array();
	var new_deaths = new Array();
	var total_cases = new Array();
	var new_cases = new Array();
	var total_tests = new Array();
	var new_tests = new Array();
	var count = 0;
</script>

</head>

<body id="top" style="background-color: #e7eaed;">

	<%@ include file="./QuickMenu.jsp" %>
	
	<%@ include file="../main/DropMenu.jsp"%>
	
	<div class="section-01 scroll">
		<section class="main">
			<!-- 국가 목록 -->
			<div class="select">
				<select class="form-control">
					<option value="location" selected="selected">나라명을 선택해주세요.</option>
					<c:forEach items="${listWorld}" var="WorldVO">
						<c:if test="${WorldVO.location ne back}">
							<option><c:out value="${WorldVO.location }" /></option>
							<c:set var="back" value="${WorldVO.location }" />
						</c:if>
					</c:forEach>
				</select> 
				<input type="button" id="btn" class="btn btn-primary" value="검색" />
			</div>
			
			<!-- 제목 -->
			<article id="listPrint">
				<table class="table table-border text-center" style="color: black;">
					<tr>
						<th>날짜</th>
						<th>국가이니셜</th>
						<th>국가명</th>
						<th>총 감염자</th>
						<th>새로운 감염자</th>
						<th>총 사망자</th>
						<th>새로운 사망자</th>
						<th>총 검사 인원</th>
						<th>새로운 검사 인원</th>
					</tr>
	
					<!-- 데이터출력부분 -->
					<c:forEach items="${listAllWorld}" var="WorldVO">
	
						<tr>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${WorldVO.date }" /></td>
							<td>${WorldVO.iso_code }</td>
							<td>${WorldVO.location }</td>
							<td>${WorldVO.total_cases }</td>
							<td>${WorldVO.new_cases }</td>
							<td>${WorldVO.total_deaths }</td>
							<td>${WorldVO.new_deaths }</td>
							<td>${WorldVO.total_tests }</td>
							<td>${WorldVO.new_tests }</td>
						</tr>
	
						<script>
							if (count == 3) {
								<fmt:formatDate var="date" pattern="MM-dd" value="${WorldVO.date}"/>
								date.push("${date}");
								total_deaths.push("${WorldVO.total_deaths}");
								new_deaths.push("${WorldVO.new_deaths}");
								total_cases.push("${WorldVO.total_cases}");
								new_cases.push("${WorldVO.new_cases}");
								total_tests.push("${WorldVO.total_tests}");
								new_tests.push("${WorldVO.new_tests}");
								count = 0;
							}
							count++;
						</script>
	
					</c:forEach>
	
				</table>
			</article>
		</section>
	</div>
	<%@ include file="./WorldGraph.jsp"%>
	
	<%@ include file = "../include/main_footer.jsp" %>
	
	<!-- 버튼리스너, get방식의 주소표현가능, 나름 괜찮은듯 -->
	<script>
		$(document).ready(
				function() {
					$("#btn").on("click",function(event) {
						self.location = "World?location=" + $("select option:selected").val();
					});
				});
	</script>

	<!-- 퀵메뉴 스크립트 -->
	<%@ include file="../resources/quickScript.jsp" %> 
	
</body>
</html>