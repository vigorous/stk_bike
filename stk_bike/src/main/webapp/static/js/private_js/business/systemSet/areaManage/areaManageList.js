bindEvent();

function bindEvent(){
	//新建
	$("#new").off().click(function(){
		var dialog = new Dialog();
		dialog.Title = "新建区域";
		dialog.URL = "addAreaPage";
		dialog.Height = 180;
		dialog.show();
	});
	
	//详情
	$("button[name='detail']").off().click(function(){
		var district_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "区域详情";
		dialog.URL = "areaDetailPage?DISTRICT_ID=" + district_id;
		dialog.Height = 150;
		dialog.show();
	});

	//编辑
	$("button[name='edit']").off().click(function(){
		var district_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "编辑区域";
		dialog.URL = "editAreaPage?DISTRICT_ID=" + district_id;
		dialog.Height = 180;
		dialog.show();
	});
	
	//删除
	$("button[name='delete']").off().click(function(){
		var district_id = $(this).attr("data-id");
		Dialog.confirm("确定删除吗？",function(){
			$.ajax({
				url : 'areaManage/deleteArea',
				data : {
					DISTRICT_ID : district_id
				},
				success : function(data){
					if(data){
						showDialog("删除成功", refresh);
					}else{
						showDialog("删除失败");
					}
				},
				error : function(error){
					showDialog(error);
				}
			});
		});
	});
	
	//批量删除
	$("#batchDelete").off().click(function(){
		var district_ids = [];
		$.each($("input[name='select']:checked"),function(index, element){
			district_ids.push({
				DISTRICT_ID : $(element).attr("data-id")
			});
		});
		if(district_ids.length < 1){
			showDialog("请至少选中一条数据");
		}else{
			$.ajax({
				type : 'POST',
				url : 'areaManage/batchDeleteArea',
				data : JSON.stringify(district_ids),
				dataType : 'json',
				contentType:"application/json",
				success : function(data){
					if(data){
						showDialog("删除成功", refresh);
					}else{
						showDialog("删除失败");
					}
				},
				error : function(error){
					showDialog(error);
				}
			});
		}
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
	addTab('bea8ebd27048422f9ae9efe2a60eee0d','cc7f755f347c4ae7b0f6c704652d5b4d','区域管理','areaManage/areaManageList')
}