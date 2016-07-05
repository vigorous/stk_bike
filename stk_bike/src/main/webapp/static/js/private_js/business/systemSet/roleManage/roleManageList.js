//新建
$("#new").off().click(function(){
	var dialog = new Dialog();
	dialog.Title = "新建角色";
	dialog.URL = "roleManageForm";
	dialog.Height = 150;
	dialog.show();
});

//保存
function save(){
	alert("保存成功");
}