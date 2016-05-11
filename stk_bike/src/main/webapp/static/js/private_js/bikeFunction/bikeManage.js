    /*表格数据部分*/
    var localData = [
 	             	{
 	             		"EID": "33041100005123",
 	             		"ADDRESS": "33041100005123",
 	             		"BIKETYPE": "电动车",
 	             		"NAME": "曾德林",
 	             		"TEL": "13123526502",
 	             		"REGISTTIME": "2016-03-31 16:23:13"
 	             	},
 	             	{
 	             		"EID": "33041100005123",
 	             		"ADDRESS": "33041100005123",
 	             		"BIKETYPE": "电动车",
 	             		"NAME": "曾德林",
 	             		"TEL": "13123526502",
 	             		"REGISTTIME": "2016-03-31 16:23:13"
 	             	},
 	             	{
 	             		"EID": "33041100005123",
 	             		"ADDRESS": "33041100005123",
 	             		"BIKETYPE": "电动车",
 	             		"NAME": "曾德林",
 	             		"TEL": "13123526502",
 	             		"REGISTTIME": "2016-03-31 16:23:13"
 	             	},
 	             	{
 	             		"EID": "33041100005123",
 	             		"ADDRESS": "33041100005123",
 	             		"BIKETYPE": "电动车",
 	             		"NAME": "曾德林",
 	             		"TEL": "13123526502",
 	             		"REGISTTIME": "2016-03-31 16:23:13"
 	             	},
 	             	{
 	             		"EID": "33041100005123",
 	             		"ADDRESS": "33041100005123",
 	             		"BIKETYPE": "电动车",
 	             		"NAME": "曾德林",
 	             		"TEL": "13123526502",
 	             		"REGISTTIME": "2016-03-31 16:23:13"
 	             	},
 	             	{
 	             		"EID": "33041100005123",
 	             		"ADDRESS": "33041100005123",
 	             		"BIKETYPE": "电动车",
 	             		"NAME": "曾德林",
 	             		"TEL": "13123526502",
 	             		"REGISTTIME": "2016-03-31 16:23:13"
 	             	},
 	             	{
 	             		"EID": "33041100005123",
 	             		"ADDRESS": "33041100005123",
 	             		"BIKETYPE": "电动车",
 	             		"NAME": "曾德林",
 	             		"TEL": "13123526502",
 	             		"REGISTTIME": "2016-03-31 16:23:13"
 	             	}];
    var gridObj;
    
    var gridFormObject;
    var layerGridFormIndex;
	 $(function () {
	    gridObj = $.fn.bsgrid.init('searchTable', {
	    localData: localData,
	    //rowHoverColor: true,
	    // autoLoad: false,
	    pageSize: 16
	    });
	    
	   if ($('#layer-gridForm').length == 1) {
          var gridFormHtml = $("#layer-gridForm").html();
          $("#layer-gridForm").html('');
          layerGridFormIndex = layer.open({
              type: 1,
              title: 'Form',
              shade: false,
              area: ['420px', '300px'],
              content: gridFormHtml,
              cancel: function (index) {
                  $('#layui-layer' + index).hide();
                  return false;
              }
          });
          $('#layui-layer' + layerGridFormIndex).hide();
      }

      // grid form obj, note grid form should init after layer
      gridFormObject = $.fn.bsgrid_form.init('gridForm', {});

      doSearch();

      //doAdd();
	 });
	 
	 
	function doSearch() {
       var searchParames = $('#searchForm').serializeArray();
       gridObj.search(searchParames);
   }

   function ACTION(record, rowIndex, colIndex, options, options) {
       return '<a href="#" onclick="doView(' + rowIndex + ');">查看</a>'
               + '&emsp;<a href="#" onclick="doEdit(' + rowIndex + ');">编辑</a>'
               + '&emsp;<a href="#" onclick="doDelete(' + rowIndex + ');">删除</a>';
   }

   function doAdd() {
       $('#gridForm')[0].reset();
       showFormDialog('add');
   }

   function doView(rowIndex) {
       fillDataAndShowFormDialog('查看', rowIndex);
   }

   function doEdit(rowIndex) {
       fillDataAndShowFormDialog('编辑', rowIndex);
   }

   function fillDataAndShowFormDialog(type, rowIndex) {
       // get record by rowIndex: gridObj.getRecord(rowIndex)
       // get column value by record and index: gridObj.getRecordIndexValue(record, index)
       // get column value by rowIndex and index: gridObj.getColumnValue(rowIndex, index)
       var record = gridObj.getRecord(rowIndex);
       $('#gridForm :input').each(function () {
           var input_name = $.trim($(this).attr('name'));
           if (input_name != '') {
               var input_value = gridObj.getRecordIndexValue(record, input_name);
               if ($(this).attr('type') == 'radio' || $(this).attr('type') == 'checkbox') {
                   if ((',' + input_value + ',').indexOf(',' + $(this).val() + ',') > -1) {
                       $.bsgrid.adaptAttrOrProp($(this), 'checked', true);
                   } else {
                       $.bsgrid.adaptAttrOrProp($(this), 'checked', false);
                   }
               } else {
                   $(this).val(input_value);
               }
           }
       });
       showFormDialog(type);
   }

   function showFormDialog(type) {
       gridFormObject.showForm(type);
       if (type == '查看') {
           $('#gridForm :button[value=保存]').hide();
       } else {
           $('#gridForm :button[value=保存]').show();
       }
       layer.title(type, layerGridFormIndex)
       $('#layui-layer' + layerGridFormIndex).show();
   }

   function doDelete(rowIndex) {
       var id = gridObj.getColumnValue(rowIndex, 'EID');
       layer.confirm('Delete?', function (index) {
           layer.alert('delete. EID=' + id);
       });
   }

   function doCommit() {
       var type = gridFormObject.options.formType;
       if (type == '查看') {
           alert('This is view.');
       } else if (type == 'add') {
           alert($('#gridForm').serialize() + '&formType=' + type);
       } else if (type == 'edit') {
           // editAble false not commit
           alert($('#gridForm :not([editAble="false"])').serialize() + '&formType=' + type);
       } else {
           alert('None.');
       }
   }