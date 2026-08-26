package com.controlcentre.masters.client;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.common.ClsCommon;


public class ClsClientAction    {
	

	/*ClsClientBean clsClientBean = new ClsClientBean();*/
	
	ClsCommon ClsCommon=new ClsCommon();
	
		private String clientDate;
		private String hidClientDate;
		private String txtcode;
		private String txtclient_name;
		private int currency;
		private int hidcmbcurrencyid;
		private String docno;
		private String cmbgroup;
		private String hidcmbgroup;
		private int cmbcategory;
		private int hidcmbcategory;
		private String cmbsalesman;
		private String hidcmbsalesman;
		private int cmbsalesmanid;
		private int hidcmbsalesmanid;
		private int cmbacgroup;
		private int hidcmbacgroup;
		private String txtaccount;
		private String txttinno;
		private String txtcstno;
		private String formdetailcode;
		private Double txtcredit_period_min=0.0;
		private Double txtcredit_period_max=0.0;
		private Double txtcredit_limit=0.0;
		private String txtaddress;
		private String txtextnno;
		private String txttelephone;
		private String txtmobile;
		private String txtfax;
		private String txtemail;
		private String txtweb;
		private String txtcontact;
		private String txtarea;
		private String txtareadet;
		private int txtareaid;
		
		private String txtaccountno;
		private String txtbankname;
		private String txtbranchname;
		private String txtbranchaddress,txtsalesman;
		private String txtswiftno;
		private String txtibanno;
		private String txtcity;
		private String txtcountry;
		private int countryid,salid;
		private int cpgridlength,vehdetgridlength;
		private String mode;
		private String msg;
		
		private int currencyid;
		private String deleted;
	    private String txtfinname;
	    private String txtfinaddress;
		private String txtserv_taxno;
		private String txtpanno;
		
	
	
		public int getVehdetgridlength() {
			return vehdetgridlength;
		}

		public void setVehdetgridlength(int vehdetgridlength) {
			this.vehdetgridlength = vehdetgridlength;
		}

		public String getTxtserv_taxno() {
			return txtserv_taxno;
		}

		public void setTxtserv_taxno(String txtserv_taxno) {
			this.txtserv_taxno = txtserv_taxno;
		}

		public String getTxtpanno() {
			return txtpanno;
		}

		public void setTxtpanno(String txtpanno) {
			this.txtpanno = txtpanno;
		}

		public String getTxtsalesman() {
			return txtsalesman;
		}

		public void setTxtsalesman(String txtsalesman) {
			this.txtsalesman = txtsalesman;
		}

		public int getSalid() {
			return salid;
		}

		public void setSalid(int salid) {
			this.salid = salid;
		}

		public String getTxtfinname() {
			return txtfinname;
		}

		public void setTxtfinname(String txtfinname) {
			this.txtfinname = txtfinname;
		}

		public String getTxtfinaddress() {
			return txtfinaddress;
		}

		public void setTxtfinaddress(String txtfinaddress) {
			this.txtfinaddress = txtfinaddress;
		}

		public String getDeleted() {
			return deleted;
		}

		public void setDeleted(String deleted) {
			this.deleted = deleted;
		}

		public String getFormdetailcode() {
			return formdetailcode;
		}

		public void setFormdetailcode(String formdetailcode) {
			this.formdetailcode = formdetailcode;
		}

		public int getHidcmbcurrencyid() {
			return hidcmbcurrencyid;
		}

		public void setHidcmbcurrencyid(int hidcmbcurrencyid) {
			this.hidcmbcurrencyid = hidcmbcurrencyid;
		}

		public int getCurrencyid() {
			return currencyid;
		}

		public void setCurrencyid(int currencyid) {
			this.currencyid = currencyid;
		}

		public int getCountryid() {
			return countryid;
		}

		public void setCountryid(int countryid) {
			this.countryid = countryid;
		}

		public String getMsg() {
			return msg;
		}

		public void setMsg(String msg) {
			this.msg = msg;
		}

