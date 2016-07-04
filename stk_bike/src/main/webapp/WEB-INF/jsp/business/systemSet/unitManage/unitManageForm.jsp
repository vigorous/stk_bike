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
		<link rel="stylesheet" href="static/assets/css/chosen.css" />
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
			<form id="unitForm">
				<input type="hidden" value="${policeOfficeVO.POLICE_OFFICE_ID}" name="POLICE_OFFICE_ID" />
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span class="color-red">*</span><span>单位编码</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" name="POLICE_OFFICE_NO" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span class="color-red">*</span><span>单位名称</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" name="POLICE_OFFICE_NAME" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>上层机构</span>
					</div>
					<div class="col-xs-7">
						<select class="form-control chosen-select" data-placeholder="上层机构" name="PARENT_NO">
							<option value=""></option>
							<c:forEach items="${policeOfficeList}" var="policeOffice">
								<option value="${policeOffice.POLICE_OFFICE_NO}">${policeOffice.POLICE_OFFICE_NAME}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span class="color-red">*</span><span>负责人</span>
					</div>
					<div class="col-xs-7">
						<select class="form-control chosen-select" data-placeholder="负责人" name="MANAGER_ID">
							<option value=""></option>
							<option value="89504b2cf2c54a01a93c998f62298984">王磊</option>
						</select>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span class="color-red">*</span><span>地址</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" name="ADDRESS" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span class="color-red">*</span><span>联系电话</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" name="PHONE" />
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
		</div>
		<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
		<script type="text/javascript">
			$('.chosen-select').chosen({width:"160px"});
		</script>
	</body>
</html>