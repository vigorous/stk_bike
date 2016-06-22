//新建
$("#new").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "新建角色";
	dialog.URL = "roleManagementForm";
	dialog.Height = 100;
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