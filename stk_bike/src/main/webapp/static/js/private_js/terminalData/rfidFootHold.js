    /*表格数据部分*/
	var localData = [
 	             	{
 	             		"STARTPLACE": "新城街道派出所",
 	             		"STARTPERCENT": "10%",
 	             		"ENDPLACE": "HZ",
 	             		"ENDPERCENT": "5%"
 	             	}];
	
	var localData2 = [
	 	             	{
	 	             		"STARTPLACE": "新城街道派出所",
	 	             		"STARTPERCENT": "10%",
	 	             		"ENDPLACE": "HZ",
	 	             		"ENDPERCENT": "5%"
	 	             	}];
     var gridObj;
 	 $(function () {
 	    $.fn.bsgrid.init('searchTable', {
	 	    localData: localData,
	 	    // autoLoad: false,
	 	    pageSize: 3,
	 	    rowHoverColor: true
 	    });
 	    
 	   $.fn.bsgrid.init('searchTable2', {
	 	    localData: localData2,
	 	    // autoLoad: false,
	 	    pageSize: 3,
	 	    rowHoverColor: true
	   });
 	 });