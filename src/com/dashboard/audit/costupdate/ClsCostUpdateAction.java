package com.dashboard.audit.costupdate;

import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class ClsCostUpdateAction {
ClsCostupdateDAO costupdatedao=new ClsCostupdateDAO();
private String hidtrno;
private String mode;
private String msg;
private String detail;
private String detailname;


public String getDetail() {
	return detail;
}

public void setDetail(String detail) {
	this.detail = detail;
}

public String getDetailname() {
	return detailname;
}

public void setDetailname(String detailname) {
	this.detailname = detailname;
}

public String getMode() {
	return mode;
}

public void setMode(String mode) {
	this.mode = mode;
}

public String getHidtrno() {
	return hidtrno;
}

public void setHidtrno(String hidtrno) {
	this.hidtrno = hidtrno;
}

public String getMsg() {
	return msg;
}

public void setMsg(String msg) {
	this.msg = msg;
}

public String saveAction() throws ParseException, SQLException{
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	String mode=getMode();
	if(mode.equalsIgnoreCase("A")){
		int val=costupdatedao.insert(getHidtrno());
		if(val>0){
			setMsg("Successfully Saved");
			 setDetail("Audit");
				setDetailname("Cost Update");
			return "success";
		}
		else{
			setMsg("Not Saved");
			setDetail("Audit");
			setDetailname("Cost Update");
			return "fail";
		}
	}
	
	return "fail";
}

}
