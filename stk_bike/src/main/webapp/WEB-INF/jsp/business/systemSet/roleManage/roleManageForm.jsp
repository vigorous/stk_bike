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
		<link rel="stylesheet" href="plugins/zTree/css/zTreeStyle/zTreeStyle.css" />
		<style type="text/css">
			.margin-bottom-10{margin-bottom: 10px;}
			.padding-top-1{padding-top: 1%;}
			.width-160{width: 160px;}
			.padding-bottom-0{padding-bottom: 0px!important;}
			.color-red{color: red;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content padding-bottom-0">
			<form id="roleForm">
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>角色ID</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="${oper == 'add' ? role_Id : roleVO.ROLE_ID}" readonly="readonly" name="roleVO.ROLE_ID" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span class="color-red">*</span><span>角色名称</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="${roleVO.ROLE_NAME}" name="roleVO.ROLE_NAME" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>角色权限</span>
					</div>
					<div class="col-xs-7">
						<div id="menuTree" class="ztree"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="col-xs-offset-4 col-xs-3">
							<input type="button" class="btn btn-sm btn-success" value="保存" id="save" />
						</div>
						<div class="col-xs-3">
							<input type="button" class="btn btn-sm btn-success" value="取消" id="cancel" />
						</div>
					</div>
				</div>
			</form>
			<input type="hidden" value="${oper}" id="oper" />
		</div>
		<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="plugins/zTree/js/jquery.ztree.core.min.js"></script>
		<script type="text/javascript" src="plugins/zTree/js/jquery.ztree.excheck.min.js"></script>
		<script type="text/javascript" src="static/js/private_js/business/systemSet/roleManage/roleManageForm.js"></script>
	</body>
</html>