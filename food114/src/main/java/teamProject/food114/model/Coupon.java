package teamProject.food114.model;


public class Coupon {
	private int couponNo;
	private String userId;
	private int couponId;
	private String useYN;
	private String beginDate;
	private String endDate;
	
	//FOOD114_COUPON_DETAIL 테이블 	
	private String title;
	private String contents;
	private double salePercent;
	private double saleAmount;
	
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCouponId() {
		return couponId;
	}
	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public double getSalePercent() {
		return salePercent;
	}
	public void setSalePercent(double salePercent) {
		this.salePercent = salePercent;
	}
	public double getSaleAmount() {
		return saleAmount;
	}
	public void setSaleAmount(double saleMount) {
		this.saleAmount = saleMount;
	}
}
