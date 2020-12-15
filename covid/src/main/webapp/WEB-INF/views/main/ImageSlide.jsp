<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="section-02 scroll">
	<div class="hoc clear" >
		<div style="float:left; margin-top:80px;">
			<ul class="bxslider">
				<li><a href="#"><img src="resources/images/demo/covid19/poster1.png" alt="이미지 오류" title="코로나 지켜주세요(1)"></a></li>
				<li><a href="#"><img src="resources/images/demo/covid19/poster2.png" alt="이미지 오류" title="코로나 지켜주세요(2)"></a></li>
				<li><a href="#"><img src="resources/images/demo/covid19/poster3.png" alt="이미지 오류" title="코로나 지켜주세요(3)"></a></li>
				<li><a href="#"><img src="resources/images/demo/covid19/poster4.png" alt="이미지 오류" title="코로나 지켜주세요(4)"></a></li>
				<li><a href="#"><img src="resources/images/demo/covid19/poster5.png" alt="이미지 오류" title="코로나 지켜주세요(5)"></a></li>
				<li><a href="#"><img src="resources/images/demo/covid19/poster6.png" alt="이미지 오류" title="코로나 지켜주세요(6)"></a></li>
				<li><a href="#"><img src="resources/images/demo/covid19/poster7.png" alt="이미지 오류" title="코로나 지켜주세요(7)"></a></li>
				<li><a href="#"><img src="resources/images/demo/covid19/poster8.png" alt="이미지 오류" title="코로나 지켜주세요(8)"></a></li>
				<li><a href="#"><img src="resources/images/demo/covid19/poster9.png" alt="이미지 오류" title="코로나 지켜주세요(9)"></a></li>
			</ul>
		</div>
		<div class="col-lg-12" style="color:black; width:40%; float:right;  margin-top:80px;">
		
			<%@ include file="./SmallNotice.jsp" %>
			
		</div>
	</div>
</div>
 
 <script>
	var j = $.noConflict(true);
	j(document).ready(function(){
	    j('.bxslider').bxSlider( {
	        mode: 'horizontal',// 가로 방향 수평 슬라이드
	        speed: 1500,       // 이동 속도를 설정
	        pager: true,       // 현재 위치 페이징 표시 여부 설정
	        moveSlides: 1,     // 슬라이드 이동시 개수
	        slideWidth: 550,   // 슬라이드 너비
	        minSlides: 1,      // 최소 노출 개수
	        maxSlides: 1,      // 최대 노출 개수
	        auto: true,        // 자동 실행 여부
	        autoHover: true,   // 마우스 호버시 정지 여부
	        controls: true,    // 이전 다음 버튼 노출 여부 
	        autoControls: true // 재성, 일시정지 노출 여부
	    });
	});
</script>