		public String getClientDate() {
			return clientDate;
		}

		public void setClientDate(String clientDate) {
			this.clientDate = clientDate;
		}



		public String getHidClientDate() {
			return hidClientDate;
		}
		public void setHidClientDate(String hidClientDate) {
			this.hidClientDate = hidClientDate;
		}



		public String getTxtcode() {
			return txtcode;
		}
		public void setTxtcode(String txtcode) {
			this.txtcode = txtcode;
		}



		public String getTxtclient_name() {
			return txtclient_name;
		}
		public void setTxtclient_name(String txtclient_name) {
			this.txtclient_name = txtclient_name;
		}



		public int getCurrency() {
			return currency;
		}
		public void setCurrency(int currency) {
			this.currency = currency;
		}

		

		

		public String getDocno() {
			return docno;
		}

		public void setDocno(String docno) {
			this.docno = docno;
		}

		public String getCmbgroup() {
			return cmbgroup;
		}
		public void setCmbgroup(String cmbgroup) {
			this.cmbgroup = cmbgroup;
		}




		public String getHidcmbgroup() {
			return hidcmbgroup;
		}
		public void setHidcmbgroup(String hidcmbgroup) {
			this.hidcmbgroup = hidcmbgroup;
		}



		public int getCmbcategory() {
			return cmbcategory;
		}
		public void setCmbcategory(int cmbcategory) {
			this.cmbcategory = cmbcategory;
		}



		public int getHidcmbcategory() {
			return hidcmbcategory;
		}
		public void setHidcmbcategory(int hidcmbcategory) {
			this.hidcmbcategory = hidcmbcategory;
		}


		public String getCmbsalesman() {
			return cmbsalesman;
		}
		public void setCmbsalesman(String cmbsalesman) {
			this.cmbsalesman = cmbsalesman;
		}



		public String getHidcmbsalesman() {
			return hidcmbsalesman;
		}
		public void setHidcmbsalesman(String hidcmbsalesman) {
			this.hidcmbsalesman = hidcmbsalesman;
		}




		public String getTxtaccount() {
			return txtaccount;
		}
		public void setTxtaccount(String txtaccount) {
			this.txtaccount = txtaccount;
		}



		public String getTxttinno() {
			return txttinno;
		}
		public void setTxttinno(String txttinno) {
			this.txttinno = txttinno;
		}



		public String getTxtcstno() {
			return txtcstno;
		}
		public void setTxtcstno(String txtcstno) {
			this.txtcstno = txtcstno;
		}



		public Double getTxtcredit_period_min() {
			return txtcredit_period_min;
		}
		public void setTxtcredit_period_min(Double txtcredit_period_min) {
			this.txtcredit_period_min = txtcredit_period_min;
		}



		public Double getTxtcredit_period_max() {
			return txtcredit_period_max;
		}
		public void setTxtcredit_period_max(Double txtcredit_period_max) {
			this.txtcredit_period_max = txtcredit_period_max;
		}



		public Double getTxtcredit_limit() {
			return txtcredit_limit;
		}
		public void setTxtcredit_limit(Double txtcredit_limit) {
			this.txtcredit_limit = txtcredit_limit;
		}


		public String getTxtaddress() {
			return txtaddress;
		}
		public void setTxtaddress(String txtaddress) {
			this.txtaddress = txtaddress;
		}


		public String getTxtextnno() {
			return txtextnno;
		}
		public void setTxtextnno(String txtextnno) {
			this.txtextnno = txtextnno;
		}



		public String getTxttelephone() {
			return txttelephone;
		}
		public void setTxttelephone(String txttelephone) {
			this.txttelephone = txttelephone;
		}



		public String getTxtmobile() {
			return txtmobile;
		}
		public void setTxtmobile(String txtmobile) {
			this.txtmobile = txtmobile;
		}



		public String getTxtfax() {
			return txtfax;
		}
		public void setTxtfax(String txtfax) {
			this.txtfax = txtfax;
		}


