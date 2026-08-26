package com.dashboard.manufacturing.materialrequirementplaning;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
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

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

public class ClsMaterialRequirementPlaningAction {
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
	        String sqld="",sqld1="",select="",joins="",casestatement="",sqlUnapplyResult="0",sqlwork="";
	        
			
            String worktype = request.getParameter("workType");
            String orderno = request.getParameter("orderno");
            String psrno = request.getParameter("psrno");
            String workno = request.getParameter("workno");
			System.out.println("worktype==="+worktype); 
			System.out.println("orderno==="+orderno); 
			System.out.println("psrno==="+psrno); 
			if(worktype.equalsIgnoreCase("1")) {
				//sqlwork="select (select concat(prd.productname,'  UOM-',u.unit,'  QTY-',round(w.qty,2)) from my_sorderd w left join my_main prd on w.psrno=prd.psrno left join my_unitm  u on w.unitid=u.doc_no  where w.psrno in(m1.mainpsrno) and w.rdocno in(m1.rdocno))mainproduct,m1.materialtype mtype,prd.productname,u.unit,m1.mtypeid,m1.wodocno, if(m1.colorcode in(0,101),round(m1.qty*m1.calcqty,2),round((m1.calcqty/m1.volume)*sum(m1.qty),2)) as qty from my_mrp m1  left join my_main prd on m1.dpsrno=prd.psrno left join my_prodattrib at on(at.mpsrno=prd.doc_no) left join my_unitm  u on m1.uom=u.doc_no  where m1.rdocno in("+orderno+")  and m1.mainpsrno in("+psrno+",0) and m1.mtypeid=4 group by mainproduct,mtype,m1.dpsrno,m1.psrno ";
				sqlwork="select (select concat(prd.productname,'  UOM-',u.unit,'  QTY-',round(w.qty,2)) from my_sorderd w left join my_main prd on w.psrno=prd.psrno left join my_unitm  u on w.unitid=u.doc_no  where w.psrno in(m1.sorpsrno) and w.rdocno in("+orderno+"))mainproduct,p.name mtype,prd.productname,u.unit,m1.mtypeid,m1.rdocno as wodocno, m1.qtyltr as qty from my_workorderd m1  left join my_main prd on m1.psrno=prd.psrno left join my_prodattrib at on(at.mpsrno=prd.doc_no) left join my_unitm  u on m1.unitid=u.doc_no left join my_prodtype p on p.doc_no=prd.prdtype  where m1.rdocno in("+workno+")  and m1.mtypeid=4  group by mainproduct,mtype,m1.psrno ";
			}
			if(worktype.equalsIgnoreCase("2")) {
				sqlwork="select (select concat(prd.productname,'  UOM-',u.unit,'  QTY-',round(w.qty,2)) from my_sorderd w left join my_main prd on w.psrno=prd.psrno left join my_unitm  u on w.unitid=u.doc_no  where w.psrno in(m1.sorpsrno) and w.rdocno in("+orderno+"))mainproduct,p.name mtype,prd.productname,u.unit,m1.mtypeid,m1.rdocno as wodocno, m1.qtyltr as qty from my_workorderd m1  left join my_main prd on m1.psrno=prd.psrno left join my_prodattrib at on(at.mpsrno=prd.doc_no) left join my_unitm  u on m1.unitid=u.doc_no left join my_prodtype p on p.doc_no=prd.prdtype  where m1.rdocno in("+workno+")  and m1.mtypeid=1  group by mainproduct,mtype,m1.psrno ";
				//sqlwork="select (select concat(prd.productname,'  UOM-',u.unit,'  QTY-',round(w.qty,2)) from my_sorderd w left join my_main prd on w.psrno=prd.psrno left join my_unitm  u on w.unitid=u.doc_no  where w.psrno in(m1.mainpsrno) and w.rdocno in(m1.rdocno))mainproduct,m1.materialtype mtype,prd.productname,u.unit,m1.mtypeid,m1.wodocno, if(m1.colorcode in(0,101),round(m1.qty*m1.calcqty,2),round((m1.calcqty/m1.volume)*sum(m1.qty),2)) as qty from my_mrp m1  left join my_main prd on m1.dpsrno=prd.psrno left join my_prodattrib at on(at.mpsrno=prd.doc_no) left join my_unitm  u on m1.uom=u.doc_no  where m1.rdocno in("+orderno+")  and m1.mainpsrno in("+psrno+",0) and m1.mtypeid=1 group by mainproduct,mtype,m1.dpsrno,m1.psrno ";
			}
			if(worktype.equalsIgnoreCase("3")) {
				sqlwork="select (select concat(prd.productname,'  UOM-',u.unit,'  QTY-',round(w.qty,2)) from my_sorderd w left join my_main prd on w.psrno=prd.psrno left join my_unitm  u on w.unitid=u.doc_no  where w.psrno in(m1.sorpsrno) and w.rdocno in("+orderno+"))mainproduct,p.name mtype,prd.productname,u.unit,m1.mtypeid,m1.rdocno as wodocno, m1.qtyltr as qty from my_workorderd m1  left join my_main prd on m1.psrno=prd.psrno left join my_prodattrib at on(at.mpsrno=prd.doc_no) left join my_unitm  u on m1.unitid=u.doc_no left join my_prodtype p on p.doc_no=prd.prdtype  where m1.rdocno in("+workno+")   group by mainproduct,mtype,m1.psrno ";
			}
			System.out.println("sqlworfggfg==="+sqlwork); 
      	    /*String totalqty = request.getParameter("totalqty");
      	   	
      	    String batch = request.getParameter("batchno");
      	  
      	    String blendsheetno = request.getParameter("blendsheetno");
      	 
      	    String sordoc = request.getParameter("sordoc");
      	    
      	    String department = request.getParameter("department");
      	    
      	    String puom = request.getParameter("uom");
      	    
      	    String psrno = request.getParameter("psrno");*/
			//String reportFileName = commonDAO.getBIBPrintPath("BAGS");
			
            String imgheaderpath=request.getSession().getServletContext().getRealPath("/icons/epic.jpg");
            imgheaderpath=imgheaderpath.replace("\\", "\\\\");
            String imgfooterpath=request.getSession().getServletContext().getRealPath("/icons/epic.jpg");
            imgfooterpath=imgfooterpath.replace("\\", "\\\\");
           //String prdno="SOR-"+sordoc+" BlendSheet-"+blendsheetno;
         
       		
            param.put("worktype", sqlwork);
            param.put("sorno", orderno);
            param.put("qrypsrno", psrno);
            param.put("qryorderno", orderno);
            param.put("workno", workno);
           /* param.put("totalqty", totalqty);
            param.put("packaging", department);
            param.put("batchno", batch);
            param.put("prdno", prdno);
            param.put("blendsheetno", blendsheetno);
            param.put("mainuom", puom);
            param.put("sordoc", sordoc);
            param.put("psrno", psrno);*/
			/*
			 * param.put("compname", ageingStatementBean.getLblcompname());
			 * param.put("compaddress", ageingStatementBean.getLblcompaddress());
			 * param.put("comptel", ageingStatementBean.getLblcomptel());
			 * param.put("compfax", ageingStatementBean.getLblcompfax());
			 * param.put("compbranch", ageingStatementBean.getLblbranch());
			 */
	        JasperDesign design = JRXmlLoader.load(request.getSession().getServletContext().getRealPath("com/dashboard/manufacturing/materialrequirementplaning/workorder.jrxml"));
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
