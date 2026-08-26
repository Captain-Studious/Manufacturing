package com.humanresource.transactions.termination;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.common.ClsCommon;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ClsTerminationAction extends ActionSupport{

	ClsCommon ClsCommon=new ClsCommon();

	ClsTerminationDAO terminationDAO= new ClsTerminationDAO();
	ClsTerminationBean terminationBean;

	private String formdetailcode;
	private String mode;
	private String deleted;
	private String msg;
	private String brchName;
	private String terminationDate;
	private String hidterminationDate;
	private int txtterminationdocno;
	private String txtemployeeid;
	private String txtemployeename;
	private int txtemployeedocno;
	private String txtemployeedesignation;
	private String txtemployeedepartment;
	private String txtemployeecategory;
	private String notifyDate;
	private String hidnotifyDate;
	private String joiningDate;
	private String hidjoiningDate;
	private String appraisalDate;
	private String hidappraisalDate;
	private double txtdrtotal;
	private double txtcrtotal;
	private int txttrno;
	
	//Termination Details Grid 
	private int gridlength;
	
	//Account Details Grid
	private int journalsgridlength;
	
	//Account Details Grid
	private int journalgridlength;

	public String getFormdetailcode() {
		return formdetailcode;
	}

	public void setFormdetailcode(String formdetailcode) {
		this.formdetailcode = formdetailcode;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getBrchName() {
		return brchName;
	}

	public void setBrchName(String brchName) {
		this.brchName = brchName;
	}

	public String getTerminationDate() {
		return terminationDate;
	}

	public void setTerminationDate(String terminationDate) {
		this.terminationDate = terminationDate;
	}

	public String getHidterminationDate() {
		return hidterminationDate;
	}

	public void setHidterminationDate(String hidterminationDate) {
		this.hidterminationDate = hidterminationDate;
	}

	public int getTxtterminationdocno() {
		return txtterminationdocno;
	}

	public void setTxtterminationdocno(int txtterminationdocno) {
		this.txtterminationdocno = txtterminationdocno;
	}

	public String getTxtemployeeid() {
		return txtemployeeid;
	}

	public void setTxtemployeeid(String txtemployeeid) {
		this.txtemployeeid = txtemployeeid;
	}

	public String getTxtemployeename() {
		return txtemployeename;
	}

	public void setTxtemployeename(String txtemployeename) {
		this.txtemployeename = txtemployeename;
	}

	public int getTxtemployeedocno() {
		return txtemployeedocno;
	}

	public void setTxtemployeedocno(int txtemployeedocno) {
		this.txtemployeedocno = txtemployeedocno;
	}

	public String getTxtemployeedesignation() {
		return txtemployeedesignation;
	}

	public void setTxtemployeedesignation(String txtemployeedesignation) {
		this.txtemployeedesignation = txtemployeedesignation;
	}

	public String getTxtemployeedepartment() {
		return txtemployeedepartment;
	}

	public void setTxtemployeedepartment(String txtemployeedepartment) {
		this.txtemployeedepartment = txtemployeedepartment;
	}

	public String getTxtemployeecategory() {
		return txtemployeecategory;
	}

	public void setTxtemployeecategory(String txtemployeecategory) {
		this.txtemployeecategory = txtemployeecategory;
	}

	public String getNotifyDate() {
		return notifyDate;
	}

	public void setNotifyDate(String notifyDate) {
		this.notifyDate = notifyDate;
	}

	public String getHidnotifyDate() {
		return hidnotifyDate;
	}

	public void setHidnotifyDate(String hidnotifyDate) {
		this.hidnotifyDate = hidnotifyDate;
	}

	public String getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}

	public String getHidjoiningDate() {
		return hidjoiningDate;
	}

	public void setHidjoiningDate(String hidjoiningDate) {
		this.hidjoiningDate = hidjoiningDate;
	}

	public String getAppraisalDate() {
		return appraisalDate;
	}

	public void setAppraisalDate(String appraisalDate) {
		this.appraisalDate = appraisalDate;
	}

	public String getHidappraisalDate() {
		return hidappraisalDate;
	}

	public void setHidappraisalDate(String hidappraisalDate) {
		this.hidappraisalDate = hidappraisalDate;
	}

	public double getTxtdrtotal() {
		return txtdrtotal;
	}

	public void setTxtdrtotal(double txtdrtotal) {
		this.txtdrtotal = txtdrtotal;
	}

	public double getTxtcrtotal() {
		return txtcrtotal;
	}

	public void setTxtcrtotal(double txtcrtotal) {
		this.txtcrtotal = txtcrtotal;
	}

	public int getTxttrno() {
		return txttrno;
	}

	public void setTxttrno(int txttrno) {
		this.txttrno = txttrno;
	}

	public int getGridlength() {
		return gridlength;
	}

	public void setGridlength(int gridlength) {
		this.gridlength = gridlength;
	}
	
	public int getJournalsgridlength() {
		return journalsgridlength;
	}

	public void setJournalsgridlength(int journalsgridlength) {
		this.journalsgridlength = journalsgridlength;
	}

	public int getJournalgridlength() {
		return journalgridlength;
	}

	public void setJournalgridlength(int journalgridlength) {
		this.journalgridlength = journalgridlength;
	}

	java.sql.Date terminationsDate;
	java.sql.Date notifyingDate;
	java.sql.Date joinedDate;
	java.sql.Date lastAppraisalDate;
	
	public String saveAction() throws ParseException, SQLException{
		
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		Map<String, String[]> requestParams = request.getParameterMap();

		String mode=getMode();
		ClsTerminationBean bean = new ClsTerminationBean();

		terminationsDate = ClsCommon.changeStringtoSqlDate(getTerminationDate());
		notifyingDate = ClsCommon.changeStringtoSqlDate(getNotifyDate());
		joinedDate = ClsCommon.changeStringtoSqlDate(getJoiningDate());
		lastAppraisalDate = ClsCommon.changeStringtoSqlDate(getAppraisalDate());
		
		if(mode.equalsIgnoreCase("A")){
			
			/*Termination Details Grid*/
			ArrayList<String> employeedetailsarray= new ArrayList<>();
			for(int i=0;i<getGridlength();i++){
				String temp=requestParams.get("test"+i)[0];
				employeedetailsarray.add(temp);
			}
			/*Termination Details Grid Ends*/
			
			/*Account Grid*/
			ArrayList<String> accountsarray= new ArrayList<>();
			for(int i=0;i<getJournalsgridlength();i++){
				String temp1=requestParams.get("journals"+i)[0];
				accountsarray.add(temp1);
			}
			/*Account Grid Ends*/
			
			/*Journal Voucher Grid*/
			ArrayList<String> journalvouchersarray= new ArrayList<>();
			for(int i=0;i<getJournalgridlength();i++){
				String temp2=requestParams.get("journal"+i)[0];
				journalvouchersarray.add(temp2);
			}
			/*Journal Voucher Grid Ends*/
			
			int val=terminationDAO.insert(getFormdetailcode(),getBrchName(),terminationsDate,getTxtemployeedocno(),notifyingDate,joinedDate,lastAppraisalDate,getTxtdrtotal(),employeedetailsarray,accountsarray,journalvouchersarray,session,request,mode);
			if(val>0.0){
				
				setTxtterminationdocno(val);
				setTxttrno(Integer.parseInt(request.getAttribute("tranno").toString()));
				setData();
				
				setMsg("Successfully Saved");
				return "success";
			}
			else{
				setMsg("Not Saved");
				return "fail";
			}	
		} else if(mode.equalsIgnoreCase("View")){
	
			String branch=null;
			terminationBean=terminationDAO.getViewDetails(session,getTxtterminationdocno());
			
			setTerminationDate(terminationBean.getTerminationDate());
			setTxtemployeedocno(terminationBean.getTxtemployeedocno());
			setTxtemployeeid(terminationBean.getTxtemployeeid());
			setTxtemployeename(terminationBean.getTxtemployeename());
			setTxtemployeedesignation(terminationBean.getTxtemployeedesignation());
			setTxtemployeedepartment(terminationBean.getTxtemployeedepartment());
			setTxtemployeecategory(terminationBean.getTxtemployeecategory());
			setNotifyDate(terminationBean.getNotifyDate());
			setJoiningDate(terminationBean.getJoiningDate());
			setAppraisalDate(terminationBean.getAppraisalDate());
			setTxtdrtotal(terminationBean.getTxtdrtotal());
			setTxtcrtotal(terminationBean.getTxtcrtotal());
			setTxttrno(terminationBean.getTxttrno());
			
			setFormdetailcode(terminationBean.getFormdetailcode());
			
			return "success";
		}
		return "fail";
	}

	public void setData() {

			if(terminationsDate != null){
	    	    setHidterminationDate(terminationsDate.toString());
	    	}
			setTxtemployeedocno(getTxtemployeedocno());
			setTxtemployeeid(getTxtemployeeid());
			setTxtemployeename(getTxtemployeename());
			setTxtemployeedesignation(getTxtemployeedesignation());
			setTxtemployeedepartment(getTxtemployeedepartment());
			setTxtemployeecategory(getTxtemployeecategory());
			if(notifyingDate != null){
	    	    setHidnotifyDate(notifyingDate.toString());
	    	}
			if(joinedDate != null){
	    	    setHidjoiningDate(joinedDate.toString());
	    	}
			if(lastAppraisalDate != null){
	    	    setHidappraisalDate(lastAppraisalDate.toString());
	    	}
			setTxtdrtotal(getTxtdrtotal());
			setTxtcrtotal(getTxtcrtotal());
			
		}
}

