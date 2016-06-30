var formId = '#userForm';
bindEvent();

function bindEvent(){
	//保存
	$("#save").off().click(function(){
		var oper = $("#oper").val();
		var url = 'userManage/addUser';
		if(oper == 'edit'){
			url = 'userManage/editUser';   
		}
		btnDisenable();
		$.ajax({
			url : url,
			data : $(formId).serialize(),
			success : function(data){
				if(data){
					showDialog("保存成功", function(){
						refresh();
						closeDialog();
					});
				}
			},
			error : function(error){
				showDialog(error);
			},
			compelete : function(){
				btnEnable();
			}
		});
	});
	
	//取消
	$("#cancel").off().click(function(){
		closeDialog();
	});
}

//关闭弹出框
function closeDialog(){
	Dialog.close();
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

//刷新页面
function refresh(){
	addTab('b7cc9061c19645c9925af0c84ac24633','cc7f755f347c4ae7b0f6c704652d5b4d','用户管理','userManage/userManageList')
}

//按钮不可用
function btnEnable(){
	$(formId).find("input[type='button']").removeAttr("disabled");
}

//按钮可用
function btnDisenable(){
	$(formId).find("input[type='button']").attr("disabled","disabled");
}