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
			.color-red{color: red;}
			.btn-mini{padding: 4px 12px!important;line-height: 20px!important;border: 1px solid #ddd!important;}
		</style>
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
	</head>
	<body class="no-skin">
		<div class="page-content padding-bottom-0">
			<form id="noticeForm">
				<input type="hidden" value="" />
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>公告标题</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="" name="TITLE" />
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>公告内容</span>
					</div>
					<div class="col-xs-7">
						<textarea class="width-160" name="CONTET"></textarea>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-xs-5 text-right padding-top-1">
						<span>发布人</span>
					</div>
					<div class="col-xs-7">
						<input type="text" class="width-160" value="${userVO.NAME}" />
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
		<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/js/private_js/business/systemSet/noticeManage/noticeManageForm.js"></script>
	</body>
</html>