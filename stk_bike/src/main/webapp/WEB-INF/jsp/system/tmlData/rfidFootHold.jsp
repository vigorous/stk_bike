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
	<link rel="stylesheet" href="static/assets/css/bootstrap-datetimepicker.min.css" />
	
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%>
	
	<title>RFID落脚点分析页面</title>
</head>
<body>
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<table style="border:0;">
					<tr>
						<td class="col-padding-right">
							<span class="input-icon">
								<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="这里输入关键词" />
								<i id="nav-search-icon" class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</td>
						
						<td class="col-padding-right">
							<input class="form-control datetime-picker" id="" type="text" placeholder="开始日期" />
						</td>
						
						<td class="col-padding-right">
							<input class="form-control datetime-picker" id="" type="text" placeholder="结束日期" />
						</td>
						
						<td class="col-padding-right"><button class="btn btn-sm btn-info" onclick="search();"  title="查询"><i id="nav-search-icon" class="fa fa-search"></i></button></td>
						
					</tr>
				</table>
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
									<th>出发地点</th>
									<th>概率</th>
									<th>最终停靠地点</th>
									<th>概率</th>
								</tr>
							</thead>
		
							<tbody>
								<tr>
		
									<td>
										<a href="#">ace.com</a>
									</td>
									<td>$45</td>
									<td>Feb 12</td>
									<td>dds</td>
		
								</tr>
		
								<tr>
		
									<td>
										<a href="#">base.com</a>
									</td>
									<td>$35</td>
									<td>Feb 18</td>
									<td>dds</td>
		
								</tr>
		
								<tr>
		
									<td>
										<a href="#">max.com</a>
									</td>
									<td>$60</td>
									<td>Mar 11</td>
									<td>dds</td>
		
								</tr>
		
								<tr>
		
									<td>
										<a href="#">best.com</a>
									</td>
									<td>$75</td>
									<td>Apr 03</td>
									<td>dds</td>
		
								</tr>
		
								<tr>
		
									<td>
										<a href="#">pro.com</a>
									</td>
									<td>$55</td>
									<td>Jan 21</td>
									<td>dds</td>
		
								</tr>
							</tbody>
						</table>
					</div><!-- /.span -->
				</div>
			</div>
		</div>
	</div>
		
	<!-- basic scripts -->
	<%@ include file="../admin/bottom.jsp"%>
		
		<script type="text/javascript">
			$('.datetime-picker').datetimepicker({
		        language:  'zh-CN',
		        format: "yyyy-mm-dd hh:ii",
		        startDate:'2000-01-01',
		        weekStart: 1,
		        todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				forceParse: 0,
		        showMeridian: 0,
		        minuteStep: 2
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