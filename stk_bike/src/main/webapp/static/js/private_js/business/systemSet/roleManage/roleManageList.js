var tableId = "#roleManageListTable";
bindEvent();

//绑定事件
function bindEvent(){
	//全选
	$("#selectAll").off().click(function(){
		var isChecked = $(this).is(":checked");
		if(isChecked){
			$(tableId).find("input[name='select']").prop("checked", true);
		}else{
			$(tableId).find("input[name='select']").prop("checked", false);
		}
	});
	
	//新建
	$("#new").off().click(function(){
		var dialog = new Dialog();
		dialog.Title = "新建角色";
		dialog.URL = "addRolePage";
		dialog.Height = 285;
		dialog.show();
	});
	
	//编辑
	$(tableId).find("button[name='edit']").off().click(function(){
		var role_id = $(this).attr("data-id");
		var role_name = $(this).attr("data-name");
		var dialog = new Dialog();
		dialog.Title = "编辑角色";
		dialog.URL = "editRolePage?ROLE_ID=" + role_id + "&ROLE_NAME=" + role_name;
		dialog.Height = 285;
		dialog.show();
	});
	
	//删除
	$(tableId).find("button[name='delete']").off().click(function(){
		var role_id = $(this).attr("data-id");
		Dialog.confirm("确定删除吗？",function(){
			$.ajax({
				type : 'POST',
				url : 'roleManage/deleteRole',
				data : {
					ROLE_ID : role_id
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
	
	//批量删除
	$("#batchDelete").off().click(function(){
		var role_ids = [];
		$.each($("input[name='select']:checked"),function(index, element){
			role_ids.push({
				ROLE_ID : $(element).attr("data-id")
			});
		});
		if(role_ids.length < 1){
			showDialog("请至少选中一条数据");
		}else{
			$.ajax({
				type : 'POST',
				url : 'roleManage/batchDeleteRole',
				data : JSON.stringify(role_ids),
				dataType : 'json',
				contentType:"application/json",
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
		}
	});
	
	//表格双击行弹出详情页面
	$(tableId + " tbody tr").off().dblclick(function(){
		var role_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "角色详情";
		dialog.URL = "roleDetailPage?ROLE_ID=" + role_id;
		dialog.Height = 215;
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
	addTab('b20fcd2ae62c4f43bf36445e915208b4','cc7f755f347c4ae7b0f6c704652d5b4d','角色管理','roleManage/roleManageList');
}