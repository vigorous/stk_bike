var ctxPath = $("#ctxPath").val();

//删除
deleteStolen=function(LOST_BIKE_ID){
	$.ajax({
		cache:false,
		type: "POST",
		url:ctxPath +"stolen/deleteLostBike/"+LOST_BIKE_ID,
		success: function(data){
			if(data==true){
				alert("删除成功");
				addTab('808c41822f7743cd9ddaa36656bd576f','5ca05caac74545bc9a1dc343741f4209','被盗车辆管理','stolen/select')			}else{
				alert("删除失败");
			}
		},
		error:function(data){
			alert("删除失败");
		}
	})
}

//模糊查询
$("#selectStolen").click(function(){
	var LOST_BIKE_EID=$("#LOST_BIKE_EID").val();
	debugger;
	if(LOST_BIKE_EID!=""){
		addTab('808c41822f7743cd9ddaa36656bd576f','5ca05caac74545bc9a1dc343741f4209','被盗车辆管理','stolen/select?LOST_BIKE_EID='+LOST_BIKE_EID)		
	}else{
		addTab('808c41822f7743cd9ddaa36656bd576f','5ca05caac74545bc9a1dc343741f4209','被盗车辆管理','stolen/select')			
	}
});


