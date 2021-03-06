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
		<style type="text/css">
			.margin-bottom-5{margin-bottom: 5px;}
			.width-120{width: 120px!important;}
			.margin-right-30{margin-right: 30px;}
			.padding-bottom-0{padding-bottom: 0px!important;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content padding-bottom-0">
			<div class="row">
				<div class="col-xs-12">
					<table class="table table-striped table-bordered table-hover text-center margin-bottom-5" id="unitManageListTable">
						<thead>
							<tr>
								<th class="text-center" width="14.28%">单位编码</th>
								<th class="text-center" width="14.28%">单位名称</th>
								<th class="text-center" width="14.28%">上层机构编码</th>
								<th class="text-center" width="14.28%">负责人</th>
								<th class="text-center" width="14.28%">地址</th>
								<th class="text-center" width="14.28%">联系电话</th>
								<th class="text-center" width="14.28%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="7">暂无数据</td>
								</tr>
							</c:if>
							<c:forEach items="${list}" var="policeOffice">
								<tr data-id="${policeOffice.policeOfficeVO.POLICE_OFFICE_ID}">
									<td>${policeOffice.policeOfficeVO.POLICE_OFFICE_NO}</td>
									<td>${policeOffice.policeOfficeVO.POLICE_OFFICE_NAME}</td>
									<td>${policeOffice.policeOfficeVO.PARENT_NO}</td>
									<td>${policeOffice.policeVO.POLICE_NAME}</td>
									<td>${policeOffice.policeOfficeVO.ADDRESS}</td>
									<td>${policeOffice.policeOfficeVO.PHONE}</td>
									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<button class="btn btn-xs btn-info" name="edit" data-id="${policeOffice.policeOfficeVO.POLICE_OFFICE_ID}">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</button>
											<button class="btn btn-xs btn-danger" name="delete" data-id="${policeOffice.policeOfficeVO.POLICE_OFFICE_ID}">
												<i class="ace-icon fa fa-trash-o bigger-120"></i>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="btn-group">
						<input type="button" class="btn btn-sm btn-success" value="新建" id="new" />
					</div>
					${page.pageStr}
				</div>
			</div>
		</div>
		<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
		<script type="text/javascript" src="static/js/private_js/business/systemSet/unitManage/unitManageList.js"></script>
	</body>
</html>