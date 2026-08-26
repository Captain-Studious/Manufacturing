package com.dashboard.procurment.productsuittype;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
 

import org.apache.struts2.ServletActionContext;

public class ClsproductSuittypeAction {

	private int  cmbmastertype,gridlenght;
	
	
	private String msgchk,loadchk; 
	
	
	private String lbldetail,lbldetailname; 
	private String lbldetail1,lbldetailname1; 
	
	
	
	   
	
	
	 public String getLbldetail() {
		return lbldetail;
	}

	public void setLbldetail(String lbldetail) {    
		this.lbldetail = lbldetail;
	}

	public String getLbldetailname() {
		return lbldetailname;
	}

	public void setLbldetailname(String lbldetailname) {
		this.lbldetailname = lbldetailname;
	}

	public String getLbldetail1() {
		return lbldetail1;
	}

	public void setLbldetail1(String lbldetail1) {
		this.lbldetail1 = lbldetail1;
	}

	public String getLbldetailname1() {
		return lbldetailname1;
	}

	public void setLbldetailname1(String lbldetailname1) {
		this.lbldetailname1 = lbldetailname1;
	}

	public String getMsgchk() {
		return msgchk;
	}

	public void setMsgchk(String msgchk) {
		this.msgchk = msgchk;
	}

	public String getLoadchk() {
		return loadchk;
	}

	public void setLoadchk(String loadchk) {
		this.loadchk = loadchk;
	}

	public int getCmbmastertype() {
		return cmbmastertype;
	}

	public void setCmbmastertype(int cmbmastertype) {
		this.cmbmastertype = cmbmastertype;
	}

	public int getGridlenght() {
		return gridlenght;
	}

	public void setGridlenght(int gridlenght) {
		this.gridlenght = gridlenght;
	}

	ClsproductSuittypeDAO saveDAO= new ClsproductSuittypeDAO();
	
	public String saveAction() throws SQLException
	{
		HttpServletRequest request=ServletActionContext.getRequest();
 
		Map<String, String[]> requestParams = request.getParameterMap();
		ArrayList<String> descarray= new ArrayList<>();
		
		//System.out.println("=====getGridlenght========"+getGridlenght());
		for(int i=0;i<getGridlenght();i++){
			
		 
			//System.out.println("=====i========"+i);
			
			
			String temp2=requestParams.get("savetest"+i)[0];
		 

			descarray.add(temp2);
			 
		}
		
		int val=saveDAO.insert(descarray,getCmbmastertype());
		
		if(val>0)
		{
		
			setLbldetail1("Supply Chain");
			setLbldetailname1("Product Suit Type");
			 setMsgchk("save");
			 
			 setLoadchk("load");
			
		}
		else
		{
			setMsgchk("notsave");
			setLoadchk("load");
		}
				 
		
		return "fail";
	}
	
	
	
	
}
