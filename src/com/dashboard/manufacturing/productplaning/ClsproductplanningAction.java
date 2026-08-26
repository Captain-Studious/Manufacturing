package com.dashboard.manufacturing.productplaning;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.naming.NamingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.common.ClsCommon;
import com.connection.ClsConnection;
import com.mailwithpdf.SendEmailAction;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

public class ClsproductplanningAction {
	ClsCommon commonDAO= new ClsCommon();
	ClsConnection connDAO = new ClsConnection();
	private Map<String, Object> param = null;
	public Map<String, Object> getParam() {
		return param;
	}
	public void setParam(Map<String, Object> param) {
		this.param = param;
	}
	public String printAction() throws ParseException, SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session=request.getSession();
	    Connection conn = null;
        java.sql.Date sqlUpToDate = null;
        
		try {
			conn = connDAO.getMyConnection();
	        Statement stmtAgeingStatement =conn.createStatement();
	        param = new HashMap();
	        String sqld="",sqld1="",select="",joins="",casestatement="",sqlUnapplyResult="0";
	        
			
String product = request.getParameter("product");
			
      	    String totalqty = request.getParameter("totalqty");
      	   	
      	    String batch = request.getParameter("batchno");
      	  
      	    String blendsheetno = request.getParameter("blendsheetno");
      	 
      	    String sordoc = request.getParameter("sordoc");
      	    
      	    String department = request.getParameter("department");
      	    
      	    String puom = request.getParameter("uom");
      	    
      	    String psrno = request.getParameter("psrno");
			//String reportFileName = commonDAO.getBIBPrintPath("BAGS");
			
            String imgheaderpath=request.getSession().getServletContext().getRealPath("/icons/epic.jpg");
            imgheaderpath=imgheaderpath.replace("\\", "\\\\");
            String imgfooterpath=request.getSession().getServletContext().getRealPath("/icons/epic.jpg");
            imgfooterpath=imgfooterpath.replace("\\", "\\\\");
           String prdno="SOR-"+sordoc+" BlendSheet-"+blendsheetno;
         
       		
            param.put("prdtname", product);
            param.put("totalqty", totalqty);
            param.put("packaging", department);
            param.put("batchno", batch);
            param.put("prdno", prdno);
            param.put("blendsheetno", blendsheetno);
            param.put("mainuom", puom);
            param.put("sordoc", sordoc);
            param.put("psrno", psrno);
			/*
			 * param.put("compname", ageingStatementBean.getLblcompname());
			 * param.put("compaddress", ageingStatementBean.getLblcompaddress());
			 * param.put("comptel", ageingStatementBean.getLblcomptel());
			 * param.put("compfax", ageingStatementBean.getLblcompfax());
			 * param.put("compbranch", ageingStatementBean.getLblbranch());
			 */
	        JasperDesign design = JRXmlLoader.load(request.getSession().getServletContext().getRealPath("com/dashboard/manufacturing/productplaning/blendsheetMNF.jrxml"));
  	        JasperReport jasperReport = JasperCompileManager.compileReport(design);
            generateReportPDF(response, param, jasperReport, conn);
			
            stmtAgeingStatement.close();
            
		} catch (Exception e) {
            e.printStackTrace();
            conn.close();
    	} finally{
    		conn.close();
    	}
		 return "print";
	}
	
	public String printCerticateAction() throws ParseException, SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session=request.getSession();
	    Connection conn = null;
        java.sql.Date sqlUpToDate = null;
        
		try {
			conn = connDAO.getMyConnection();
	        Statement stmtAgeingStatement =conn.createStatement();
	        param = new HashMap();
	        String sqld="",sqld1="",select="",joins="",casestatement="",sqlUnapplyResult="0";
	        
	        String product = request.getParameter("product");
	        
	        String batch = request.getParameter("batchno");
			
      	    String workno = request.getParameter("workno");
      	    
      	    String psrno = request.getParameter("psrno");
      	    
      	    System.out.println("workno===="+workno+"===psrno==="+psrno);
      	   			
			//String reportFileName = commonDAO.getBIBPrintPath("BAGS");
			
            String imghead=request.getSession().getServletContext().getRealPath("/icons/aitsheader.jpg");
            imghead=imghead.replace("\\", "\\\\");
            String imgfoot=request.getSession().getServletContext().getRealPath("/icons/aitsfooter.jpg");
            imgfoot=imgfoot.replace("\\", "\\\\");
           
         
       		
            param.put("imgheader", imghead);
            param.put("imgfooter", imgfoot);
            param.put("prdtname", product);
            param.put("batchno", batch);
            param.put("workno", workno);
            param.put("psrno", psrno);
          //  param.put("comptel", ageingStatementBean.getLblcomptel());
          //  param.put("compfax", ageingStatementBean.getLblcompfax());
           // param.put("compbranch", ageingStatementBean.getLblbranch());
	      //  param.put("printby", session.getAttribute("USERNAME"));
	        //param.put("printby", session.getAttribute("USERNAME"));
	        
	        JasperDesign design = JRXmlLoader.load(request.getSession().getServletContext().getRealPath("com/dashboard/manufacturing/productplaning/certificateofanalysis.jrxml"));
  	        JasperReport jasperReport = JasperCompileManager.compileReport(design);
            generateReportPDF(response, param, jasperReport, conn);
			
            stmtAgeingStatement.close();
            
		} catch (Exception e) {
            e.printStackTrace();
            conn.close();
    	} finally{
    		conn.close();
    	}
		 return "printns";
	}
	
	 private void generateReportPDF (HttpServletResponse resp, Map parameters, JasperReport jasperReport, Connection conn)throws JRException, NamingException, SQLException, IOException, AddressException, MessagingException {
 		  byte[] bytes = null;
         bytes = JasperRunManager.runReportToPdf(jasperReport,parameters,conn);
         resp.reset();
         resp.resetBuffer();
         
         resp.setContentType("application/pdf");
         resp.setContentLength(bytes.length);
         ServletOutputStream ouputStream = resp.getOutputStream();
         ouputStream.write(bytes, 0, bytes.length);
		   
		    ouputStream.flush();
		    ouputStream.close();
        
              
     }
}
