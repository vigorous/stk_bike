var formId = '#areaForm';
bindEvent();

//绑定事件
function bindEvent(){
	//区县级别选择二级时，显示上级区县下拉
	$(formId).find("select[name='DISTRICT_LEVEL']").change(function(){
		var districtLevel = $(this).val();
		if(districtLevel == 1){
			$("#parentDistrict").addClass("hide");
		}else if(districtLevel == 2){
			$("#parentDistrict").removeClass("hide");
		}
	});
	
	//保存
	$("#save").off().click(function(){
		var oper = $("#oper").val();	
		var url = 'areaManage/addArea';
		var district_no = $(formId).find("input[name='DISTRICT_NO']").val();
		if(oper == 'edit'){
			url = 'areaManage/editArea';
		}
		if(!validateForm()){
			return false;
		}
		btnDisenable();
		if(oper == 'add'){
			$.ajax({
				type : 'POST',
				url : 'areaManage/isExistAreaNo',
				data : {
					DISTRICT_NO : district_no
				},
				success : function(data){
					if(data){
						showDialog("区域编号已存在", btnEnable);
					}else{
						save(url);
					}
				},
				error : function(){
					showDialog("保存失败", btnEnable);
				}
			});
		}else{
			save(url);
		}
	});
	
	//取消
	$("#cancel").off().click(function(){
		closeDialog();
	});
}

//验证表单
function validateForm(){
	var flag = true;
	var district_no_input = $(formId).find("input[name='DISTRICT_NO']");
	var district_no_length = $.trim(district_no_input.val()).length;
	var district_name_input = $(formId).find("input[name='DISTRICT_NAME']");
	var district_name_length = $.trim(district_name_input.val()).length;
	var district_level_select = $(formId).find("select[name='DISTRICT_LEVEL']");
	var district_level_length = $.trim(district_level_select.val()).length;
	var parent_no_select = $(formId).find("select[name='PARENT_NO']");
	var parent_no_length = $.trim(parent_no_select.val()).length;
	if(district_no_length < 1 || district_no_length > 10){
		showTip(district_no_input, "20位字符以内");
		flag = false;
	}
	if(district_name_length < 1 || district_name_length > 60){
		showTip(district_name_input, "60位字符以内");
		flag = false;
	}
	if(district_level_length < 1){
		showTip(district_level_select.next(), "选择区县级别");
		flag = false;
	}
	if(!$("#parentDistrict").hasClass("hide") && parent_no_length < 1){
		showTip(parent_no_select.next(), "选择上级区县");
		flag = false;
	}
	return flag;
}

//保存方法
function save(url){
	$.ajax({
		type : 'POST',
		url : url,
		data : $(formId).serializeArray(),
		success : function(data){
			if(data){
				showDialog("保存成功", function(){
					refresh();
					closeDialog();
				});
			}else{
				showDialog("保存失败", btnEnable);
			}
		},
		error : function(){
			showDialog("保存失败", btnEnable);
		}
	});
}

//给jquery元素设置提示
function showTip(element, msg){
	element.tips({
		msg : msg,
		side : 2,
		bg : '#FF0000',
		time : 3,
		x : 12
	});
}

//弹框
function showDialog(tip, success){
	tip = "<font size='3'>" + tip + "</font>";
	Dialog.alert(tip, function(){
		if(success){
			success();
		}
	});
}

//关闭弹出框
function closeDialog(){
	Dialog.close();
}

//刷新页面
function refresh(){
	addTab('bea8ebd27048422f9ae9efe2a60eee0d','cc7f755f347c4ae7b0f6c704652d5b4d','区域管理','areaManage/areaManageList')
}

//按钮不可用
function btnEnable(){
	$(formId).find("input[type='button']").removeAttr("disabled");
}

//按钮可用
function btnDisenable(){
	$(formId).find("input[type='button']").attr("disabled","disabled");
}