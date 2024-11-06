package kr.or.ddit.board.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.comn.vo.FileDetailVO;
import lombok.Data;

// NOTICE_BOARD VO
@Data
public class BoardVO {
	private String ntcBrdNo;
	private String memId;
	private String ntcBrdType;
	private String ntcBrdTtl;
	private String ntcBrdRegYmd;
	private String ntcBrdCn;
	private int ntcBrdInqCnt;
	private long fileGroupNo;
	private String empNm;
	
	private int rnum;//행번호
	
	private MultipartFile[] uploadFile;
	
	private List<FileDetailVO> fileDetailVOList;
}
