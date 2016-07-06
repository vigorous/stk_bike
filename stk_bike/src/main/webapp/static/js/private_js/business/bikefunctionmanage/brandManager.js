var ctxPath=$("#ctxPath").val();
$("#addBrand").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "添加品牌";
	dialog.URL = "brandManagerForm";
	dialog.Height = 150;
	dialog.show();
});
modifyBrand= function(id){
	debugger
	var dialog = new Dialog();
	dialog.Title = "编辑品牌";
	dialog.URL = "brandManagerForm/"+id;
	dialog.Height = 150;
	dialog.show();
}
deleteBrand=function(id){
	Dialog.confirm("确定删除吗？",function(){
		$.ajax({
			cache:false,
			type: "POST",
			url:ctxPath +"/brand/deleteBrand/"+id,
			success: function(data){
				if(data==true){
					showDialog("删除成功", function(){
						addTab('d2ef4d27e4d84f548e6304f7a5856d3d','5ca05caac74545bc9a1dc343741f4209','品牌管理','brand/select')
					});
				}else{
					showDialog("删除失败", function(){
						addTab('d2ef4d27e4d84f548e6304f7a5856d3d','5ca05caac74545bc9a1dc343741f4209','品牌管理','brand/select')
					});
				}
			},
			error:function(data){
				showDialog("删除失败", function(){
					addTab('d2ef4d27e4d84f548e6304f7a5856d3d','5ca05caac74545bc9a1dc343741f4209','品牌管理','brand/select')
				});
			}
		})
	})
	
}
function showDialog(tip, success){
	tip = "<font size='3'>" + tip + "</font>";
	Dialog.alert(tip, function(){
		if(success){
			success();
		}
	});
}