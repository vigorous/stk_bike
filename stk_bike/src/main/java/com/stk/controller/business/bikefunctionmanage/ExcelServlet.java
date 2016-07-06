package com.stk.controller.business.bikefunctionmanage;
import java.io.IOException;  
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.sse.bikemanagement.dao.impl.BikeDAOImpl;
import com.sse.bikemanagement.entity.BikeVO;   
public class ExcelServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
            //导出Excel文件，不需要返回值，因为在方法的内部已经处理完成response  
            //HttpServletRequest request =ServletActionContext.getRequest();  
            String chcCreateDate=request.getParameter("svrDueId");  
            BikeDAOImpl bd =new BikeDAOImpl();  
            List<BikeVO>  customers = bd.queryAllBike();//从数据库中获取要导出的集合  
            //获取模板样式,需自行创建  
            String url = request.getRealPath("/expimp/default.xls");
            url = url.replace("\\", "/");
            ExcelTemplate template = ExcelTemplate.newInstance("expimp/default.xls");    
            for(int i=0; i<customers.size(); i++){  
                BikeVO bikeVO=(BikeVO)customers.get(i); 
                //创建一行  
                template.createRow(i);  
                //创建列  
                template.createCell(bikeVO.getBIKE_EID().toString());  
                template.createCell(bikeVO.getBIKE_BRAND_NO().toString());  
                template.createCell(bikeVO.getBIKE_FLAG().toString());  
                template.createCell(bikeVO.getBIKE_SKELETON_NO().toString());  
            }  
            //提供下载  
            //HttpServletResponse response = ServletActionContext.getResponse();  
            response.reset();  
            response.setContentType("application/x-download;charset=GBK");  
            response.setHeader("Content-Disposition", "attachment;filename=Book_"+System.currentTimeMillis()+".xls");  
            try {  
                template.getWorkbook().write(response.getOutputStream());  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
    }  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
    }  
}
