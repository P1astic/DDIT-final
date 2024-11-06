package kr.or.ddit.approv.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.JobGradeVO;
import kr.or.ddit.human.vo.LeaveDetailVO;
import lombok.Data;

@Data
public class ElecApvVO {
	private String elecApvNo; // 문서번호
	private String elecApvRegDate; // 문서 기안일
	private String elecApvLastAtrzYmd; // 최종결재일자
	private String elecApvStat; // 문서상태
	private String elecApvCn; // 문서내용
	private Date elecApvRtrvlYmd; // 문서 회수일자
	private long fileGroupNo; // 파일 그룹번호
	private String tempSeCd; // 문서 구분코드
	private String memId; // 직원 아이디
	private String elecApvTitle; // 문서제목
	
	
	// 파일업로드
	private MultipartFile[] uploadFile;
	
	// 24.09.23 결재관련 김인호
	private String apvId;
	private EmployeeVO employeeVO;
	private CommonCodeDetailVO commonCodeDetailVO;
	private ApvDetailVO apvDetailVO;
	private DeptVO deptVO;
	private JobGradeVO jobGradeVO;
	private String apvLineFinYn;
	private int empYrycDaycnt;
	
	private int lvDetCd; // 휴가 상세코드
	private String lvBgngYmd; // 휴가 시작일자
	private String lvEndYmd; // 휴가 종료일자
	private String lvDetType; // 휴가 유형
	private String lvDetRsn; // 연차사유
	private int lvUseDay; // 휴가 사용일수
	
	private LeaveDetailVO leaveDetailVO;
	private String rnum; // 행 번호
}
