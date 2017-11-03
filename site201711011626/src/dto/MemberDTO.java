package dto;

import java.sql.Date;

public class MemberDTO {
	 
	private String shopid;
	private String shoppw;
	private String shopname;
	private String shopaddr;
	private String shopaddr2;
	private String shopaddr3;
	private String shopphone;
	private String shopemail;
	private Date regdate;
	
	
	
	
	


	
	

	public MemberDTO(String shopid, String shoppw, String shopname, String shopaddr, String shopaddr2, String shopaddr3,
			String shopphone, String shopemail) {
		super();
		this.shopid = shopid;
		this.shoppw = shoppw;
		this.shopname = shopname;
		this.shopaddr = shopaddr;
		this.shopaddr2 = shopaddr2;
		this.shopaddr3 = shopaddr3;
		this.shopphone = shopphone;
		this.shopemail = shopemail;
	}


	




	public MemberDTO(String shopid, String shopname, String shopaddr, String shopaddr2, String shopaddr3,
			String shopphone, String shopemail) {
		super();
		this.shopid = shopid;
		this.shopname = shopname;
		this.shopaddr = shopaddr;
		this.shopaddr2 = shopaddr2;
		this.shopaddr3 = shopaddr3;
		this.shopphone = shopphone;
		this.shopemail = shopemail;
	}







	public MemberDTO(String shopid, String shopname, String shopaddr, String shopaddr2, String shopaddr3,
			String shopphone, String shopemail, Date regdate) {
		super();
		this.shopid = shopid;
		this.shopname = shopname;
		this.shopaddr = shopaddr;
		this.shopaddr2 = shopaddr2;
		this.shopaddr3 = shopaddr3;
		this.shopphone = shopphone;
		this.shopemail = shopemail;
		this.regdate = regdate;
	}


	public String getShopid() {
		return shopid;
	}


	public void setShopid(String shopid) {
		this.shopid = shopid;
	}


	public String getShoppw() {
		return shoppw;
	}


	public void setShoppw(String shoppw) {
		this.shoppw = shoppw;
	}


	public String getShopname() {
		return shopname;
	}


	public void setShopname(String shopname) {
		this.shopname = shopname;
	}


	public String getShopaddr() {
		return shopaddr;
	}


	public void setShopaddr(String shopaddr) {
		this.shopaddr = shopaddr;
	}


	public String getShopaddr2() {
		return shopaddr2;
	}


	public void setShopaddr2(String shopaddr2) {
		this.shopaddr2 = shopaddr2;
	}


	public String getShopaddr3() {
		return shopaddr3;
	}


	public void setShopaddr3(String shopaddr3) {
		this.shopaddr3 = shopaddr3;
	}


	public String getShopphone() {
		return shopphone;
	}


	public void setShopphone(String shopphone) {
		this.shopphone = shopphone;
	}


	public String getShopemail() {
		return shopemail;
	}


	public void setShopemail(String shopemail) {
		this.shopemail = shopemail;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
	
	