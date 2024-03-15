package teamProject.food114.model;

import lombok.Data;

@Data
public class Payment {
	private int payNo;
	private int orderNo;
	private String payId;
	private int applyCoupon;
	private int price;
	private String payDate;
	private String type;
}
