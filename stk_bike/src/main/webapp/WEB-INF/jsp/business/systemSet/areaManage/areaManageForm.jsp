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
			.btn-mini{padding: 4px 12px!important;line-height: 20px!important;border: 1px solid #ddd!important;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content padding-bottom-0">
			<form id="areaForm">
				<input type="hidden" name="DISTRICT_ID" value="${districtVO.DISTRICT_ID}" />
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span class="color-red">*</span><span>区域编号</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="${districtVO.DISTRICT_NO}" name="DISTRICT_NO" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span class="color-red">*</span><span>区域名称</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="${districtVO.DISTRICT_NAME}" name="DISTRICT_NAME" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span class="color-red">*</span><span>区县级别</span>
					</div>
					<div class="col-xs-7 text-left">
						<select class="form-control chosen-select" data-placeholder="区县级别" name="DISTRICT_LEVEL">
							<option value=""></option>
							<option value="1" <c:if test="${districtVO.DISTRICT_LEVEL == 1}">selected="selected"</c:if>>一级</option>
							<option value="2" <c:if test="${districtVO.DISTRICT_LEVEL == 2}">selected="selected"</c:if>>二级</option>
						</select>
					</div>
				</div>
				<div class="row margin-bottom-10 <c:if test="${districtVO.DISTRICT_LEVEL != 2}">hide</c:if>" id="parentDistrict">
					<div class="col-xs-5 text-right padding-top-1">
						<span class="color-red">*</span><span>上级区县</span>
					</div>
					<div class="col-xs-7 text-left">
						<select class="form-control chosen-select" data-placeholder="上级区县" name="PARENT_NO">
							<option value=""></option>
							<c:forEach items="${districtList}" var="district">
								<c:if test="${district.DISTRICT_LEVEL == 1}">
									<option value="${district.DISTRICT_NO}"  <c:if test="${districtVO.PARENT_NO == district.DISTRICT_NO}">selected="selected"</c:if>>${district.DISTRICT_NAME}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-5 text-right">
					</div>
					<div class="col-xs-7 text-left">
						<div class="btn-group">
							<input type="button" class="btn btn-mini btn-success" value="保存" id="save" />
							<input type="button" class="btn btn-mini btn-success" value="取消" id="cancel" />
						</div>
					</div>
				</div>
			</form>
			<input type="hidden" value="${oper}" id="oper" />
		</div>
		<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
		<script type="text/javascript">
			$('.chosen-select').chosen({width:"160px"});
		</script>
		<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/js/private_js/business/systemSet/areaManage/areaManageForm.js"></script>
	</body>
</html>