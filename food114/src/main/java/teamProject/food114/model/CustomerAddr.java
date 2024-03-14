package teamProject.food114.model;

import lombok.Data;

@Data
public class CustomerAddr {
	private int addrNo;
	private String userId;
	private String addrAs;
	private String oldAddr;
	private String newAddr;
	private String detail;
	private String si;
	private String gu;
	private String dong;
	private String defaultYn;
	private String request;	
	
	public String getSi() {
		return si;
	}
	public void setSi(String si) {
		this.si = si;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	
	
}
