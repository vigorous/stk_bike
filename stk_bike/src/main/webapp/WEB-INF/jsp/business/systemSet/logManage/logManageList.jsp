<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
<link rel="stylesheet"
	href="static/assets/css/bootstrap-datepicker3.css" />
<style type="text/css">
.margin-bottom-5 {
	margin-bottom: 5px;
}

.width-120 {
	width: 120px !important;
}

.margin-right-30 {
	margin-right: 30px;
}

.padding-bottom-0 {
	padding-bottom: 0px !important;
}
</style>
<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
</head>
<body class="no-skin">
	<div class="page-content padding-bottom-0">
		<div class="row margin-bottom-5">
			<div class="col-xs-7">
				<form action="business/systemSetting/systemLog/systemLogList"
					id="systemLogListSreachForm">
					<table>
						<tr>
							<td><input type="text" class="width-120 margin-right-30"
							    placeholder="操作记录" name="OPERATION_CONTENT" /></td>
							<td>
								<div class="input-group margin-right-30">
									<input class="form-control date-picker text-center width-120"
										type="text" data-date-format="yyyy-mm-dd" placeholder="开始日期"
										name="startTime" /> <span
										class="input-group-addon border-left-0"> <i
										class="fa fa-calendar bigger-110"></i>
									</span>
								</div>
							</td>
							<td>
								<div class="input-group">
									<input class="form-control date-picker text-center width-120"
										type="text" data-date-format="yyyy-mm-dd" placeholder="结束日期"
										name="endTime" /> <span class="input-group-addon"> <i
										class="fa fa-calendar bigger-110"></i>
									</span>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-xs-5 text-right">
				<div class="btn-group">
					<button class="btn btn-primary" id="systemLogListSreachBtn">查询</button>
					<!-- <button type="button" class="btn btn-primary" value="查询" name="query" /> -->
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<table
					class="table table-striped table-bordered table-hover text-center margin-bottom-5">
					<thead>
						<tr>
							<th class="text-center" width="33.33%">操作用户</th>
							<th class="text-center" width="33.33%">操作记录</th>
							<th class="text-center" width="33.33%">时间</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty logList}">
							<tr>
								<td colspan="5">暂无数据</td>
							</tr>
						</c:if>
						<c:forEach items="${logList}" var="loginfoVo">
							<tr data-id="${loginfoVo.logVO.LOG_ID}">
								<td>${loginfoVo.userVO.USERNAME}</td>
								<td>${loginfoVo.logVO.OPERATION_CONTENT}</td>
								<td>${loginfoVo.logVO.OPERATION_TIME}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				${page.getPageStr()}
			</div>
		</div>
	</div>
		<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
	<script type="text/javascript"
		src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script type="text/javascript">
		$('.form-control.date-picker').datepicker({
			language : 'zh-CN'
		});
	</script>
	<script type="text/javascript"
		src="static/js/private_js/business/systemSet/logManage/logManageList.js"></script>
</body>
</html>