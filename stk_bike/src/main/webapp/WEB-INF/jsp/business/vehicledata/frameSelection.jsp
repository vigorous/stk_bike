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
<title>嫌疑车辆框选分析</title>
</head>
<body>
<div class="page-content">
<div class="row">
	<div class="col-xs-12" style="padding: 15px">
		<table style="border: 0;">
			<tr>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">地图框选</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">查询</button>
				</td>
			</tr>
		</table>
	</div>
</div>
	<div class="col-xs-12" style="padding: 15px">
		
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
							<!-- <li><select title="显示条数" style="width: 55px; float: left;">
									<option value="1">1页</option>
									<option value="2">2页</option>
									<option value="3">3页</option>
									<option value="4">4页</option>
									<option value="5">5页</option>
									<option value="6">6页</option>
									<option value="7">7页</option>
							</select></li> -->
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