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
<title>电子车牌发卡管理</title>
</head>
<body>
<div class="page-content">
<div class="row">
	<div class="col-xs-12" style="padding: 15px">
		<table style="border: 0;">
			<tr>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">已巡回车发放电子车牌辆</button>
				</td>
				<td>
					<div class="input-group margin-right-30">
						<input class="form-control date-picker text-center width-120" type="text" data-date-format="yyyy-mm-dd" placeholder="开始日期" />
						<span class="input-group-addon border-left-0">
							<i class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
				</td>
				<td style="padding-left:20px;">
					<div class="input-group">
						<input class="form-control date-picker text-center width-120" type="text" data-date-format="yyyy-mm-dd" placeholder="结束日期" />
						<span class="input-group-addon">
							<i class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">统计</button>
				</td>
			</tr>
		</table>
	</div>
</div>
	<div class="col-xs-12" style="padding: 15px">
		<table id="simple-table"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>申请卡片单位</th>
					<th>发卡单位</th>
					<th class="hidden-480">申请时间</th>
					<th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
						开始号码</th>
					<th class="hidden-480">结束号码</th>
					<th>经办人ID</th>
					<th>经办人姓名</th>
					<th>发卡数量</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td><a href="#">南浔区公安局</a></td>
					<td><a href="#"> </a></td>
					<td>2016-06-15 13:19:32</td>
					<td class="hidden-480">33050300000001</td>
					<td>33050300000100</td>
					<td>1</td>
					<td>1</td>
					<td>100</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 尾部页数 -->
	<div class="col-xs-12">
		<table style="width: 100%;">
			<tbody>
				<tr>
					<td><div class="pagination"
							style="float: right; padding-top: 0px; margin-top: 0px;">
							<li><a>发卡总数:<font color="red">7</font>条</a></li>
							<li><a>首页</a></li>
							<li><a>上页</a></li>
							<li><a><font color="#808080">1</font></a></li>
							<li><a>下页</a></li>
							<li><a>尾页</a></li>
							<li><a>第1页</a></li>
							<li><a>共1页</a></li>
						</div></td>

				</tr>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script type="text/javascript">
			$('.form-control.date-picker').datepicker({language: 'zh-CN'});
		</script>
</body>
</html>