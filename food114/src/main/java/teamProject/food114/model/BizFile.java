package teamProject.food114.model;

public class BizFile {
	private int bizFileNo;
	private String bizId;
	private String filePath;
	private String fileName;
	private String fileOrgName;
	private int fileSize;
	private String fileEtc;
	private String deleteTime;
	
	private String path;

	public int getBizFileNo() {
		return bizFileNo;
	}

	public void setBizFileNo(int bizFileNo) {
		this.bizFileNo = bizFileNo;
	}

	public String getBizId() {
		return bizId;
	}

	public void setBizId(String bizId) {
		this.bizId = bizId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileOrgName() {
		return fileOrgName;
	}

	public void setFileOrgName(String fileOrgName) {
		this.fileOrgName = fileOrgName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileEtc() {
		return fileEtc;
	}

	public void setFileEtc(String fileEtc) {
		this.fileEtc = fileEtc;
	}

	public String getDeleteTime() {
		return deleteTime;
	}

	public void setDeleteTime(String deleteTime) {
		this.deleteTime = deleteTime;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}