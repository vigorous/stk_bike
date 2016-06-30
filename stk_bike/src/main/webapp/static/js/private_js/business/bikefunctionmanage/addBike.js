$("#quit").click(function() {
	Dialog.close();
})
var form=$("#form");
var ctxPath = $("#ctxPath").val();
$(document).ready(
		function() {
			$.ajax({
				cache : false,
				type : "POST",
				url : ctxPath + "bike/selectBrandVO",
				success : function(data) {
					debugger;
					var html = "";
					if (data != null) {
						for (i in data) {
							if (data[i].BRAND_NO != undefined) {
								html += "<option value = '" + data[i].BRAND_NO
										+ "'>" + data[i].BRAND_NAME
										+ "</option>";
							}
						}
						$("#brandNo").html(html)
					}
				},
			})
			$.ajax({
				cache : false,
				type : "POST",
				url : ctxPath + "bike/queryPoliceByPoliceOfficeID",
				success : function(data) {
					debugger;
					var html = "";
					if (data != null) {
						for (i in data) {
							if (data[i].POLICE_NAME != undefined) {
								html += "<option   value = '"+ data[i].POLICE_ID + "'>"+ data[i].POLICE_NAME + "</option>";
							}
						}
						$("#POLICE_ID").html(html)
					}
				},
			})
		});
$("#POLICE_ID").change(function(){
	var id=$("#POLICE_ID").val();
	$.ajax({
		cache : false,
		type : "POST",
		url : ctxPath + "bike/queryPoliceByID/"+id,
		success : function(data) {
			if (data != null) {
				$("#POLICE_OFFICE_ID").val(data.POLICE_OFFICE_NO)
			}
		},
	})
})	

$("#save").click(function(){
	if($("#BIKE_EID").val()==""||$("#BIKE_EID").val()==null){
		$("#BIKE_EID").tips({
			side : 1,
			msg : "电子车牌不能为空",
			bg : '#FF5080',
			time : 3
		});
		return false;
	}
	if($("#OWNER_NAME").val()==""||$("#OWNER_NAME").val()==null){
		$("#OWNER_NAME").tips({
			side : 1,
			msg : "车主姓名不能为空",
			bg : '#FF5080',
			time : 3
		});
		return false;
	}
	if($("#OWNER_SFID").val()==""||$("#OWNER_SFID").val()==null){
		$("#OWNER_SFID").tips({
			side : 1,
			msg : "身份证号不能为空",
			bg : '#FF5080',
			time : 3
		});
		return false;
	}
	if($("#OWNER_ADDRESS").val()==""||$("#OWNER_ADDRESS").val()==null){
		$("#OWNER_ADDRESS").tips({
			side : 1,
			msg : "车主联系地址不能为空",
			bg : '#FF5080',
			time : 3
		});
		return false;
	}
	if($("#OWNER_PHONE").val()==""||$("#OWNER_PHONE").val()==null){
		$("#OWNER_PHONE").tips({
			side : 1,
			msg : "车主联系电话不能为空",
			bg : '#FF5080',
			time : 3
		});
		return false;
	}
	if($("#REGISTER_TIME").val()==""||$("#REGISTER_TIME").val()==null){
		$("#REGISTER_TIME").tips({
			side : 1,
			msg : "车辆登记时间不能为空",
			bg : '#FF5080',
			time : 3
		});
		return false;
	}
	if($("#POLICE_ID").val()==""||$("#POLICE_ID").val()==null){
		$("#POLICE_ID").tips({
			side : 1,
			msg : "经办人姓名不能为空",
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
		url:ctxPath +"/bike/addBikeInfo",
		success:function(data){
			if(data==true){
				alert("添加成功");
				Dialog.close();
				addTab('18b6a36d86fc4b918c751b5ac41917cd','5ca05caac74545bc9a1dc343741f4209','车辆管理','bike/select')
			}
		}
	});
});