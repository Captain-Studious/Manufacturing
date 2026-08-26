package com.manufacturing.productdetails;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.common.ClsCommon;
import com.connection.ClsConnection;
import com.opensymphony.xwork2.ActionSupport;
import com.procurement.purchase.goodsreceiptnote.ClsgoodsreceiptnoteBean;
import com.procurement.purchase.goodsreceiptnote.ClsgoodsreceiptnoteDAO;

public class ClsMProductDetailsAction extends ActionSupport{

	ClsConnection objconn=new ClsConnection();
	ClsCommon objcommon=new ClsCommon();
	ClsMProductDetailsDAO dao=new ClsMProductDetailsDAO();
	private String uomid,brchName,formdetailcode,date,productcode,productname,psrno,method,technote,safetymeasure,uom,volume,qualitypercent,duration,labour,overhead,others,chkactiveprocess,hidchkactiveprocess,mode,deleted,msg,sectype,hidsectype,txtkg,density,typename;
	public String getTxtkg() {
		return txtkg;
	}
	public void setTxtkg(String txtkg) {
		this.txtkg = txtkg;
	}
	public String getDensity() {
		return density;
	}
	public void setDensity(String density) {
		this.density = density;
	}
	public String getSectype() {
		return sectype;
	}
	public void setSectype(String sectype) {
		this.sectype = sectype;
	}
	public String getHidsectype() {
		return hidsectype;
	}
	public void setHidsectype(String hidsectype) {
		this.hidsectype = hidsectype;
	}

