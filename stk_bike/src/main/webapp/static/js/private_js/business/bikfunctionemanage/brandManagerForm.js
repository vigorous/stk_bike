$("#quit").click(function(){
	Dialog.close();
})
var ctxPath=$("#ctxPath").val();
var form=$("#form");
function save(){
	debugger;
	var params=form.serialize();
	$.ajax({
		cache: false,
		type: "POST",
		data:params,
		url:ctxPath +"/brand/save",
		success: function(data){
			debugger;
			if(data==true){
				alert("添加成功");
				Dialog.close();
			}else{
				alert("添加失败");
			}
		},
		error:function(data){
			alert(data)
			alert("添加失败");
		}
	})
}