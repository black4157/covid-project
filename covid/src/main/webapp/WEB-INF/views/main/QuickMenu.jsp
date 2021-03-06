<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

ul, ol { list-style: none; padding: 0;}

/* floating menu */
.floating-menu { position: fixed; top: 50%; z-index: 100; width: 128px;  margin: -220px 0 0 0; }
.floating-menu li { margin: 0; *float: left; }
.floating-menu a { display: block; width: 123px; padding: 10px 0;color: #fff; text-align: center; border: 1px solid #464646; text-decoration: none;}
.floating-menu a.menu-04 { background: none; }
.floating-menu li.on a { background-color: rgb(2,170,178); color: #fff;/*background: url("") 0 0 no-repeat;*/ }
.floating-menu li.on a.menu-01 {/* background-position: -131px 0;*/ }
.floating-menu li.on a.menu-02 {/* background-position: -131px -104px;*/ }
.floating-menu li.on a.menu-03 { /*background-position: -131px -219px;*/ }

</style>

<div id="contents">
	<div class="floating-menu">
		<ul>
			<li class="m"><a href="#section-02" class="menu-02"><span style="color:black;">공지사항</span></a></li>
			<li class="m"><a href="#section-03" class="menu-03"><span style="color:black;">코로나 유튜브</span></a></li>
			<li class="btn-top"><a href="#header" class="menu-04"><span style="color:black;">Top</span></a></li>
		</ul>
	</div>
</div>

