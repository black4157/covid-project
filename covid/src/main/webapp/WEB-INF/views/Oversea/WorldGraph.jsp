<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="section-02 scroll" style="padding:30px 30px 0 30px; margin-top:40px;">
	<section>
		<h2 style="text-align: center;"><b>사망자</b></h2>
		<div class="chart">
			<canvas id="death"></canvas>
		</div>
		<div class="blank" style="margin: 15px;"></div>
	</section>
</div>

<div class="section-03 scroll" style="padding:30px 30px 0 30px; margin-top:40px;">
	<section>
		<h2 style="text-align: center;"><b>확진자</b></h2>
		<div class="chart">
			<canvas id="cases"></canvas>
		</div>
		<div class="blank" style="margin: 15px;"></div>
	</section>
</div>

<div class="section-04 scroll" style="padding:30px; margin-top:40px;">
	<section>
		<h2 style="text-align: center;"><b>검사자</b></h2>
		<div class="chart">
			<canvas id="tests"></canvas>
		</div>
		<div class="blank" style="margin: 15px;"></div>
	</section>
</div>
<script>
	var date = date.reverse();
	var total_deaths = total_deaths.reverse();
	var new_deaths = new_deaths.reverse();
	var total_cases = total_cases.reverse();
	var new_cases = new_cases.reverse();
	var total_tests = total_tests.reverse();
	var new_tests = new_tests.reverse();
	
	var deathsGraph = document.getElementById("death").getContext('2d');
	var casesGraph = document.getElementById("cases").getContext('2d');
	var testsGraph = document.getElementById("tests").getContext('2d');
	
	var deathChart = new Chart(deathsGraph, {
		type : 'line',
		data : {
			labels : date,
			datasets : [ {
				label : '누적 사망자',
				yAxisID : 'total',
				data : total_deaths,
				backgroundColor : 'rgba(255,99,132,0)',
				borderColor : 'rgba(0,0,0,1)',
				borderWidth : 2
			},
			{
				label : '추가 사망자',
				yAxisID : 'new',
				data : new_deaths,
				backgroundColor : 'rgba(255,99,132,0)',
				borderColor : 'rgba(123,123,123,1)' ,
				borderWidth : 2
			}]
		},
		options : {
			maintainAspectRatio : true,
			scales : {
				xAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "날짜"
					}
				} ],

				yAxes : [ {
					id : 'total',
					type : 'linear',
					position : 'left',
					scaleLabel : {
						display : true,
						labelString : "총 사망자"
					}
				},{
					id : 'new',
					type : 'linear',
					position : 'right',
					scaleLabel : {
						display : true,
						labelString : "추가 사망자"
					}
				} ]
			}
		}
	});

	var casesChart = new Chart(casesGraph, {
		type : 'line',
		data : {
			labels : date,
			datasets : [ {
				label : '누적 확진자',
				yAxisID : 'total',
				data : total_cases,
				backgroundColor : 'rgba(255,99,132,0)',
				borderColor : 'rgba(255,0,0,1)' ,
				borderWidth : 2
			},
			{
				label : '신규 확진자',
				yAxisID : 'new',
				data : new_cases,
				backgroundColor : 'rgba(255,99,132,0)',
				borderColor : 'rgba(150,0,0,1)' ,
				borderWidth : 2
			}]
		},
		options : {
			maintainAspectRatio : true,
			scales : {
				xAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "날짜"
					}
				} ],

				yAxes : [ {
					id : 'total',
					type : 'linear',
					position : 'left',
					scaleLabel : {
						display : true,
						labelString : "총 확진자"
					}
				},{
					id : 'new',
					type : 'linear',
					position : 'right',
					scaleLabel : {
						display : true,
						labelString : "신규 확진자"
					}
				} ]
			}
		}
	});

	var testsChart = new Chart(testsGraph, {
		type : 'line',
		data : {
			labels : date,
			datasets : [ {
				label : '누적 검사인원',
				yAxisID : 'total',
				data : total_tests,
				backgroundColor : 'rgba(255,99,132,0)',
				borderColor : 'rgba(255,150,0,1)' ,
				borderWidth : 2
			},
			{
				label : '추가 검사인원',
				yAxisID : 'new',
				data : new_tests,
				backgroundColor : 'rgba(255,99,132,0)',
				borderColor : 'rgba(255,200,0,1)' ,
				borderWidth : 2
			}]
		},
		options : {
			maintainAspectRatio : true,
			scales : {
				xAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "날짜"
					}
				} ],

				yAxes : [ {
					id : 'total',
					type : 'linear',
					position : 'left',
					scaleLabel : {
						display : true,
						labelString : "총 검사인원"
					}
				},{
					id : 'new',
					type : 'linear',
					position : 'right',
					scaleLabel : {
						display : true,
						labelString : "추가 검사인원"
					}
				} ]
			}
		}
	});

</script>