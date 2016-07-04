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

.margin-left-30 {
	margin-left: 30px;
}

.padding-bottom-0 {
	padding-bottom: 0px !important;
}
</style>
<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
</head>
<body class="no-skin">
	<div class="page-content padding-bottom-0">
		<div class="row">
			<div class="col-xs-12">
				<table
					class="table table-striped table-bordered table-hover text-center margin-bottom-5"
					id="userManageListTable">
					<thead>
						<tr>
							<th class="text-center" width="16.66%">用户名称</th>
							<th class="text-center" width="16.66%">真实姓名</th>
							<th class="text-center" width="16.66%">所在单位</th>
							<th class="text-center" width="16.66%">状态</th>
							<th class="text-center" width="16.66%">角色</th>
							<th class="text-center" width="16.66%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list}">
							<tr>
								<td colspan="5">暂无数据</td>
							</tr>
						</c:if>
						<c:forEach items="${list}" var="user">
							<tr data-id="${user.userVO.USER_ID}">
								<td>${user.userVO.USERNAME}</td>
								<td>${user.userVO.NAME}</td>
								<td>${user.policeOfficeVO.POLICE_OFFICE_NAME}</td>
								<td><c:choose>
										<c:when test="${user.userVO.STATUS=='0'}">冻结</c:when>
										<c:when test="${user.userVO.STATUS=='1'}">正常</c:when>
									</c:choose></td>
								<td>${user.roleVo.ROLE_NAME}</td>
								<td>
									<div class="btn-group">
										<button class="btn btn-xs btn-info" name="edit"
											data-id="${user.userVO.USER_ID}">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-danger" name="delete"
											data-id="${user.userVO.USER_ID}">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="btn-group">
					<input type="button" class="btn btn-sm btn-success" value="新建"
						id="new" />
				</div>
				${page.getPageStr()}
			</div>
		</div>
	</div>
	<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
	<script type="text/javascript"
		src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script type="text/javascript"
		src="static/js/private_js/business/systemSet/userManage/userManageList.js"></script>
</body>
</html>