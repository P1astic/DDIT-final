package kr.or.ddit.human.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.auth.service.AuthService;
import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.util.FileController;
import kr.or.ddit.comn.util.UploadController;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.service.DeptService;
import kr.or.ddit.human.service.EmployeeService;
import kr.or.ddit.human.util.EmployeePagination;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.JobGradeVO;
import kr.or.ddit.human.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/emp/employee")
@Slf4j
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	@Inject
	DeptService deptService; 
	
	@Autowired
	PasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	FileController fileController;
	
	@Inject
	UploadController uploadController;
	
	
	@Inject
	AuthService authService;
	/** 사원 리스트
	 * 240924 임세희
	 * @param model
	 * @return
	 * 
	 *  
	 *  [검색]
	 *  1. 카테고리
	 *   - 부서, 직급, 재직상태
	 *  2. 키워드
	 *   - 나머지
	 */
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(value="getDepts", required=false, defaultValue="") String getDepts,//부서목록 
			@RequestParam(value="getJobGrades", required=false, defaultValue="") String getJobGrades,//직급목록
			@RequestParam(value="getEmpStats", required=false, defaultValue="") String getEmpStats,//재직상태 목록
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			) {
		Map<String, Object> empMap = new HashMap<String, Object>();
	
		empMap.put("getDepts", getDepts);
		empMap.put("getJobGrades", getJobGrades);
		empMap.put("getEmpStats", getEmpStats);
		empMap.put("gubun", gubun);
		empMap.put("keyword", keyword);
		empMap.put("currentPage", currentPage);
		log.info("1. 들어온 값 empMap : "+ empMap);
		
		//전체 행의 수 
		int total = this.employeeService.getTotal(empMap);
		log.info("total : "+ total);

		//부서, 직급, 재직상태  목록 불러오기
		List<DeptVO> getDept = this.employeeService.getDepts();
		List<JobGradeVO>  getJobGrade = this.employeeService.getJobGrades();
		List<CommonCodeDetailVO> getEmpStat = this.employeeService.getEmpStats();
		
		//사원 목록 불러오기*******사원 목록********
		List<EmployeeVO> employeeVOList = this.employeeService.list(empMap);
		log.info("2. 조회한 값  empMap ==> employeeVOList : "+ employeeVOList);
		
		//페이지 네이션 객체
		EmployeePagination<EmployeeVO> articlePage = new EmployeePagination<EmployeeVO>(total, currentPage, 15, employeeVOList, empMap);
		log.info("articlePage : " + articlePage);
		
		//담기
		model.addAttribute("articlePage", articlePage);
		model.addAttribute("getDept",getDept); //부서
		model.addAttribute("getJobGrade",getJobGrade); //직급
		model.addAttribute("getEmpStat",getEmpStat); //재직상태
		
		
		return "emp/employee/list";
	}
	
	/** 사원상세페이지
	 * 
	 * @param memId
	 * @param mav
	 * @return
	 */
	@GetMapping("/detail") //VO로 받을 것이냐 RequestParam으로 받을 것인가
	public String detail(Model model, 
	                     @RequestParam(value="memId", required=true) String memId) {
	    log.info("detail ==> memId : " + memId);
	    
	    // 1) 상세 정보 조회
	    List<EmployeeVO> employeeVOList = this.employeeService.detail(memId);
	    
	    EmployeeVO employeeVO = null;

	    // 리스트가 비어있지 않은 경우 첫 번째 요소 선택
	    if (employeeVOList != null && !employeeVOList.isEmpty()) {
	        employeeVO = employeeVOList.get(0);  // 첫 번째 EmployeeVO 선택
	        log.info("detail ==> employeeVO : " + employeeVO);
	    } else {
	        // 리스트가 비어있는 경우 처리할 로직
	        log.info("No employee found with the given memId.");
	    }
	    
	    List<MemberVO> memberVOList = this.employeeService.memList(memId);
	    log.info("detail ==> memberVOList : " + memberVOList);
	    int enabled = 0;
	    for (MemberVO memberVO : memberVOList) {
	    	enabled = memberVO.getEnabled(); // 계정상태 가져오기
	    	log.info("detail ==> 계정상태enabled : " + enabled); // 계정상태 출력 1이면 활성화 0이면 비활성화
	    }
	    
	    // employeeVO를 model에 추가
	    model.addAttribute("enabled", enabled);
	    model.addAttribute("memberVOList", memberVOList);
	    model.addAttribute("employeeVO", employeeVO);
	    
	    // forwarding: jsp
	    return "emp/employee/detail";
	}
	
	/** 사원등록 요청
	 * 
	 * @return 
	 */
	@GetMapping("/regist")
	public String regist(Model model) {
		log.info("잘왔당");
		
		List<AuthVO> authVOList = this.employeeService.authList();
		model.addAttribute("authVOList", authVOList);
		
		return "emp/employee/regist";
	}
	
	
	/**
	 *  직원 등록 실행
	 * @param memberVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/registPost")
	public  Map<String, Object> registPost( Model model,@ModelAttribute EmployeeVO employeeVO) {
		log.info("받은 값 registPost -> employeeVO : " + employeeVO);
		
		//empRrno : 받은 생년월일 -> 초기비밀번호 생성 및 암호화
		String pwd = employeeVO.getEmpRrno();
		String encodedPwd = this.bcryptPasswordEncoder.encode(pwd); 
		log.info("encodedPwd : " +encodedPwd );
		
		//중첩된 자바빈을 처리  -> employeeVO의 memberVO에 set할수 있음
		MemberVO memberVO = new MemberVO();
		memberVO.setPassword(encodedPwd);
		
		employeeVO.setMemberVO(memberVO);
		
		//등록결과 
		int result = this.employeeService.registPost(employeeVO);
		//.registPost() 메서드에 갔다오면 employeeVO 객체의 memId 프로퍼티에 새롭게 생성된 값이 할당
		//selectKey resultType="String" order="BEFORE" keyProperty="memId">
		log.info("insert 결과 registPost -> result : " + result);
		log.info("비밀번호 세팅 후 employeeVO: " + employeeVO);

		Map<String, Object> response = new HashMap<>();
		
		//PL/SQL 이 성공 시 -1을 리턴
		if(result == -1) {//insert 성공
			response.put("result", "success");
			response.put("memId", employeeVO.getMemId());
		}else{//insert 실패
			response.put("result", "error");
			response.put("memId", "");
		}
		
//		model.addAttribute("employeeVO", employeeVO); 
		log.info("registPost 결과 -> response : " + response);
		//다른 회원도 임의의 아이디를 파라미터로 보내서 확인할 수 있게됨(x)
		return response;
	}
	
	/**
	 * 사원 아이디 중복확인
	 * 요청URI /idCheckPost
	 * 요청파라미터 {memId}
	 * 요청방식 post
	 */
	@ResponseBody
	@PostMapping("/idCheckPost")
		public boolean selectById(@RequestBody String memId) {
		log.info("memId :" + memId);
		
		boolean result = this.employeeService.selectById(memId);
		log.info("result : " + result);
		
		return result;
	}
	
	@GetMapping("/attendance/main")
	public String attendanceMain() {
		return "emp/attendance/main";
	}
	
	

	//사원 수정 요청
		@GetMapping("/edit")
		public String edit(Model model,		
				@RequestParam(value="memId", required=true) String memId) {
			log.info("edit==> memId : " + memId);
			
			  // 1) 상세 정보 조회
		    List<EmployeeVO> employeeVOList = this.employeeService.detail(memId);
		    
		    EmployeeVO employeeVO = null;

		    // 리스트가 비어있지 않은 경우 첫 번째 요소 선택
		    if (employeeVOList != null && !employeeVOList.isEmpty()) {
		        employeeVO = employeeVOList.get(0);  // 첫 번째 EmployeeVO 선택
		        log.info("detail ==> employeeVO : " + employeeVO);
		    } else {
		        // 리스트가 비어있는 경우 처리할 로직
		        log.info("No employee found with the given memId.");
		    }
		    
			List<MemberVO> memberVOList = this.employeeService.memList(memId);
		    log.info("불러와따 memberVOList : " + memberVOList);
		    
		    
		    String password2 = null;
		    for (MemberVO memberVO : memberVOList) {
		    	password2 = memberVO.getPassword(); // 비밀번호 가져오기
		        log.info("비밀번호 password2: " + password2); // 비밀번호 출력
		        
		    }
		    
		    String spass = password2.substring(0,8);
		    log.info("비밀번호 spass: " + spass); // 비밀번호 출력
		    
//	        // 비밀번호 확인
//	        if (BCrypt.checkpw(inputPassword, hashedPassword)) {
//	            System.out.println("비밀번호가 일치합니다.");
//	        } else {
//	            System.out.println("비밀번호가 일치하지 않습니다.");
//	        }
		    
		    
		   
			List<AuthVO> authVOList = this.employeeService.authList();
			
			model.addAttribute("spass", spass);			
			model.addAttribute("memberVOList", memberVOList);			
			model.addAttribute("authVOList", authVOList);			
			model.addAttribute("employeeVO", employeeVO);

			//forwarding: jsp
			return "emp/employee/edit";
		}
		
		
		//사원 수정 실행
		//ResponseBody : Map -> JSONString으로 변환 -> Client로 리턴
		@ResponseBody
		@PostMapping("/editPost")
		public Map<String, String> editPost(Model model, @ModelAttribute EmployeeVO employeeVO) {
			//1. 파일객체 이외의 폼데이터를 모두 받을 수 있어야 함
			//2. 가상의 formData 즉, <form><input type="file" name="uploadFile" ... /></form> 도 받을 수 있어야 함.
			/*
			employeeVO : EmployeeVO(memId=emp24C1004, empNm=냥냥인호, empRrno=19940706, empEml=kim1@naver.com, 
				empMoblphon=01012341234, empZip=65432, empRoadNmAddr=456 Hillside Lane, empDaddr=House 12, empImgUrl=undefined,
				empImgNm=null, empYrycDaycnt=8, empHdofStat=T1, empJncmpYmd=20220419, empRsgntnYmd=20240912, empAtrzSgn=null, 
				jbgdCd=B4, deptCd=C1, empGender=V2, apvId=null, airNm=null, elecApvCn=null, tempSeCd=null, elecApvNo=null, 
				apvLineDetNo=0, elecApvTitle=null, deptNm=null, jbgdNm=null, jobGrade=null, department=null, auth=null, 
				password=null, enabled=null, rnum=null, memberVO=null, commonCodeDetailVO=null, 
				uploadFile=org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@19d2e4f4, 
				fileDetailVOList=null, fileDetailVO=null)
			
			[파일이 없을 때]
				EmployeeVO(memId=emp24C1020, empNm=오예영, empRrno=20240920, empEml=ohyes123@naver.com, empMoblphon=0101234567, empZip=04522, 
				empRoadNmAddr=서울 중구 남대문로 109, empDaddr=국제빌딩, empImgUrl=undefined, empImgNm=null, empYrycDaycnt=5, empHdofStat=T1, empJncmpYmd=20240101, 
				empRsgntnYmd=, empAtrzSgn=null, jbgdCd=B2, deptCd=C2, empGender=V1, apvId=null, airNm=null, elecApvCn=null, tempSeCd=null, elecApvNo=null, 
				apvLineDetNo=0, elecApvTitle=null, deptNm=null, jbgdNm=null, jobGrade=null, department=null, auth=null, password=null, enabled=null, rnum=null, 
				memberVO=null, commonCodeDetailVO=null, uploadFile=null, fileDetailVOList=null, fileDetailVO=null)
			 */
			log.info(" editPost -> employeeVO : "+employeeVO); //받은값
			log.info("Employee Name (empNm) : " + employeeVO.getEmpNm()); // empNm 필드 출력
			log.info("Employee Name (password) : " + employeeVO.getPassword()); // password 필드 출력
			
			
			
			//새로운 비밀번호 암호화하기
			String newPass = null;
					
			newPass = employeeVO.getPassword();
			String encodedPwd = this.bcryptPasswordEncoder.encode(newPass); 
			log.info("수정 encodedPwd : " +encodedPwd );
			
			employeeVO.setPassword(encodedPwd);
			
			int newPassResult = this.employeeService.updatePass(employeeVO);
			log.info("비밀번호 업데이트 결과 newPassResult : " +newPassResult );
			
			//받아서 update한 값
			//1) emp 정보수정
			int editResult = this.employeeService.editPost(employeeVO); 
			log.info(" editPost -> employeeVO(2) : "+employeeVO);
			//2) 권한 정보수정
			int editAuthResult = this.employeeService.editAuthPost(employeeVO); 
			
			
			
			Map<String, String> response = new HashMap<>();
//				response.put("result", );
			if(editResult > 0 &&editAuthResult > 0) {
				response.put("result", "success");
			}else{
				response.put("result", "error");
			}
			
			
			return response;
		}
}

