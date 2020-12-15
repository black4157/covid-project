<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box box-primary">
	<div class="box-header with border">
		<p class="heading" style="font-size: 25px; margin-bottom:5px;">공지사항</p>
	</div>
	<div class="heading">
		<table class="table table-bordered">
			<tbody>
				<c:forEach items="${articles }" var="article">
					<tr>
						<td style="font-size: 20px; display:block; width:450px; white-space:nowrap; overflow:hidden; text-overflow: ellipsis; ">
							<a href="${path}/article/paging/search/read${pageMaker.makeSearch(pageMaker.criteria.page)}&articleNo=${article.articleNo}">
								${article.title}
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<p style="text-align: right; color:black; font-size:17px;"><a href="/article/paging/search/list">공지사항 더보기</a></p>