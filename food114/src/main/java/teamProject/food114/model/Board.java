package teamProject.food114.model;

import lombok.Data;

@Data
public class Board {

	   private int boardNo;
	   private String title;
	   private String contents;
	   private String beginTime;
	   private String endTime;
	   private String setBeginTime;
	   private String setEndTime;
	   private String userId;
	   private int hit;
	   private int recommend;
	   private String type;
	   private String endYn;
	   private String cdateTime;
	   private String udateTime;
	   private int pboardNo;
	   private int code;
	   private int cnt;
	   private String beginTime2;
	   private String endTime2;
	   private String filePath;
	   private String fileName;
	   private String fileOrgName;
	   private String fileEtc;
	   private String usage;
	   // biz join시
	   private String bizId;

		private String bizName;
	   private String bizFileNo;
		private String bizCategory;
		private String openTime;
		private String closeTime;
		private String opneYN;

}