		public String getTxtemail() {
			return txtemail;
		}
		public void setTxtemail(String txtemail) {
			this.txtemail = txtemail;
		}


		public String getTxtweb() {
			return txtweb;
		}
		public void setTxtweb(String txtweb) {
			this.txtweb = txtweb;
		}



		public String getTxtcontact() {
			return txtcontact;
		}
		public void setTxtcontact(String txtcontact) {
			this.txtcontact = txtcontact;
		}




		public String getTxtarea() {
			return txtarea;
		}
		public void setTxtarea(String txtarea) {
			this.txtarea = txtarea;
		}



		public String getTxtareadet() {
			return txtareadet;
		}
		public void setTxtareadet(String txtareadet) {
			this.txtareadet = txtareadet;
		}


		public int getTxtareaid() {
			return txtareaid;
		}
		public void setTxtareaid(int txtareaid) {
			this.txtareaid = txtareaid;
		}



		public String getTxtaccountno() {
			return txtaccountno;
		}
		public void setTxtaccountno(String txtaccountno) {
			this.txtaccountno = txtaccountno;
		}



		public String getTxtbankname() {
			return txtbankname;
		}
		public void setTxtbankname(String txtbankname) {
			this.txtbankname = txtbankname;
		}




		public String getTxtbranchname() {
			return txtbranchname;
		}
		public void setTxtbranchname(String txtbranchname) {
			this.txtbranchname = txtbranchname;
		}




		public String getTxtbranchaddress() {
			return txtbranchaddress;
		}
		public void setTxtbranchaddress(String txtbranchaddress) {
			this.txtbranchaddress = txtbranchaddress;
		}



		public String getTxtswiftno() {
			return txtswiftno;
		}
		public void setTxtswiftno(String txtswiftno) {
			this.txtswiftno = txtswiftno;
		}


		public String getTxtibanno() {
			return txtibanno;
		}
		public void setTxtibanno(String txtibanno) {
			this.txtibanno = txtibanno;
		}



		public String getTxtcity() {
			return txtcity;
		}
		public void setTxtcity(String txtcity) {
			this.txtcity = txtcity;
		}




		public String getTxtcountry() {
			return txtcountry;
		}
		public void setTxtcountry(String txtcountry) {
			this.txtcountry = txtcountry;
		}



		public int getCpgridlength() {
			return cpgridlength;
		}
		public void setCpgridlength(int cpgridlength) {
			this.cpgridlength = cpgridlength;
		}




		public int getCmbsalesmanid() {
			return cmbsalesmanid;
		}

		public void setCmbsalesmanid(int cmbsalesmanid) {
			this.cmbsalesmanid = cmbsalesmanid;
		}

		public int getHidcmbsalesmanid() {
			return hidcmbsalesmanid;
		}

		public void setHidcmbsalesmanid(int hidcmbsalesmanid) {
			this.hidcmbsalesmanid = hidcmbsalesmanid;
		}

		public int getCmbacgroup() {
			return cmbacgroup;
		}

		public void setCmbacgroup(int cmbacgroup) {
			this.cmbacgroup = cmbacgroup;
		}

		public int getHidcmbacgroup() {
			return hidcmbacgroup;
		}

		public void setHidcmbacgroup(int hidcmbacgroup) {
			this.hidcmbacgroup = hidcmbacgroup;
		}

		public String getMode() {
			return mode;
		}
		public void setMode(String mode) {
			this.mode = mode;
		}




	
		 

