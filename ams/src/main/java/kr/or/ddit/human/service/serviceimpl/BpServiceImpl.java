package kr.or.ddit.human.service.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.auth.vo.AuthLinkVO;
import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.controller.ImgController;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.mapper.BpMapper;
import kr.or.ddit.human.service.BpService;
import kr.or.ddit.human.vo.BpVO;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BpServiceImpl implements BpService {
	
	@Autowired
	BpMapper bpMapper;

	@Inject
	ImgController imgController;

	//협력직원 목록
	@Override
	public List<BpVO> bpList(Map<String, Object> bpMap) {
		return this.bpMapper.bpList(bpMap);
	}
	// 전체 행수
	@Override
	public int getTotal(Map<String, Object> bpMap) {
		return this.bpMapper.getTotal(bpMap);
	}
	//협력직원 상세정보 조회
	@Override
	public BpVO detail(String memId) {
		return this.bpMapper.detail(memId);
	}
	//담당자 목록조회
	@Override
	public List<EmployeeVO> empList() {
		return this.bpMapper.empList();
	}
	//부서목록조회
	@Override
	public List<DeptVO> deptList() {
		return this.bpMapper.deptList();
	}
	//권한 목록조회
	@Override
	public List<AuthVO> authList() {
		return this.bpMapper.authList();
	}
	//계약상태목록조회
	@Override
	public List<CommonCodeDetailVO> ctrtList() {
		return this.bpMapper.ctrtList();
	}
	//협력직원 정보수정 실행
	@Override
	public int editPost(BpVO bpVO) {

		int result =0;
		
		//0)파일업로드 처리
		MultipartFile singleFile = bpVO.getUploadFile();
		
		String bpImgUrl = null;
		
		//파일이 있는 경우에만 실행
		if(singleFile!=null && singleFile.getOriginalFilename().length()>0) {
												// 파일객체    			emp24C1004				냥냥인호
			bpImgUrl =this.imgController.bpUploadMethod(singleFile, bpVO.getMemId(), bpVO.getBpNm());
			log.info("editPost BpServiceImpl -> bpImgUrl : " + bpImgUrl);
		}
		bpVO.setBpImgUrl(bpImgUrl);
		log.info("editPost BpServiceImpl -> bpImgUrl : " + bpVO.getBpImgUrl());
		
		result += this.bpMapper.editPost(bpVO);
		if(bpVO.getBpCtrtStat().equals("Z3")) {
			result += this.bpMapper.updateEnabled(bpVO.getMemId());
			log.info("계약만료 시 계정 비활성화 result : " + result);
			return result;
		}
		log.info("editPost BpServiceImpl -> result : " + result);
		
		return result;
	}
	//협력직원 권한수정 실행
	@Override
	public int editPostAuth(BpVO bpVO) {
		return this.bpMapper.editPostAuth(bpVO);
	}
	
	//협력직원 등록
	@Override
	public int registPost(BpVO bpVO) {
	/*
	BpVO(bpImgUrl=undefined, bpImgNm=null, bpEml=asdf@asdf.asdf, deptCd=C5, deptNm=null, bpCtrtStat=null, empId=emp24C1029, memId=undefined, bpNm=asdf5,
	 bpRprsvNm=이이잉35, bpTelno=423, bpBrno=1234123, ctrtYmd=20241008, ctrtEndYmd=20241024, comDetCdCn=null, empNm=null, authCd=ROLE_AIR, password=null, 
	 uploadFile=org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@623f4b4b, auth=null, rnum=null, commonCodeDetailVO=null, 
	 jobGrade=null, departmentVO=null, authCode=null, authNm=null, 
	 		memberVO=MemberVO(memId=null, password=$2a$10$aZgcMv19C5lXNlnggmGui.izk6L8UEqY64TYGjR5Ukultr66AAgxO, 
	 		enabled=0, employeeVO=null, bpVO=null, jobGradeVO=null, deptVO=null, authLinkVOList=null), employeeVO=null, franchiseVO=null)
	 */
	log.info("registPost BpServiceImpl -> bpVO : " + bpVO);
		
	int result =0;
	
	  // 0) 파일 업로드 처리
	//uploadFile=org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@623f4b4b
	 MultipartFile singleFile = bpVO.getUploadFile();
	      
	String bpImpUrl = null;
	//파일 있는 경우에만 실행
	if(singleFile!=null && singleFile.getOriginalFilename().length()>0) {
										//						undefined		asdf5
	bpImpUrl = this.imgController.bpUploadMethod(singleFile, bpVO.getMemId(), bpVO.getBpNm());
		
	//bpImpUrl : 9ed743d5-c12e-4e5a-b2f0-3677aecac14d_airplane5.jpg
	log.info("registPost bpServiceImpl -> bpImpUrl : " + bpImpUrl);
	}else {
		bpImpUrl = null;
	}
	bpVO.setBpImgUrl(bpImpUrl);
	log.info("bpVO.getBpImgUrl :" +bpVO.getBpImgUrl());
	
	bpVO.setDeptCd(bpVO.getDeptCd().toLowerCase());
	//협력직원 등록결과
	/*
	BpVO(bpImgUrl=9ed743d5-c12e-4e5a-b2f0-3677aecac14d_airplane5.jpg, bpImgNm=null, bpEml=asdf@asdf.asdf, deptCd=C5, deptNm=null, bpCtrtStat=null, empId=emp24C1029, memId=undefined, bpNm=asdf5,
	 bpRprsvNm=이이잉35, bpTelno=423, bpBrno=1234123, ctrtYmd=20241008, ctrtEndYmd=20241024, comDetCdCn=null, empNm=null, authCd=ROLE_AIR, password=null, 
	 uploadFile=org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@623f4b4b, auth=null, rnum=null, commonCodeDetailVO=null, 
	 jobGrade=null, departmentVO=null, authCode=null, authNm=null, 
	 		memberVO=MemberVO(memId=null, password=$2a$10$aZgcMv19C5lXNlnggmGui.izk6L8UEqY64TYGjR5Ukultr66AAgxO, 
	 		enabled=0, employeeVO=null, bpVO=null, jobGradeVO=null, deptVO=null, authLinkVOList=null), employeeVO=null, franchiseVO=null)
	 */
	result += this.bpMapper.registPost(bpVO);
	
	
    log.info("registPost bpServiceImpl -> result : " + result);
		
		
	return result;
	}
	
	@Override
	public List<CommonCodeDetailVO> selFrnSeCd() {
		return this.bpMapper.selFrnSeCd();
	}
	@Override
	public List<BpVO> mygubun(String memId) {
		return this.bpMapper.mygubun(memId);
	}
	@Override
	public BpVO myfrn(String memId){
		return this.bpMapper.myfrn(memId);
	}
	@Override
	public int editMyfrn(BpVO bpVO) {
		return this.bpMapper.editMyfrn(bpVO);
	}
	@Override
	public int updatePass(BpVO bpVO) {
		return this.bpMapper.updatePass(bpVO);
	}
	@Override
	public List<MemberVO> memList(String memId) {
		return this.bpMapper.memList(memId);
	}

}


















