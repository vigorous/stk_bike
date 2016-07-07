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
								<th class="text-center" width="25%">电子车牌</th>
								<th class="text-center" width="25%">安装位置</th>
								<th class="text-center" width="25%">报警类型</th>
								<th class="text-center" width="25%">时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="realAlarm">
								<tr>
									<td>${realAlarm.bikeVO.BIKE_EID}</td>
									<td>${realAlarm.machineVO.MACHINE_ADDRESS}</td>
									<td>
										<c:choose>
											<c:when test="${realAlarm.focusRecordVO.FLAG == '00'}">被盗</c:when>
											<c:when test="${realAlarm.focusRecordVO.FLAG == '01'}">布控</c:when>
										</c:choose>
									</td>
									<td>${realAlarm.focusRecordVO.CREATE_TIME}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					${page.pageStr}
				</div>
			</div>
		</div>
		<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
	</body>
</html>