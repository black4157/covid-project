<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>

<style>
.main{
	margin: 10px 0px 0px 230px;
}

</style>

<section class="main">
	<article>
		<table class="table table-border text-center">
			<tr>
				<th>날짜</th>
				<th>코로나 관련 인원</th>
				<th>총 감염자 수</th>
				<th>감염자</th>
				<th>격리 해제</th>
				<th>사망자</th>
				<th>검사 중</th>
				<th>음성 판정</th>
			</tr>
			
			<c:forEach items="${list}" var="DomesticVO">
			
			<tr>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${DomesticVO.today }"/></td>
				<td>${DomesticVO.total }</td>
				<td>${DomesticVO.infect_total }</td>
				<td>${DomesticVO.infected }</td>
				<td>${DomesticVO.released }</td>
				<td>${DomesticVO.dead }</td>
				<td>${DomesticVO.checked }</td>
				<td>${DomesticVO.negative }</td>
			</tr>	
			
			</c:forEach>
			
		</table>
	</article>
</section>
