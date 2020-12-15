<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
</head>

<style>
    .fileDrop {
        width: 100%;
        height: 200px;
        border: 2px dotted #0b58a2;
    }
</style>
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
	                <form role="form" id="writeForm" method="post" action="${path}/article/paging/search/write">
	                    <div class="box box-primary">
	                        <div class="box-header with-border">
	                            <h3 class="box-title" style="font-family: 'Noto Sans KR', sans-serif;">게시글 작성</h3>
	                        </div>
	                        <div class="box-body">
	                            <div class="form-group">
	                                <label  style="color:#000000"for="title">제목</label>
	                                <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
	                            </div>
	                            <div class="form-group">
	                                <label  style="color:#000000" for="content">내용</label>
	                                <textarea class="form-control" id="content" name="content" rows="30" placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
	                            </div>
	                            <div class="form-group" >
	                                <label  style="color:#000000" for="writer">작성자</label>
	                                <input class="form-control" id="writer" name="writer" value="관리자">
	                            </div>
	                            <div class="form-group">
	                                <div class="fileDrop">
	                                    <br/>
	                                    <br/>
	                                    <br/>
	                                    <br/>
	                                    <p style="color:#000000" class="text-center"><i style="color:#000000"  class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="box-footer">
	                            <ul class="mailbox-attachments clearfix uploadedFileList"></ul>
	                        </div>
	                        <div class="box-footer">
	                            <button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
	                            <div class="pull-right">
	                            	<button type="button" class="btn btn-danger" onclick="back();"><i class="fa fa-ban"></i> 취소</button>
	                                <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
	                                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
	                            </div>
	                        </div>
	                    </div>
	                </form>
	            </div>
	
	        </section>
	        <!-- /.content -->
	    </div>
	    <!-- /.content-wrapper -->
	
	   
	
	</div>
	<!-- ./wrapper -->
	
	<!-- Main Footer -->
	<%@ include file="../../include/main_footer.jsp" %>
	    
	
	<%@ include file="../../include/plugin_js.jsp" %>
	<script id="fileTemplate" type="text/x-handlebars-template">
    <li>
        <span class="mailbox-attachment-icon has-img">
            <img src="{{imgSrc}}" alt="Attachment">
        </span>
        <div class="mailbox-attachment-info">
            <a href="{{originalFileUrl}}" class="mailbox-attachment-name">
                <i class="fa fa-paperclip"></i> {{originalFileName}}
            </a>
            <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn">
                <i class="fa fa-fw fa-remove"></i>
            </a>
        </div>
    </li>
	</script>
	<script type="text/javascript" src="/resources/dist/js/article_file_upload.js"></script>
	<script>
	
	    $(document).ready(function () {
	
	        // 게시글 저장 버튼 클릭 이벤트 처리
	        $("#writeForm").submit(function (event) {
	            event.preventDefault();
	            if( check() ){
	            	var that = $(this);
					filesSubmit(that);
		        }
	        });
	
	        // 파일 삭제 버튼 클릭 이벤트
	        $(document).on("click", ".delBtn", function (event) {
	            event.preventDefault();
	            var that = $(this);
	            deleteFileWrtPage(that);
	        });
	
	        // 목록 버튼 클릭 이벤트 처리
	        $(".listBtn").on("click", function () {
	            self.location = "/article/paging/search/list?page=${searchCriteria.page}"
	                + "&perPageNum=${searchCriteria.perPageNum}"
	                + "&searchType=${searchCriteria.searchType}"
	                + "&keyword=${searchCriteria.keyword}";
	        });
	    });

		function back(){
			window.history.back();
		}

		function check(){
			var title = document.forms[0].title.value;
			var content = document.forms[0].content.value;

			if( !title ){
				alert("제목을 적어주세요");
				document.forms[0].title.focus();
				return false;
			}

			if( !content ){
				alert("내용을 적어주세요");
				document.forms[0].content.focus();
				return false;
			}

			return true;
		}
	</script>
</body>
</html>