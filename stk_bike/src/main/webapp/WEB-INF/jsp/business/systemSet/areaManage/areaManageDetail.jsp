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
			<form action="areaManage/areaManageForm" id="areaForm">
				<input type="hidden" name="DISTRICT_ID" value="${districtVO.DISTRICT_ID}" />
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>区域编号</span>
					</div>
					<div class="col-xs-7 padding-top-1">
						<span>${districtVO.DISTRICT_NO}</span>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>区域名称</span>
					</div>
					<div class="col-xs-7 padding-top-1">
						<span>${districtVO.DISTRICT_NAME}</span>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>区县级别</span>
					</div>
					<div class="col-xs-7 text-left padding-top-1">
						<c:choose>
							<c:when test="${districtVO.DISTRICT_LEVEL == 1}">
								一级
							</c:when>
							<c:when test="${districtVO.DISTRICT_LEVEL == 2}">
								二级
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="row margin-bottom-10 <c:if test="${districtVO.DISTRICT_LEVEL != 2}">hide</c:if>" id="parentDistrict">
					<div class="col-xs-5 text-right padding-top-1">
						<span>上级区县</span>
					</div>
					<div class="col-xs-7 text-left padding-top-1">
						<c:forEach items="${districtList}" var="district">
							<c:if test="${district.DISTRICT_LEVEL == 1}">
								<c:if test="${districtVO.PARENT_NO == district.DISTRICT_NO}">
									<span>${district.DISTRICT_NAME}</span>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</form>
			<input type="hidden" value="${oper}" id="oper" />
		</div>
	</body>
</html>