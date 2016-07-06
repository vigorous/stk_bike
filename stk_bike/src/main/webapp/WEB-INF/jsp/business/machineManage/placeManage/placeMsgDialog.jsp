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
<link rel="stylesheet" href="static/assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="static/css/private_css/bikeMsg.css" />

<%@ include file="../../../system/admin/top.jsp"%>
<title>场所详细信息弹窗</title>
</head>
<body class="no-skin">
	<input type="hidden" value="<%=basePath%>" id="ctxPath">
	<div class="dialog-content">
		<form action="placeManage/userManageForm" id="placeForm" >
			<input type="hidden" name="PLACE_ID" value="${placeVO.PLACE_ID}" />
			<div class="dialog-header">
				<h1>场所详细信息：</h1>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">上网服务场所编码<span
						class="word-danger">*</span>：
					</label> <input type="text" name="PLACE_NO" value="${placeVO.PLACE_NO}" />
				</div>

				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">上网服务场所名称<span
						class="word-danger">*</span>：
					</label> <input type="text" name="PLACE_NAME" value="${placeVO.PLACE_NAME}" />
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所详细地址<span
						class="word-danger">*</span>：
					</label> <input type="text" name="ADDRESS" value="${placeVO.ADDRESS}" />
				</div>

				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所经度：
					</label> <input type="text" name="LONGITUDE" value="${placeVO.LONGITUDE}" />
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所纬度：
					</label> <input type="text" name="LATITUDE" value="${placeVO.LATITUDE}" />
				</div>

				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所服务类型<span
						class="word-danger">*</span>：
					</label>
					<div class="col-xs-6  no-padding-left ">
						<select class="form-control chosen-select"
							data-placeholder="场所服务类型" name="STATUS">
							<option value="1"
								<c:if test="${placeVO.TYPE==1}">selected="selected"</c:if>>旅店宾馆类</option>
							<option value="2"
								<c:if test="${placeVO.TYPE==2}">selected="selected"</c:if>>图书馆阅览室</option>
							<option value="3"
								<c:if test="${placeVO.TYPE==3}">selected="selected"</c:if>>电脑培训中心类</option>
							<option value="4"
								<c:if test="${placeVO.TYPE==4}">selected="selected"</c:if>>娱乐场所类</option>
							<option value="5"
								<c:if test="${placeVO.TYPE==5}">selected="selected"</c:if>>交通枢纽</option>
							<option value="6"
								<c:if test="${placeVO.TYPE==6}">selected="selected"</c:if>>公共交通工具</option>
							<option value="7"
								<c:if test="${placeVO.TYPE==7}">selected="selected"</c:if>>餐饮服务场所</option>
							<option value="8"
								<c:if test="${placeVO.TYPE==8}">selected="selected"</c:if>>金融服务场所</option>
							<option value="A"
								<c:if test="${placeVO.TYPE==A}">selected="selected"</c:if>>购物场所</option>
							<option value="B"
								<c:if test="${placeVO.TYPE==B}">selected="selected"</c:if>>公共服务场所</option>
							<option value="C"
								<c:if test="${placeVO.TYPE==C}">selected="selected"</c:if>>文化服务场所</option>
							<option value="D"
								<c:if test="${placeVO.TYPE==D}">selected="selected"</c:if>>公共休闲场所</option>
							<option value="9"
								<c:if test="${placeVO.TYPE==9}">selected="selected"</c:if>>其他</option>
						</select>
					</div>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所经营性质<span
						class="word-danger">*</span>：
					</label>
					<div class="col-xs-6  no-padding-left ">
						<select class="form-control chosen-select"
							data-placeholder="场所经营性质" name="PROPERTY">
							<option value="0"
								<c:if test="${placeVO.PROPERTY==0}">selected="selected"</c:if>>经营</option>
							<option value="1"
								<c:if test="${placeVO.PROPERTY==1}">selected="selected"</c:if>>非经营</option>
							<option value="3"
								<c:if test="${placeVO.PROPERTY==3}">selected="selected"</c:if>>其他</option>
						</select>
					</div>

				</div>

				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">场所经营法人：
					</label> <input type="text" name="LEGAL_PERSON" value="${placeVO.LEGAL_PERSON}" />
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">法人有效证件类型：
					</label>
					<div class="col-xs-6  no-padding-left ">
						<select class="form-control chosen-select"
							data-placeholder="法人有效证件类型" name="CERT_TYPE">
							<option value="00"
								<c:if test="${placeVO.CERT_TYPE==00}">selected="selected"</c:if>>身份证</option>
							<option value="01"
								<c:if test="${placeVO.CERT_TYPE==01}">selected="selected"</c:if>>户口本</option>
							<option value="02"
								<c:if test="${placeVO.CERT_TYPE==02}">selected="selected"</c:if>>居住证</option>
							<option value="03"
								<c:if test="${placeVO.CERT_TYPE==03}">selected="selected"</c:if>>签证</option>
							<option value="04"
								<c:if test="${placeVO.CERT_TYPE==04}">selected="selected"</c:if>>护照</option>
							<option value="05"
								<c:if test="${placeVO.CERT_TYPE==05}">selected="selected"</c:if>>军人证</option>
							<option value="06"
								<c:if test="${placeVO.CERT_TYPE==06}">selected="selected"</c:if>>港澳通行证</option>
							<option value="99"
								<c:if test="${placeVO.CERT_TYPE==99}">selected="selected"</c:if>>其他</option>

						</select>
					</div>
				</div>

				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">法人有效证件号码：
					</label> <input type="text" name="CERT_NO" value="${placeVO.CERT_NO}" />
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">联系方式：
					</label> <input type="text" name="TEL" value="${placeVO.TEL}" />
				</div>

				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">营业开始时间：
					</label> <input class="time-picker" type="text" name="BEGIN_TIME" value="${placeVO.BEGIN_TIME}" />
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">营业结束时间：
					</label> <input class="time-picker" type="text" name="END_TIME" value="${placeVO.END_TIME}" />
				</div>

				<div class="col-xs-6">
					<label class="col-xs-5 no-padding-right dialog-text text-rt" for="">厂商组织机构代码<span
						class="word-danger">*</span>：
					</label> <input type="text" name="ORG_CODE" value="${placeVO.ORG_CODE}" />
				</div>
			</div>

			<div class="dialog-header row-margin-top">
				<h1>场所设备列表：</h1>
			</div>
			<div class="row row-margin-top">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12">
							<table id="simple-table"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>设备编码</th>
										<th>设备IP</th>
										<th>设备状态</th>
									</tr>
								</thead>

								<tbody>
									<c:if test="${empty macList}">
										<tr>
											<td colspan="5">暂无数据</td>
										</tr>
									</c:if>
									<c:forEach items="${macList}" var="macMachine">
										<td>${macMachine.MAC_MACHINE_NO}</td>
										<td>${macMachine.IP}</td>
										<td><c:choose>
												<c:when test="${macMachine.STATUS=='00'}">离线</c:when>
												<c:when test="${macMachine.STATUS=='01'}">在线</c:when>
											</c:choose></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="row row-margin-top">
				<div class="col-xs-offset-4 col-xs-3">
					<input onclick="save('${list.bikeVO.BIKE_ID }')"
						class="btn btn-sm btn-success" type="button" value="保存" />
				</div>
				<div class="col-xs-3">
					<input class="btn btn-sm btn-success" id="quit" type="button"
						value="退出" />
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="static/js/private_js/admin/head.js"></script>
	<%@ include file="../../../system/admin/bottom.jsp"%>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$('.time-picker').timepicker({
			minuteStep : 1,
			secondStep : 5,
			showSeconds : true,
			showMeridian : false,
			disableFocus : true
		})
	</script>
</body>
</html>