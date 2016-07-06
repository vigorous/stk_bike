
$("#bikeSelect").click(function(){
	var diag = new Dialog();
	  
	diag.Width = 750;

	diag.Height = 650;

	diag.Title = "车辆详细信息";

	diag.URL = "bikeMsg";

	diag.show();
})
$("#addbike").click(function(){
	var diag = new Dialog();
	  
	diag.Width = 750;

	diag.Height = 680;

	diag.Title = "添加车辆信息";

	diag.URL = "addbike";

	diag.show();
})
  edit=function (bid){
	var diag = new Dialog();
	  
	diag.Width = 750;

	diag.Height = 680;

	diag.Title = "编辑车辆信息";
	
	diag.URL = "editbike?BIKE_ID="+bid;

	diag.show();
}
var ctxPath=$("#ctxPath").val();
$("#download").click(function(){
	window.location=ctxPath+"expimps.zip";
})
$("#selectBike").click(function(){
	var bikeEid=$("#bikeEid").val();
	var bikeNo=$("#bikeNo").val();
	var bikeType=$("#bikeType").val();
	var bikeName=$("#bikeName").val();
	debugger;
	if(bikeEid!=""){
          addTab('18b6a36d86fc4b918c751b5ac41917cd','5ca05caac74545bc9a1dc343741f4209','车辆管理','bike/select?BIKE_EID='+bikeEid)
	}else if(bikeNo!=""){
        addTab('18b6a36d86fc4b918c751b5ac41917cd','5ca05caac74545bc9a1dc343741f4209','车辆管理','bike/select?BIKE_NO='+bikeNo)
	}else if(bikeType!=""){
        addTab('18b6a36d86fc4b918c751b5ac41917cd','5ca05caac74545bc9a1dc343741f4209','车辆管理','bike/select?BIKE_TYPE='+bikeType)
	}else if(bikeName!=""){
        addTab('18b6a36d86fc4b918c751b5ac41917cd','5ca05caac74545bc9a1dc343741f4209','车辆管理','bike/select?OWNER_NAME='+bikeName)
	}else{
		 addTab('18b6a36d86fc4b918c751b5ac41917cd','5ca05caac74545bc9a1dc343741f4209','车辆管理','bike/select')
	}
});
  function deletes(bid,oid,rid){
	  $.ajax({
			cache:false,
			type: "GET",
			url:ctxPath +"/bike/deleteBikeInfo?BIKE_ID="+bid+"&OWNER_ID="+oid+"&REGISTER_ID="+rid,
			success: function(data){
				if(data==true){
					alert("删除成功");
					addTab('18b6a36d86fc4b918c751b5ac41917cd','5ca05caac74545bc9a1dc343741f4209','车辆管理','bike/select')
				}else{
					alert("删除失败");
				}
			},
			error:function(data){
				alert("删除失败");
			}
		})
 }
  
  $("#toDcExcel").click(function(){
	  debugger
	  window.location=ctxPath+"excel/dcExcel";
	  alert("导出成功")
  })
  function bikeClick(bid){
	  window.location=ctxPath+"bike/selectbike?BIKE_ID="+bid;
  }
