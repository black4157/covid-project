<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.ArrayList"%>

<div class="section-02 scroll" style="padding:30px 30px 0 30px; margin-top:40px;">
	<section>
		<h2 style="text-align: center;"><b>사망자</b></h2>
		<div class="chart">
			<canvas id="dead"></canvas>
		</div>
		<div class="blank" style="margin: 5px;"></div>
	</section>
</div>

<div class="section-03 scroll" style="padding:30px 30px 0 30px; margin-top:40px;">
	<section>
		<h2 style="text-align: center;"><b>확진자</b></h2>
		<div class="chart">
			<canvas id="infect"></canvas>
		</div>
		<div class="blank" style="margin: 5px;"></div>
	</section>
</div>

<div class="section-04 scroll" style="padding:30px 30px 0 30px; margin-top:40px;">
	<section>
		<h2 style="text-align: center;"><b>검사자</b></h2>
		<div class="chart">
			<canvas id="check"></canvas>
		</div>
		<div class="blank" style="margin: 5px;"></div>
	</section>
</div>

<div class="section-05 scroll" style="padding:30px; margin-top:40px;">
	<section>
		<h2 style="text-align: center;"><b>음성 판정자</b></h2>
		<div class="chart">
			<canvas id="negative"></canvas>
		</div>
		<div class="blank" style="margin: 5px;"></div>
	</section>
</div>

<!-- 그래프 스크립트 -->
<script>
	var dead = dead.reverse();
	var date = date.reverse();
	var infect = infect.reverse();
	var check = check.reverse();
	var negative = negative.reverse();
	
	var deadGraph = document.getElementById("dead").getContext('2d');
	var infectGraph = document.getElementById("infect").getContext('2d');
	var checkGraph = document.getElementById("check").getContext('2d');
	var negativeGraph = document.getElementById("negative").getContext('2d');

	var deadChart = new Chart(deadGraph, {
		type : 'line',
		data : {
			labels : date,
			datasets : [ {
				label : '',
				data : dead,
				backgroundColor : 'rgba(0,0,0,0.2)',
				borderColor : 'rgba(0,0,0,1)',
				borderWidth : 2
			} ]
		},
		options : {
			maintainAspectRatio : true,
			hover : true,
			scales : {
				xAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "날짜"
					}
				} ],

				yAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "사망자"
					}
				} ]
			},
			tooltips : {
				mode:'point'
				}
		},
	});

	var infectChart = new Chart(infectGraph, {
		type : 'line',
		data : {
			labels : date,
			datasets : [ {
				label : '',
				data : infect,
				backgroundColor : 'rgba(255,0,0,0.2)',
				borderColor : 'rgba(255,0,0,1)' ,
				borderWidth : 2
			} ]
		},
		options : {
			maintainAspectRatio : true, 
			hover : true,
			scales : {
				xAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "날짜"
					}
				} ],

				yAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "확진자"
					}
				} ]
			}
		},
	});

	var checkChart = new Chart(checkGraph, {
		type : 'line',
		data : {
			labels : date,
			datasets : [ {
				label : '',
				data : check,
				backgroundColor : 'rgba(255,200,0,0.2)',
				borderColor : 'rgba(255,200,0,1)',
				borderWidth : 2
			} ]
		},
		options : {
			maintainAspectRatio : true, 
			hover : true,
			scales : {
				xAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "날짜"
					}
				} ],

				yAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "검사 중"
					}
				} ]
			}
		},
	});

	var negativeChart = new Chart(negativeGraph, {
		type : 'line',
		data : {
			labels : date,
			datasets : [ {
				label : '',
				data : negative,
				backgroundColor : 'rgba(0,255,0,0.2)',
				borderColor : 'rgba(0,255,0,1)' ,
				borderWidth : 2
			} ]
		},
		options : {
			maintainAspectRatio : true,
			hover : true,
			scales : {
				xAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "날짜"
					}
				} ],

				yAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "음성 판정"
					}
				} ]
			}
		},
	});
</script>