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
<link rel="stylesheet"
	href="static/assets/css/bootstrap-datepicker3.css" />
<title>电子车牌发卡管理</title>
</head>
<body>
	<input type="hidden" value="<%=basePath%>" id="ctxPath" />
	<div class="page-content">
		<!-- 主体查询条件部分 -->
		<div class="row">
			<div class="col-xs-12">
				<table style="border: 0">
					<tr>
						<td class="col-padding-right">
							<button id="addPlate" class="btn btn-sm btn-info">发放电子车牌</button>
						</td>
						<td class="col-padding-right">
							<div class="input-group margin-right-30">
								<input class="form-control date-picker text-center" type="text"
									data-date-format="yyyy-mm-dd" placeholder="开始日期" id="startTime" />
								<span class="input-group-addon border-left-0"> <i
									class="fa fa-calendar bigger-110"></i>
								</span>
							</div>
						</td>
						<td class="col-padding-right">
							<div class="input-group">
								<input class="form-control date-picker text-center" type="text"
									data-date-format="yyyy-mm-dd" placeholder="结束日期" id="endTime" />
								<span class="input-group-addon"> <i
									class="fa fa-calendar bigger-110"></i>
								</span>
							</div>
						</td>
						<td class="col-padding-right">
							<button class="btn btn-sm btn-info" id="selectPlate">统计</button>
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
									<th>申请卡片单位</th>
									<th>发卡单位</th>
									<th class="hidden-480">申请时间</th>
									<th><i
										class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i> 开始号码</th>
									<th class="hidden-480">结束号码</th>
									<th>经办人ID</th>
									<th>经办人姓名</th>
									<th>发卡数量</th>
								</tr>
							</thead>

							<tbody>
								<!-- 判断li是否为空 -->
								<c:if test="${empty list}">
									<tr>
										<td colspan="8" style="text-align: center;">暂无数据</td>
									</tr>
								</c:if>
								<c:forEach items="${list}" var="card">
									<tr>
										<td><a href="#">${card.APPLY_ORG_NAME}</a></td>
										<td><a href="#">${card.AUTH_ORG_NAME}</a></td>
										<td>${card.APPLY_TIME}</td>
										<td>${card.CARD_BEGIN_NO}</td>
										<td>${card.CARD_END_NO}</td>
										<td>${card.POLICE_ID}</td>
										<td>${card.POLICE_NAME}</td>
										<td>${card.APPLY_NUM}</td>
								</c:forEach>
								<tr />
							</tbody>
						</table>
						${page.pageStr}
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../system/admin/bottom.jsp"%>
	<script src="static/js/private_js/admin/head.js"></script>
	<script type="text/javascript"
		src="static/js/private_js/business/bikefunctionmanage/plateManager.js"></script>
	<script type="text/javascript">
		$('.form-control.date-picker').datepicker({
			language : 'zh-CN'
		});
	</script>
</body>
</html>