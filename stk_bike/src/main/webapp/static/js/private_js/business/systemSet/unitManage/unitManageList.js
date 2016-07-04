var tableId = "#unitManageListTable";
bindEvent();

//绑定事件
function bindEvent(){
	//新建
	$("#new").off().click(function(){
		var dialog = new Dialog();
		dialog.Title = "新建单位";
		dialog.URL = "addUnitPage";
		dialog.Height = 310;
		dialog.show();
	});
	
	//编辑
	$(tableId).find("button[name='edit']").off().click(function(){
		var police_office_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "编辑单位";
		dialog.URL = "editUnitPage?POLICE_OFFICE_ID=" + police_office_id;
		dialog.Height = 310;
		dialog.show();
	});
	
	//删除
	$(tableId).find("button[name='delete']").off().click(function(){
		var police_office_id = $(this).attr("data-id");
		Dialog.confirm("确定删除吗？",function(){
			$.ajax({
				type : 'POST',
				url : 'unitManage/deleteUnit',
				data : {
					POLICE_OFFICE_ID : police_office_id
				},
				success : function(data){
					if(data){
						showDialog("删除成功", refresh);
					}else{
						showDialog("删除失败");
					}
				},
				error : function(){
					showDialog("删除失败");
				}
			});
		});
	});
	
	//表格双击行弹出详情页面
	$(tableId + " tbody tr").off().dblclick(function(){
		var police_office_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "单位详情";
		dialog.URL = "unitDetailPage?POLICE_OFFICE_ID=" + police_office_id;
		dialog.Height = 220;
		dialog.show();
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

//刷新页面
function refresh(){
	addTab('4eb3a9dcdd7f4b3cbc99c7e0a7085239','cc7f755f347c4ae7b0f6c704652d5b4d','单位管理','unitManage/unitManageList');
}