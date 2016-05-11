    /*表格数据部分*/
    var localData = [
 	             	{
 	             		"BRANDNUM": "31",
 	             		"BRAND": "爱玛"
 	             	},
 	             	{
 	             		"BRANDNUM": "32",
 	             		"BRAND": "雅迪"
 	             	},
 	             	{
 	             		"BRANDNUM": "33",
 	             		"BRAND": "爱玛"
 	             	},
 	             	{
 	             		"BRANDNUM": "20",
 	             		"BRAND": "绿源"
 	             	},
 	             	{
 	             		"BRANDNUM": "23",
 	             		"BRAND": "小刀"
 	             	},
 	             	{
 	             		"BRANDNUM": "53",
 	             		"BRAND": "爱玛"
 	             	},
 	             	{
 	             		"BRANDNUM": "36",
 	             		"BRAND": "大白鲨"
 	             	}];
     var gridObj;
 	 $(function () {
 	    gridObj = $.fn.bsgrid.init('searchTable', {
 	    localData: localData,
 	    // autoLoad: false,
 	    pageSize: 10
 	    });
 	 });
 	 
 	function ACTION(record, rowIndex, colIndex, options, options) {
        return '<a href="#" onclick="doEdit(' + rowIndex + ');">编辑</a>'
                + '&emsp;<a href="#" onclick="doDelete(' + rowIndex + ');">删除</a>';
    }