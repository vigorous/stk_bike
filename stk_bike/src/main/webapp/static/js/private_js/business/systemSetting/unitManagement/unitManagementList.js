//新建
$("#new").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "新建单位";
	dialog.URL = "unitManagementForm";
	dialog.Height = 270;
	dialog.ShowButtonRow = true;
	dialog.OKEvent = function(){
		save();
	}
	dialog.show();
});

//保存
function save(){
	alert("保存成功");
}