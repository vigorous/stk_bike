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
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content">
			<div class="row margin-bottom-5">
				<div class="col-xs-7">
					<form id="surveySearchForm" action="realTimeAlarm/survey">
						<table>
							<tr>
								<td>
									<div class="input-group margin-right-30">
										<input class="form-control date-picker text-center width-120" type="text" data-date-format="yyyy-mm-dd" placeholder="开始日期" />
										<span class="input-group-addon border-left-0">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
									</div>
								</td>
								<td>
									<div class="input-group margin-right-30">
										<input class="form-control date-picker text-center width-120" type="text" data-date-format="yyyy-mm-dd" placeholder="结束日期" />
										<span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
									</div>
								</td>
								<td>
									<select class="form-control chosen-select" data-placeholder="车辆类型">
										<option value=""></option>
										<option value="">全部车辆</option>
										<option value="0">新车</option>
										<option value="1">旧车</option>
									</select>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="col-xs-5 text-right">
					<div class="btn-group">
						<input type="button" class="btn btn-primary" value="查询" />
					</div>
				</div>
			</div>
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
							<tr>
								<td>杭州吉祥派出所</td>
								<td>100000</td>
								<td>100</td>
								<td>100</td>
							</tr>
							<tr>
								<td>杭州吉祥派出所</td>
								<td>100000</td>
								<td>100</td>
								<td>100</td>
							</tr>
							<tr>
								<td>杭州吉祥派出所</td>
								<td>100000</td>
								<td>100</td>
								<td>100</td>
							</tr>
							<tr>
								<td>杭州吉祥派出所</td>
								<td>100000</td>
								<td>100</td>
								<td>100</td>
							</tr>
							<tr>
								<td>杭州吉祥派出所</td>
								<td>100000</td>
								<td>100</td>
								<td>100</td>
							</tr>
							<tr>
								<td>杭州吉祥派出所</td>
								<td>100000</td>
								<td>100</td>
								<td>100</td>
							</tr>
							<tr>
								<td>杭州吉祥派出所</td>
								<td>100000</td>
								<td>100</td>
								<td>100</td>
							</tr>
							<tr>
								<td>杭州吉祥派出所</td>
								<td>100000</td>
								<td>100</td>
								<td>100</td>
							</tr>
							<tr>
								<td>杭州吉祥派出所</td>
								<td>100000</td>
								<td>100</td>
								<td>100</td>
							</tr>
							<tr>
								<td>杭州吉祥派出所</td>
								<td>100000</td>
								<td>100</td>
								<td>100</td>
							</tr>
						</tbody>
					</table>
					${page.getPageStr()}
				</div>
			</div>
			<div class="row hide" id="histogramTagPage">
				<div class="col-xs-12">
					
				</div>
			</div>
		</div>
		<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
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
		</script>
	</body>
</html>