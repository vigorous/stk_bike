var tableId = '#noticeManageListTable';
bindEvent();

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