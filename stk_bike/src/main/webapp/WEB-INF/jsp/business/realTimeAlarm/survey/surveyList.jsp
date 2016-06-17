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
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
		<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
		<style type="text/css">
			.margin-bottom-5{margin-bottom: 5px;}
			.width-120{width: 120px!important;}
			.margin-left-30{margin-left: 30px;}
		</style>
	</head>
	<body class="no-skin">
		<div class="breadcrumbs">
			<ul class="breadcrumb">
				<li><span>您现在的位置：</span></li>
				<li class="active">首页</li>
			</ul>
		</div>
		<div class="page-content">
			<div class="row margin-bottom-5">
				<div class="col-xs-7">
					<form id="surveySearchForm" action="realTimeAlarm/survey">
						<table>
							<tr>
								<td>
									<div class="input-group">
										<input class="form-control date-picker text-center width-120" type="text" data-date-format="yyyy-mm-dd" placeholder="开始日期" />
										<span class="input-group-addon border-left-0">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
									</div>
								</td>
								<td>
									<div class="input-group">
										<input class="form-control date-picker text-center width-120  margin-left-30" type="text" data-date-format="yyyy-mm-dd" placeholder="结束日期" />
										<span class="input-group-addon">
											<i class="fa fa-calendar bigger-110"></i>
										</span>
									</div>
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
	</body>
</html>
<script>
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
</script>