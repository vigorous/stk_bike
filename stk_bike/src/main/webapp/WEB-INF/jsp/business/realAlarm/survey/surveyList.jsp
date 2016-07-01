<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head lang="en">
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
		<link rel="stylesheet" href="static/assets/css/chosen.css" />
		<style type="text/css">
			.margin-bottom-5{margin-bottom: 5px;}
			.width-120{width: 120px!important;}
			.margin-right-30{margin-right: 30px;}
			.padding-bottom-0{padding-bottom: 0px!important;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content">
			<!-- <div class="row margin-bottom-5"> -->
			<div class="row">
				<div class="col-xs-12">
					<form class="form-horizontal" role="form" id="surveySearchForm" action="survey/surveyList">
						<div class="form-group">
							<div class="col-sm-2">
								<div class="input-group">
									<input class="form-control date-picker text-center" type="text" name="START_TIME" data-date-format="yyyy-mm-dd" placeholder="开始日期" />
									<span class="input-group-addon">
										<i class="fa fa-calendar bigger-110"></i>
									</span>
								</div>
							</div>
							
							<div class="col-sm-2">
								<div class="input-group">
									<input class="form-control date-picker text-center" type="text" name="END_TIME" data-date-format="yyyy-mm-dd" placeholder="结束日期" />
									<span class="input-group-addon">
										<i class="fa fa-calendar bigger-110"></i>
									</span>
								</div>
							</div>
							
							<div class="col-sm-2">
								<select class="form-control chosen-select" data-placeholder="车辆类型" name="BIKE_SOURCE">
									<option value=""></option>
									<option value="">全部车辆</option>
									<option value="00">新车</option>
									<option value="01">旧车</option>
								</select>
							</div>
							<!-- 按钮控件 -->
							<button class="btn btn-sm btn-light" onclick="search();"  title="查询">
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</button>
							<!-- /按钮控件 -->
						</div>
					</form>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-12">
					<ul class="nav nav-tabs">
						<li class="active"><a id="tableTag">表格</a></li>
						<li><a id="histogramTag">柱状图</a></li>
					</ul>
					<div class="row" id="tableTagPage">
						<div class="col-xs-12">
							<table class="table table-striped table-bordered table-hover text-center margin-bottom-5">
								<thead>
									<tr>
										<th class="text-center" width="25%">单位</th>
										<th class="text-center" width="25%">总量</th>
										<th class="text-center" width="25%">丢失</th>
										<th class="text-center" width="25%">寻回</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="statisticBike" varStatus="varStatus">
									<tr>
										<td>${statisticBike.NAME }</td>
										<td>${statisticBike.CARS_COUNT}</td>
										<td>${statisticBike.LOST_CARS_COUNT}</td>
										<td>${statisticBike.BACK_CARS_COUNT}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							${page.getPageStr()}
						</div>
					</div>
				</div>
			</div>
			<div class="row hide" id="histogramTagPage">
				<div class="col-xs-12 row-margin-top">
					<div class="row">
						<div class="col-xs-6" id="container"></div>
						<div class="col-xs-6" id="container1"></div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
		<script src="plugins/Highcharts-4.1.10/js/highcharts.js"></script>
		<script src="plugins/Highcharts-4.1.10/js/modules/exporting.js"></script>
		<script type="text/javascript">
			$('.form-control.date-picker').datepicker({language: 'zh-CN'});
			$("#histogramTag").off().click(function(){
				$("#tableTag").parent().removeClass("active");
				$("#histogramTagPage").removeClass("hide");
				$("#histogramTag").parent().addClass("active");
				$("#tableTagPage").addClass("hide");
			});
			$("#tableTag").off().click(function(){
				$("#histogramTag").parent().removeClass("active");
				$("#tableTagPage").removeClass("hide");
				$("#tableTag").parent().addClass("active");
				$("#histogramTagPage").addClass("hide");
			});
			$('.chosen-select').chosen();
			
			$(function () {
				$('#container').highcharts({
					credits: {
						enabled: false
					},
					exporting: {
						enabled: false
					},
					chart: {
						type: 'column'
					},
					title: {
						text: '车辆详细记录'
					},
					subtitle: {
						text: '车辆数量（辆）'
					},
					xAxis: {
						categories: [
							'秀洲公安局',
							'洪河交警中队',
							'王店派出所',
							'洪河派出所',
							'新城派出所',
							'王店交警中队',
							'五联派出所',
							'江泾派出所'
						],
						//type: 'category',
						//labels: {
						//	rotation: -45,
						//	style: {
						//		fontSize: '13px',
						//		fontFamily: 'Verdana, sans-serif'
						//	}
						//}
						//crosshair: true
						labels: {
							rotation: -15
						}
					},
					yAxis: {
						min: 0,
						title: {
							text: '车辆数量 (辆)'
						}
					},
					tooltip: {
						headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
						pointFormat: '<tr><td style="color:{series.color};padding:0;border:1px solid #ccc;text-align:right">{series.name}: </td>' +
						'<td style="padding:0;border:1px solid #ccc"><b>{point.y} 辆</b></td></tr>',//{point.y:.1f}修改颜色：#434348-->#e4393c
						footerFormat: '</table>',
						shared: true,
						useHTML: true
					},
					plotOptions: {
						column: {
							pointPadding: 0.2,
							borderWidth: 0
						}
					},
					series: [{
						name: '总车辆数',
						data: [185, 71, 106, 129, 144, 176, 135, 148]

					}, {
						name: '遗失',
						data: [83, 78, 98, 93, 106, 84, 105, 104]

					}, {
						name: '寻回',
						data: [48, 38, 39, 41, 47, 48, 59, 56]

					}]
				});
			});
			
			$(function () {
			    $('#container1').highcharts({
			    	credits: {
						enabled: false
					},
					exporting: {
						enabled: false
					},
			        chart: {
			            plotBackgroundColor: null,
			            plotBorderWidth: null,
			            plotShadow: false
			        },
			        title: {
			            text: '车辆数量统计分布图'
			        },
			        tooltip: {
			    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			        },
			        plotOptions: {
			            pie: {
			                allowPointSelect: true,
			                cursor: 'pointer',
			                dataLabels: {
			                    enabled: true,
			                    color: '#000000',
			                    connectorColor: '#000000',
			                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
			                },
			                showInLegend: true
			            }
			        },
			        series: [{
			            type: 'pie',
			            name: '车辆占有比率',
			            data: [
			                ['秀洲公安局',   45.0],
			                ['王店派出所',       26.8],
			                {
			                    name: '洪河派出所',
			                    y: 12.8,
			                    sliced: true,
			                    selected: true
			                },
			                ['新城派出所',    8.5],
			                ['五联派出所',     6.2],
			                ['洪河交警中队',   0.7]
			            ]
			        }]
			    });
			});
		</script>
	</body>
</html>