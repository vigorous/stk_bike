bindEvent();

// 保存
function bindEvent() {
	// 新建
	 $("#new").off().click(function() {
		var dialog = new Dialog();
		dialog.Title = "新建用户";
		dialog.URL = "addUserPage";
		dialog.Height = 450;
		dialog.show();
	});

	// 编辑
	$("button[name='edit']").off().click(function() {
		var user_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "编辑区域";
		dialog.URL = "userManagePage?USER_ID=" + user_id;
		dialog.Height = 450;
		dialog.show();
	});

	// 删除
	$("button[name='delete']").off().click(function() {
		var user_id = $(this).attr("data-id");
		Dialog.confirm("确定删除吗？", function() {
			$.ajax({
				url : 'userManage/deleteUser',
				data : {
					USER_ID : user_id
				},
				success : function(data) {
					if (data) {
						showDialog("删除成功", refresh);
					} else {
						showDialog("删除失败");
					}
				},
				error : function(error) {
					showDialog(error);
				}
			});
		});
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
	addTab('b7cc9061c19645c9925af0c84ac24633','cc7f755f347c4ae7b0f6c704652d5b4d','用户管理','userManage/userManageList')
}