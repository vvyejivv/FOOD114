package teamProject.food114.model;


public class Review {
	private int reviewNo;
	private int orderNo;
	private String userId;
	private int raiting;
	private String contents;
	private String cdateTime;
	private int p_reviewNo;
	private String bizId;
	private String orderDate;
	private int menuNo;
	private int categoryNo;
	private String menu;
	private String price;
	private String menuInfo;
	private int status;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRaiting() {
		return raiting;
	}
	public void setRaiting(int raiting) {
		this.raiting = raiting;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCdateTime() {
		return cdateTime;
	}
	public void setCdateTime(String cdateTime) {
		this.cdateTime = cdateTime;
	}
	public int getP_reviewNo() {
		return p_reviewNo;
	}
	public void setP_reviewNo(int p_reviewNo) {
		this.p_reviewNo = p_reviewNo;
	}
	public String getBizId() {
		return bizId;
	}
	public void setBizId(String bizId) {
		this.bizId = bizId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
}
