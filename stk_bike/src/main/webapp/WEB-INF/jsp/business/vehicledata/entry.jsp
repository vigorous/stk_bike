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
<%@ include file="../../system/admin/top.jsp"%>
<title>布防设置</title>
</head>
<body>
	<div class="page-content">
		<!-- 主体查询条件部分 -->
		<div class="row">
			<div class="col-xs-12">
				<table style="border: 0">
					<tr>
						<td class="col-padding-right">
							<button id="addentry" class="btn btn-sm btn-info">创建新的布防设置</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 主体表格部分 -->
		<div class="row row-margin-top">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-12">
						<table id="simple-table"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>布防名称</th>
									<th>布防机具</th>
									<th class="hidden-480">布防车牌</th>
									<th>开始时间</th>
									<th>结束时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>

							<tbody>

								<c:if test="${empty monitorList}">
									<tr>
										<td colspan="7" style="text-align: center;">暂无数据</td>
									</tr>
								</c:if>
								<c:forEach items="${monitorList}" var="monitor">
									<tr>

										<td>${monitor.monitorRuleVO.RULE_NAME}</td>
										<c:forEach items="${monitor.monitorMachienInfoVOList}"
											var="list">
											<td>${list.machineName}</td>
										</c:forEach>

										<c:forEach items="${monitor.monitorBikeVOList}" var="lists">
											<td>${lists.BIKE_EID}</td>
										</c:forEach>
										<td>${monitor.monitorRuleVO.RULE_BEGIN_TIME}</td>
										<td>${monitor.monitorRuleVO.RULE_END_TIME}</td>
										<c:if test="${monitor.monitorRuleVO.STATUS=='01'}">
											<td>无效</td>
										</c:if>
										<c:if test="${monitor.monitorRuleVO.STATUS=='00'}">
											<td>有效</td>
										</c:if>
										<td>${monitor.monitorRuleVO.STATUS}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- 底部页码 -->
			<div class="col-xs-12"></div>
		</div>
	</div>
	<script src="static/js/private_js/admin/head.js"></script>
	<script type="text/javascript"
		src="static/js/private_js/business/vehicledata/entry.js"></script>
</body>
</html>