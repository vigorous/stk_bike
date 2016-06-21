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
<title>布防设置</title>
</head>
<body>
	<div class="col-xs-12" style="padding: 15px">
		<table style="border: 0;">
			<tr>
				<td style="padding: 0 5px;"><input
					class="form-control date-picker" id="id-date-picker-1" type="text"
					data-date-format="dd-mm-yyyy" placeholder="开始日期" /></td>
				<td style="padding: 0 5px;"><input
					class="form-control date-picker" id="id-date-picker-2" type="text"
					data-date-format="dd-mm-yyyy" placeholder="结束时间" /></td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">查询</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">重复</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">不重复</button>
				</td>
			</tr>
		</table>
	</div>

	<div class="col-xs-12" style="padding: 15px">
		<table id="simple-table"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>机具ID</th>
					<th>安装位置</th>
					<th>过车数量</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>1</td>
					<td>1</td>
					<td>1</td>
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
</body>
</html>