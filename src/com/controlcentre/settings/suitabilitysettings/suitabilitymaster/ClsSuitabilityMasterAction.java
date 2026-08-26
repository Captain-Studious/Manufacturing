package com.controlcentre.settings.suitabilitysettings.suitabilitymaster;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.common.ClsCommon;


public class ClsSuitabilityMasterAction {
	ClsSuitabilityMasterDAO pDAO= new ClsSuitabilityMasterDAO();

	private int docno;
	private String mode,msg1;
	private String deleted;
	private String msg;
	private String formdetail;
	private String formdetailcode;
	private String ptmdate;
	private String ptmtype;
	private String brand;
	private String branddesc;
	private String date;
	private String unit;
	private String unitdesc;
	private String chkstatus;
	private Double unitfr;
	private String txtcategory;
	private String model; 
	private String brandid;
	private String subcat;
	private String category;
	private String dept;
	private String suitspec;
	private String suitdesc;
	private String yom;
	private String modelid;
	private String submodel;
	private String submodelid;
	
	private String yomfrm;
	private String yomto;
	
	private String esize;
	
	private String csize1;
	private String csize2;
	private String csize3;
	
	private String bsize1;
	private String bsize2;
	private String bsize3;
	
	
	private int yomfrmid;
	private int yomtoid;
	
	private String esizeid;
	
	private String csize1id;
	private String csize2id;
	private String csize3id;
	
