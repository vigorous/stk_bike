    /*表格数据部分*/
    var localData = [
 	             	{
 	             		"EID": 33041100051501,
 	             		"ADDRESS": "新王桥常木桥桥东",
 	             		"TYPE": "被盗",
 	             		"ENDTIME": "2016-04-26"
 	             	},
 	             	{
 	             		"EID": 33041100051502,
 	             		"ADDRESS": "新王桥常木桥桥东",
 	             		"TYPE": "被盗",
 	             		"ENDTIME": "2016-04-26"
 	             	},
 	             	{
 	             		"EID": 33041100051503,
 	             		"ADDRESS": "新王桥常木桥桥东",
 	             		"TYPE": "被盗",
 	             		"ENDTIME": "2016-04-26"
 	             	},
 	             	{
 	             		"EID": 33041100051503,
 	             		"ADDRESS": "新王桥常木桥桥东",
 	             		"TYPE": "被盗",
 	             		"ENDTIME": "2016-04-26"
 	             	},
 	             	{
 	             		"EID": 33041100051503,
 	             		"ADDRESS": "新王桥常木桥桥东",
 	             		"TYPE": "被盗",
 	             		"ENDTIME": "2016-04-26"
 	             	},
 	             	{
 	             		"EID": 33041100051503,
 	             		"ADDRESS": "新王桥常木桥桥东",
 	             		"TYPE": "被盗",
 	             		"ENDTIME": "2016-04-26"
 	             	},
 	             	{
 	             		"EID": 33041100051503,
 	             		"ADDRESS": "新王桥常木桥桥东",
 	             		"TYPE": "被盗",
 	             		"ENDTIME": "2016-04-26"
 	             	},
 	             	{
 	             		"EID": 33041100051503,
 	             		"ADDRESS": "新王桥常木桥桥东",
 	             		"TYPE": "被盗",
 	             		"ENDTIME": "2016-04-26"
 	             	}];
     var gridObj;
 	 $(function () {
 	    gridObj = $.fn.bsgrid.init('searchTable', {
 	    localData: localData,
 	    // autoLoad: false,
 	    pageSize: 5
 	    });
 	 });
 	 
 	function DETAIL(record, rowIndex, colIndex, options) {
	     return '<a href="#" onclick="alert(\'EID=' + gridObj.getRecordIndexValue(record, 'EID') + '\');">详细信息</a>';
	 };