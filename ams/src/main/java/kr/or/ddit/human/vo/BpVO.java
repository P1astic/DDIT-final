package kr.or.ddit.human.vo;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.facility.vo.FranchiseVO;
import lombok.Data;

@Data
public class BpVO {
	
	
	private String memId; // 협력업체 아이디
	private String bpNm; // 협력업체 명
	private String bpRprsvNm; // 대표자명
	private String bpTelno; // 유선전화번호
	private String bpBrno; // 사업자등록번호
	private String ctrtYmd; // 계약 시작일자
	private String ctrtEndYmd; // 계약 종료일자
	private String bpImgUrl; // 이미지경로
	private String bpImgNm; // 이미지 명
	private String bpEml; // 협력업체 이메일
	private String deptCd; // 협력업체 구분
	private String bpCtrtStat; // 계약상태
	private String empId; // 담당자 아이디
	
	//권한 추가 
	private String authCd;
	
	private String password;

	//프로필 이미지
	private MultipartFile uploadFile;
	//권한 
	private AuthVO auth;
	
	private String rnum;//행번호
	
	//공통코드
	private CommonCodeDetailVO commonCodeDetailVO;
	
	//  권한사용자 목록에서 직급과 부서를 뽑기 위한 변수 추가
	private JobGradeVO jobGrade;
	private DeptVO departmentVO;
	private String authCode;
	private String authNm;
	
	private String deptNm; // 부서명
	private String comDetCdCn; // 
	private String empNm; // 사원명
	
	private String frnSeCd;	
	private String frnSeCdNm;	
	
	// 아이디 생성
	private MemberVO memberVO; 
	private EmployeeVO employeeVO;
	private FranchiseVO franchiseVO;
}
