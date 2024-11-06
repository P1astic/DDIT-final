package kr.or.ddit.human.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.auth.service.AuthService;
import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.service.BpService;
import kr.or.ddit.human.service.DeptService;
import kr.or.ddit.human.service.EmployeeService;
import kr.or.ddit.human.util.bpPagination;
import kr.or.ddit.human.vo.BpVO;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/emp/bpUser")
@Slf4j
@Controller
public class bpController {
	
	//IO, IOC
	@Autowired
	BpService bpService; 

	@Inject
	DeptService deptService; 
	

	@Inject
	AuthService authService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	PasswordEncoder bcryptPasswordEncoder;
	
	
	//목록조회
	@GetMapping("/bpList")
	public String bpList(Model model,
			@RequestParam(value="gubun", required=false, defaultValue="") String gubun,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			){
		//받아오기
		Map<String, Object> bpMap = new HashMap<String, Object>();
		
		log.info("bpMap :" +bpMap);
		
		bpMap.put("gubun", gubun);
		bpMap.put("keyword", keyword);
		bpMap.put("currentPage", currentPage);
		log.info("bpMap :" +bpMap);
		
		// 전체 행의 수 
		int total = this.bpService.getTotal(bpMap);
		
		//협력직원 목록
		List<BpVO> bpVOList = this.bpService.bpList(bpMap);
		log.info("bpVOList :" +bpVOList);
		
		//페이지 네이션객체
		bpPagination<BpVO> articlePage = new bpPagination<BpVO>(total, currentPage, 15, bpVOList, bpMap);
		log.info("articlePage : " + articlePage);
		//담기
		model.addAttribute("bpVOList",bpVOList); 
		model.addAttribute("articlePage", articlePage);
		
		return "emp/bpUser/list";
	}
	
	//상세조회
	@GetMapping("/detail")
	public String detail(Model model,
			@RequestParam(value="memId", required=true) String memId
			){
		log.info("bpController detail ==> memId : " + memId);
		
		BpVO bpVO = this.bpService.detail(memId);
		log.info("bpController detail ==> bpVO : " + bpVO);
		
		BpVO myfrn = this.bpService.myfrn(memId);
		log.info("bpController detail(myfrn) ==> myfrn  : " + myfrn);
		
		
		model.addAttribute("myfrn", myfrn);
		model.addAttribute("bpVO", bpVO);
		
		return "emp/bpUser/detail";
	}