	public String saveClientMaster() throws ParseException, SQLException
	{
		
		
		String result="";
		try{
		ClsClientDAO clientDAO= new ClsClientDAO();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		String mode=getMode();
		String formcode="";
		int val=0;
		System.out.println("==mode===="+mode);
		/*formcode=session.getAttribute("Code").toString();*/
		Map<String, String[]> requestParams = request.getParameterMap();
		
		if(mode.equalsIgnoreCase("A")){
     	   
     	 
     	  
     	   java.sql.Date sqlDate = ClsCommon.changeStringtoSqlDate(getClientDate());
     	   
     	   ArrayList<String> cparray= new ArrayList<>();
     	  ArrayList<String> veharray= new ArrayList<>();
     	   
				for(int i=0;i<getCpgridlength();i++){
					
					
					
				 String temp=requestParams.get("test"+i)[0];
				 
				 cparray.add(temp);
				 System.out.println("==cparray===="+cparray);
				}
				
				for(int i=0;i<getVehdetgridlength();i++){
					
					
					
					 String temp1=requestParams.get("vehtest"+i)[0];
					 
					 veharray.add(temp1);
				 
					}
					
					
				
				
				
				
				
				System.out.println(getTxtclient_name()+","+getCurrencyid()+","+getCmbacgroup()+","+getCmbsalesmanid()+","+getCmbsalesman()+","+getTxtcstno()+","+getTxttinno()+","+getTxtcredit_period_min()+","+getTxtcredit_period_max()+","+getTxtcredit_limit()+","+getTxtaddress()+","+getTxtextnno()+","+getTxtmobile()+","+getTxttelephone()+","+getTxtfax()+","+getTxtweb()+","+getTxtemail()+","+getTxtcontact()+","+getTxtarea()+","+getTxtareadet()+","+getTxtareaid()+","+getTxtaccountno()+","+getTxtbankname()+","+getTxtbranchname()+","+getTxtbranchaddress()+","+getTxtswiftno()+","+getTxtibanno()+","+getTxtcity()+","+getCountryid()+",'"+getFormdetailcode()+"pan'"+getTxtserv_taxno()+";"+getTxtpanno());
				
				
				val=clientDAO.insert(sqlDate,getTxtclient_name(),getCurrencyid(),getCmbacgroup(),getCmbsalesmanid(),getCmbcategory(),getTxtcstno(),getTxttinno(),
						getTxtcredit_period_min(),getTxtcredit_period_max(),getTxtcredit_limit(),getTxtaddress(),getTxtextnno(),getTxtmobile(),getTxttelephone(),
						getTxtfax(),getTxtweb(),getTxtemail(),getTxtcontact(),getTxtareaid(),getTxtaccountno(),getTxtbankname(),
						getTxtbranchname(),getTxtbranchaddress(),getTxtswiftno(),getTxtibanno(),getTxtcity(),getCountryid(),
						getTxtcontact(),cparray,session,getMode(),getFormdetailcode(),getTxtfinname(),getTxtfinaddress(),request,getSalid(),getTxtserv_taxno(),getTxtpanno(),veharray);
				
				if(val>0)
				{
					reloadData(val);
					setTxtaccount(request.getAttribute("documentNo").toString());
					
					
					int id=(int) request.getAttribute("catids");
					
					
					System.out.println("======id========="+id);
					
					setHidcmbcategory(id);
					
					setSalid(getSalid());
					 setTxtsalesman(getTxtsalesman());
					setMsg("Successfully Saved");
					result="success";
				}
				else
				{
					setSalid(getSalid());
					 setTxtsalesman(getTxtsalesman());
					result="fail";
					setMsg("Not Saved");
				}
				
		}
		
		else if(mode.equalsIgnoreCase("D")){
			
			val=clientDAO.delete(getDocno(),session);
			
			if(val>0)
			{
				reloadData(val);
	 
				setMsg("Successfully Deleted");
				setDeleted("DELETED");
				result="success";
			}
			else
			{
				result="fail";
				setMsg("failed");
			}
			
		}
		
else if(mode.equalsIgnoreCase("E")){
			
	System.out.println("==getClientDate()==="+getClientDate());
	  
	   java.sql.Date sqlDate = ClsCommon.changeStringtoSqlDate(getClientDate());
	   
	   System.out.println("==sqlDate==="+sqlDate);
	   
	   ArrayList<String> cparray= new ArrayList<>();
			for(int i=0;i<getCpgridlength();i++){
				/*System.out.println("nullnullnullnull"+getCpgridlength());
				if(requestParams.get("test"+i)[0]==null || requestParams.get("test"+i)[0].equals(null))
					{
					continue;
					}*/
				
			 String temp=requestParams.get("test"+i)[0];
			 
			 cparray.add(temp);
			 System.out.println("==cparray===="+cparray);
			}
			
			
	     	  ArrayList<String> veharray= new ArrayList<>();
	     	   
				 
					for(int i=0;i<getVehdetgridlength();i++){
						
						
						
						 String temp1=requestParams.get("vehtest"+i)[0];
						 
						 veharray.add(temp1);
					 
						}
						
						
			
			
			
			System.out.println(getTxtclient_name()+","+getCurrencyid()+","+getCmbacgroup()+","+getCmbsalesmanid()+","+getCmbsalesman()+","+getTxtcstno()+","+getTxttinno()+","+getTxtcredit_period_min()+","+getTxtcredit_period_max()+","+getTxtcredit_limit()+","+getTxtaddress()+","+getTxtextnno()+","+getTxtmobile()+","+getTxttelephone()+","+getTxtfax()+","+getTxtweb()+","+getTxtemail()+","+getTxtcontact()+","+getTxtarea()+","+getTxtareadet()+","+getTxtareaid()+","+getTxtaccountno()+","+getTxtbankname()+","+getTxtbranchname()+","+getTxtbranchaddress()+","+getTxtswiftno()+","+getTxtibanno()+","+getTxtcity()+","+getCountryid()+"");
			
			//energy,1, 1,1,0,,987654321,1234567789,30,40,60,ambur house,112,9744987412,101,852741,www.gatewayerp.com,krishnan@gatewayerp.com,nthin,thrissur,banglore,INDIA,ASIA,1,123456,BOB,manuthy,manuthy po manuthy,2134,5678,thrissur,india
			
			val=clientDAO.update(sqlDate,getTxtclient_name(),getCurrencyid(),getCmbacgroup(),5,getCmbcategory(),getTxtcstno(),getTxttinno(),
					getTxtcredit_period_min(),getTxtcredit_period_max(),getTxtcredit_limit(),getTxtaddress(),getTxtextnno(),getTxtmobile(),getTxttelephone(),
					getTxtfax(),getTxtweb(),getTxtemail(),getTxtcontact(),getTxtareaid(),getTxtaccountno(),getTxtbankname(),
					getTxtbranchname(),getTxtbranchaddress(),getTxtswiftno(),getTxtibanno(),getTxtcity(),getCountryid(),getTxtcontact(),cparray,session,getMode(),
					getTxtcode(),getTxtaccount(),getFormdetailcode(),getTxtfinname(),getTxtfinaddress(),getSalid(),getTxtserv_taxno(),getTxtpanno(),veharray);
			
			if(val>0)
			{
				reloadData(val);
				setMsg("Updated Successfully");
				result="success";
				
			}
			else
			{
				result="fail";
				setMsg("Not Updated");
				
			}
	
			
		}
		
		else if(mode.equalsIgnoreCase("View")){
			
			System.out.println("==1====");
			
			ClsClientBean  clbean= new ClsClientBean();
			ClsClientDAO dao= new ClsClientDAO();
			System.out.println("==2====");
			clbean=dao.getViewDetails(session,getTxtcode());
			
			System.out.println("==2==---------------------=="+clbean.getTxtsalesman());

			
			
			setTxtserv_taxno(clbean.getTxtserv_taxno());
			
			setTxtpanno(clbean.getTxtpanno());
			
			
			setSalid(clbean.getSalid());
			setTxtsalesman(clbean.getTxtsalesman());
			
			setTxtcode(clbean.getTxtcode());
			setClientDate(clbean.getClientDate());
			setHidClientDate(clbean.getHidClientDate());
			setTxtclient_name(clbean.getTxtclient_name());
			setCurrencyid(clbean.getCurrencyid());
			setHidcmbcurrencyid(clbean.getHidcmbcurrencyid());
			setCmbacgroup(clbean.getCmbacgroup());
			setHidcmbacgroup(clbean.getHidcmbacgroup());
			setCmbcategory(clbean.getCmbcategory());
			setHidcmbcategory(clbean.getHidcmbcategory());
			setTxtcstno(clbean.getTxtcstno());
			setTxttinno(clbean.getTxttinno());
			setTxtcredit_period_min(clbean.getTxtcredit_period_min());
			setTxtcredit_period_max(clbean.getTxtcredit_period_max());
			setTxtcredit_limit(clbean.getTxtcredit_limit());
			setTxtaddress(clbean.getTxtaddress());
			setTxtextnno(clbean.getTxtextnno());
			setTxtmobile(clbean.getTxtmobile());
			setTxtfax(clbean.getTxtfax());
			setTxtweb(clbean.getTxtweb());
			setTxttelephone(clbean.getTxttelephone());
			setTxtemail(clbean.getTxtemail());
			setTxtcontact(clbean.getTxtcontact());
			setTxtareaid(clbean.getTxtareaid());
			setTxtareadet(clbean.getTxtareadet());
			setTxtarea(clbean.getTxtarea());
			setTxtaccountno(clbean.getTxtaccountno());
			setTxtbankname(clbean.getTxtbankname());
			setTxtbranchname(clbean.getTxtbranchname());
			setTxtbranchaddress(clbean.getTxtbranchaddress());
			setTxtswiftno(clbean.getTxtswiftno());
			setTxtibanno(clbean.getTxtibanno());
			setTxtcity(clbean.getTxtcity());
			setTxtcountry(clbean.getTxtcountry());
			setTxtaccount(clbean.getTxtaccount());
			setDocno(clbean.getDocno());
			setTxtfinname(clbean.getTxtfinname());
			setTxtfinaddress(clbean.getTxtfinaddress());
			result="success";
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		
		return result;
		
	}
	
	public void reloadData(int docno)
	{
		//String cldocno=docno+"";
		
		setTxtcode(docno+"");
		setClientDate(ClsCommon.changeStringtoSqlDate(getClientDate()).toString());
		//setHidClientDate(ClsCommon.changeStringtoSqlDate(getClientDate()).toString());
		setTxtclient_name(getTxtclient_name());
		setHidcmbcurrencyid(getCurrencyid());
		setCmbacgroup(getCmbacgroup());
		setHidcmbacgroup(getCmbacgroup());
		setCmbsalesmanid(getCmbsalesmanid());
		setCmbcategory(getCmbcategory());
		setHidcmbcategory(getCmbcategory());
		setTxtcstno(getTxtcstno());
		setTxttinno(getTxttinno());
		setTxtcredit_period_min(getTxtcredit_period_min());
		setTxtcredit_period_max(getTxtcredit_period_max());
		setTxtcredit_limit(getTxtcredit_limit());
		setTxtaddress(getTxtaddress());
		setTxtextnno(getTxtextnno());
		setTxtmobile(getTxtmobile());
		setTxttelephone(getTxttelephone());
		setTxtfax(getTxtfax());
		setTxtweb(getTxtweb());
		setTxtemail(getTxtemail());
		setTxtcontact(getTxtcontact());
		setTxtareaid(getTxtareaid());
		setTxtaccountno(getTxtaccountno());
		setTxtbankname(getTxtbankname());
		setTxtbranchname(getTxtbranchname());
		setTxtbranchaddress(getTxtbranchaddress());
		setTxtswiftno(getTxtswiftno());
		setTxtibanno(getTxtibanno());
		setTxtcity(getTxtcity());
		setTxtcountry(getTxtcountry());
		setTxtcontact(getTxtcontact());
		setDocno(docno+"");
		setTxtaccount(getTxtaccount());
		setMode(getMode());
	}
	
	}
