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

.padding-right-30 {
	padding-right: 30px;
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
			<div class="col-xs-3">
				<form
					action="business/deviceManagement/placeManagement/placeManagementList"
					id="placeListSreachForm">
					<table>
						<tr>
							<td class="padding-right-30"><input type="text"
								class="width-120" value="" placeholder="场所编码" name="PLACE_NO" /></td>
							<td><input type="text" class="width-120" value=""
								placeholder="场所名称" name="PLACE_NAME" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-xs-5 text-left">
					<button class="btn btn-sm btn-primary" id="placeListSreachBtn">查询</button>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<table
					class="table table-striped table-bordered table-hover text-center margin-bottom-5" id="placeManageListTable">
					<thead>
						<tr>
							<th class="text-center" width="8.28%"><label class="pos-rel">
									<input type="checkbox" class="ace" id="selectAll" /> <span
									class="lbl"></span>
							</label></th>
							<th class="text-center" width="14.28%">场所编码</th>
							<th class="text-center" width="17.28%">场所名称</th>
							<th class="text-center" width="17.28%">场所详细地址</th>
							<th class="text-center" width="14.28%">场所服务类型</th>
							<th class="text-center" width="14.28%">场所经营性质</th>
							<th class="text-center" width="14.28%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty placeList}">
							<tr>
								<td colspan="5">暂无数据</td>
							</tr>
						</c:if>
						
						<c:forEach items="${placeList}" var="place">
							<tr data-id="${place.PLACE_ID}">
								<td><label class="pos-rel"> <input type="checkbox"
										class="ace" name="select" data-id="${place.PLACE_ID}" /> <span
										class="lbl"></span>
								</label></td>
								<td>${place.PLACE_NO}</td>
								<td>${place.PLACE_NAME}</td>
								<td>${place.ADDRESS}</td>
								<td><c:choose>
										<c:when test="${place.TYPE=='1'}">旅店宾馆类</c:when>
										<c:when test="${place.TYPE=='2'}">图书馆阅览室</c:when>
										<c:when test="${place.TYPE=='3'}">电脑培训中心类</c:when>
										<c:when test="${place.TYPE=='4'}">娱乐场所类</c:when>
										<c:when test="${place.TYPE=='5'}">交通枢纽</c:when>
										<c:when test="${place.TYPE=='6'}">公共交通工具</c:when>
										<c:when test="${place.TYPE=='7'}">餐饮服务场所</c:when>
										<c:when test="${place.TYPE=='8'}">金融服务场所</c:when>
										<c:when test="${place.TYPE=='9'}">其他</c:when>
										<c:when test="${place.TYPE=='A'}">购物场所</c:when>
										<c:when test="${place.TYPE=='B'}">公共服务场所</c:when>
										<c:when test="${place.TYPE=='C'}">文化服务场所</c:when>
										<c:when test="${place.TYPE=='D'}">公共休闲场所 </c:when>
									</c:choose></td>
								</td>
								<td><c:choose>
										<c:when test="${place.PROPERTY=='0'}">经营</c:when>
										<c:when test="${place.PROPERTY=='1'}">非经营</c:when>
										<c:when test="${place.PROPERTY=='3'}">其他</c:when>
									</c:choose></td>
								</td>
								<td>
									<div class="btn-group">
										<button class="btn btn-xs btn-danger" name="delete"
											data-id="${place.PLACE_ID}">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</button>
										<button class="btn btn-xs btn-info" name="edit" 
											data-id="${place.PLACE_ID}">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="btn-group">
					<input type="button" class="btn btn-sm btn-success" value="删除" id="batchDelete"/>
					<input type="button" class="btn btn-sm btn-success" value="导出" />
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
	<script type="text/javascript">
		$('.form-control.date-picker').datepicker({
			language : 'zh-CN'
		});
	</script>
	<script type="text/javascript"
		src="static/js/private_js/business/machineManage/placeManage/placeManageList.js"></script>
</body>
</html>