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
		<link rel="stylesheet" href="static/assets/css/chosen.css" />
		<link rel="stylesheet" href="static/assets/css/bootstrap-datepicker3.css" />
		<link rel="stylesheet" href="static/assets/css/bootstrap-datetimepicker.css" />
		
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%>
	<title>MAC布防设置弹窗</title>
	<style>
		.dialog-text{
			padding-top: 7px;
			text-align: right;
		}
	</style>
</head>
<body>
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-xs-4 control-label no-padding-right dialog-text" for=""> 布防名称： </label>
						<div class="col-xs-8"><input type="text" placeholder="布防名称" /></div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-4 control-label no-padding-right dialog-text" for=""> 添加布防机具： </label>
						<div class="col-xs-3">
							<select class="chosen-select form-control" id="form-field-select-2" data-placeholder="所属派出所">
								<option value="">  </option>
								<option value="新城派出所">新城派出所</option>
								<option value="丁兰派出所">丁兰派出所</option>
								<option value="秀洲交警支队">秀洲交警支队</option>
							</select>
						</div>
						<div class="col-xs-3">
							<select class="chosen-select form-control" id="form-field-select-3" data-placeholder="安装地址">
								<option value="">  </option>
								<option value="丁兰广场">丁兰广场</option>
								<option value="五联西苑">五联西苑</option>
								<option value="钱江新城">钱江新城</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-4 control-label no-padding-right dialog-text" for=""> 布防机具： </label>
						<div class="col-xs-8"><textarea class="input-xlarge"></textarea></div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-4 control-label no-padding-right dialog-text" for=""> 开始时间： </label>
						<div class="col-xs-7">
							<input class="date-timepicker" type="text" class="form-control" placeholder="开始日期" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-4 control-label no-padding-right dialog-text" for=""> 结束时间： </label>
						<div class="col-xs-7">
							<input class="date-timepicker" type="text" class="form-control" placeholder="结束日期" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-4 control-label no-padding-right dialog-text" for=""> 终端设备MAC： </label>
						<div class="col-xs-8">
							<input class="btn btn-sm btn-primary" type="button" value="添加" />
							<input class="btn btn-sm btn-primary" type="button" value="删除" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-4 control-label no-padding-right dialog-text" for=""> 短信推送联系人： </label>
						<div class="col-xs-8">
							<input class="btn btn-sm btn-primary" type="button" value="添加" />
							<input class="btn btn-sm btn-primary" type="button" value="删除" />
						</div>
					</div>
					
					<div class="clearfix form-actions">
						<div class="col-xs-offset-4 col-xs-3"><input class="btn btn-info" id="save" type="button" value="保存" /></div>
						<div class="col-xs-3"><input class="btn" id="quit" type="button" value="退出" /></div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<script src="static/assets/js/date-time/moment.js"></script>
	<script src="static/assets/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script src="static/assets/js/date-time/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="static/assets/js/chosen.jquery.js"></script>
	
	<script type="text/javascript">
		//datepicker plugin
		//link
		$('.date-picker').datepicker({
			language: 'zh-CN',
			format: "yyyy-mm-dd",
			showButtonPanel: true,
			autoclose: true,
			todayHighlight: true
		})
		//show datepicker when clicking on the icon
		.next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		$('.date-timepicker').datetimepicker({
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
		
		var tag_input = $('#form-field-tags');
		try{
			tag_input.tag(
			  {
				placeholder:tag_input.attr('placeholder'),
				//enable typeahead by specifying the source array
				source: ace.vars['US_STATES'],//defined in ace.js >> ace.enable_search_ahead
				/**
				//or fetch data from database, fetch those that match "query"
				source: function(query, process) {
				  $.ajax({url: 'remote_source.php?q='+encodeURIComponent(query)})
				  .done(function(result_items){
					process(result_items);
				  });
				}
				*/
			  }
			)
	
			//programmatically add/remove a tag
			var $tag_obj = $('#form-field-tags').data('tag');
			$tag_obj.add('Programmatically Added');
			
			var index = $tag_obj.inValues('some tag');
			$tag_obj.remove(index);
		}
		catch(e) {
			//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
			tag_input.after('<textarea id="'+tag_input.attr('id')+'" name="'+tag_input.attr('name')+'" rows="3">'+tag_input.val()+'</textarea>').remove();
			//autosize($('#form-field-tags'));
		}
		
		//选择框效果
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
		
		$("#quit").click(function(){
			Dialog.close();
		})
	</script>
</body>
</html>