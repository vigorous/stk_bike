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
<title>MAC设备管理</title>
</head>
<body>
<div class="page-content">
<div class="row">
	<div class="col-xs-12">
		<table style="border: 0;">
			<tr>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">重启</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">删除</button>
				</td>
				<td class="col-xs-4" style="padding: 0 5px;">
					<input  type="file" id="id-input-file-2" />
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">上传</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">升级</button>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">Mac设备日志</button>
				</td>
			</tr>
		</table>
	</div>
</div>
<div class="row"  style="padding: 10px">
	<div class="col-xs-12">
		<table style="border: 0;">
			<tr>
				<td>
					<input type="text" class="width-120 margin-right-30" value="" placeholder="设备ID" />
				</td>
				<td style="padding-left:20px;">
					<input type="text" class="width-120 margin-right-30" value="" placeholder="设备Mac" />
				</td>
				<td style="padding-left:20px;">
					<input type="text" class="width-120 margin-right-30" value="" placeholder="场所编号" />
				</td>
				<td style="padding-left:20px;">
					<input type="text" class="width-120 margin-right-30" value="" placeholder="设备地址" />
				</td>
				<td style="padding-left:20px;">
					<select class="form-control chosen-select" data-placeholder="经办人">
						<option value="">查看所有</option>
						<option value="22">222</option>
						<option value="33">333</option>
					</select>
				</td>
				<td  style="padding: 0 5px">
					<select class="form-control chosen-select" data-placeholder="经办人">
						<option value="">显示所有</option>
						<option value="1">在线</option>
						<option value="2">离线</option>
					</select>
				</td>
				<td style="padding: 0 5px;">
					<button class="btn btn-sm btn-primary">查询</button>
				</td>
			</tr>
		</table>
	</div>
</div>
<div class="row" style="margin-top:10px;">
	<div class="col-xs-12">
		<table id="simple-table"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="center">
						<label class="pos-rel">
							<input type="checkbox" class="ace" />
							<span class="lbl"></span>
						</label>
					</th>
					<th>设备ID</th>
					<th>设备Mac</th>
					<th class="hidden-480">场所编号</th>
					<th class="hidden-480">设备地址</th>
					<th class="hidden-480">在线状态</th>
					<th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>设备IP</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td class="center">
						<label class="pos-rel">
							<input type="checkbox" class="ace" />
							<span class="lbl"></span>
						</label>				
					</td>
					<td><a href="#">ace.com</a></td>
					<td>$45</td>
					<td>$45</td>
					<td class="hidden-480">3,330</td>
					<td>Feb 12</td>
					<td class="hidden-480"><span
						class="label label-sm label-warning">Expiring</span></td>

					<td>
						<div class="hidden-sm hidden-xs btn-group">

							<button id="macend" class="btn btn-xs btn-info">
								<i class="ace-icon fa fa-pencil bigger-120"></i>
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
</div>	
	<script type="text/javascript" src="static/js/private_js/business/machineManage/macManage/macManageList.js"></script>
<script type="text/javascript" src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script type="text/javascript">
			$('.form-control.date-picker').datepicker({language: 'zh-CN'});
		</script>
	<%@ include file="/WEB-INF/jsp/system/admin/bottom.jsp"%>
	<script>
		$('#id-input-file-1 , #id-input-file-2').ace_file_input({
			no_file:'No File ...',
			btn_choose:'Choose',
			btn_change:'Change',
			droppable:false,
			onchange:null,
			thumbnail:false //| true | large
			//whitelist:'gif|png|jpg|jpeg'
			//blacklist:'exe|php'
			//onchange:''
			//
		});
	</script>
</body>
</html>