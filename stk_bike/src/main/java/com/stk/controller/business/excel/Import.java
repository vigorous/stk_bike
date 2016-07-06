package com.stk.controller.business.excel;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sse.bikemanagement.dao.impl.BikeDAOImpl;
import com.sse.bikemanagement.entity.BikeVO;

@Controller
@RequestMapping(value = "/import/")
public class Import {
	@RequestMapping(value="impBike",method=RequestMethod.POST)  
	public String impBike(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
		String root=request.getRealPath("/"); 
		  root = root.replace("\\", "/");
		  System.out.println(root);
		  System.out.println(file);
		  if (file == null)
		      return null;
		  String name = file.getOriginalFilename();
		  long size = file.getSize();
		  if ((name == null || name.equals("")) && size == 0)
		      return null;
		//  InputStream in = file.getInputStream();
		  Impexcel excelReader = new Impexcel();
		  String url = request.getRealPath("/expimps");
		  InputStream is1;
		  is1 = new FileInputStream(url+"/bike.xls");
		  Map<Integer, Object> bikemap = excelReader.readExcelContent(is1,"bike");
		  BikeDAOImpl bikeDao = new BikeDAOImpl();
		  for (int i = 1; i <= bikemap.size(); i++) {
	        	bikeDao.insert((BikeVO) bikemap.get(i));
	        	System.out.println("成功插入BIKE第"+i+"条");
	        }
		  
	      return "插入成功";
	}
}