	private String bsize1id;
	private String bsize2id;
	private String bsize3id;
	
	
	
	


		
	public String getMsg1() {
		return msg1;
	}
	public void setMsg1(String msg1) {
		this.msg1 = msg1;
	}
	public String getYomfrm() {
		return yomfrm;
	}
	public void setYomfrm(String yomfrm) {
		this.yomfrm = yomfrm;
	}
	public String getYomto() {
		return yomto;
	}
	public void setYomto(String yomto) {
		this.yomto = yomto;
	}
	public String getEsize() {
		return esize;
	}
	public void setEsize(String esize) {
		this.esize = esize;
	}
	public String getCsize1() {
		return csize1;
	}
	public void setCsize1(String csize1) {
		this.csize1 = csize1;
	}
	public String getCsize2() {
		return csize2;
	}
	public void setCsize2(String csize2) {
		this.csize2 = csize2;
	}
	public String getCsize3() {
		return csize3;
	}
	public void setCsize3(String csize3) {
		this.csize3 = csize3;
	}
	public String getBsize1() {
		return bsize1;
	}
	public void setBsize1(String bsize1) {
		this.bsize1 = bsize1;
	}
	public String getBsize2() {
		return bsize2;
	}
	public void setBsize2(String bsize2) {
		this.bsize2 = bsize2;
	}
	public String getBsize3() {
		return bsize3;
	}
	public void setBsize3(String bsize3) {
		this.bsize3 = bsize3;
	}
	public int getYomfrmid() {
		return yomfrmid;
	}
	public void setYomfrmid(int yomfrmid) {
		this.yomfrmid = yomfrmid;
	}
	public int getYomtoid() {
		return yomtoid;
	}
	public void setYomtoid(int yomtoid) {
		this.yomtoid = yomtoid;
	}
	public String getEsizeid() {
		return esizeid;
	}
	public void setEsizeid(String esizeid) {
		this.esizeid = esizeid;
	}
	public String getCsize1id() {
		return csize1id;
	}
	public void setCsize1id(String csize1id) {
		this.csize1id = csize1id;
	}
	public String getCsize2id() {
		return csize2id;
	}
	public void setCsize2id(String csize2id) {
		this.csize2id = csize2id;
	}
	public String getCsize3id() {
		return csize3id;
	}
	public void setCsize3id(String csize3id) {
		this.csize3id = csize3id;
	}
	public String getBsize1id() {
		return bsize1id;
	}
	public void setBsize1id(String bsize1id) {
		this.bsize1id = bsize1id;
	}
	public String getBsize2id() {
		return bsize2id;
	}
	public void setBsize2id(String bsize2id) {
		this.bsize2id = bsize2id;
	}
	public String getBsize3id() {
		return bsize3id;
	}
	public void setBsize3id(String bsize3id) {
		this.bsize3id = bsize3id;
	}
	public String getSubmodelid() {
		return submodelid;
	}
	public void setSubmodelid(String submodelid) {
		this.submodelid = submodelid;
	}
	public String getModelid() {
		return modelid;
	}
	public void setModelid(String modelid) {
		this.modelid = modelid;
	}
	public String getSubmodel() {
		return submodel;
	}
	public void setSubmodel(String submodel) {
		this.submodel = submodel;
	}
	public String getYom() {
		return yom;
	}
	public void setYom(String yom) {
		this.yom = yom;
	}
	public String getSuitspec() {
		return suitspec;
	}
	public void setSuitspec(String suitspec) {
		this.suitspec = suitspec;
	}
	public String getSuitdesc() {
		return suitdesc;
	}
	public void setSuitdesc(String suitdesc) {
		this.suitdesc = suitdesc;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getDocno() {
		return docno;
	}
	public void setDocno(int docno) {
		this.docno = docno;
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
	public String getPtmdate() {
		return ptmdate;
	}
	public void setPtmdate(String ptmdate) {
		this.ptmdate = ptmdate;
	}
	public String getPtmtype() {
		return ptmtype;
	}
	public void setPtmtype(String ptmtype) {
		this.ptmtype = ptmtype;
	}

	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getBranddesc() {
		return branddesc;
	}
	public void setBranddesc(String branddesc) {
		this.branddesc = branddesc;
	}

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getUnitdesc() {
		return unitdesc;
	}
	public void setUnitdesc(String unitdesc) {
		this.unitdesc = unitdesc;
	}
	public String getChkstatus() {
		return chkstatus;
	}
	public void setChkstatus(String chkstatus) {
		this.chkstatus = chkstatus;
	}
	public Double getUnitfr() {
		return unitfr;
	}
	public void setUnitfr(Double unitfr) {
		this.unitfr = unitfr;
	}
	public String getTxtcategory() {
		return txtcategory;
	}
	public void setTxtcategory(String txtcategory) {
		this.txtcategory = txtcategory;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getBrandid() {
		return brandid;
	}
	public void setBrandid(String brandid) {
		this.brandid = brandid;
	}
	public String getSubcat() {
		return subcat;
	}
	public void setSubcat(String subcat) {
		this.subcat = subcat;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	ClsCommon ClsCommon=new ClsCommon();
	public String savetypeAction() throws SQLException{


		System.out.println("savetypeAction suitability");

		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		String returns="";
		try{
			java.sql.Date date = ClsCommon.changeStringtoSqlDate(getPtmdate());
			if(mode.equalsIgnoreCase("A")){


				int val=pDAO.insert(date,getFormdetail(),getFormdetailcode(),getPtmtype(),getMode() );
				if(val>0){
					setDocno(val);
					setMsg("Successfully Saved");
					setChkstatus("0");
					returns="success";
					
					setDate(date+"");

				}
				else if(val==-1){
					setDate(date+"");
					//setBrand(getBrand());
					setChkstatus("1");
					setMsg("Type Already Exists");
					//request.setAttribute("SAVED", "Not Saved");
					//addActionError("Not Saved");
					return "fail";
				}

				else{

					setMsg("Not Saved");
					setDate(date+"");

					returns="fail";
				}	
			}

			else if(mode.equalsIgnoreCase("E")){


				int val=pDAO.update(date,getFormdetail(),getFormdetailcode(),getPtmtype(),getMode(),getDocno() );
				if(val>0.0){
					setDocno(val);
					setDate(date+"");
					setMsg("Updated Successfully");
					setChkstatus("0");
					returns="success";

				}
				else if(val==-1){
					setDate(date+"");
					setBrand(getBrand());
					setChkstatus("2");
					setMsg("Type Already Exists");
					//request.setAttribute("SAVED", "Not Saved");
					//addActionError("Not Saved");
					return "fail";
				}

				else{
					setDate(date+"");
					setMsg("Not Updated");

					returns="fail";
				}	
			}

			else if(mode.equalsIgnoreCase("D")){


				int val=pDAO.delete(date,getFormdetail(),getFormdetailcode(),getPtmtype(),getMode(),getDocno() );
				if(val>0.0){
					/*setDocno(0);*/
					setPtmtype("");
					setDate(date+"");
					setMsg("Deleted Successfully");
					setDeleted("DELETED");
					returns="success";

				}

				else{

					setMsg("Not Deleted");
					setDate(date+"");
					returns="fail";
				}	
			}

		}catch(Exception e){
			e.printStackTrace();
		}


		return returns;

	}


	public String savebrandAction() throws ParseException, SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();

		String mode=getMode();


		java.sql.Date sqlStartDate = ClsCommon.changeStringtoSqlDate(getDate());

		if(mode.equalsIgnoreCase("A")){
		 	//	System.out.println("date---"+sqlStartDate);
			int val=pDAO.binsert(sqlStartDate,getBrand(),getBranddesc(),getMode(),session,getFormdetailcode(),getYomfrmid(),getYomtoid());
			if(val>0){
				
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				
				
				setChkstatus("0");
				setBrand(getBrand());
				setDocno(val);
				setDate(sqlStartDate+"");
				//session.setAttribute("SAVED", "SUCCESSFULLY SAVED");
				setMsg("Successfully Saved");
				//addActionMessage("Saved Successfully");
				//							System.out.println(session.getAttribute("SAVED"));
				return "success";
			}
			else if(val==-1){
				
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setDate(sqlStartDate+"");
				setBrand(getBrand());
				setChkstatus("1");
				setMsg("Brand Already Exists");
				//request.setAttribute("SAVED", "Not Saved");
				//addActionError("Not Saved");
				return "fail";
			}
			else{
				
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setDate(sqlStartDate+"");
				setBrand(getBrand());
				setMsg("Not Saved");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("E")){
			int Status=pDAO.bedit(getDocno(),sqlStartDate,getBrand(),getBranddesc(),session,getFormdetailcode(),getYomfrmid(),getYomtoid());
			if(Status>0){
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setDate(sqlStartDate+"");
				setBrand(getBrand());
				setDocno(getDocno());
				setMsg("Updated Successfully");
				setChkstatus("0");
				return "success";
			}
			else if(Status==-1){
				setDate(sqlStartDate+"");
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setBrand(getBrand());
				setDocno(getDocno());

				setChkstatus("2");
				setMsg("Brand Already Exists");
				return "fail";

			}
			else{
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setDate(sqlStartDate+"");
				setBrand(getBrand());
				setDocno(getDocno());
				setMsg("Not Updated");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("D")){
			int Status=pDAO.bdelete(getDocno(),session,getBrand(),getFormdetailcode());
			if(Status>0){
				setDate(sqlStartDate+"");
				setBrand(getBrand());
				setDocno(getDocno());
				setDeleted("DELETED");
				setMsg("Successfully Deleted");
				return "success";
			}
			else if(Status==-2){
				setDate(sqlStartDate+"");

				setBrand(getBrand());
				setDocno(getDocno());
				setMsg("");
				setMsg1("References Present in Other Documents");
				return "fail";
			}
			else{
				setDate(sqlStartDate+"");
				setBrand(getBrand());
				setDocno(getDocno());
				setMsg("Not Deleted");
				return "fail";
			}
		}
		return "fail";
	}


	public String savemodelAction() throws ParseException, SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();


		session.getAttribute("BranchName");


		String mode=getMode();

		java.sql.Date sqlStartDate=null;
		if((mode.equalsIgnoreCase("A"))||(mode.equalsIgnoreCase("E"))){
			sqlStartDate = ClsCommon.changeStringtoSqlDate(getDate());

		}

		if(mode.equalsIgnoreCase("A")){
			int val=pDAO.insert(getModel(),getBrand(),sqlStartDate,session,getMode(),getFormdetailcode(),getYomfrmid(),getYomtoid());
			if(val>0.0){
				setDate(sqlStartDate+"");
				setModel(getModel());
				setBrandid(getBrand());
				setMode(getMode());
				setChkstatus("0");
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				//							System.out.println(val);
				setDocno(val);
				setMsg("Successfully Saved");
				return "success";
			}
			else if(val==-1){
				setDate(sqlStartDate+"");
				setModel(getModel());
				setBrandid(getBrand());
				setMode(getMode());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				//							System.out.println(val);
				//setDocno(val);
				setChkstatus("1");
				setMsg("Model Already Exists");
				return "fail";
			}
			else{
				setDate(sqlStartDate+"");
				setModel(getModel());
				setBrandid(getBrand());
				setMode(getMode());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				//							System.out.println(val);
				setDocno(val);
				setMsg("Not Saved");
				return "fail";
			}
		}


		else if(mode.equalsIgnoreCase("E")){
			int Status=pDAO.edit(getModel(),getDocno(),sqlStartDate,getBrand(),getMode(),session,getFormdetailcode(),getYomfrmid(),getYomtoid());
			if(Status>0){
				setDate(sqlStartDate+"");
				setModel(getModel());
				setDocno(getDocno());
				setBrandid(getBrand());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setChkstatus("0");
				//					System.out.println("Action"+getBrandid());
				setMode(getMode());
				setMsg("Updated Successfully");

				return "success";
			}
			else if(Status==-1){
				setDate(sqlStartDate+"");
				setModel(getModel());
				setDocno(getDocno());
				setBrandid(getBrand());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				//					System.out.println("Action"+getBrandid());
				//setMode(getMode());
				setChkstatus("2");
				setMsg("Model Already Exists");
				return "fail";
			}
			else{
				setDate(sqlStartDate+"");
				setModel(getModel());
				setDocno(getDocno());
				setBrandid(getBrand());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				//					System.out.println("Action"+getBrandid());
				setMode(getMode());
				setMsg("Not Updated");

				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("D")){
			//				System.out.println(getDocno()+","+getBrandid()+","+getModeldate());
			int Status=pDAO.delete(getModel(),getDocno(),sqlStartDate,getBrand(),getMode(),session,getFormdetailcode());
			if(Status>0){
				setModel(getModel());
				setDocno(getDocno());
				setBrandid(getBrand());
				setBrand(getBrand());
				setDeleted("DELETED");
				setMsg("Successfully Deleted");
				setDate(sqlStartDate+"");

				return "success";
			}
			else if(Status==-2){
				setModel(getModel());
				setDocno(getDocno());
				setBrandid(getBrand());
				setBrand(getBrand());
				setDate(sqlStartDate+"");
				setMsg("");
				setMsg1("References Present in Other Documents");
				return "fail";
			}
			else{
				setModel(getModel());
				setDocno(getDocno());
				setBrandid(getBrand());
				setBrand(getBrand());
				setDate(sqlStartDate+"");
				setMsg("Not Deleted");

				return "fail";
			}
		}
		return "fail";
	}
	public String saveSubmodelAction() throws ParseException, SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();


		session.getAttribute("BranchName");


		String mode=getMode();

		java.sql.Date sqlStartDate=null;
		if((mode.equalsIgnoreCase("A"))||(mode.equalsIgnoreCase("E"))){
			sqlStartDate = ClsCommon.changeStringtoSqlDate(getDate());

		}

		if(mode.equalsIgnoreCase("A")){
			int val=pDAO.submodelinsert(getSubmodel(),getModel(),getBrand(),sqlStartDate,session,getMode(),getFormdetailcode(),getYomfrmid(),getYomtoid());
			if(val>0.0){
				setDate(sqlStartDate+"");
				setSubmodel(getSubmodel());
				setBrandid(getBrand());
				setBrand(getBrand());
				setModel(getModel());
				setModelid(getModel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setMode(getMode());
				//							System.out.println(val);
				setDocno(val);
				setChkstatus("0");
				setMsg("Successfully Saved");
				return "success";
			}
			else if(val==-1){
				setDate(sqlStartDate+"");
				setSubmodel(getSubmodel());
				setBrandid(getBrand());
				setBrand(getBrand());
				setModel(getModel());
				setModelid(getModel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setMode(getMode());
				setChkstatus("1");
				//							System.out.println(val);
				//setDocno(val);
				setChkstatus("1");
				setMsg("Submodel Already Exists");
				return "fail";
			}
			else{
				setDate(sqlStartDate+"");
				setSubmodel(getSubmodel());
				setBrandid(getBrand());
				setBrand(getBrand());
				setModel(getModel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setModelid(getModel());
				setMode(getMode());
				//							System.out.println(val);
				setDocno(val);
				setMsg("Not Saved");
				return "fail";
			}
		}


		else if(mode.equalsIgnoreCase("E")){
			int Status=pDAO.submodeledit(getSubmodel(),getModel(),getDocno(),sqlStartDate,getBrand(),getMode(),session,getFormdetailcode(),getYomfrmid(),getYomtoid());
			if(Status>0){
				setDate(sqlStartDate+"");
				//setModel(getModel());
				setSubmodel(getSubmodel());
				setBrandid(getBrand());
				setBrand(getBrand());
				setModel(getModel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setMode(getMode());
				setModelid(getModel());
				//					System.out.println("Action"+getBrandid());
				setMode(getMode());
				setChkstatus("0");
				setMsg("Updated Successfully");

				return "success";
			}
			else if(Status==-1){
				setDate(sqlStartDate+"");
				setSubmodel(getSubmodel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setBrandid(getBrand());
				setBrand(getBrand());
				setModel(getModel());
				setMode(getMode());
				setModelid(getModel());
				//					System.out.println("Action"+getBrandid());
				//setMode(getMode());
				setChkstatus("2");
				setMsg("Submodel Already Exists");
				return "fail";
			}
			else{
				setDate(sqlStartDate+"");
				setSubmodel(getSubmodel());
				setBrandid(getBrand());
				setBrand(getBrand());
				setModel(getModel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setMode(getMode());
				setModelid(getModel());
				//					System.out.println("Action"+getBrandid());
				setMode(getMode());
				setMsg("Not Updated");

				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("D")){
			//				System.out.println(getDocno()+","+getBrandid()+","+getModeldate());
			int Status=pDAO.submodeldelete(getSubmodel(),getModel(),getDocno(),sqlStartDate,getBrand(),getMode(),session,getFormdetailcode());
			if(Status>0){
				setDate(sqlStartDate+"");
				setSubmodel(getSubmodel());
				setBrandid(getBrand());
				setBrand(getBrand());
				setModel(getModel());
				
				setMode(getMode());
				setModelid(getModel());
				setDeleted("DELETED");
				setMsg("Successfully Deleted");

				return "success";
			}
			else if(Status==-2){
				setDate(sqlStartDate+"");
				setSubmodel(getSubmodel());
				setBrandid(getBrand());
				setBrand(getBrand());
				setModel(getModel());
				setMode(getMode());
				setModelid(getModel());
				setMsg("");
				setMsg1("References Present in Other Documents");
				return "fail";
			}
			else{
				setDate(sqlStartDate+"");
				setSubmodel(getSubmodel());
				setBrandid(getBrand());
				setBrand(getBrand());
				setModel(getModel());
				setMode(getMode());
				setModelid(getModel());
				setMsg("Not Deleted");

				return "fail";
			}
		}
		return "fail";
	}


	public String savesuitspec1Action() throws ParseException, SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();

		String mode=getMode();

		String specs="spec1";
 
		
		if(mode.equalsIgnoreCase("A")){
			java.sql.Date sqlStartDate = ClsCommon.changeStringtoSqlDate(getDate());

			//			System.out.println("date---"+sqlStartDate);
			int val=pDAO.insert(sqlStartDate,getBrandid(),getModelid(),getSubmodelid(),getSuitspec(),getSuitdesc(),getMode(),session,getFormdetailcode(),specs,getYomfrmid(),getYomtoid());
			System.out.println("retn val1 save="+val);
			if(val>0){
				setDate(sqlStartDate+"");
				setModel(getModel());
				setModelid(getModelid());
				setSuitspec(getSuitspec());
				setDocno(val);
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setChkstatus("0");
				//session.setAttribute("SAVED", "SUCCESSFULLY SAVED");
				setMsg("Successfully Saved");
				//addActionMessage("Saved Successfully");
				//							System.out.println(session.getAttribute("SAVED"));
				return "success";
			}
			else if(val==-11){
				setDate(sqlStartDate+"");
				setModel(getModel());
				setModelid(getModelid());
				setSuitspec(getSuitspec());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setChkstatus("1");
				setMsg("Bedsize Already Exists");
				//request.setAttribute("SAVED", "Not Saved");
				//addActionError("Not Saved");
				return "fail";
			}
			
			
			else{
				setDate(sqlStartDate+"");
				setBrand(getBrand());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setMsg("Not Saved");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("E")){
			java.sql.Date sqlStartDate = ClsCommon.changeStringtoSqlDate(getDate());

			int Status=pDAO.edit(getDocno(),sqlStartDate,getBrandid(),getModelid(),getSubmodelid(),getSuitspec(),getSuitdesc(),getMode(),session,getFormdetailcode(),specs,getYomfrmid(),getYomtoid());
			System.out.println("retn val1 edit="+Status);
			if(Status>0){
				setDate(sqlStartDate+"");
				setModel(getModel());
				setModelid(getModelid());
				setSuitspec(getSuitspec());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setDocno(getDocno());
				setChkstatus("0");
				setMsg("Updated Successfully");
				return "success";
			}
			else if(Status==-11){
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setChkstatus("2");
				setModel(getModel());
				setModelid(getModelid());


				setMsg(" Bedsize Already Exists");
				return "fail";

			}
		
			else{
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setDocno(getDocno());
				setMsg("Not Updated");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("D")){
			int Status=pDAO.delete(getDocno(),session,getSuitspec(),getFormdetailcode(),specs);
			if(Status>0){
//				setDate("");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				
				setDeleted("DELETED");
				setMsg("Successfully Deleted");
				return "success";
			}
			else if(Status==-2){
	//			setDate("");

				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("");
				setMsg1("References Present in Other Documents");
				return "fail";
			}
			else{
		//		setDate("");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("Not Deleted");
				return "fail";
			}
		}
		return "fail";
	}	


	public String savesuitspec2Action() throws ParseException, SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();

		String mode=getMode();

		String specs="spec2";

		

		if(mode.equalsIgnoreCase("A")){
			//			System.out.println("date---"+sqlStartDate);
			java.sql.Date sqlStartDate = ClsCommon.changeStringtoSqlDate(getDate());
			int val=pDAO.insert(sqlStartDate,getBrandid(),getModelid(),getSubmodelid(),getSuitspec(),getSuitdesc(),getMode(),session,getFormdetailcode(),specs,getYomfrmid(),getYomtoid());
			System.out.println("retn val2 sav="+val);
			if(val>0){
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(val);
				setChkstatus("0");
				setModel(getModel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setModelid(getModelid());
				//session.setAttribute("SAVED", "SUCCESSFULLY SAVED");
				setMsg("Successfully Saved");
			//	addActionMessage("Saved Successfully");
				//							System.out.println(session.getAttribute("SAVED"));
				return "success";
			}
			
			else if(val==-12){
				setDate(sqlStartDate+"");

				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("Enginsize Already Exists");
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setChkstatus("1");
				setModel(getModel());
				setModelid(getModelid());
				//request.setAttribute("SAVED", "Not Saved");
				//addActionError("Not Saved");
				return "fail";
			}
			
			else{
				setDate(sqlStartDate+"");

				//setBrand(getBrand());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setMsg("Not Saved");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("E")){
			java.sql.Date sqlStartDate = ClsCommon.changeStringtoSqlDate(getDate());
			int Status=pDAO.edit(getDocno(),sqlStartDate,getBrandid(),getModelid(),getSubmodelid(),getSuitspec(),getSuitdesc(),getMode(),session,getFormdetailcode(),specs,getYomfrmid(),getYomtoid());
			System.out.println("retn val2 edit="+Status);
			if(Status>0){
				setDate(sqlStartDate+"");
				setModel(getModel());
				setModelid(getModelid());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setChkstatus("0");
				setMsg("Updated Successfully");
				return "success";
			}
			else if(Status==-12){
				setDate(sqlStartDate+"");

				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setMsg("Enginsize Already Exists");
				setChkstatus("1");
				setModel(getModel());
				setModelid(getModelid());
				//request.setAttribute("SAVED", "Not Saved");
				//addActionError("Not Saved");
				return "fail";
			}
			
			else{
				setDate(sqlStartDate+"");
				setModel(getModel());
				setModelid(getModelid());
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setMsg("Not Updated");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("D")){ 
			
			int Status=pDAO.delete(getDocno(),session,getSuitspec(),getFormdetailcode(),specs);
			if(Status>0){
				//setDate("");

				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setDeleted("DELETED");
				setMsg("Successfully Deleted");
				return "success";
			}
			else if(Status==-2){
				
				//setDate(sqlStartDate+"");

				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("");
				setMsg1("References Present in Other Documents");
				return "fail";
			}
			else{
				//setDate(sqlStartDate+"");
				setModel(getModel());
				setModelid(getModelid());
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("Not Deleted");
				return "fail";
			}
		}
		return "fail";
	}


	public String savesuitspec3Action() throws ParseException, SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();

		String mode=getMode();

		String specs="spec3";

		if(mode.equalsIgnoreCase("A")){

			java.sql.Date sqlStartDate = ClsCommon.changeStringtoSqlDate(getDate());

			//			System.out.println("date---"+sqlStartDate);
			int val=pDAO.insert(sqlStartDate,getBrandid(),getModelid(),getSubmodelid(),getSuitspec(),getSuitdesc(),getMode(),session,getFormdetailcode(),specs,getYomfrmid(),getYomtoid());
			System.out.println("retn val3 sav="+val);
			if(val>0){
				setDate(sqlStartDate+"");

				setSuitspec(getSuitspec());
				setDocno(val);
				setBrand(getBrand());
				setModel(getModel());
				setModelid(getModelid());
				setSubmodel(getSubmodel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setChkstatus("0");
				//session.setAttribute("SAVED", "SUCCESSFULLY SAVED");
				setMsg("Successfully Saved");
				//addActionMessage("Saved Successfully");
				//							System.out.println(session.getAttribute("SAVED"));
				return "success";
			}
		
			else if(val==-13){
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setBrand(getBrand());
				setModel(getModel());
				setModelid(getModelid());
				setSubmodel(getSubmodel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setSuitspec(getSuitspec());
				setChkstatus("1");
				setMsg("Cabinsize Already Exists");
				//request.setAttribute("SAVED", "Not Saved");
				//addActionError("Not Saved");
				return "fail";
			}
			else{
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(val);
				setBrand(getBrand());
				setModel(getModel());
				setModelid(getModelid());
				setSubmodel(getSubmodel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setMsg("Not Saved");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("E")){

			java.sql.Date sqlStartDate = ClsCommon.changeStringtoSqlDate(getDate());

			int Status=pDAO.edit(getDocno(),sqlStartDate,getBrandid(),getModelid(),getSubmodelid(),getSuitspec(),getSuitdesc(),getMode(),session,getFormdetailcode(),specs,getYomfrmid(),getYomtoid());
			System.out.println("retn val3 edit="+Status);
			if(Status>0){
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setChkstatus("0");
				setModelid(getModelid());
				setModel(getModel());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setMsg("Updated Successfully");
				return "success";
			}
			else if(Status==-13){
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setBrand(getBrand());
				setModel(getModel());  //==============
				setModelid(getModelid());
				setSubmodel(getSubmodel());
				setSuitspec(getSuitspec());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setChkstatus("1");
				setMsg("Cabinsize Already Exists");
				//request.setAttribute("SAVED", "Not Saved");
				//addActionError("Not Saved");
				return "fail";
			}
			else{
				setDate(sqlStartDate+"");

				setSuitspec(getSuitspec());
				setYomfrm(getYomfrm());
				setYomto(getYomto());
				setYomfrmid(getYomfrmid());
				setYomtoid(getYomtoid());
				setDocno(getDocno());
				setMsg("Not Updated");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("D")){
			
			int Status=pDAO.delete(getDocno(),session,getSuitspec(),getFormdetailcode(),specs);
			if(Status>0){
				//setDate(sqlStartDate+"");

				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setDeleted("DELETED");
				setMsg("Successfully Deleted");
				return "success";
			}
			else if(Status==-2){
			//	setDate(sqlStartDate+"");

				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("");
				setMsg1("References Present in Other Documents");
				return "fail";
			}
			else{
				//setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("Not Deleted");
				return "fail";
			}
		}
		return "fail";
	}
	
	
	public String saveSuitVehAction() throws ParseException, SQLException{
	/*	HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();

		String mode=getMode();



		java.sql.Date sqlStartDate = ClsCommon.changeStringtoSqlDate(getDate());

		if(mode.equalsIgnoreCase("A")){
			//			System.out.println("date---"+sqlStartDate);
			int val=pDAO.insert(sqlStartDate,getYomfrm(),getYomto(),getYomfrmid(),getYomtoid(),getBrandid(),getModelid(),getSubmodelid(),getEsizeid(),getCsize1id(),
					getCsize2id(),getCsize3id(),getBsize1id(),getBsize2id(),getBsize3id(),getMode(),session,getFormdetailcode());
			if(val>0){
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(val);
				setBrand(getBrand());
				setModel(getModel());
				setSubmodel(getSubmodel());
				setChkstatus("0");
				setMsg("Successfully Saved");
				addActionMessage("Saved Successfully");
				return "success";
			}
			else if(val==-1){
				setDate(sqlStartDate+"");
				setBrand(getBrand());
				setModel(getModel());
				setSubmodel(getSubmodel());
				setSuitspec(getSuitspec());
				setChkstatus("1");
				setMsg(" Already Exists");
				//request.setAttribute("SAVED", "Not Saved");
				//addActionError("Not Saved");
				return "fail";
			}
			else{
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(val);
				setBrand(getBrand());
				setModel(getModel());
				setSubmodel(getSubmodel());
				setMsg("Not Saved");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("E")){
			int Status=pDAO.edit(getDocno(),sqlStartDate,getYomfrm(),getYomto(),getYomfrmid(),getYomtoid(),getBrandid(),getModelid(),getSubmodelid(),getEsizeid(),getCsize1id(),
					getCsize2id(),getCsize3id(),getBsize1id(),getBsize2id(),getBsize3id(),getMode(),session,getFormdetailcode());
			if(Status>0){
				setDate(sqlStartDate+"");
				setChkstatus("0");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("Updated Successfully");
				return "success";
			}
			else if(Status==-1){
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setChkstatus("2");
				setMsg(" Already Exists");
				return "fail";

			}
			else{
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("Not Updated");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("D")){
			int Status=pDAO.delete(getDocno(),sqlStartDate,getYomfrm(),getYomto(),getYomfrmid(),getYomtoid(),getBrandid(),getModelid(),getSubmodelid(),getEsizeid(),getCsize1id(),
					getCsize2id(),getCsize3id(),getBsize1id(),getBsize2id(),getBsize3id(),getMode(),session,getFormdetailcode());
			if(Status>0){
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setDeleted("DELETED");
				setMsg("Successfully Deleted");
				return "success";
			}
			else if(Status==-2){
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("References Present in Other Documents");
				return "fail";
			}
			else{
				setDate(sqlStartDate+"");
				setSuitspec(getSuitspec());
				setDocno(getDocno());
				setMsg("Not Deleted");
				return "fail";
			}
		}*/
		return "fail";
	}


	public String savesuitYomAction() throws SQLException{



		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		String returns="";
		try{
			java.sql.Date date = ClsCommon.changeStringtoSqlDate(getDate());
			if(mode.equalsIgnoreCase("A")){


				int val=pDAO.insertYom(date,getFormdetail(),getFormdetailcode(),getYom(),getMode() );
				if(val>0){
					setDate(date+"");
					setDocno(val);
					setMsg("Successfully Saved");
					setChkstatus("0");

					returns="success";

				}
				else if(val==-1){
					setDate(date+"");
					setDocno(val);
					setChkstatus("1");
					setMsg(" Already Exists");
					//request.setAttribute("SAVED", "Not Saved");
					//addActionError("Not Saved");
					return "fail";
				}

				else{
					setDate(date+"");

					setMsg("Not Saved");

					returns="fail";
				}	
			}

			else if(mode.equalsIgnoreCase("E")){


				int val=pDAO.updateYom(date,getFormdetail(),getFormdetailcode(),getYom(),getMode(),getDocno() );
				if(val>0.0){
					setDate(date+"");
					setDocno(val);
					setMsg("Updated Successfully");
					setChkstatus("0");
					returns="success";

				}
				else if(val==-1){
					setDate(date+"");
					setDocno(val);
					setChkstatus("2");
					setMsg(" Already Exists");
					//request.setAttribute("SAVED", "Not Saved");
					//addActionError("Not Saved");
					return "fail";
				}


				else{
					setDate(date+"");

					setMsg("Not Updated");
					setChkstatus("2");
					returns="fail";
				}	
			}

			else if(mode.equalsIgnoreCase("D")){


				int val=pDAO.deleteYom(date,getFormdetail(),getFormdetailcode(),getYom(),getMode(),getDocno() );
				if(val>0.0){
					setDate(date+"");
					/*setDocno(0);*/
					setPtmtype("");
					setMsg("Deleted Successfully");

					returns="success";

				}

				else{
					setDate(date+"");

					setMsg("Not Saved");

					returns="fail";
				}	
			}

		}catch(Exception e){
			e.printStackTrace();
		}


		return returns;

	}
	
	
}

