var formId = '#placeListSreachForm';
var tableId = "#placeManageListTable";
bindEvent();

function bindEvent() {
	// 编辑
	$("button[name='edit']").off().click(function() {
		var place_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "编辑区域";
		dialog.URL = "placeManageForm?PLACE_ID=" + place_id;
		dialog.Width = 750;
		dialog.Height = 650;
		dialog.show();
	});

	// 删除
	$("button[name='delete']").off().click(function() {
		var place_id = $(this).attr("data-id");
		Dialog.confirm("确定删除吗？", function() {
			$.ajax({
				type : 'POST',
				url : 'placeManage/deletePlace',
				data : {
					PLACE_ID : place_id
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
	
	// 全选
	$("#selectAll").off().click(function() {
		var isChecked = $(this).is(":checked");
		if (isChecked) {
			$(tableId).find("input[name='select']").prop("checked", true);
		} else {
			$(tableId).find("input[name='select']").prop("checked", false);
		}
	});
	// 点击事件
	$("#placeListSreachBtn").off().click(
			function() {
				window.location.href = 'placeManage/placeManageList?'
						+ $(formId).serialize();
			});
	// 批量删除
	$("#batchDelete").off().click(function() {
		var place_ids = [];
		$.each($("input[name='select']:checked"), function(index, element) {
			place_ids.push({
				PLACE_ID : $(element).attr("data-id")
			});
		});
		if (place_ids.length < 1) {
			showDialog("请至少选中一条数据");
		} else {
			$.ajax({
				type : 'POST',
				url : 'placeManage/batchDeletePlace',
				data : JSON.stringify(place_ids),
				dataType : 'json',
				contentType : "application/json",
				success : function(data) {
					if (data) {
						showDialog("删除成功", refresh);
					} else {
						showDialog("删除失败");
					}
				},
				error : function() {
					showDialog("删除失败");
				}
			});
		}
	});
}
// 弹框
function showDialog(tip, success) {
	tip = "<font size='3'>" + tip + "</font>";
	Dialog.alert(tip, function() {
		if (success) {
			success();
		}
	});
}
// 刷新页面
function refresh() {
	addTab('fa844aa174cc4909bb919ebd10a73eef',
			'8f369279f9e24bcf9f8f6c8e368e3a6a', '场所管理',
			'placeManage/placeManageList')
}