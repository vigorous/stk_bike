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
					<table class="table table-striped table-bordered table-hover text-center margin-bottom-5" id="roleManageListTable">
						<thead>
							<tr>
								<th class="text-center" width="10%">
									<label class="pos-rel">
										<input type="checkbox" class="ace" id="selectAll" />
										<span class="lbl"></span>
									</label>
								</th>
								<th class="text-center" width="37.5%">角色ID</th>
								<th class="text-center" width="37.5%">角色名称</th>
								<th class="text-center" width="15%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="4">暂无数据</td>
								</tr>
							</c:if>
							<c:forEach items="${list}" var="role">
								<tr>
									<td>
										<label class="pos-rel">
											<input type="checkbox"class="ace" name="select" data-id="" />
											<span class="lbl"></span>
										</label>
									</td>
									<td>${role.roleVO.ROLE_ID}</td>
									<td>${role.roleVO.ROLE_NAME}</td>
									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<button class="btn btn-xs btn-info">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</button>
											<button class="btn btn-xs btn-danger">
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
					${page.getPageStr()}
				</div>
			</div>
		</div>
		<script type="text/javascript" src="static/js/private_js/business/systemSet/roleManage/roleManageList.js"></script>
	</body>
</html>