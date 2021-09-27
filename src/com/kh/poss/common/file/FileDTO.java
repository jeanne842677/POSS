package com.kh.poss.common.file;

import java.util.Date;

public class FileDTO {

	private String fiIdx;
	private String typeIdx;
	private String originFileName;
	private String renameFileName;
	private String savePath;
	private Date regDate;
	private String downloadLink;
	private int isDel;

	public FileDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getFiIdx() {
		return fiIdx;
	}

	public void setFiIdx(String fiIdx) {
		this.fiIdx = fiIdx;
	}

	public String getTypeIdx() {
		return typeIdx;
	}

	public void setTypeIdx(String typeIdx) {
		this.typeIdx = typeIdx;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	public String getDownloadLink() {
		
		return "/file/" + getSavePath() + getRenameFileName() + "?originFileName=" + getOriginFileName();
		
	}
	

	@Override
	public String toString() {
		return "FileDTO [fiIdx=" + fiIdx + ", typeIdx=" + typeIdx + ", originFileName=" + originFileName
				+ ", renameFileName=" + renameFileName + ", savePath=" + savePath + ", regDate=" + regDate
				+ ", downloadLink=" + downloadLink + ", isDel=" + isDel + "]";
	}
	

}