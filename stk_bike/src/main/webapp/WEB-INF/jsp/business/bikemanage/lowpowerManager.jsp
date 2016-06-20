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
<title>低电量车辆管理</title>
</head>
<body>
	<div class="col-xs-12" style="padding: 15px">
		<table style="border: 0;">
			<tr>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">通知</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">已通知车主</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">未通知车主</button>
				</td>
			</tr>
		</table>
	</div>

	<div class="col-xs-12" style="padding: 15px">
		<table id="simple-table"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>案件号</th>
					<th>电子车牌</th>
					<th class="hidden-480">车主姓名</th>
					<th>身份证号妈</th>
					<th>联系电话</th>
					<th>状态</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>$45</td>
					<td><a href="#">ace.com</a></td>
					<td>$45</td>
					<td class="hidden-480">3,330</td>
					<td>Feb 12</td>
					<td>$45</td>
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
							<li><a>共<font color="red">7</font>条
							</a></li>
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
</body>
</html>