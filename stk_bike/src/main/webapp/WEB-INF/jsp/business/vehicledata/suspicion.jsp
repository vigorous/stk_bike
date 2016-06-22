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
		<%@ include file="/WEB-INF/jsp/system/admin/top.jsp"%>
		<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
<title>嫌疑车辆分析</title>
</head>
<body>
<div class="page-content">
<div class="row">
	<div class="col-xs-12" style="padding: 15px">
		<table style="border: 0;">
			<tr>
				<td><h2>轨迹点位：</h2></td>
				<td>
					<select class="form-control chosen-select" data-placeholder="经办人">
						<option value="">请选择机具</option>
						<option value="66">66</option>
						<option value="77">77</option>
					</select>
				</td>
				<td style="padding-left:20px;">
					<div class="input-group margin-right-30">
						<input class="form-control date-picker text-center width-120" type="text" data-date-format="yyyy-mm-dd" placeholder="开始日期" />
						<span class="input-group-addon border-left-0">
							<i class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
				</td>
				<td style="padding-left:20px;">
					<div class="input-group">
						<input class="form-control date-picker text-center width-120" type="text" data-date-format="yyyy-mm-dd" placeholder="结束日期" />
						<span class="input-group-addon">
							<i class="fa fa-calendar bigger-110"></i>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">增加</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">查询</button>
				</td>
			</tr>
		</table>
	</div>
</div>
	<div class="col-xs-12" style="padding: 15px">
		<table id="simple-table"
			class="table table-striped table-bordered table-hover" style="display: none;">
			<thead>
				<tr>
					<th>品牌序号</th>
					<th class="hidden-480">品牌名称</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href="#">1</a></td>

					<td class="hidden-480"><span>红茶</span></td>

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
			</tbody>
		</table>
	</div>

	<!-- 尾部页数 -->
	<div class="col-xs-12">
		<table style="width: 100%;">
			<tbody>
				<tr>
					<td><div class="pagination"
							style="float: right; padding-top: 0px; margin-top: 0px;">
							<li><a>共<font color="red">7</font>条
							</a></li>
							<!-- <li><select title="显示条数" style="width: 55px; float: left;">
									<option value="1">1页</option>
									<option value="2">2页</option>
									<option value="3">3页</option>
									<option value="4">4页</option>
									<option value="5">5页</option>
									<option value="6">6页</option>
									<option value="7">7页</option>
							</select></li> -->
							<li><a>首页</a></li>
							<li><a>上页</a></li>
							<li><a><font color="#808080">1</font></a></li>
							<li><a>下页</a></li>
							<li><a>尾页</a></li>
							<li><a>第1页</a></li>
							<li><a>共1页</a></li>
						</div></td>

				</tr>
			</tbody>
		</table>
	</div>
	</div>
	<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script type="text/javascript">
			$('.form-control.date-picker').datepicker({language: 'zh-CN'});
		</script>
</body>
</html>