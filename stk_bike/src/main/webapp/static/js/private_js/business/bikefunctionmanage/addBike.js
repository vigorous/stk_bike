$("#quit").click(function() {
	Dialog.close();
})
$(document).ready(
		function() {
			var ctxPath = $("#ctxPath").val();
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
								html += "<option value = '"
										+ data[i].POLICE_NAME + "'>"
										+ data[i].POLICE_NAME + "</option>";
							}
						}
						$("#adds").html(html)
					}
				},
			})
		});