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
	addTab('4eb3a9dcdd7f4b3cbc99c7e0a7085239','cc7f755f347c4ae7b0f6c704652d5b4d','单位管理','unitManage/unitManageList')
}

//按钮不可用
function btnEnable(){
	$(formId).find("input[type='button']").removeAttr("disabled");
}

//按钮可用
function btnDisenable(){
	$(formId).find("input[type='button']").attr("disabled","disabled");
}