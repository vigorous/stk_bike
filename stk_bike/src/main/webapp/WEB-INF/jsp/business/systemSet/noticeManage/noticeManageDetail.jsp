<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<span>公告标题</span>
				</div>
				<div class="col-xs-7 padding-top-1">
					<span>${noticeInfoVO.noticeVO.TITLE}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>公告内容</span>
				</div>
				<div class="col-xs-7 padding-top-1">
					<span>${noticeInfoVO.noticeVO.CONTET}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					<span>发布人</span>
				</div>
				<div class="col-xs-7 padding-top-1">
					<span>${noticeInfoVO.userVO.NAME}</span>
				</div>
			</div>
			<div class="row margin-bottom-10">
				<div class="col-xs-5 text-right padding-top-1">
					发布时间
				</div>
				<div class="col-xs-7 text-left padding-top-1">
					<span><fmt:formatDate value="${noticeInfoVO.noticeVO.CREATE_TIME}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-5 text-right padding-top-1">
					上次修改时间
				</div>
				<div class="col-xs-7 text-left padding-top-1">
					<span>${noticeInfoVO.noticeVO.UPDATE_TIME}</span>
				</div>
			</div>
		</div>
	</body>
</html>