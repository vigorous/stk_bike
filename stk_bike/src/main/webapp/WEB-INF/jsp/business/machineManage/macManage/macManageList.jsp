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
	
	<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
	
	<%@ include file="../../../system/admin/top.jsp"%>
	<title>MAC设备管理</title>
</head>
<body>
<div class="page-content">
	<!-- 主体查询条件部分 -->
	<div class="row">
		<div class="col-xs-12">
			<table style="border:0">
				<tr>
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">重启</button>
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">删除</button>
					</td>
					
					<td  class="col-xs-5 no-padding-left col-padding-right">
						<input  type="file" id="id-input-file-2" />
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">上传</button>
					</td>
					
					<td  class="col-padding-right">
						<button class="btn btn-sm btn-info">MAC设备日志</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="row row-margin-top">
		<div class="col-xs-12">
			<table style="border:0">
				<tr>
					<td class="col-padding-right">
						<input type="text" value="${bikeEid }" id="" placeholder="设备ID" />
					</td>
					
					<td class="col-padding-right">
						<input type="text" value="${bikeNo }" id="" placeholder="设备Mac" />
					</td>
					
					<td class="col-padding-right">
						<input type="text" value="${bikeType }" id="" placeholder="场所编号" />
					</td>
					
					<td class="col-padding-right">
						<input type="text" value="${bikeName }" id="" placeholder="设备地址" />
					</td>
					
					<td class="col-padding-right">
						<select class="form-control">
							<option value="查看所有派出所">查看所有派出所</option>
							<option value="22">222</option>
							<option value="33">333</option>
						</select>
					</td>
					
					<td class="col-padding-right">
						<select class="form-control">
							<option value="在线状态">在线状态</option>
							<option value="online">在线</option>
							<option value="outline">离线</option>
						</select>
					</td>
					
					<td class="col-padding-right">
						<button id="selectBike" class="btn btn-sm btn-info">查询</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="row row-margin-top">
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
	</div>
</div>
	<script type="text/javascript" src="static/js/private_js/business/machineManage/macManage/macManageList.js"></script>
	
	<%@ include file="../../../system/admin/bottom.jsp"%>
	<script>
		$('.form-control.date-picker').datepicker({language: 'zh-CN'});
	
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
		
		//And for the first simple table, which doesn't have TableTools or dataTables
		//select/deselect all rows according to table header checkbox
		var active_class = 'active';
		$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
			var th_checked = this.checked;//checkbox inside "TH" table header

			$(this).closest('table').find('tbody > tr').each(function(){
				var row = this;
				if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
				else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
			});
		});

		//select/deselect a row when the checkbox is checked/unchecked
		$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
			var $row = $(this).closest('tr');
			if(this.checked) $row.addClass(active_class);
			else $row.removeClass(active_class);
		});

		/********************************/
		//add tooltip for small view action buttons in dropdown menu
		$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

		//tooltip placement on right or left
		function tooltip_placement(context, source) {
			var $source = $(source);
			var $parent = $source.closest('table');
			var off1 = $parent.offset();
			var w1 = $parent.width();

			var off2 = $source.offset();
			//var w2 = $source.width();

			if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
			return 'left';
		}
	</script>
</body>
</html>