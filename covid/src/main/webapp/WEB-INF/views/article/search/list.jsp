<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<%@ include file="../../include/head.jsp"%>
<head>
<%@ include file="../../main/DropMenu.jsp"%>

<style>
.sub iframe {
   position: relative;
   
   right: 0%;
   left: 0%;
   width: 20%;
   height: 10%;
   Z-INDEX: 1;
   LEFT: 0px;
   OVERFLOW: hidden;
   WIDTH: 300px;
   POSITION: absolute;
   TOP: -270px;
   HEIGHT: 380px;
}
</style>

</head>

<body class="hold-transition skin-blue sidebar-mini layout-boxed">

	<p style="margin:30px 0 0 0;"></p>

	<div class="wrapper" style="background-color:#e7eaed;">

		<%@ include file="../../include/left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content container-fluid" >

				<div class="col-lg-12" >
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title"></h3>
						</div>
						<div class="box-body">
							<table class="table table-bordered" style="color:black;">
								<tbody>
									<tr>
										<th class="col-xs-1">번호</th>
										<th>제목</th>
										<th class="col-xs-2">작성자</th>
										<th class="col-xs-2">작성일자</th>
										<th class="col-xs-1">파일</th>
										<th class="col-xs-1">조회</th>
									</tr>
									<c:forEach items="${articles}" var="article">
										<tr>
											<td style="color: #000000">${article.articleNo}</td>
											<td><a href="${path}/article/paging/search/read${pageMaker.makeSearch(pageMaker.criteria.page)}&articleNo=${article.articleNo}">
													${article.title} </a> <span class="badge bg-teal"><i class="fa fa-comment-o"></i> + ${article.replyCnt}</span></td>
											<td>${article.writer}</td>
											<td><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd" /></td>
											<td><span class="badge bg-teal"><i class="fa fa-file"></i> ${article.fileCnt}</span></td>
											<td><span class="badge bg-red">${article.viewCnt}</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="box-footer">
							<div class="text-center">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li><a
											href="${path}/article/paging/search/list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<li
											<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
											<a
											href="${path}/article/paging/search/list${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="${path}/article/paging/search/list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="box-footer">
							<div class="form-group col-sm-2">
								<select class="form-control" name="searchType" id="searchType">
									<option value="n"
										<c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>
										선택 </option>
									<option value="t"
										<c:out value="${searchCriteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
									<option value="c"
										<c:out value="${searchCriteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
									<option value="w"
										<c:out value="${searchCriteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
									<option value="tc"
										<c:out value="${searchCriteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
									<option value="cw"
										<c:out value="${searchCriteria.searchType eq 'cw' ? 'selected' : ''}"/>>내용+작성자</option>
									<option value="tcw"
										<c:out value="${searchCriteria.searchType eq 'tcw' ? 'selected' : ''}"/>>제목+내용+작성자</option>
								</select>
							</div>
							<div class="form-group col-sm-10">
								<div class="input-group">
									<input type="text" class="form-control" name="keyword" id="keywordInput" value="${searchCriteria.keyword}" placeholder="검색어"> <span class="input-group-btn">
										<button type="button" class="btn btn-primary btn-flat" id="searchBtn">
											<i class="fa fa-search"></i> 검색
										</button>
									</span>
								</div>
							</div>
							<div class="pull-right">
								<button type="button" class="btn btn-success btn-flat"
									id="writeBtn">
									<i class="fa fa-pencil"></i> 글쓰기
								</button>
							</div>
						</div>
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
	</div>
	
	<!-- Main Footer -->
	<%@ include file="../../include/main_footer.jsp"%>
	
	<!-- ./wrapper -->
	<%@ include file="../../include/plugin_js.jsp"%>
	
	<script>
		$(document).ready(function() {
							var result = "${msg}";
							if (result == "regSuccess") {
								alert("게시글 등록이 완료되었습니다.");
							} else if (result == "modSuccess") {
								alert("게시글 수정이 완료되었습니다.");
							} else if (result == "delSuccess") {
								alert("게시글 삭제가 완료되었습니다.");
							}

							$("#searchBtn").on("click",	function(event) {
												self.location = "/article/paging/search/list${pageMaker.makeQuery(1)}"
														+ "&searchType="
														+ $("select option:selected").val()
														+ "&keyword="
														+ encodeURIComponent($("#keywordInput").val());
											});

							$("#writeBtn").on("click", function(event) {
								self.location = "/article/paging/search/write";
							});
						});
	</script>
</body>
</html>