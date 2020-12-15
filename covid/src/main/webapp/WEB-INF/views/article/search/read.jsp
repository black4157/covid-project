<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
</head>


<body class="hold-transition skin-blue sidebar-mini layout-boxed">

	<%@ include file="../../include/head.jsp" %>
	
	<%@ include file="../../main/DropMenu.jsp"%>
	
	<p style="margin:30px 0 0 0;"></p>
	
	<div class="wrapper" style="background-color:#e7eaed;">
	
	    <!-- Left side column. contains the logo and sidebar -->
	    <%@ include file="../../include/left_column.jsp" %>
	
	    <!-- Content Wrapper. Contains page content -->
	    <div class="content-wrapper">
	
	        <!-- Main content -->
	        <section class="content container-fluid">
	
	            <div class="col-lg-12">
	                <div class="box box-primary">
	                    <div class="box-header with-border">
	                        <h3 class="box-title" style="font-family: 'Noto Sans KR', sans-serif;">글 번호 ${article.articleNo}번 : ${article.title}</h3>
	                    </div>
	                    <div class="box-body" style="height: 700px; color:black;">
	                        ${article.content}
	                    </div>
	
	                    <%--업로드 파일 정보 영역--%>
	                    <div class="box-footer uploadFiles">
	                        <ul class="mailbox-attachments clearfix uploadedFileList"></ul>
	                    </div>
	
	                    <div class="box-footer">
	                        <div class="user-block">
	                            <img class="img-circle img-bordered-sm" src="${path}/dist/img/default-user.png" alt="user image">
	                            <span class="username">
	                                <a href="#">${article.writer}</a>
	                            </span>
	                            <span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${article.regDate}"/></span>
	                        </div>
	                    </div>
	                    <div class="box-footer">
	                        <form role="form" method="post">
	                            <input type="hidden" name="articleNo" value="${article.articleNo}">
	                            <input type="hidden" name="page" value="${searchCriteria.page}">
	                            <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
	                            <input type="hidden" name="searchType" value="${searchCriteria.searchType}">
	                            <input type="hidden" name="keyword" value="${searchCriteria.keyword}">
	                        </form>
	                        <button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
	                       
	                            <div class="pull-right">
	                                <button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>
	                                <button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
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
    <%@ include file="../../include/main_footer.jsp" %>
	
	<!-- ./wrapper -->
	<%@ include file="../../include/plugin_js.jsp" %>
	<script id="replyTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <div class="post replyDiv" data-replyNo={{replyNo}}>
        <div class="user-block">
            <%--댓글 작성자 프로필사진--%>
            <img class="img-circle img-bordered-sm" src="/{{userVO.userImg}}" alt="user image">
            <%--댓글 작성자--%>
            <span class="username">
                <%--작성자 이름--%>
                <a href="#">{{replyWriter}}</a>
                {{#eqReplyWriter replyWriter}}
                <%--댓글 삭제 버튼--%>
                <a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
                    <i class="fa fa-times"> 삭제</i>
                </a>
                <%--댓글 수정 버튼--%>
                <a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
                    <i class="fa fa-edit"> 수정</i>
                </a>
                {{/eqReplyWriter}}
            </span>
            <%--댓글 작성일자--%>
            <span class="description">{{prettifyDate regDate}}</span>
        </div>
        <%--댓글 내용--%>
        <div class="oldReplyText">{{{escape replyText}}}</div>
        <br/>
    </div>
    {{/each}}
	</script>
	<script id="fileTemplate" type="text/x-handlebars-template">
    <li data-src="{{fullName}}">
        <span class="mailbox-attachment-icon has-img">
            <img src="{{imgSrc}}" alt="Attachment">
        </span>
        <div class="mailbox-attachment-info">
            <a href="{{originalFileUrl}}" class="mailbox-attachment-name">
                <i class="fa fa-paperclip"></i> {{originalFileName}}
            </a>
        </div>
    </li>
	</script>
	<script type="text/javascript" src="/resources/dist/js/article_file_upload.js"></script>
	<script type="text/javascript" src="/resources/dist/js/reply.js"></script>
	<script>
	    $(document).ready(function () {
	
	        Handlebars.registerHelper("eqReplyWriter", function (replyWriter, block) {
	            var accum = "";
	            if (replyWriter === "${login.userId}") {
	                accum += block.fn();
	            }
	            return accum;
	        });
	
	        var articleNo = "${article.articleNo}";  // 현재 게시글 번호
	        var replyPageNum = 1; // 댓글 페이지 번호 초기화
	
	        // 첨부파일 목록
	        getFiles(articleNo);
	
	        // 댓글 목록 함수 호출
	        getReplies("/replies/" + articleNo + "/" + replyPageNum);
	
	        // 댓글 페이지 번호 클릭 이벤트
	        $(".pagination").on("click", "li a", function (event) {
	            event.preventDefault();
	            replyPageNum = $(this).attr("href");
	            getReplies("/replies/" + articleNo + "/" + replyPageNum);
	        });
	
	        // 댓글 저장 버튼 클릭 이벤트
	        $(".replyAddBtn").on("click", function () {
	
	            // 입력 form 선택자
	            var replyWriterObj = $("#newReplyWriter");
	            var replyTextObj = $("#newReplyText");
	            var replyWriter = replyWriterObj.val();
	            var replyText = replyTextObj.val();
	
	            // 댓글 입력처리 수행
	            $.ajax({
	                type: "post",
	                url: "/replies/",
	                headers: {
	                    "Content-Type": "application/json",
	                    "X-HTTP-Method-Override": "POST"
	                },
	                dataType: "text",
	                data: JSON.stringify({
	                    articleNo: articleNo,
	                    replyWriter: replyWriter,
	                    replyText: replyText
	                }),
	                success: function (result) {
	                    console.log("result : " + result);
	                    if (result === "regSuccess") {
	                        alert("댓글이 등록되었습니다.");
	                        replyPageNum = 1;  // 페이지 1로 초기화
	                        getReplies("/replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출
	                        replyTextObj.val("");   // 댓글 입력창 공백처리
	                        replyWriterObj.val("");   // 댓글 입력창 공백처리
	                    }
	                }
	            });
	        });
	
	        // 댓글 수정을 위해 modal창에 선택한 댓글의 값들을 세팅
	        $(".repliesDiv").on("click", ".replyDiv", function (event) {
	            var reply = $(this);
	            $(".replyNo").val(reply.attr("data-replyNo"));
	            $("#replyText").val(reply.find(".oldReplyText").text());
	        });
	
	        // modal 창의 댓글 수정버튼 클릭 이벤트
	        $(".modalModBtn").on("click", function () {
	            var replyNo = $(".replyNo").val();
	            var replyText = $("#replyText").val();
	            $.ajax({
	                type: "put",
	                url: "/replies/" + replyNo,
	                headers: {
	                    "Content-Type": "application/json",
	                    "X-HTTP-Method-Override": "PUT"
	                },
	                dataType: "text",
	                data: JSON.stringify({
	                    replyText: replyText
	                }),
	                success: function (result) {
	                    console.log("result : " + result);
	                    if (result === "modSuccess") {
	                        alert("댓글이 수정되었습니다.");
	                        getReplies("/replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출
	                        $("#modModal").modal("hide"); // modal 창 닫기
	                    }
	                }
	            })
	        });
	
	        // modal 창의 댓글 삭제버튼 클릭 이벤트
	        $(".modalDelBtn").on("click", function () {
	            var replyNo = $(".replyNo").val();
	            $.ajax({
	                type: "delete",
	                url: "/replies/" + replyNo,
	                headers: {
	                    "Content-Type": "application/json",
	                    "X-HTTP-Method-Override": "DELETE"
	                },
	                dataType: "text",
	                success: function (result) {
	                    console.log("result : " + result);
	                    if (result === "delSuccess") {
	                        alert("댓글이 삭제되었습니다.");
	                        getReplies("/replies/" + articleNo + "/" + replyPageNum); // 댓글 목록 호출
	                        $("#delModal").modal("hide"); // modal 창 닫기
	                    }
	                }
	            });
	        });
	
	        var formObj = $("form[role='form']");
	        console.log(formObj);
	
	        $(".modBtn").on("click", function () {
	            formObj.attr("action", "/article/paging/search/modify");
	            formObj.attr("method", "get");
	            formObj.submit();
	        });
	
	        $(".delBtn").on("click", function () {
	
	            var replyCnt = $(".replyDiv").length;
	            if (replyCnt > 0) {
	                alert("댓글이 달린 게시글은 삭제할수 없습니다.");
	                return;
	            }
	
	            var arr = [];
	            $(".uploadedFileList li").each(function () {
	                arr.push($(this).attr("data-src"));
	            });
	
	            if (arr.length > 0) {
	                $.post("/article/file/deleteAll", {files: arr}, function () {
	
	                });
	            }
	
	            formObj.attr("action", "/article/paging/search/remove");
	            formObj.submit();
	        });
	
	        $(".listBtn").on("click", function () {
	            formObj.attr("action", "/article/paging/search/list");
	            formObj.attr("method", "get");
	            formObj.submit();
	        });
	
	    });
	</script>

</body>
</html>