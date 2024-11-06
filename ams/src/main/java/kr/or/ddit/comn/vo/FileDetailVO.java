package kr.or.ddit.comn.vo;

import java.util.Date;

import lombok.Data;

@Data
public class FileDetailVO {
	private int fileSn;
	private long fileGroupNo;
	private String fileOrgnlFileNm;
	private String fileStrgFileNm;
	private String fileFilePathNm;
	private long fileSz;
	private String fileFileExtnNm;
	private String fileMime;
	private String fileFancysize;
	private Date fileFileStrgYmd;
	private int fileDwnldCnt;
}
