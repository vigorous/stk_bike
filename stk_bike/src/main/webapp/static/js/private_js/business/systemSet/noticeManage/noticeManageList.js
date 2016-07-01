var tableId = '#noticeManageListTable';
bindEvent();

//绑定事件
function bindEvent(){
	//新建
	$("#new").off().click(function(){
		var dialog = new Dialog();
		dialog.Title = "新建公告";
		dialog.URL = "addNoticePage";
		dialog.Height = 205;
		dialog.show();
	});

	//编辑
	$(tableId).find("button[name='edit']").off().click(function(){
		var notice_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "编辑公告";
		dialog.URL = "editNoticePage?NOTICE_ID=" + notice_id;
		dialog.Height = 205;
		dialog.show();
	});
	
	//删除
	$(tableId).find("button[name='delete']").off().click(function(){
		var notice_id = $(this).attr("data-id");
		Dialog.confirm("确定删除吗？",function(){
			$.ajax({
				url : 'noticeManage/deleteNotice',
				data : {
					NOTICE_ID : notice_id
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
		var notice_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "公告详情";
		dialog.URL = "noticeDetailPage?NOTICE_ID=" + notice_id;
		dialog.Height = 205;
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
	addTab('61b41081f89042bd9dc908d4176e7ac2','cc7f755f347c4ae7b0f6c704652d5b4d','公告管理','noticeManage/noticeManageList')
}