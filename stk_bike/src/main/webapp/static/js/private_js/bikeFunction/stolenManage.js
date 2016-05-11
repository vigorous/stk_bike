    /*表格数据部分*/
    var localData = [
 	             	{
 	             		"CASENUM": "31",
 	             		"POLICE": "秀洲公安局",
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"LOSTTIME": "2016-03-31 16:24:47",
 	             		"LOSTPLACE": "杭州逐旭",
 	             		"AGENT": "流氓",
 	             		"LASTTIME": "未出现",
 	             		"STATUS": "未寻回"
 	             	},
 	             	{
 	             		"CASENUM": "31",
 	             		"POLICE": "秀洲公安局",
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"LOSTTIME": "2016-03-31 16:24:47",
 	             		"LOSTPLACE": "杭州逐旭",
 	             		"AGENT": "流氓",
 	             		"LASTTIME": "未出现",
 	             		"STATUS": "未寻回"
 	             	},
 	             	{
 	             		"CASENUM": "31",
 	             		"POLICE": "秀洲公安局",
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"LOSTTIME": "2016-03-31 16:24:47",
 	             		"LOSTPLACE": "杭州逐旭",
 	             		"AGENT": "流氓",
 	             		"LASTTIME": "未出现",
 	             		"STATUS": "未寻回"
 	             	},
 	             	{
 	             		"CASENUM": "31",
 	             		"POLICE": "秀洲公安局",
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"LOSTTIME": "2016-03-31 16:24:47",
 	             		"LOSTPLACE": "杭州逐旭",
 	             		"AGENT": "流氓",
 	             		"LASTTIME": "未出现",
 	             		"STATUS": "未寻回"
 	             	},
 	             	{
 	             		"CASENUM": "31",
 	             		"POLICE": "秀洲公安局",
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"LOSTTIME": "2016-03-31 16:24:47",
 	             		"LOSTPLACE": "杭州逐旭",
 	             		"AGENT": "流氓",
 	             		"LASTTIME": "未出现",
 	             		"STATUS": "未寻回"
 	             	}];
     var gridObj;
 	 $(function () {
 	    gridObj = $.fn.bsgrid.init('searchTable', {
 	    localData: localData,
 	    // autoLoad: false,
 	    pageSize: 10
 	    });
 	 });
 	 
 	function ACTION(record, rowIndex, colIndex, options) {
	     return '<a href="#" onclick="alert(\'CASENUM=' + gridObj.getRecordIndexValue(record, 'CASENUM') + '\');">编辑</a>';
	 };