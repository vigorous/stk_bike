var formId = '#roleForm';
init();
bindEvent();

//初始化
function init(){
	//初始化树状结构
	var setting = {
			view: {
				showIcon : false,
			},
			check: {
				enable : true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			async : {
				enable : true,
				type : 'post',
				url : 'roleManage/findAllMenu',
				otherParam : ['oper', '']
			}
		};
	$.fn.zTree.init($('#menuTree'), setting);
}

//绑定事件
function bindEvent(){
	//保存
	$("#save").off().click(function(){
		var oper = $("#oper").val();
		var url = 'roleManage/addRole';
		if(oper == 'edit'){
			url = 'roleManage/editRole';
		}
		if(!validateForm()){
			return false;
		}
		btnDisenable();
		save(url);
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
	var treeObj = $.fn.zTree.getZTreeObj("menuTree");
	var menuArray = treeObj.getCheckedNodes();
	var menuIdArray = [];
	$.each(menuArray, function(index, menu){
		menuIdArray.push(menu.id);
	});
	console.log($(formId).serializeArray());
//	$.ajax({
//		type : 'POST',
//		url : url,
//		data : JSON.stringify(),
//		dataType : 'json',
//		contentType:"application/json",
//		success : function(data){
//			if(data){
//				showDialog("保存成功", function(){
//					refresh();
//					closeDialog();
//				});
//			}else{
//				showDialog("保存失败", btnEnable);
//			}
//		},
//		error : function(){
//			showDialog("保存失败", btnEnable);
//		}
//	});
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
	addTab('b20fcd2ae62c4f43bf36445e915208b4','cc7f755f347c4ae7b0f6c704652d5b4d','角色管理','roleManage/roleManageList')
}

//按钮可用
function btnEnable(){
	$(formId).find("input[type='button']").removeAttr("disabled");
}

//按钮不可用
function btnDisenable(){
	$(formId).find("input[type='button']").attr("disabled","disabled");
}