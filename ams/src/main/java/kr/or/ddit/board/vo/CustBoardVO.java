package kr.or.ddit.board.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.comn.vo.FileDetailVO;
import lombok.Data;

@Data
public class CustBoardVO {
	private String custBrdNo;
	private String custBrdTtl;
	private String custBrdCn;
	private String custBrdPswd;
	private String custBrdNm;
	private String custBrdAnsYn;
	private Date custBrdRegYmd;
	private long fileGroupNo;
	private int fileSn;
	private String custBrdMbiph;
	private String custBrdEmi;
	private String custBrdAnsty;
	// 답변일
	private String custBrdAnsYmd;

	private String name;

	private int rnum;// 행번호
	private String phnum; // 휴대폰번호뒷자리

	private MultipartFile[] uploadFile;

	private List<FileDetailVO> fileDetailVOList;
}
