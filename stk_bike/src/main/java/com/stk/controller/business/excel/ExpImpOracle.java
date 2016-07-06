package com.stk.controller.business.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.multipart.MultipartFile;

import com.sse.bikemanagement.dao.impl.BikeDAOImpl;
import com.sse.bikemanagement.dao.impl.OwnerDAOImpl;
import com.sse.bikemanagement.dao.impl.RegisterDAOImpl;
import com.sse.bikemanagement.entity.BikeVO;
import com.sse.bikemanagement.entity.LostBikeVO;
import com.sse.bikemanagement.entity.OwnerVO;
import com.sse.bikemanagement.entity.RegisterVO;
import com.sse.bikemanagement.facade.BikeFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.LostBikeFacade;
@Controller
@RequestMapping(value = "/excel/")
public class ExpImpOracle{
	private List<File> file;
	private List<String> fileFileName;
	private List<String> fileContentType;
	private String root;
	public List<File> getFile() {
		return file;
	}
	public void setFile(List<File> file) {
		this.file = file;
	}
	public List<String> getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}
	public List<String> getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getRoot() {
		return root;
	}
	public void setRoot(String root) {
		this.root = root;
	}
	public String expBike(){
		String cmd = "exp stk_admin/stk20151120@192.168.1.76/orcl:1521 file=\"../webapps/ROOT/expimp/bike.dmp\" tables=('STK_ADMIN')";
		try {
			Runtime.getRuntime().exec("cmd /c start "+cmd);
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	@RequestMapping(value="impBike",method=RequestMethod.POST)  
	public String impBike(HttpServletRequest request) {
		root=request.getRealPath("/"); 
		  root = root.replace("\\", "/");
		  System.out.println(root);
		  for(int i = 0; i < file.size(); i++)
	        {
	        	String name = fileFileName.get(i);
	            InputStream is;
				try {
					is = new FileInputStream(file.get(i));
	            
	            OutputStream os = new FileOutputStream(new File(root, name));
	            
	            byte[] buffer = new byte[500];
	            
	            @SuppressWarnings("unused")
	            int length = 0;
	            
	            while(-1 != (length = is.read(buffer, 0, buffer.length)))
	            {
	                os.write(buffer);
	            }
	            
	            os.close();
	            is.close();
	            
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
		  GoZip.unzip(root+"/expimps.zip");
		  Impexcel excelReader = new Impexcel();
		  String url =request.getRealPath("/expimps"); 
		  InputStream is1;
	      InputStream is2;
	      InputStream is3;
	      return "";
	}
	public String expLostBike(HttpServletRequest request){
		String url = request.getRealPath("/expimps"); 
		url = url.replace("\\", "/");
		System.out.println(url);
		String command = url+"/expLostbike.sh";
        try {
			Runtime.getRuntime().exec(command);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	public String impLostBike(HttpServletRequest request){
		System.out.println("开始执行");
        root = request.getRealPath("/expimps"); 
        root = root.replace("\\", "/");
        System.out.println(root);
        for(int i = 0; i < file.size(); i++)
        {
        	String name = fileFileName.get(i);
            InputStream is;
			try {
				is = new FileInputStream(file.get(i));
            
            OutputStream os = new FileOutputStream(new File(root, name));
            
            byte[] buffer = new byte[500];
            
            @SuppressWarnings("unused")
            int length = 0;
            
            while(-1 != (length = is.read(buffer, 0, buffer.length)))
            {
                os.write(buffer);
            }
            
            os.close();
            is.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
      //导出xls
        Impexcel excelReader = new Impexcel();
        String url = request.getRealPath("/expimps"); 
        InputStream is1;
        try {
			is1 = new FileInputStream(url+"/lostbike.xls");
			 Map<Integer, Object> bikemap = excelReader.readExcelContent(is1,"lostbike");
			 LostBikeFacade lf = new LostBikeFacade();
		      lf = FacadeFactory.getLostBikeFacade();
		     System.out.println("获得Excel表格的内容:");
		     LostBikeVO lostvo;
		    
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	@RequestMapping(value="dcExcel",method=RequestMethod.GET)  
	public String expExcelByBike(HttpServletRequest request){
		String url = request.getRealPath("/expimps");
		url = url.replace("\\", "/");
		Expexcel<BikeVO> ex = new Expexcel<BikeVO>();
	    String[] headers = {};
	    List<BikeVO> dataset = new ArrayList<BikeVO>();
	    BikeFacade bf = new BikeFacade();
	try{
	    bf = FacadeFactory.getBikeFacade();
	    List<BikeVO> list = bf.queryAllBike();
	    for(int i=0;i<list.size();i++){
	    	dataset.add(list.get(i));
	    }
	      
			OutputStream out = new FileOutputStream(url+"/bike.xls");
			ex.exportExcel(headers, dataset, out);
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   

	      Expexcel<OwnerVO> ex1 = new Expexcel<OwnerVO>();
	      List<OwnerVO> dataset1 = new ArrayList<OwnerVO>();
	      BikeFacade bf1 = new BikeFacade();
	 try {
		  bf1 = FacadeFactory.getBikeFacade();
		  List<OwnerVO> list = bf1.queryAllOwner();
	      for(int i=0;i<list.size();i++){
	    	  dataset1.add(list.get(i));
	      }
	      
			OutputStream out = new FileOutputStream(url+"/owner.xls");
			ex1.exportExcel(headers, dataset1, out);
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
	   
	      Expexcel<RegisterVO> ex2 = new Expexcel<RegisterVO>();
	      List<RegisterVO> dataset2 = new ArrayList<RegisterVO>();
	      RegisterDAOImpl rd = new RegisterDAOImpl();
	 try {
	      ArrayList<RegisterVO> list = rd.selectAll();
	      for(int i=0;i<list.size();i++){
	    	  dataset2.add(list.get(i));
	      }
	      
			OutputStream out = new FileOutputStream(url+"/register.xls");
			ex2.exportExcel(headers, dataset2, out);
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		File file = GoZip.zip(url);
		System.out.println(file);
		return "business/bikefunctionmanage/bikeManager";
	}
}
