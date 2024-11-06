package kr.or.ddit.board.service.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.board.mapper.BoardMapper;
import kr.or.ddit.board.mapper.CusBoardMapper;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.CusBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.CustBoardVO;
import kr.or.ddit.comn.util.UploadController;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.comn.vo.FileDetailVO;
import kr.or.ddit.human.ServiceResult;
import kr.or.ddit.userPass.vo.CustInfo;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CusBoardServiceImpl implements CusBoardService {

	@Inject
	CusBoardMapper cusBoardMapper;

	@Inject
	UploadController uploadController;

	@Override
	public List<CustBoardVO> custBoardList(CustInfo custInfoVO) {
		return this.cusBoardMapper.custBoardList(custInfoVO);
	}

	@Override
	public int getTotal(Map<String, Object> custBoardMap) {
		return this.cusBoardMapper.getTotal(custBoardMap);
	}

	@Override
	public int registPost(CustBoardVO custBoardVO) {
		log.info("registPost ServiceImpl -> custBoardVO : " + custBoardVO);

		int result = 0;

		// 0) 파일 업로드 처리
		MultipartFile[] multipartFiles = custBoardVO.getUploadFile();

		long fileGroupNo = 0; // 파일이 없는 경우 0으로 설정

		// 파일이 있을 때만 업로드 처리
		// 1. 파일 존재
		// 파일 배열의 첫 번째 파일을 가져옴 -> 그 파일의 명을 가져와서 -> 길이를 체킹 -> 0보다 큼
		// 2. 파일 없으면
		// 파일 배열의 첫 번째 파일을 가져옴 -> 그 파일의 명을 가져와서 -> 길이를 체킹 -> 0
		if (multipartFiles[0].getOriginalFilename().length() > 0) {

			// 파일이 있는 경우에만 업로드 처리
			fileGroupNo = this.uploadController.multiImageUpload(multipartFiles);
			log.info("registPost Service Impl -> fileGroupNo : " + fileGroupNo);
		}

		log.info("registPost Service Impl -> custBoardVO(before) : " + custBoardVO);

		custBoardVO.setFileGroupNo(fileGroupNo);

		log.info("registPost Service Impl -> custBoardVO(after) : " + custBoardVO);

		// 1) 등록
		result = this.cusBoardMapper.registPost(custBoardVO);

		log.info("registPost ServiceImpl -> result : " + result);

		return result;
	}

	@Override
	public List<CustBoardVO> searchList(CustInfo custInfoVO) {

//		CustInfo custInfoVO = new CustInfo();
//		log.info("name: " + name);
//		log.info("phone: " + phone);
//		log.info("custInfoVO: " + custInfoVO);

//		CustInfo custInfoVO = new CustInfo();
//		custInfoVO.setPhone(phone);
//		custInfoVO.setName(name);
		log.info("custInfoVO: " + custInfoVO);

		return this.cusBoardMapper.searchList(custInfoVO);
	}

	@Override
	public List<FileDetailVO> fileList(long fileGroupNo) {
		return this.cusBoardMapper.fileList(fileGroupNo);
	}

	@Override
	public CustBoardVO detail(String custBrdNo) {
		return this.cusBoardMapper.detail(custBrdNo);
	}

	@Override
	public int delete(CustBoardVO custBoardVO) {
		int result = 0;

		result += this.cusBoardMapper.delete(custBoardVO.getCustBrdNo());

		log.info("delete -> delete : " + result);

		return result;
	}

	@Override
	public ServiceResult updateAnswer(CustBoardVO custBoardVO) {
		try {
			int insertCount = cusBoardMapper.updateAnswerStatus(custBoardVO);
			if (insertCount > 0) {
				return ServiceResult.OK;
			} else {
				return ServiceResult.FAILED; // Handle the case where no rows were affected
			}
		} catch (Exception e) {
			log.error("Error while inserting attendance: ", e);
			return ServiceResult.FAILED; // Handle exceptions appropriately
		}
	}



}