	//회원수정 요청
	@GetMapping("/edit")
	public String edit(Model model,		
			@RequestParam(value="memId", required=true) String memId
			){
		//받은 데이터
		log.info("bpController edit ==> memId : " + memId);
		
		//상세정보 불러오기
		BpVO bpVO = this.bpService.detail(memId);
		log.info("bpController edit detail ==> bpVO : " + bpVO);
		
		//담당자목록 불러오기
		List<EmployeeVO> empVOList = this.bpService.empList();
		log.info("bpController edit ==> empVOList : " + empVOList);
		
		//협력직원 부서목록 불러오기
		List<DeptVO> deptList = this.bpService.deptList();
		log.info("bpController edit ==> deptList : " + deptList);
		
		//권한불러오기
		List<AuthVO> authList = this.bpService.authList();
		log.info("bpController edit ==> authList : " + authList);
		
		//계약상태 목록 불러오기
		List<CommonCodeDetailVO> ctrtList = this.bpService.ctrtList();
		log.info("bpController edit ==> ctrtList : " + ctrtList);
		
		//업체구분 목록 불러오기
		List<CommonCodeDetailVO> selFrnSeCd = this.bpService.selFrnSeCd();
		log.info("bpController edit ==> selFrnSeCd : " + selFrnSeCd);
		
		//나의 업체구분 불러오기 예) 카페.디저트
		BpVO myfrn = this.bpService.myfrn(memId);
		log.info("bpController edit ==> myfrn : " + myfrn);
		
		//비밀번호 조회
		List<MemberVO> memberVOList = this.bpService.memList(memId);
	    log.info("불러와따 memberVOList : " + memberVOList);
	    
	    //비밀번호 출력
	    String password2 = null;
	    for (MemberVO memberVO : memberVOList) {
	    	password2 = memberVO.getPassword(); // 비밀번호 가져오기
	        log.info("비밀번호 password2: " + password2); // 비밀번호 출력
	        
	    }
	    //비밀번호 짧게 세팅
	    String spass = password2.substring(0,8);
	    log.info("비밀번호 spass: " + spass); // 비밀번호 출력
	    
		
		//담아서 보내기
		
	    model.addAttribute("spass", spass);
		model.addAttribute("myfrn", myfrn);
		model.addAttribute("selFrnSeCd", selFrnSeCd);
		model.addAttribute("bpVO", bpVO);
		model.addAttribute("empVOList", empVOList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("authList", authList);
		model.addAttribute("ctrtList", ctrtList);
		
		return "emp/bpUser/edit";
	}
	
	
	//회원수정 실행
	@ResponseBody
	@PostMapping("/editPost")
	public  Map<String, String>  editPost(Model model, @ModelAttribute BpVO bpVO){
		log.info(" bpController editPost -> bpVO : "+bpVO);
		
		//bp수정[1]
		int result = this.bpService.editPost(bpVO);
		log.info(" bpController editPost -> result : "+result);
		//권한수정[2]
		int resAuth = this.bpService.editPostAuth(bpVO);
		log.info(" bpController editPost -> resAuth : "+resAuth);
		//업체구분 수정[4]
		int resMyfrn = this.bpService.editMyfrn(bpVO);
		log.info(" bpController editPost -> resMyfrn : "+resMyfrn);
		
		
		//새로운 비밀번호 암호화하기
		String newPass = null;
		
		//받아온 비밀번호 담고 암호화처리
		newPass = bpVO.getPassword();
		String encodedPwd = this.bcryptPasswordEncoder.encode(newPass); 
		log.info("수정 encodedPwd : " +encodedPwd );
		
		//암호화된 비밀번호 vo에 다시세팅
		bpVO.setPassword(encodedPwd);
		
		//비밀번호 수정[5]
		int resNwePass = this.bpService.updatePass(bpVO);
		log.info("비밀번호 업뎃 결과 resNwePass :" + resNwePass );
		
		
		Map<String, String> response = new HashMap<>();
		
		if(result > 0 && resAuth > 0) {
			response.put("result", "success");
			log.info(" bpController editPost -> response : "+response);
		}else{
			response.put("result", "error");
		}
//		return "/bp/bpUser/editPost";
		return response;
	}
	
	   //회원등록 요청
	   @GetMapping("/regist")
	   public String regist(Model model){

		//담당자목록 불러오기
		List<EmployeeVO> empVOList = this.bpService.empList();
		log.info("bpController regist ==> empVOList : " + empVOList);
		
		//협력직원 부서목록 불러오기
		List<DeptVO> deptList = this.bpService.deptList();
		log.info("bpController regist ==> deptList : " + deptList);
		
		//권한불러오기
		List<AuthVO> authList = this.bpService.authList();
		log.info("bpController regist ==> authList : " + authList);
		
		//계약상태 목록 불러오기
		List<CommonCodeDetailVO> ctrtList = this.bpService.ctrtList();
		log.info("bpController regist ==> ctrtList : " + ctrtList);
		
		List<CommonCodeDetailVO> selFrnSeCd = this.bpService.selFrnSeCd();
		log.info("bpController regist ==> selFrnSeCd : " + selFrnSeCd);
		
		  model.addAttribute("selFrnSeCd",selFrnSeCd);
	      model.addAttribute("empVOList",empVOList);
	      model.addAttribute("deptList",deptList);
	      model.addAttribute("authList",authList);
	      model.addAttribute("ctrtList",ctrtList);
	      
	      return "emp/bpUser/regist";
	   }
	   
	   
	   //회원등록 실행
	   @ResponseBody
	   @PostMapping("/registPost")
	   public Map<String, Object> registPost( Model model,@ModelAttribute BpVO bpVO){
		   /*
		   BpVO(bpImgUrl=undefined, bpImgNm=null, bpEml=asdf@asdf.asdf, deptCd=C5, deptNm=null, bpCtrtStat=null, empId=emp24C1029, memId=undefined, bpNm=asdf5,
		    bpRprsvNm=이이잉35, bpTelno=423, bpBrno=1234123, ctrtYmd=20241008, ctrtEndYmd=20241024, comDetCdCn=null, empNm=null, authCd=ROLE_AIR, 
		    password=null, uploadFile=org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@623f4b4b, 
		    auth=null, rnum=null, commonCodeDetailVO=null, jobGrade=null, departmentVO=null, authCode=null, authNm=null, memberVO=null, employeeVO=null, franchiseVO=null)
		    */
	      log.info("받은 값 registPost -> bpVO : "+bpVO);
  
			//초기비밀번호 -> 사업자등록번호
			String pwd = bpVO.getBpBrno();
			String encodedPwd = this.bcryptPasswordEncoder.encode(pwd);
			log.info("encodedPwd : " +encodedPwd );
			  
			//중첩된 자바빈을 처리  -> employeeVO의 memberVO에 set할수 있음
			MemberVO memberVO = new MemberVO();
			memberVO.setPassword(encodedPwd);
			
			bpVO.setMemberVO(memberVO);
			 
			//등록실행 결과
			int result = this.bpService.registPost(bpVO);
			log.info("registPost -> result : "+result);
			log.info("비밀번호 세팅후  -> bpVO : "+bpVO);
			Map<String, Object> response = new HashMap<>();
			  
			//PL/SQL 이 성공 시 -1을 리턴
			if(result == -1) {//insert 성공
				log.info("???");
				response.put("result", "success");
				response.put("memId", bpVO.getMemId());
			}else{//insert 실패
				log.info("!!!");
				response.put("result", "error");
				response.put("memId", "");
			}
		
		log.info("registPost 결과 -> response : " + response);
	      return response;
	   }
	
	
	
}
