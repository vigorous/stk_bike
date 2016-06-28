<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="<%=basePath%>">
	<!-- page specific plugin styles -->
	<link rel="stylesheet" href="static/assets/css/jquery-ui.custom.css" />
	<link rel="stylesheet" href="static/assets/css/chosen.css" />
	<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
	<link rel="stylesheet" href="static/assets/css/bootstrap-datetimepicker.css" />
	
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%>	
		
	<title>终端采集查询页面</title>
</head>
<body>
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<table style="border:0">
					<tr>
						<td  class="col-padding-right">
							<select class="chosen-select form-control" id="form-field-select-3" data-placeholder="查询类型...">
								<option value="">  </option>
								<option value="场所编号查询">场所编号查询</option>
								<option value="采集设备编号">采集设备编号</option>
								<option value="采集设备地址">采集设备地址</option>
							</select>
						</td>
						
						<td  class="col-padding-right">
							<span class="input-icon">
								<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="这里输入关键词" />
								<i id="nav-search-icon" class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</td>
						
						<td  class="col-padding-right">
							<input class="form-control date-picker" id="id-date-picker-1" type="text" placeholder="开始日期" />
						</td>
						
						<td  class="col-padding-right">
							<input class="form-control date-picker" id="id-date-picker-2" type="text" placeholder="结束日期" />
						</td>
						
						<td  class="col-padding-right">
							<button class="btn btn-sm btn-info" onclick="search();"  title="查询"><i id="nav-search-icon" class="fa fa-search"></i></button>
						</td>
					</tr>
				</table>
				<%-- <form class="form-horizontal" role="form">
					<div class="form-group">
						<div class="col-sm-2">
							<select class="chosen-select form-control" id="form-field-select-3" data-placeholder="查询类型...">
								<option value="">  </option>
								<option value="场所编号查询">场所编号查询</option>
								<option value="采集设备编号">采集设备编号</option>
								<option value="采集设备地址">采集设备地址</option>
							</select>
						</div>
						
						<div class="col-sm-2">
							<span class="input-icon">
								<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="这里输入关键词" />
								<i id="nav-search-icon" class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</div>
						
						<div class="col-sm-2">
							<input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy" placeholder="开始日期" />
						</div>
						
						<div class="col-sm-2">
							<input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy" placeholder="结束日期" />
						</div>
						
						<div class="col-sm-2">
							<button class="btn btn-sm btn-info" onclick="search();"  title="查询"><i id="nav-search-icon" class="fa fa-search"></i></button>
						</div>
					</div>
				</form> --%>
			</div>
		</div>
		
		<div class="row row-margin-top">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<div class="row">
					<div class="col-xs-12">
						<table id="simple-table" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>智能终端MAC地址</th>
									<th>位置</th>
									<th class="hidden-480">
										<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
										进入时间
									</th>

									<th>
										<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
										离开时间
									</th>
									<th class="hidden-480">已连接的APMAC</th>

									<th>已连接的AP名称</th>
									
									<th>采集次数</th>
								</tr>
							</thead>

							<tbody>
								<tr>

									<td>
										<a href="#">ace.com</a>
									</td>
									<td>$45</td>
									<td class="hidden-480">3,330</td>
									<td>Feb 12</td>

									<td class="hidden-480">
										<span class="label label-sm label-warning">Expiring</span>
									</td>

									<td>
										<div class="hidden-sm hidden-xs btn-group" >
											<button class="btn btn-xs btn-success" onclick="Alert();">
												<i class="ace-icon fa fa-check bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-info" onclick="openDialog();">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-danger" onclick="deleteMsg();">
												<i class="ace-icon fa fa-trash-o bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-warning">
												<i class="ace-icon fa fa-flag bigger-120"></i>
											</button>
										</div>

										<div class="hidden-md hidden-lg">
											<div class="inline pos-rel">
												<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
													<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
												</button>

												<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
													<li>
														<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
															<span class="blue">
																<i class="ace-icon fa fa-search-plus bigger-120"></i>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
															<span class="green">
																<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
															<span class="red">
																<i class="ace-icon fa fa-trash-o bigger-120"></i>
															</span>
														</a>
													</li>
												</ul>
											</div>
										</div>
									</td>
									
									<td class="hidden-480">
										5
									</td>
								</tr>

								<tr>

									<td>
										<a href="#">base.com</a>
									</td>
									<td>$35</td>
									<td class="hidden-480">2,595</td>
									<td>Feb 18</td>

									<td class="hidden-480">
										<span class="label label-sm label-success">Registered</span>
									</td>

									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<button class="btn btn-xs btn-success">
												<i class="ace-icon fa fa-check bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-info">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-danger">
												<i class="ace-icon fa fa-trash-o bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-warning">
												<i class="ace-icon fa fa-flag bigger-120"></i>
											</button>
										</div>

										<div class="hidden-md hidden-lg">
											<div class="inline pos-rel">
												<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
													<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
												</button>

												<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
													<li>
														<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
															<span class="blue">
																<i class="ace-icon fa fa-search-plus bigger-120"></i>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
															<span class="green">
																<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
															<span class="red">
																<i class="ace-icon fa fa-trash-o bigger-120"></i>
															</span>
														</a>
													</li>
												</ul>
											</div>
										</div>
									</td>
									
									<td class="hidden-480">
										5
									</td>
								</tr>

								<tr>

									<td>
										<a href="#">max.com</a>
									</td>
									<td>$60</td>
									<td class="hidden-480">4,400</td>
									<td>Mar 11</td>

									<td class="hidden-480">
										<span class="label label-sm label-warning">Expiring</span>
									</td>

									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<button class="btn btn-xs btn-success">
												<i class="ace-icon fa fa-check bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-info">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-danger">
												<i class="ace-icon fa fa-trash-o bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-warning">
												<i class="ace-icon fa fa-flag bigger-120"></i>
											</button>
										</div>

										<div class="hidden-md hidden-lg">
											<div class="inline pos-rel">
												<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
													<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
												</button>

												<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
													<li>
														<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
															<span class="blue">
																<i class="ace-icon fa fa-search-plus bigger-120"></i>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
															<span class="green">
																<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
															<span class="red">
																<i class="ace-icon fa fa-trash-o bigger-120"></i>
															</span>
														</a>
													</li>
												</ul>
											</div>
										</div>
									</td>
									
									<td class="hidden-480">
										5
									</td>
								</tr>

								<tr>

									<td>
										<a href="#">best.com</a>
									</td>
									<td>$75</td>
									<td class="hidden-480">6,500</td>
									<td>Apr 03</td>

									<td class="hidden-480">
										<span class="label label-sm label-inverse arrowed-in">Flagged</span>
									</td>

									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<button class="btn btn-xs btn-success">
												<i class="ace-icon fa fa-check bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-info">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-danger">
												<i class="ace-icon fa fa-trash-o bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-warning">
												<i class="ace-icon fa fa-flag bigger-120"></i>
											</button>
										</div>

										<div class="hidden-md hidden-lg">
											<div class="inline pos-rel">
												<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
													<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
												</button>

												<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
													<li>
														<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
															<span class="blue">
																<i class="ace-icon fa fa-search-plus bigger-120"></i>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
															<span class="green">
																<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
															<span class="red">
																<i class="ace-icon fa fa-trash-o bigger-120"></i>
															</span>
														</a>
													</li>
												</ul>
											</div>
										</div>
									</td>
									
									<td class="hidden-480">
										5
									</td>
								</tr>

								<tr>

									<td>
										<a href="#">pro.com</a>
									</td>
									<td>$55</td>
									<td class="hidden-480">4,250</td>
									<td>Jan 21</td>

									<td class="hidden-480">
										<span class="label label-sm label-success">Registered</span>
									</td>

									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<button class="btn btn-xs btn-success">
												<i class="ace-icon fa fa-check bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-info">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-danger">
												<i class="ace-icon fa fa-trash-o bigger-120"></i>
											</button>

											<button class="btn btn-xs btn-warning">
												<i class="ace-icon fa fa-flag bigger-120"></i>
											</button>
										</div>

										<div class="hidden-md hidden-lg">
											<div class="inline pos-rel">
												<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
													<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
												</button>

												<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
													<li>
														<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
															<span class="blue">
																<i class="ace-icon fa fa-search-plus bigger-120"></i>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
															<span class="green">
																<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
															</span>
														</a>
													</li>

													<li>
														<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
															<span class="red">
																<i class="ace-icon fa fa-trash-o bigger-120"></i>
															</span>
														</a>
													</li>
												</ul>
											</div>
										</div>
									</td>
									
									<td class="hidden-480">
										5
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- /.span -->
				</div>
			</div>
		</div>
		
		<!-- 页码功能模块 -->
		<div class="page-header position-relative">
			<table style="width:100%;">
				<tr>
					<td style="vertical-align:top;">
						<a class="btn btn-mini btn-success" onclick="add();">新增</a>
						<a title="编辑信息" class="btn btn-mini btn-info" onclick="makeAll('确定要给选中的用户发送邮件吗?');"><i class="ace-icon fa fa-pencil bigger-120"></i></a>
						<a title="标记" class="btn btn-mini btn-warning" onclick="makeAll('确定要给选中的用户发送短信吗?');"><i class="ace-icon fa fa-flag bigger-120"></i></a>
						<a title="删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');"><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
					</td>
					<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- basic scripts -->
		<%@ include file="../admin/bottom.jsp"%>

		<script type="text/javascript">
			//datepicker plugin
			//link
			$('.date-picker').datepicker({
				language: 'zh-CN',
				format: "yyyy-mm-dd",
				autoclose: true,
				todayHighlight: true
			})
			//show datepicker when clicking on the icon
			.next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
		
			
			jQuery(function($){
				$('#id-disable-check').on('click', function() {
					var inp = $('#form-input-readonly').get(0);
					if(inp.hasAttribute('disabled')) {
						inp.setAttribute('readonly' , 'true');
						inp.removeAttribute('disabled');
						inp.value="This text field is readonly!";
					}
					else {
						inp.setAttribute('disabled' , 'disabled');
						inp.removeAttribute('readonly');
						inp.value="This text field is disabled!";
					}
				});
			
			
				if(!ace.vars['touch']) {
					$('.chosen-select').chosen({allow_single_deselect:true}); 
					//resize the chosen on window resize
			
					$(window)
					.off('resize.chosen')
					.on('resize.chosen', function() {
						$('.chosen-select').each(function() {
							 var $this = $(this);
							 $this.next().css({'width': $this.parent().width()});
						})
					}).trigger('resize.chosen');
					//resize chosen on sidebar collapse/expand
					$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
						if(event_name != 'sidebar_collapsed') return;
						$('.chosen-select').each(function() {
							 var $this = $(this);
							 $this.next().css({'width': $this.parent().width()});
						})
					});
			
			
					$('#chosen-multiple-style .btn').on('click', function(e){
						var target = $(this).find('input[type=radio]');
						var which = parseInt(target.val());
						if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
						 else $('#form-field-select-4').removeClass('tag-input-style');
					});
				}
			})
		</script>
		
		<script>
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
		
		<!-- placeholder兼容性问题 -->
		<script type="text/javascript">  
		  if( !('placeholder' in document.createElement('input')) ){  
		   
		    $('input[placeholder],textarea[placeholder]').each(function(){   
		      var that = $(this),   
		      text= that.attr('placeholder');   
		      if(that.val()===""){   
		        that.val(text).addClass('placeholder');   
		      }   
		      that.focus(function(){   
		        if(that.val()===text){   
		          that.val("").removeClass('placeholder');   
		        }   
		      })   
		      .blur(function(){   
		        if(that.val()===""){   
		          that.val(text).addClass('placeholder');   
		        }   
		      })   
		      .closest('form').submit(function(){   
		        if(that.val() === text){   
		          that.val('');   
		        }   
		      });   
		    });   
		  }  
		</script>
</body>
</html>