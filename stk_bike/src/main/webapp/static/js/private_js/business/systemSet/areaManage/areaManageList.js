bindEvent();

function bindEvent(){
	//新建
	$("#new").off().click(function(){
		var dialog = new Dialog();
		dialog.Title = "新建区域";
		dialog.URL = "addAreaPage";
		dialog.Height = 170;
		dialog.show();
	});

	//编辑
	$("button[name='edit']").off().click(function(){
		var district_id = $(this).attr("data-id");
		var dialog = new Dialog();
		dialog.Title = "编辑区域";
		dialog.URL = "editAreaPage?DISTRICT_ID=" + district_id;
		dialog.Height = 170;
		dialog.show();
	});
	
	//删除
	$("button[name='delete']").off().click(function(){
		var district_id = $(this).attr("data-id");
		$.ajax({
			url : 'areaManage/deleteArea',
			data : {
				DISTRICT_ID : district_id
			},
			success : function(data){
				if(data){
					alert("删除成功");
				}else{
					alert("删除失败");
				}
			},error : function(error){
				alert(error);
			}
		});
	});
	
	//批量删除
	$("#batchDelete").off().click(function(){
		debugger;
		var district_ids = [];
		$.each($("input[name='select']:checked"),function(index, element){
			district_ids.push({
				DISTRICT_ID : $(element).attr("data-id")
			});
		});
		$.ajax({
			type : 'POST',
			url : 'areaManage/batchDeleteArea',
			data : JSON.stringify(district_ids),
			dataType : 'json',
			contentType:"application/json",
			success : function(data){
				if(data){
					alert("删除成功");
				}else{
					alert("删除失败");
				}
			},error : function(error){
				alert(error);
			}
		});
	});
}