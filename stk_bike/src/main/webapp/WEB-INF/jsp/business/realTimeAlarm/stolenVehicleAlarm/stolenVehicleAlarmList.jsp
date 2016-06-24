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
		<style type="text/css">
			.margin-bottom-5{margin-bottom: 5px;}
			.width-120{width: 120px!important;}
			.margin-left-30{margin-left: 30px;}
			.padding-bottom-0{padding-bottom: 0px!important;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content padding-bottom-0">
			<div class="row">
				<div class="col-xs-12">
					<table class="table table-striped table-bordered table-hover text-center margin-bottom-5">
						<thead>
							<tr>
								<th class="text-center" width="20%">电子车牌</th>
								<th class="text-center" width="20%">报警位置</th>
								<th class="text-center" width="20%">报警类型</th>
								<th class="text-center" width="20%">最后出现时间</th>
								<th class="text-center" width="20%">详细信息</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>43011111111111</td>
								<td>新城区白石路</td>
								<td>即时</td>
								<td>2015-5-5 10:10</td>
								<td>白色</td>
							</tr>
							<tr>
								<td>43011111111111</td>
								<td>新城区白石路</td>
								<td>即时</td>
								<td>2015-5-5 10:10</td>
								<td>白色</td>
							</tr>
							<tr>
								<td>43011111111111</td>
								<td>新城区白石路</td>
								<td>即时</td>
								<td>2015-5-5 10:10</td>
								<td>白色</td>
							</tr>
							<tr>
								<td>43011111111111</td>
								<td>新城区白石路</td>
								<td>即时</td>
								<td>2015-5-5 10:10</td>
								<td>白色</td>
							</tr>
							<tr>
								<td>43011111111111</td>
								<td>新城区白石路</td>
								<td>即时</td>
								<td>2015-5-5 10:10</td>
								<td>白色</td>
							</tr>
							<tr>
								<td>43011111111111</td>
								<td>新城区白石路</td>
								<td>即时</td>
								<td>2015-5-5 10:10</td>
								<td>白色</td>
							</tr>
							<tr>
								<td>43011111111111</td>
								<td>新城区白石路</td>
								<td>即时</td>
								<td>2015-5-5 10:10</td>
								<td>白色</td>
							</tr>
							<tr>
								<td>43011111111111</td>
								<td>新城区白石路</td>
								<td>即时</td>
								<td>2015-5-5 10:10</td>
								<td>白色</td>
							</tr>
							<tr>
								<td>43011111111111</td>
								<td>新城区白石路</td>
								<td>即时</td>
								<td>2015-5-5 10:10</td>
								<td>白色</td>
							</tr>
							<tr>
								<td>43011111111111</td>
								<td>新城区白石路</td>
								<td>即时</td>
								<td>2015-5-5 10:10</td>
								<td>白色</td>
							</tr>
						</tbody>
					</table>
					${page.getPageStr()}
				</div>
			</div>
		</div>
		<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
	</body>
</html>