package com.kh.ReaderForChildren.audioBook_sh.model.vo;

import java.sql.Date;

public class AudioFile {
	private int afCode;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	private String userId;
	private int audCode;
	
	public AudioFile() {}

	public AudioFile(int afCode, String originName, String changeName, String filePath, Date uploadDate, String status,
			String userId, int audCode) {
		super();
		this.afCode = afCode;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
		this.userId = userId;
		this.audCode = audCode;
	}

	public int getAfCode() {
		return afCode;
	}

	public void setAfCode(int afCode) {
		this.afCode = afCode;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getAudCode() {
		return audCode;
	}

	public void setAudCode(int audCode) {
		this.audCode = audCode;
	}

	@Override
	public String toString() {
		return "AudioFile [afCode=" + afCode + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status + ", userId=" + userId
				+ ", audCode=" + audCode + "]";
	}
	
}
