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
		<link rel="stylesheet" href="static/assets/css/bootstrap-timepicker.css" />
		<link rel="stylesheet" href="static/assets/css/daterangepicker.css" />
		<link rel="stylesheet" href="static/assets/css/bootstrap-datetimepicker.css" />
		<link rel="stylesheet" href="static/assets/css/colorpicker.css" />
		
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%>
	<title>人流量统计页面</title>
</head>
<body>
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12 widget-container-col ui-sortable">
				<div class="widget-box collapsed ui-sortable-handle">
					<div class="widget-header">
						<h4 class="widget-title">查询条件</h4>
						
						<div class="widget-toolbar">
							<button class="btn btn-minier btn-info" onclick="search();"  title="查询"><i id="nav-search-icon" class="fa fa-search"></i></button>
						
							<a href="#" data-action="collapse" title="展开">
								<i class="ace-icon fa fa-chevron-up"></i>
							</a>
							
							<!-- <a href="#" data-action="close">
								<i class="ace-icon fa fa-times"></i>
							</a> -->
						</div>
					</div>

					<div class="widget-body">
						<div class="widget-main">
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="电子牌照" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="备案号牌" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车辆类型" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车身颜色" />
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车辆型号" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车辆品牌" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车辆电机号" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车架号" />
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车主姓名" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车主身份证号" />
									</div>
									<div class="col-xs-3">
										<input autocomplete="off" class="col-xs-12" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="车主电话" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div><!-- /.span -->
			
			
			<div class="col-xs-12">
				<table id="simple-table" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>位置</th>
							<th class="hidden-480">
								<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
								开始时间
							</th>

							<th>
								<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
								结束时间
							</th>

							<th>设备MAC数</th>
							
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

						</tr>

						<tr>

							<td>
								<a href="#">base.com</a>
							</td>
							<td>$35</td>
							<td class="hidden-480">2,595</td>
							<td>Feb 18</td>

						</tr>

						<tr>

							<td>
								<a href="#">max.com</a>
							</td>
							<td>$60</td>
							<td class="hidden-480">4,400</td>
							<td>Mar 11</td>

						</tr>

						<tr>

							<td>
								<a href="#">best.com</a>
							</td>
							<td>$75</td>
							<td class="hidden-480">6,500</td>
							<td>Apr 03</td>

						</tr>

						<tr>

							<td>
								<a href="#">pro.com</a>
							</td>
							<td>$55</td>
							<td class="hidden-480">4,250</td>
							<td>Jan 21</td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 页码功能模块 -->
		<div class="page-header position-relative">
			<table style="width:100%;">
				<tr>
					<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='static/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='static/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='static/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="static/assets/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->
		<script src="static/assets/js/jquery-ui.custom.js"></script>
		<script src="static/assets/js/jquery.ui.touch-punch.js"></script>
		<script src="static/assets/js/chosen.jquery.js"></script>
		<script src="static/assets/js/fuelux/fuelux.spinner.js"></script>
		<script src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script src="static/assets/js/date-time/bootstrap-timepicker.js"></script>
		<script src="static/assets/js/date-time/moment.js"></script>
		<script src="static/assets/js/date-time/daterangepicker.js"></script>
		<script src="static/assets/js/date-time/bootstrap-datetimepicker.js"></script>
		<script src="static/assets/js/bootstrap-colorpicker.js"></script>
		<script src="static/assets/js/jquery.knob.js"></script>
		<script src="static/assets/js/autosize.js"></script>
		<script src="static/assets/js/jquery.inputlimiter.1.3.1.js"></script>
		<script src="static/assets/js/jquery.maskedinput.js"></script>
		<script src="static/assets/js/bootstrap-tag.js"></script>

		<!-- ace scripts -->
		<script src="static/assets/js/ace/elements.scroller.js"></script>
		<script src="static/assets/js/ace/elements.colorpicker.js"></script>
		<script src="static/assets/js/ace/elements.fileinput.js"></script>
		<script src="static/assets/js/ace/elements.typeahead.js"></script>
		<script src="static/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="static/assets/js/ace/elements.spinner.js"></script>
		<script src="static/assets/js/ace/elements.treeview.js"></script>
		<script src="static/assets/js/ace/elements.wizard.js"></script>
		<script src="static/assets/js/ace/elements.aside.js"></script>
		<script src="static/assets/js/ace/ace.js"></script>
		<script src="static/assets/js/ace/ace.ajax-content.js"></script>
		<script src="static/assets/js/ace/ace.touch-drag.js"></script>
		<script src="static/assets/js/ace/ace.sidebar.js"></script>
		<script src="static/assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="static/assets/js/ace/ace.submenu-hover.js"></script>
		<script src="static/assets/js/ace/ace.widget-box.js"></script>
		<script src="static/assets/js/ace/ace.settings.js"></script>
		<script src="static/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="static/assets/js/ace/ace.settings-skin.js"></script>
		<script src="static/assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="static/assets/js/ace/ace.searchbox-autocomplete.js"></script>
		
		<script type="text/javascript">
			$('#date-timepicker1').datetimepicker({
				 icons: {
					time: 'fa fa-clock-o',
					date: 'fa fa-calendar',
					up: 'fa fa-chevron-up',
					down: 'fa fa-chevron-down',
					previous: 'fa fa-chevron-left',
					next: 'fa fa-chevron-right',
					today: 'fa fa-arrows ',
					clear: 'fa fa-trash',
					close: 'fa fa-times'
				 }
				}).next().on(ace.click_event, function(){
					$(this).prev().focus();
			});
			
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
		
			//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
			$('input[name=date-range-picker]').daterangepicker({
				'applyClass' : 'btn-sm btn-success',
				'cancelClass' : 'btn-sm btn-default',
				locale: {
					applyLabel: 'Apply',
					cancelLabel: 'Cancel',
				}
			})
			.prev().on(ace.click_event, function(){
				$(this).next().focus();
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