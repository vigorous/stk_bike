	/*柱状图部分*/
    $(function () {
    	$('#container').highcharts({
    		credits: {
    			enabled: false
    		},
    		exporting: {
    			enabled: false
    		},
    		chart: {
    			type: 'column'
    		},
    		title: {
    			text: '车辆详细记录'
    		},
    		subtitle: {
    			text: '车辆数量（辆）'
    		},
    		xAxis: {
    			categories: [
    				'秀洲公安局',
    				'洪河交警中队',
    				'王店派出所',
    				'洪河派出所',
    				'新城派出所',
    				'王店交警中队',
    				'五联派出所',
    				'江泾派出所'
    			],
    			labels: {
    				rotation: -15,
    				style: {
    					fontSize: '12px'
    				}
    			}
    		},
    		yAxis: {
    			min: 0,
    			title: {
    				text: '车辆数量 (辆)'
    			}
    		},
    		tooltip: {
    			headerFormat: '<span style="font-size:12px">{point.key}</span><table>',
    			pointFormat: '<tr><td style="color:{series.color};padding:5px;border:1px solid #ccc;">{series.name}: </td>' +
    			'<td style="padding:5px;border:1px solid #ccc;"><b>{point.y} 辆</b></td></tr>',//{point.y:.1f}修改颜色：#434348-->#e4393c
    			footerFormat: '</table>',
    			shared: true,
    			useHTML: true
    		},
    		plotOptions: {
    			column: {
    				pointPadding: 0.2,
    				borderWidth: 0
    			}
    		},
    		series: [{
    			name: '总车辆数',
    			data: [185, 71, 106, 129, 144, 176, 135, 148]

    		}, {
    			name: '遗失',
    			data: [83, 78, 98, 93, 106, 84, 105, 104]

    		}, {
    			name: '寻回',
    			data: [48, 38, 39, 41, 47, 48, 59, 56]

    		}]
    	});
    });
    /*表格数据部分*/
    var localData = [
 	             	{
 	             		"UNIT": "新城街道派出所",
 	             		"TOTAL": "202",
 	             		"LOST": "18",
 	             		"FIND": "11"
 	             	},
 	             	{
 	             		"UNIT": "新城街道派出所",
 	             		"TOTAL": "202",
 	             		"LOST": "18",
 	             		"FIND": "11"
 	             	},
 	             	{
 	             		"UNIT": "新城街道派出所",
 	             		"TOTAL": "202",
 	             		"LOST": "18",
 	             		"FIND": "11"
 	             	},
 	             	{
 	             		"UNIT": "新城街道派出所",
 	             		"TOTAL": "202",
 	             		"LOST": "18",
 	             		"FIND": "11"
 	             	},
 	             	{
 	             		"UNIT": "新城街道派出所",
 	             		"TOTAL": "202",
 	             		"LOST": "18",
 	             		"FIND": "11"
 	             	},
 	             	{
 	             		"UNIT": "新城街道派出所",
 	             		"TOTAL": "202",
 	             		"LOST": "18",
 	             		"FIND": "11"
 	             	},
 	             	{
 	             		"UNIT": "新城街道派出所",
 	             		"TOTAL": "202",
 	             		"LOST": "18",
 	             		"FIND": "11"
 	             	}];
     var gridObj;
 	 $(function () {
 	    gridObj = $.fn.bsgrid.init('searchTable', {
 	    localData: localData,
 	    // autoLoad: false,
 	    pageSize: 3,
 	    rowHoverColor: true
 	    });
 	 });

    /*表格和柱状图的切换*/
    $(function(){
    	$("table").hide();
		$("#toTable").bind("click",function(){
			var btText = $("#toTable").text();
			if(btText=="切换为表格"){
				$("#toTable").text("切换为柱状图");
				$("#container").hide();
				$("table").show();
				/* $("#searchTable").append("<tr><th w_index='XH' width='5%;'>XH</th><th w_index='ID' width='5%;'>ID</th><th w_index='CHAR' width='15%;'>CHAR</th><th w_index='TEXT' width='30%;'>TEXT</th><th w_index='DATE' width='15%;'>DATE</th><th w_index='TIME' width='15%;'>TIME</th><th w_index='NUM' width='5%;'>NUM</th><th w_render='operate' width='10%;'>Operate</th></tr>"); */
			}else{
				$("#toTable").text("切换为表格");
				$("#container").show();
				$("table").hide();
			}
		})
	})