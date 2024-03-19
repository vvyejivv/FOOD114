package teamProject.food114.model;

public class Biz {
	private String bizId;
	private String pwd;
	private String bizNo;
	private String bizName;
	private String ownerName;
	private String email;
	private String phone;
	private String oldAddr;
	private String detail;
	private String newAddr;
	private String latitude;
	private String longitude;
	private String cdate;
	private String udate;
	private String bank;
	private String accountNumber;
	private String bizFileNo;
	private String bizCategory;
	private String openTime;
	private String closeTime;
	private String opneYN;
	private String categoryName;
	private String bankName;
	private String open;
	private String close;
	private String shopOpenYN;
	
	//event
	private int eventStatus;

	// 이벤트board 조인시
	private String beginTime2;
	private String endTime2;
	private String beginTime;
	private String endTime;
	private String setBeginTime;
	private String setEndTime;

	// 파일 path (biz_file)
	private String path;
	private String reviewAvg;
	private String reviewCnt;
	
	// 이벤트 내용
	private String title;
	private String contents;
	
	// 총 카운트 수
	private int totalCnt;
	
	// 반경, 배달포장가능여부,주문양
	private String range;
	private String takeOut;
	private String orderCnt;
	
	// 구분문자 포함된 연락처, 오픈시간, 마감시간
	private String sepaPhone;
	private String sepaOpenTime;
	private String sepaCloseTime;
	
	// 배달, 포장 가능여부
	private String devType;
	
	public String getBizId() {
		return bizId;
	}

	public void setBizId(String bizId) {
		this.bizId = bizId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getBizNo() {
		return bizNo;
	}

	public void setBizNo(String bizNo) {
		this.bizNo = bizNo;
	}

	public String getBizName() {
		return bizName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOldAddr() {
		return oldAddr;
	}

	public void setOldAddr(String oldAddr) {
		this.oldAddr = oldAddr;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getNewAddr() {
		return newAddr;
	}

	public void setNewAddr(String newAddr) {
		this.newAddr = newAddr;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getUdate() {
		return udate;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getBizFileNo() {
		return bizFileNo;
	}

	public void setBizFileNo(String bizFileNo) {
		this.bizFileNo = bizFileNo;
	}

	public String getBizCategory() {
		return bizCategory;
	}

	public void setBizCategory(String bizCategory) {
		this.bizCategory = bizCategory;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public String getOpneYN() {
		return opneYN;
	}

	public void setOpneYN(String opneYN) {
		this.opneYN = opneYN;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getReviewAvg() {
		return reviewAvg;
	}

	public void setReviewAvg(String reviewAvg) {
		this.reviewAvg = reviewAvg;
	}

	public String getReviewCnt() {
		return reviewCnt;
	}

	public void setReviewCnt(String reviewCnt) {
		this.reviewCnt = reviewCnt;
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

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getClose() {
		return close;
	}

	public void setClose(String close) {
		this.close = close;
	}

	public String getShopOpenYN() {
		return shopOpenYN;
	}

	public void setShopOpenYN(String shopOpenYN) {
		this.shopOpenYN = shopOpenYN;
	}
		
		public String getBeginTime2() {
		return beginTime2;
	}

	public void setBeginTime2(String beginTime2) {
		this.beginTime2 = beginTime2;
	}

	public String getEndTime2() {
		return endTime2;
	}

	public void setEndTime2(String endTime2) {
		this.endTime2 = endTime2;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getSetBeginTime() {
		return setBeginTime;
	}

	public void setSetBeginTime(String setBeginTime) {
		this.setBeginTime = setBeginTime;
	}

	public String getSetEndTime() {
		return setEndTime;
	}

	public void setSetEndTime(String setEndTime) {
		this.setEndTime = setEndTime;
	}

	public String getRange() {
		return range;
	}

	public void setRange(String range) {
		this.range = range;
	}

	public String getTakeOut() {
		return takeOut;
	}

	public void setTakeOut(String takeOut) {
		this.takeOut = takeOut;
	}

	public String getSepaPhone() {
		return sepaPhone;
	}

	public void setSepaPhone(String sepaPhone) {
		this.sepaPhone = sepaPhone;
	}

	public String getSepaOpenTime() {
		return sepaOpenTime;
	}

	public void setSepaOpenTime(String sepaOpenTime) {
		this.sepaOpenTime = sepaOpenTime;
	}

	public String getSepaCloseTime() {
		return sepaCloseTime;
	}

	public void setSepaCloseTime(String sepaCloseTime) {
		this.sepaCloseTime = sepaCloseTime;
	}

	public String getDevType() {
		return devType;
	}

	public void setDevType(String devType) {
		this.devType = devType;
	}
}