package com.controlcentre.masters.salesmanmaster.driver;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.common.ClsCommon;

public class ClsDriverAction  {
	
	ClsDriverDAO driverDAO=new ClsDriverDAO();
	ClsDriverBean bean;
	ClsCommon ClsCommon=new ClsCommon();
	private int docno;
	private String txtaccname;
	private int txtaccno;
	private String code;
	private String name;
	private String driverdate;
	private String hiddriverdate;
	private String licenseexpiry;
	private String hidlicenseexpiry;
	private String licenseno;
	private String mode;
	private String deleted;
	private String authority;
	private int gridlength;
	private String mail;
	private String mobile;
	private String msg;
	private String formdetail;
	private String formdetailcode;
	private String chkstatus;
	private String hidacno;
	
	public String getHidacno() {
		return hidacno;
	}
	public void setHidacno(String hidacno) {
		this.hidacno = hidacno;
	}
	public String getFormdetail() {
		return formdetail;
	}
	public void setFormdetail(String formdetail) {
		this.formdetail = formdetail;
	}
	public String getFormdetailcode() {
		return formdetailcode;
	}
	public void setFormdetailcode(String formdetailcode) {
		this.formdetailcode = formdetailcode;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getGridlength() {
		return gridlength;
	}
	public void setGridlength(int gridlength) {
		this.gridlength = gridlength;
	}
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getDocno() {
		return docno;
	}
	public void setDocno(int docno) {
		this.docno = docno;
	}
	public String getTxtaccname() {
		return txtaccname;
	}
	public void setTxtaccname(String txtaccname) {
		this.txtaccname = txtaccname;
	}
	public int getTxtaccno() {
		return txtaccno;
	}
	public void setTxtaccno(int txtaccno) {
		this.txtaccno = txtaccno;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDriverdate() {
		return driverdate;
	}
	public void setDriverdate(String driverdate) {
		this.driverdate = driverdate;
	}
	public String getHiddriverdate() {
		return hiddriverdate;
	}
	public void setHiddriverdate(String hiddriverdate) {
		this.hiddriverdate = hiddriverdate;
	}
	public String getLicenseexpiry() {
		return licenseexpiry;
	}
	public void setLicenseexpiry(String licenseexpiry) {
		this.licenseexpiry = licenseexpiry;
	}
	public String getHidlicenseexpiry() {
		return hidlicenseexpiry;
	}
	public void setHidlicenseexpiry(String hidlicenseexpiry) {
		this.hidlicenseexpiry = hidlicenseexpiry;
	}
	public String getLicenseno() {
		return licenseno;
	}
	public void setLicenseno(String licenseno) {
		this.licenseno = licenseno;
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
    public String getChkstatus() {
		return chkstatus;
	}
	public void setChkstatus(String chkstatus) {
		this.chkstatus = chkstatus;
	}
	
  public String saveAction() throws ParseException, SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		Map<String, String[]> requestParams = request.getParameterMap();

		String mode=getMode();
		ClsDriverBean bean=new ClsDriverBean();
	
		java.sql.Date sqlStartDate = ClsCommon.changeStringtoSqlDate(getDriverdate());

		if(mode.equalsIgnoreCase("A")){
			ArrayList<String> driverarray= new ArrayList<>();
			for(int i=0;i<getGridlength();i++){
				ClsDriverBean driverbean=new ClsDriverBean();
				String temp=requestParams.get("test"+i)[0];
				driverarray.add(temp);
			}
					int val=driverDAO.insert(getCode(),getName(),sqlStartDate,getHidacno(),getLicenseno(),getAuthority(),session,getMode(),driverarray,getMail(),getFormdetailcode());
					if(val>0.0){
						setHidacno(getHidacno());
						setCode(getCode());
						setName(getName());
						setHiddriverdate(getDriverdate());
						setHidlicenseexpiry(getLicenseexpiry());
						setTxtaccname(getTxtaccname());
						setTxtaccno(getTxtaccno());
						setLicenseno(getLicenseno());
						setAuthority(getAuthority());
						setMode(getMode());
						setDocno(val);
						setMsg("Successfully Saved");
						return "success";
					}
					else if(val==-1){
						setChkstatus("1");
						setMsg("Code Already Exists.");
						return "fail";
					}
					else if(val==-2){
						setChkstatus("1");
						setMsg("Name Already Exists.");
						return "fail";
					}
					else if(val==-3){
						setChkstatus("1");
						setMsg("Account Already Exists.");
						return "fail";
					}
					else{
						setHidacno(getHidacno());
						setCode(getCode());
						setName(getName());
						setHiddriverdate(getDriverdate());
						setHidlicenseexpiry(getLicenseexpiry());
						setTxtaccname(getTxtaccname());
						setTxtaccno(getTxtaccno());
						setLicenseno(getLicenseno());
						setAuthority(getAuthority());
						setMode(getMode());
						setDocno(val);
						setMsg("Not Saved");
						return "fail";
					}	
	}

	else if(mode.equalsIgnoreCase("E")){
		ArrayList<String> driverarray= new ArrayList<>();
		for(int i=0;i<getGridlength();i++){
			ClsDriverBean driverbean=new ClsDriverBean();
			String temp=requestParams.get("test"+i)[0];
			driverarray.add(temp);
		}
			int Status=driverDAO.edit(getCode(),getName(),sqlStartDate,getHidacno(),getLicenseno(),getAuthority(),session,getMode(),getDocno(),driverarray,getMail(),getFormdetailcode());
			if(Status>0){
				setHidacno(getHidacno());
				setCode(getCode());
				setName(getName());
				setHiddriverdate(getDriverdate());
				setHidlicenseexpiry(getLicenseexpiry());				
				setTxtaccname(getTxtaccname());
				setTxtaccno(getTxtaccno());
				setLicenseno(getLicenseno());
				setAuthority(getAuthority());
				setDocno(getDocno());
				setMode(getMode());
				setMsg("Updated Successfully");
				return "success";
			}
			else if(Status==-1){
				setChkstatus("2");
				setMsg("Code Already Exists.");
				return "fail";
			}
			else if(Status==-2){
				setChkstatus("2");
				setMsg("Name Already Exists.");
				return "fail";
			}
			else if(Status==-3){
				setChkstatus("2");
				setMsg("Account Already Exists.");
				return "fail";
			}
			else{
				setHidacno(getHidacno());
				setCode(getCode());
				setName(getName());
				setHiddriverdate(getDriverdate());
				setHidlicenseexpiry(getLicenseexpiry());				
				setTxtaccname(getTxtaccname());
				setTxtaccno(getTxtaccno());
				setLicenseno(getLicenseno());
				setAuthority(getAuthority());
				setDocno(getDocno());
				setMode(getMode());
				setMsg("Not Updated");
				return "fail";
			}
		}
		
		else if(mode.equalsIgnoreCase("D")){
			boolean Status=driverDAO.delete(getCode(),getName(),sqlStartDate,getTxtaccno(),getLicenseno(),getAuthority(),session,getMode(),getDocno(),getMail(),getFormdetailcode());
		if(Status){
			setHidacno(getHidacno());
			setCode(getCode());
			setName(getName());
			setHiddriverdate(getDriverdate());
			setHidlicenseexpiry(getLicenseexpiry());	
			setTxtaccname(getTxtaccname());
			setTxtaccno(getTxtaccno());
			setLicenseno(getLicenseno());
			setAuthority(getAuthority());
			setDocno(getDocno());
			setMode(getMode());
			setDeleted("DELETED");
			setMsg("Successfully Deleted");
			return "success";
		}
		else{

			setHidacno(getHidacno());
			setCode(getCode());
			setName(getName());
			setHiddriverdate(getDriverdate());
			setHidlicenseexpiry(getLicenseexpiry());	
			setTxtaccname(getTxtaccname());
			setTxtaccno(getTxtaccno());
			setLicenseno(getLicenseno());
			setAuthority(getAuthority());
			setDocno(getDocno());
			setMode(getMode());
			setMsg("Not Deleted");
			return "fail";
		}
	}
	return "fail";
}

	public   JSONArray searchDetails(){
		  JSONArray cellarray = new JSONArray();
		  JSONObject cellobj = null;
		  try {
			  ClsDriverDAO ClsDriverDAO=new ClsDriverDAO();
 			  List <ClsDriverBean> list= ClsDriverDAO.list();
			  for(ClsDriverBean bean:list){
			  cellobj = new JSONObject();
			  cellobj.put("DOC_NO", bean.getDocno());
			  cellobj.put("sal_code",bean.getCode());
			  cellobj.put("sal_name",bean.getName());
			  cellobj.put("date",bean.getDriverdate().toString());
			  cellobj.put("acc_no",bean.getTxtaccno());
			  cellobj.put("mail",bean.getMail());
			  cellobj.put("description", bean.getTxtaccname());
			  cellobj.put("authority",bean.getAuthority());
			  cellobj.put("acdoc",bean.getHidacno());
     		  cellarray.add(cellobj);
			 }
		  } catch (SQLException e) {
			  e.printStackTrace();
		  }
		return cellarray;
	}
}

