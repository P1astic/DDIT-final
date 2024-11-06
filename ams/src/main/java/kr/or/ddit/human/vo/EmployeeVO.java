package kr.or.ddit.human.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.comn.vo.FileDetailVO;
import lombok.Data;

/**
 * @author 김인호
 * 내부직원
 */

@Data
public class EmployeeVO {
	private String memId; // 아이디
	private String empNm; // 사원명
	private String empRrno; // 생년월일
	private String empEml; // 이메일
	private String empMoblphon; // 폰번호
	private String empZip; // 우편번호
	private String empRoadNmAddr; // 도로명주소
	private String empDaddr; // 상세주소
	private String empImgUrl; // 직원 프로필 이미지경로
	private String empImgNm; // 직원사진이름
	private int empYrycDaycnt; // 연차일수
	private String empHdofStat; // 재직상태
	private String empJncmpYmd; // 입사일자
	private String empRsgntnYmd; // 퇴사일자
	private String empAtrzSgn; // 결재서명
	private String jbgdCd; // 직급코드
	private String deptCd; // 부서코드
	private String empGender; //성별
	
	// 24.09.20 결재관련 김인호
	private String[] apvId; // 결재자 아이디
	private String airNm; // 항공사 명
	private String elecApvCn; // 문서내용
	private String tempSeCd; // 문서 구분 코드
	private String elecApvNo; // 문서번호
	private int apvLineDetNo; // 결재순번
	private String elecApvTitle; // 문서제목
	
	// 24.09.18 임세희 사원상세페이지에 필요함
	private String deptNm; //부서명
	private String jbgdNm; // 직급명
	
	// 24.10.19 김예영 마이페이지에 사용
	private String jbgdEnNm; // 직급영어명
	
	// 24.9.13. 권한사용자 목록에서 직급과 부서를 뽑기 위한 변수 추가 홍정호
	private JobGradeVO jobGrade;
	private DeptVO department;
	private AuthVO auth;
	private String authCd;
	private String authCode;
	private String authNm;
	
	
	private int lvDetCd; // 휴가 상세코드
	private String lvBgngYmd; // 휴가 시작일자
	private String lvEndYmd; // 휴가 종료일자
	private String lvDetType; // 휴가 유형
	private String lvDetRsn; // 연차사유
	private int lvUseDay; // 휴가 사용일수
//	private LeaveDetailVO leaveDetailVO; // 휴가상세
	
	//24.09.17 마이페이지 출력을 위한 변수 추가(MemberVO)
	private String password;
	private int enabled; //재직여부
	
	private String rnum;//행번호
	
	//24.09.24 상태 뽀으려궁
	private MemberVO memberVO;
	
	//240924 공통코드
	private CommonCodeDetailVO commonCodeDetailVO;
	
	//241002
	private MultipartFile[] uploadFiles;
	
	private long fileGroupNo;
	//직원 프로필 이미지
	private MultipartFile uploadFile;
	
	private List<FileDetailVO> fileDetailVOList;

	private FileDetailVO fileDetailVO;
}
