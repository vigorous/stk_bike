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
			.margin-bottom-10{margin-bottom: 10px;}
			.padding-top-1{padding-top: 1%;}
			.width-160{width: 160px;}
			.padding-bottom-0{padding-bottom: 0px!important;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content padding-bottom-0">
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>单位编码</span>
				</div>
				<div class="col-xs-7 padding-top-1">
					<span>${policeOfficeVO.POLICE_OFFICE_NO}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>单位名称</span>
				</div>
				<div class="col-xs-7 padding-top-1">
					<span>${policeOfficeVO.POLICE_OFFICE_NAME}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>上层机构</span>
				</div>
				<div class="col-xs-7 padding-top-1">
					<c:forEach items="${policeOfficeList}" var="policeOffice">
						<c:if test="${policeOfficeVO.PARENT_NO == policeOffice.POLICE_OFFICE_NO}">
							${policeOffice.POLICE_OFFICE_NAME}
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>负责人</span>
				</div>
				<div class="col-xs-7 padding-top-1">
					<c:forEach items="${policeList}" var="police">
						<c:if test="${policeOfficeVO.MANAGER_ID == police.POLICE_ID}">
							${police.POLICE_NAME}
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>地址</span>
				</div>
				<div class="col-xs-7 padding-top-1">
					<span>${policeOfficeVO.ADDRESS}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>联系电话</span>
				</div>
				<div class="col-xs-7 padding-top-1">
					<span>${policeOfficeVO.PHONE}</span>
				</div>
			</div>
		</div>
	</body>
</html>