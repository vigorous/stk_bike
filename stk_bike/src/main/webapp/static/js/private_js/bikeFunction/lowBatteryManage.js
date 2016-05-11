    /*表格数据部分*/
    var localData = [
 	             	{
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"IDCARD": "36242519920105",
 	             		"STATUS": "未寻回"
 	             	},
 	             	{
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"IDCARD": "36242519920105",
 	             		"STATUS": "未寻回"
 	             	},
 	             	{
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"IDCARD": "36242519920105",
 	             		"STATUS": "未寻回"
 	             	},
 	             	{
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"IDCARD": "36242519920105",
 	             		"STATUS": "未寻回"
 	             	},
 	             	{
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"IDCARD": "36242519920105",
 	             		"STATUS": "未寻回"
 	             	},
 	             	{
 	             		"ELCID": "33041100051503",
 	             		"NAME": "刘明",
 	             		"TEL": "13856260250",
 	             		"IDCARD": "36242519920105",
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
 	 
     function getCheckedIds() {
         // values are array
         alert(gridObj.getCheckedValues('ELCID'));
     }