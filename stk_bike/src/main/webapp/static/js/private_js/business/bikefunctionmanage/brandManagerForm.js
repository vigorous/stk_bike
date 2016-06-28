$("#quit").click(function(){
	Dialog.close();
})
var ctxPath=$("#ctxPath").val();
var form=$("#form");
function save(){
	if($("#brandNo").val()==""||$("#brandNo").val()==null){
		$("#brandNo").tips({
			side : 1,
			msg : "品牌编号不能为空",
			bg : '#FF5080',
			time : 3
		});
		return false;
	}
	if($("#brandName").val()==""||$("#brandName").val()==null){
		$("#brandName").tips({
			side : 1,
			msg : "品牌名称不能为空",
			bg : '#FF5080',
			time : 3
		});
		return false;
	}
	var params=form.serialize();
	$.ajax({
		cache: false,
		type: "POST",
		data:params,
		url:ctxPath +"/brand/addBrand",
		success: function(data){
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