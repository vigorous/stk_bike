var formId = '#unitForm';
bindEvent();

//绑定事件
function bindEvent(){
	//保存
	$("#save").off().click(function(){
		var oper = $("#oper").val();
		var url = 'unitManage/addUnit';
		var police_office_no = $(formId).find("input[name='POLICE_OFFICE_NO']").val();
		if(oper == 'edit'){
			url = 'unitManage/editUnit';
		}
		if(!validateForm()){
			return false;
		}
		btnDisenable();
		if(oper == 'add'){
			$.ajax({
				type : 'POST',
				url : 'unitManage/isExistUnitNo',
				data : {
					POLICE_OFFICE_NO : police_office_no
				},
				success : function(data){
					if(data){
						showDialog("单位编号已存在", btnEnable);
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
	var police_office_no_input = $(formId).find("input[name='POLICE_OFFICE_NO']");
	var police_office_no_length = $.trim(police_office_no_input.val()).length;
	var police_office_name_input = $(formId).find("input[name='POLICE_OFFICE_NAME']");
	var police_office_name_length = $.trim(police_office_name_input.val()).length;
	var manager_id_select = $(formId).find("select[name='MANAGER_ID']");
	var manager_id_length = $.trim(manager_id_select.val()).length;
	var address_input = $(formId).find("input[name='ADDRESS']");
	var address_length = $.trim(address_input.val()).length;
	var phone_input = $(formId).find("input[name='PHONE']");
	var phone_length = $.trim(phone_input.val()).length;
	if(police_office_no_length < 1 || police_office_no_length > 20){
		showTip(police_office_no_input, "20位字符以内");
		flag = false;
	}
	if(police_office_name_length < 1 || police_office_name_length > 60){
		showTip(police_office_name_input, "60位字符以内");
		flag = false;
	}
	if(manager_id_length < 1){
		showTip(manager_id_select.next(), "选择负责人");
		flag = false;
	}
	if(address_length < 1 || address_length > 100){
		showTip(address_input, "100位字符以内");
		flag = false;
	}
	if(phone_length < 1 || phone_length > 20){
		showTip(phone_input, "20位字符以内");
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
	addTab('4eb3a9dcdd7f4b3cbc99c7e0a7085239','cc7f755f347c4ae7b0f6c704652d5b4d','单位管理','unitManage/unitManageList');
}

//按钮可用
function btnEnable(){
	$(formId).find("input[type='button']").removeAttr("disabled");
}

//按钮不可用
function btnDisenable(){
	$(formId).find("input[type='button']").attr("disabled","disabled");
}