package kr.or.ddit.approv.service.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.approv.mapper.ElecApvMapper;
import kr.or.ddit.approv.service.ElecApvService;
import kr.or.ddit.approv.vo.ApvDetailVO;
import kr.or.ddit.approv.vo.ElecApvVO;
import kr.or.ddit.comn.util.UploadController;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.mapper.LeaveDetailMapper;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.LeaveDetailVO;
import lombok.extern.slf4j.Slf4j;



/**
 * @author 김인호 24.09.20 
 * 결재문서 서비스임플
 */
@Transactional
@Slf4j
@Service
public class ElecApvServiceImpl implements ElecApvService{
	
	@Inject
	ElecApvMapper elecApvMapper;
	
	@Inject
	LeaveDetailMapper leaveDetailMapper;
	
	@Inject
	UploadController uploadController;
	
	// 나의 기안서 목록 김인호
	@Override
	public List<ElecApvVO> elecApvList(Map<String, Object> listMap) {
		
		
		
		return this.elecApvMapper.elecApvList(listMap);
	}

	
	// 24.09.23 결재서 기안 김인호
	@Transactional
	@Override
	public int paymentInsert(EmployeeVO employeeVO) {
		int result = 0;

	    // 0) 파일 업로드 처리
	    MultipartFile[] multipartFiles = employeeVO.getUploadFiles();  // getgetUploadFiles

	    long fileGroupNo = 0; // 파일이 없는 경우 0으로 설정

//	     파일이 있을 때만 업로드 처리
//	     1. 파일 존재
//	     파일 배열의 첫 번째 파일을 가져옴 -> 그 파일의 명을 가져와서 -> 길이를 체킹 -> 0보다 큼
//	     2. 파일 없으면
//	     파일 배열의 첫 번째 파일을 가져옴 -> 그 파일의 명을 가져와서 -> 길이를 체킹 -> 0
//	    if (multipartFiles[0].getOriginalFilename().length() > 0) {
//
//	        // 파일이 있는 경우에만 업로드 처리
//	            fileGroupNo = this.uploadController.multiImageUpload(multipartFiles);
//	            log.info("registPost Service Impl -> fileGroupNo : " + fileGroupNo);
//	    }
//	    
//	    log.info("registPost Service Impl -> employeeVO(before) : " + employeeVO);
//	    employeeVO.setFileGroupNo(fileGroupNo);
//	    log.info("registPost Service Impl -> employeeVO(after) : " + employeeVO);



		
		result += this.elecApvMapper.elecApvInsert(employeeVO);
		log.info("1번 serviceImpl -> result : "+result);
		// 초안 (날려도 됨)
//		for(String apvId : employeeVO.getApvId() ) {
//			ApvDetailVO lineVO = new ApvDetailVO();
//			
//			lineVO.setElecApvNo(employeeVO.getElecApvNo());
//			lineVO.setMemId(apvId);
//			
//			result += this.elecApvMapper.apvDetailInsert(lineVO);
//			log.info("2번 serviceImpl -> result : "+result);
//			
//		};
		
		for(int i=0; i<employeeVO.getApvId().length; i++ ) {
			ApvDetailVO lineVO = new ApvDetailVO();
			
			String[] apvId = employeeVO.getApvId();
			
			lineVO.setElecApvNo(employeeVO.getElecApvNo());
			lineVO.setMemId(apvId[i]);
			lineVO.setApvLineFinYn("N");
			int lastId = employeeVO.getApvId().length-1;
			log.info("lastId : "+lastId);
			if(lastId == i) {
				lineVO.setApvLineFinYn("Y");
			}
			result += this.elecApvMapper.apvDetailInsert(lineVO);
			log.info("2번 serviceImpl -> result : "+result);
			
		};
		employeeVO.setLvBgngYmd(employeeVO.getLvBgngYmd().replaceAll("-", ""));
		employeeVO.setLvEndYmd(employeeVO.getLvEndYmd().replaceAll("-", "")); 
		
		result += this.leaveDetailMapper.leaveDetailInsert(employeeVO);
		log.info("3번 serviceImpl -> result : "+result);
		
		return result;
	}
	
	
	
	@Override
	public List<ElecApvVO> myElecApvListDetail(String elecApvNo) {
		return this.elecApvMapper.myElecApvListDetail(elecApvNo);
	};
	
	// 결재승인 24.09.26 김인호
	@Transactional
	@Override
	public int apvDetailUpdate(ElecApvVO elecApvVO) {
		
		int result = this.elecApvMapper.apvDetailUpdate(elecApvVO);
		
		if("Y".equals(elecApvVO.getApvLineFinYn())){
				result += this.elecApvMapper.statUpdate(elecApvVO);
				ElecApvVO elecApv = this.elecApvMapper.checkNo(elecApvVO);
				log.info("elecApv : "+elecApv);
				
				// 휴가일수 차감
				if("H3".equals(elecApv.getElecApvStat())||"I3".equals(elecApv.getTempSeCd())) {
					
					elecApv.setEmpYrycDaycnt(elecApv.getEmployeeVO().getEmpYrycDaycnt()-elecApv.getLvUseDay());
					result += this.elecApvMapper.yrycDaycntUpdate(elecApv);
					return result;
					
				}
				log.info("result : "+result);
			return result;
		}
		log.info("result : "+result);
		
		return result;
	};
	
	@Transactional
	@Override
	public int prDetailUpdate(ApvDetailVO apvDetailVO) {
		
		int result = this.elecApvMapper.prDetailUpdate(apvDetailVO);
		
		if(!apvDetailVO.getApvDecReason().equals("")) {
			result = this.elecApvMapper.statUpdate2(apvDetailVO);
			return result;
		}
		
		return result;
	};
	
	// 최종결재자 get!
	@Override
	public ApvDetailVO getApvLineFinYn(ApvDetailVO apvDetailVO) {
		
		
		return this.elecApvMapper.getApvLineFinYn(apvDetailVO);
	}


	@Override
	public int getTotal(Map<String, Object> listMap) {
		return this.elecApvMapper.getTotal(listMap);
	}


	@Override
	public List<ApvDetailVO> getApvLineFinYn1(String elecApvNo) {
		return this.elecApvMapper.getApvLineFinYn1(elecApvNo);
	}


	@Override
	public List<CommonCodeDetailVO> comCodeList() {
		return this.elecApvMapper.comCodeList();
	}

	//결재대기 문서(내가 결재자)
	@Override
	public List<ElecApvVO> waitElec() {
		return this.elecApvMapper.waitElec();
	};

}
