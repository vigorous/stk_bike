package com.stk.controller.business.excel;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import com.sse.bikemanagement.dao.impl.BikeDAOImpl;
import com.sse.bikemanagement.dao.impl.OwnerDAOImpl;
import com.sse.bikemanagement.dao.impl.RegisterDAOImpl;
import com.sse.bikemanagement.entity.BikeVO;
import com.sse.bikemanagement.entity.LostBikeVO;
import com.sse.bikemanagement.entity.OwnerVO;
import com.sse.bikemanagement.entity.RegisterVO;
import com.sse.bikemanagement.facade.BikeFacade;
import com.sse.bikemanagement.facade.FacadeFactory;

public class Impexcel {
	 private POIFSFileSystem fs;
	    private HSSFWorkbook wb;
	    private HSSFSheet sheet;
	    private HSSFRow row;

	    /**
	     * 读取Excel表格表头的内容
	     * @param InputStream
	     * @return String 表头内容的数组
	     */
	    public String[] readExcelTitle(InputStream is) {
	        try {
	            fs = new POIFSFileSystem(is);
	            wb = new HSSFWorkbook(fs);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        sheet = wb.getSheetAt(0);
	        row = sheet.getRow(0);
	        // 标题总列数
	        int colNum = row.getPhysicalNumberOfCells();
	        System.out.println("colNum:" + colNum);
	        String[] title = new String[colNum];
	        for (int i = 0; i < colNum; i++) {
	            //title[i] = getStringCellValue(row.getCell((short) i));
	            title[i] = getCellFormatValue(row.getCell((short) i));
	        }
	        return title;
	    }

	    /**
	     * 读取Excel数据内容
	     * @param InputStream
	     * @return Map 包含单元格数据内容的Map对象
	     */
	    public Map<Integer, Object> readExcelContent(InputStream is,String type) {
	        Map<Integer, Object> content = new HashMap<Integer, Object>();
	        String str = "";
	        try {
	            fs = new POIFSFileSystem(is);
	            wb = new HSSFWorkbook(fs);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        sheet = wb.getSheetAt(0);
	        // 得到总行数
	        int rowNum = sheet.getLastRowNum();
	        row = sheet.getRow(1);
	        int colNum = row.getLastCellNum();
	        ArrayList<String> list = new ArrayList<String>();
	        // 正文内容应该从第二行开始,第一行为表头的标题
	        for (int i = 1; i <= rowNum; i++) {
	            row = sheet.getRow(i);
	            int j = 0;
	            list.removeAll(list);
	            while (j < colNum) {
	                // 每个单元格的数据内容用"-"分割开，以后需要时用String类的replace()方法还原数据
	                // 也可以将每个单元格的数据设置到一个javabean的属性中，此时需要新建一个javabean
	                // str += getStringCellValue(row.getCell((short) j)).trim() +
	                // "-";
	                str += getCellFormatValue(row.getCell((short) j)).trim() + "";
	                list.add(getCellFormatValue(row.getCell((short) j)).trim());
	                j++;
	            }
	            if(type.equals("bike")){
	            	content.put(i, bikelist(list));
	            }
	            
	            str = "";
	        }
	        return content;
	    }

	    /**
	     * 获取单元格数据内容为字符串类型的数据
	     * 
	     * @param cell Excel单元格
	     * @return String 单元格数据内容
	     */
	    private String getStringCellValue(HSSFCell cell) {
	        String strCell = "";
	        switch (cell.getCellType()) {
	        case HSSFCell.CELL_TYPE_STRING:
	            strCell = cell.getStringCellValue();
	            break;
	        case HSSFCell.CELL_TYPE_NUMERIC:
	            strCell = String.valueOf(cell.getNumericCellValue());
	            break;
	        case HSSFCell.CELL_TYPE_BOOLEAN:
	            strCell = String.valueOf(cell.getBooleanCellValue());
	            break;
	        case HSSFCell.CELL_TYPE_BLANK:
	            strCell = "";
	            break;
	        default:
	            strCell = "";
	            break;
	        }
	        if (strCell.equals("") || strCell == null) {
	            return "";
	        }
	        if (cell == null) {
	            return "";
	        }
	        return strCell;
	    }

	    /**
	     * 获取单元格数据内容为日期类型的数据
	     * 
	     * @param cell
	     *            Excel单元格
	     * @return String 单元格数据内容
	     */
	    private String getDateCellValue(HSSFCell cell) {
	        String result = "";
	        try {
	            int cellType = cell.getCellType();
	            if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {
	                Date date = cell.getDateCellValue();
	                result = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)
	                        + "-" + date.getDate();
	            } else if (cellType == HSSFCell.CELL_TYPE_STRING) {
	                String date = getStringCellValue(cell);
	                result = date.replaceAll("[年月]", "-").replace("日", "").trim();
	            } else if (cellType == HSSFCell.CELL_TYPE_BLANK) {
	                result = "";
	            }
	        } catch (Exception e) {
	            System.out.println("日期格式不正确!");
	            e.printStackTrace();
	        }
	        return result;
	    }

	    /**
	     * 根据HSSFCell类型设置数据
	     * @param cell
	     * @return
	     */
	    private String getCellFormatValue(HSSFCell cell) {
	        String cellvalue = "";
	        if (cell != null) {
	            // 判断当前Cell的Type
	            switch (cell.getCellType()) {
	            // 如果当前Cell的Type为NUMERIC
	            case HSSFCell.CELL_TYPE_NUMERIC:
	            case HSSFCell.CELL_TYPE_FORMULA: {
	                // 判断当前的cell是否为Date
	                if (HSSFDateUtil.isCellDateFormatted(cell)) {
	                    // 如果是Date类型则，转化为Data格式
	                    
	                    //方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
	                    //cellvalue = cell.getDateCellValue().toLocaleString();
	                    
	                    //方法2：这样子的data格式是不带带时分秒的：2011-10-12
	                    Date date = cell.getDateCellValue();
	                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	                    cellvalue = sdf.format(date);
	                    
	                }
	                // 如果是纯数字
	                else {
	                    // 取得当前Cell的数值
	                    cellvalue = String.valueOf(cell.getNumericCellValue());
	                }
	                break;
	            }
	            // 如果当前Cell的Type为STRIN
	            case HSSFCell.CELL_TYPE_STRING:
	                // 取得当前的Cell字符串
	                cellvalue = cell.getRichStringCellValue().getString();
	                break;
	            // 默认的Cell值
	            default:
	                cellvalue = " ";
	            }
	        } else {
	            cellvalue = "";
	        }
	        return cellvalue;

	    }
	    public BikeVO bikelist(ArrayList<String> list){
	    	BikeVO vo = new BikeVO();
	    	
	    	return vo;
	    	
	    }
	    
	    public OwnerVO ownerlist(ArrayList<String> list){
	    	OwnerVO vo = new OwnerVO();
	    	vo.setOWNER_ID(list.get(0));
	    	vo.setOWNER_NAME(list.get(1));
	    	vo.setOWNER_PHONE(list.get(2));
	    	vo.setOWNER_ADDRESS(list.get(3));
	    	vo.setOWNER_COMPANY(list.get(4));
	    	vo.setOWNER_SEX(list.get(5));
	    	return vo;
	    }
	  
	    
	    
	    

	    public static void main(String[] args) {
	        try {
//	            // 对读取Excel表格标题测试
//	            InputStream is = new FileInputStream("d:\\test2.xls");
//	            ExcelReader excelReader = new ExcelReader();
//	            String[] title = excelReader.readExcelTitle(is);
//	            System.out.println("获得Excel表格的标题:");
//	            for (String s : title) {
//	                System.out.print(s + " ");
//	            }
	            // 对读取Excel表格内容测试
	        	Impexcel excelReader = new Impexcel();
	            InputStream is1 = new FileInputStream("d:\\bike.xls");
	            InputStream is2 = new FileInputStream("d:\\owner.xls");
	            InputStream is3 = new FileInputStream("d:\\register.xls");
	            Map<Integer, Object> bikemap = excelReader.readExcelContent(is1,"bike");
	            Map<Integer, Object> ownermap = excelReader.readExcelContent(is2,"owner");
	            Map<Integer, Object> registermap = excelReader.readExcelContent(is3,"register");
	            BikeDAOImpl bikeDao = new BikeDAOImpl();
	            OwnerDAOImpl ownerDao = new OwnerDAOImpl();
	            RegisterDAOImpl registerDao = new RegisterDAOImpl();
	            System.out.println("获得Excel表格的内容:");
	            for (int i = 1; i <= bikemap.size(); i++) {
	            	bikeDao.insert((BikeVO) bikemap.get(i));
	            	System.out.println("成功插入BIKE第"+i+"条");
	            }
	            for (int i = 1; i <= ownermap.size(); i++) {
	            	ownerDao.insert((OwnerVO) ownermap.get(i));
	            	System.out.println("成功插入Onwer"+i+"条");
	            }
	            for (int i = 1; i <= registermap.size(); i++) {
	            	registerDao.insert((RegisterVO) registermap.get(i));
	            	System.out.println("成功插入Register"+i+"条");
	            }

	        } catch (Exception e) {
	            System.out.println("未找到指定路径的文件!");
	            e.printStackTrace();
	        }
	    }
}
