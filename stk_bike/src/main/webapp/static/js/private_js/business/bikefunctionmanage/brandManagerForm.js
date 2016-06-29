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
				addTab('d2ef4d27e4d84f548e6304f7a5856d3d','5ca05caac74545bc9a1dc343741f4209','品牌管理','brand/select')
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