	private int vocno,docno,rawmaterialgridlength,packingmaterialgridlength,processgridlength,qualityassurancegridlength,processqagridlength;
	
	
	public String getUomid() {
		return uomid;
	}
	public void setUomid(String uomid) {
		this.uomid = uomid;
	}
	public String getBrchName() {
		return brchName;
	}
	public void setBrchName(String brchName) {
		this.brchName = brchName;
	}
	public String getFormdetailcode() {
		return formdetailcode;
	}
	public void setFormdetailcode(String formdetailcode) {
		this.formdetailcode = formdetailcode;
	}
	public int getVocno() {
		return vocno;
	}
	public void setVocno(int vocno) {
		this.vocno = vocno;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getProductcode() {
		return productcode;
	}
	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getPsrno() {
		return psrno;
	}
	public void setPsrno(String psrno) {
		this.psrno = psrno;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getTechnote() {
		return technote;
	}
	public void setTechnote(String technote) {
		this.technote = technote;
	}
	public String getSafetymeasure() {
		return safetymeasure;
	}
	public void setSafetymeasure(String safetymeasure) {
		this.safetymeasure = safetymeasure;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}
	public String getQualitypercent() {
		return qualitypercent;
	}
	public void setQualitypercent(String qualitypercent) {
		this.qualitypercent = qualitypercent;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getLabour() {
		return labour;
	}
	public void setLabour(String labour) {
		this.labour = labour;
	}
	public String getOverhead() {
		return overhead;
	}
	public void setOverhead(String overhead) {
		this.overhead = overhead;
	}
	public String getOthers() {
		return others;
	}
	public void setOthers(String others) {
		this.others = others;
	}
	public String getChkactiveprocess() {
		return chkactiveprocess;
	}
	public void setChkactiveprocess(String chkactiveprocess) {
		this.chkactiveprocess = chkactiveprocess;
	}
	public String getHidchkactiveprocess() {
		return hidchkactiveprocess;
	}
	public void setHidchkactiveprocess(String hidchkactiveprocess) {
		this.hidchkactiveprocess = hidchkactiveprocess;
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
	public int getDocno() {
		return docno;
	}
	public void setDocno(int docno) {
		this.docno = docno;
	}
	public int getRawmaterialgridlength() {
		return rawmaterialgridlength;
	}
	public void setRawmaterialgridlength(int rawmaterialgridlength) {
		this.rawmaterialgridlength = rawmaterialgridlength;
	}
	public int getPackingmaterialgridlength() {
		return packingmaterialgridlength;
	}
	public void setPackingmaterialgridlength(int packingmaterialgridlength) {
		this.packingmaterialgridlength = packingmaterialgridlength;
	}
	public int getProcessgridlength() {
		return processgridlength;
	}
	public void setProcessgridlength(int processgridlength) {
		this.processgridlength = processgridlength;
	}
	public int getQualityassurancegridlength() {
		return qualityassurancegridlength;
	}
	public void setQualityassurancegridlength(int qualityassurancegridlength) {
		this.qualityassurancegridlength = qualityassurancegridlength;
	}
	public int getProcessqagridlength() {
		return processqagridlength;
	}
	public void setProcessqagridlength(int processqagridlength) {
		this.processqagridlength = processqagridlength;
	}
	
	public void setValues(int docno,int vocno,java.sql.Date sqldate){
		setDocno(docno);
		setVocno(vocno);
		setDate(sqldate.toString());
		setProductcode(getProductcode());
		setProductname(getProductname());
		setPsrno(getPsrno());
		setMethod(getMethod());
		setTechnote(getTechnote());
		setSafetymeasure(getSafetymeasure());
		setUom(getUom());
		setVolume(getVolume());
		setQualitypercent(getQualitypercent());
		setDuration(getDuration());
		setLabour(getLabour());
		setOverhead(getOverhead());
		setOthers(getOthers());
		setHidchkactiveprocess(getHidchkactiveprocess());
		setUomid(getUomid());
		setSectype(getSectype());
		setHidsectype(getSectype());
		setTxtkg(getTxtkg());
		setDensity(getDensity());
	}
	
	public String saveAction() throws ParseException, SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		Map<String, String[]> requestParams = request.getParameterMap();
		ClsMProductDetailsBean viewObj = new ClsMProductDetailsBean();
		String mode=getMode();
		java.sql.Date sqldate=null;
		if(getDate()!=null && !getDate().equalsIgnoreCase("")){
			sqldate=objcommon.changeStringtoSqlDate(getDate());
		}
		ArrayList<String> rawmaterialarray=new ArrayList<>();
		ArrayList<String> packingmaterialarray=new ArrayList<>();
		ArrayList<String> processarray=new ArrayList<>();
		ArrayList<String> qualityassurancearray=new ArrayList<>();
		ArrayList<String> processqaarray=new ArrayList<>();
		
		if(mode.equalsIgnoreCase("A") || mode.equalsIgnoreCase("E")){
			if(getRawmaterialgridlength()>0){
				for(int i=0;i<getRawmaterialgridlength();i++){
					String temp=requestParams.get("rawmaterialarray"+i)[0];
					rawmaterialarray.add(temp);
				}
			}
			if(getPackingmaterialgridlength()>0){
				for(int i=0;i<getPackingmaterialgridlength();i++){
					String temp=requestParams.get("packingmaterialarray"+i)[0];
					packingmaterialarray.add(temp);
				}
			}
			if(getProcessgridlength()>0){
				for(int i=0;i<getProcessgridlength();i++){
					String temp=requestParams.get("processarray"+i)[0];
					processarray.add(temp);
				}
			}
			if(getQualityassurancegridlength()>0){
				for(int i=0;i<getQualityassurancegridlength();i++){
					String temp=requestParams.get("qualityassurancearray"+i)[0];
					qualityassurancearray.add(temp);
				}
			}
			if(getProcessqagridlength()>0){
				for(int i=0;i<getProcessqagridlength();i++){
					String temp=requestParams.get("processqaarray"+i)[0];
					processqaarray.add(temp);
				}
			}
		}
		if(mode.equalsIgnoreCase("A")){
			int val=dao.insert(getProductcode(),getProductname(),getPsrno(),getMethod(),getTechnote(),getSafetymeasure(),getUomid(),getVolume(),getQualitypercent(),
					getDuration(),getLabour(),getOverhead(),getOthers(),getHidchkactiveprocess(),sqldate,mode,session,request,getBrchName(),getFormdetailcode(),getSectype(),getTxtkg(),getDensity());
			int vocno=Integer.parseInt(request.getAttribute("VOCNO").toString());
			if(val>0){
				int detailvalue=dao.insertDetail(val,rawmaterialarray,packingmaterialarray,processarray,qualityassurancearray,processqaarray);
				if(detailvalue>0){
					setValues(val,vocno,sqldate);
					setMsg("Successfully Saved");
					return "success";
				}
				else{
					setValues(val,vocno,sqldate);
					setMsg("Not Saved");
					return "fail";
				}
				
			}
			else{
				setValues(val,vocno,sqldate);
				setMsg("Not Saved");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("E")){
			boolean status=dao.edit(getProductcode(),getProductname(),getPsrno(),getMethod(),getTechnote(),getSafetymeasure(),getUomid(),getVolume(),getQualitypercent(),
					getDuration(),getLabour(),getOverhead(),getOthers(),getHidchkactiveprocess(),sqldate,mode,session,request,getBrchName(),
					getFormdetailcode(),getDocno(),getVocno(),getSectype(),getTxtkg(),getDensity());
			if(status){
				int detailvalue=dao.insertDetail(getDocno(),rawmaterialarray,packingmaterialarray,processarray,qualityassurancearray,processqaarray);
				if(detailvalue>0){
					setValues(getDocno(),getVocno(),sqldate);
					setMsg("Updated Successfully");
					return "success";
				}
				else{
					setValues(getDocno(),getVocno(),sqldate);
					setMsg("Not Updated");
					return "fail";
				}
				
			}
			else{
				setValues(getDocno(),getVocno(),sqldate);
				setMsg("Not Updated");
				return "fail";
			}
		}
		else if(mode.equalsIgnoreCase("view")){
			
			
			viewObj=dao.getViewDetails(getDocno());
			
			
			
			
			setDocno(viewObj.getDocno());
			setVocno(viewObj.getVocno());
			setDate(viewObj.getDate());
			setProductcode(viewObj.getProductcode());
			setPsrno(viewObj.getPsrno());
			setProductname(viewObj.getProductname());
		    setMethod(viewObj.getMethod());
			setTechnote(viewObj.getTechnote());
			setSafetymeasure(viewObj.getSafetymeasure());
			
			setUomid(viewObj.getUomid());
			setUom(viewObj.getUom());
			setVolume(viewObj.getVolume());
			
		    setQualitypercent(viewObj.getQualitypercent());
			
			setDuration(viewObj.getDuration());
		
		    setLabour(viewObj.getLabour());
			setOverhead(viewObj.getOverhead());
		    setOthers(viewObj.getOthers());
			setHidchkactiveprocess(viewObj.getHidchkactiveprocess());
			setHidsectype(viewObj.getHidsectype()); 
			setTxtkg(viewObj.getTxtkg());
			setDensity(viewObj.getDensity());
			setTypename(viewObj.getTypename());
	         return "success";
			
		}
		else if(mode.equalsIgnoreCase("D")){
			boolean status=dao.delete(getProductcode(),getProductname(),getPsrno(),getMethod(),getTechnote(),getSafetymeasure(),getUomid(),getVolume(),getQualitypercent(),
					getDuration(),getLabour(),getOverhead(),getOthers(),getHidchkactiveprocess(),sqldate,mode,session,request,getBrchName(),
					getFormdetailcode(),getDocno(),getVocno(),getSectype(),getTxtkg(),getDensity());
			if(status){
				setValues(getDocno(),getVocno(),sqldate);
				setMsg("Successfully Deleted");
				return "success";
			}
			else{
				setValues(getDocno(),getVocno(),sqldate);
				setMsg("Not Deleted");
				return "fail";
			}
		}
		
		return "fail";
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	}
