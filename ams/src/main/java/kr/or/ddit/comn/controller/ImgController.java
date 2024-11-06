package kr.or.ddit.comn.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.airport.vo.FloorInfoVO;
import kr.or.ddit.human.mapper.BpMapper;
import kr.or.ddit.human.mapper.EmployeeMapper;
import kr.or.ddit.human.vo.BpVO;
import kr.or.ddit.human.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ImgController {
	
	@GetMapping("/profileImageUpdate")
	public String test() {
		return "/profileImageUpdate";
	}
	
	/**
	 * 파일 다운로드
	 * 
	 * @param filePath
	 * @param fileOrgnlFileNm
	 * @param response
	 * 
	 * <img src="/download?filePath=${empVO.empImgUrl}&fileOrgnlFileNm=${empVO.empImgNm}" />
	 * /download?filePath=/upload/profile/emp/멍절규.jpg&fileOrgnlFileNm=
	 */

	@GetMapping("/download")
	public void downloadFile(@RequestParam String filePath, @RequestParam String fileOrgnlFileNm,
			HttpServletResponse response) throws IOException {

		log.info("fileName : " + fileOrgnlFileNm);
		try {
			File file = new File(filePath);
			if (file.exists()) {
				response.setContentType("application/octet-stream");

				// 파일 이름을 URLEncoder로 인코딩
				String encodedFileName = URLEncoder.encode(fileOrgnlFileNm, "UTF-8");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");

				FileInputStream in = new FileInputStream(file);
				OutputStream out = response.getOutputStream();

				byte[] buffer = new byte[4096];
				int bytesRead;
				while ((bytesRead = in.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
				in.close();
				out.flush();
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
		} catch (IOException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}

	// DI, IoC
	// root-context.xml에 <bean.. 으로 존재함 c:\\upload\\profile\\emp
	@Autowired
	String empUploadPath;

	// root-context.xml에 <bean.. 으로 존재함 c:\\upload\\profile\\bp
	@Autowired
	String bpUploadPath;

	@Autowired
	String floorUploadPath;

	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	BpMapper bpMapper;

	/*
	 * 직원 이미지 업로드
	 * ajax 사용
	 */
	@ResponseBody
	@PostMapping("/empImgUpload")
	@Transactional
	public String empUpload(
			@RequestParam("file") MultipartFile multipartFile,
            @RequestParam("memId") String memId,
            @RequestParam("empNm") String empNm
				            ) {
	    log.info("EmpImgUpload 도착");
	    log.info("Received file: " + multipartFile.getOriginalFilename());
	    log.info("empNm : " + empNm);
	    log.info("memId : " + memId);

	    int result = 0;

	    File uploadPath = new File(this.empUploadPath, this.getEmpFolder(memId, empNm));

	    // 파일 경로 확인
	    if (!uploadPath.exists()) {
	        uploadPath.mkdirs(); // 없다면 생성
	    }

	    log.info("memId(empNm) : " + memId + "(" + empNm + ")");

	    // 원본 파일명
	    String fileName = multipartFile.getOriginalFilename();

	    UUID uuid = UUID.randomUUID();
	    fileName = uuid.toString() + "_" + fileName;

	    // File객체 설계(복사할 대상 경로, 파일명)
	    File saveFile = new File(uploadPath, fileName);

	    EmployeeVO employeeVO = new EmployeeVO();
	    try {
	        // 파일 복사 실행
	        multipartFile.transferTo(saveFile);

	        // 1) Employee 테이블에 update
	        employeeVO.setMemId(memId);
	        employeeVO.setEmpImgNm(fileName);
	        employeeVO.setEmpImgUrl("/upload/profile/emp/" + this.getEmpFolder(memId, empNm).replace("\\", "/") + "/" + fileName);
	        /*
			UPDATE EMPLOYEE
				SET EMP_IMG_URL = 샴{empImgUrl},
				    EMP_IMG_NM = 샵{empImgNm}
				WHERE MEM_ID = 샵{memId}
			 */
	        result += this.employeeMapper.updateImg(employeeVO);

	    } catch (IllegalStateException | IOException e) {
	        log.error("파일 처리 중 오류 발생: " + e.getMessage(), e);
	    } catch (Exception e) {
	        log.error("업데이트 중 오류 발생: " + e.getMessage(), e);
	    }

	    log.info("emgUpload result : " + result);
	    log.info("emplpyeeVO getempulr : " + employeeVO.getEmpImgUrl()); 

	    return employeeVO.getEmpImgUrl();
	}
	/*
	 * 직원 이미지 업로드(동기 방식)
	 * 메소드 호출 this.imgController.empUpload(파일객체, emp24C1004, 냥냥인호)
	 * 
	 * I 					-> I -> U 동시 수행 한다고 하면
	 * 성공 					-> 실패
	 * 이 시전 미전으로 ROLLBACK
	 * 
	 * ex) 회원 등록 성공 -> 회원 권한 등록 실패?
	 *     회원 로그인이 안 됨
	 *     그래서 회원 등록 성공을 되돌려서 회원 등록도 안 된 상태로 롤백
	 */
	@Transactional
	public String empUploadMethod(MultipartFile multipartFile,
			String memId, String empNm
			) {
		log.info("empUploadMethod 도착");
		log.info("Received file: " + multipartFile.getOriginalFilename());
		log.info("empNm : " + empNm);
		//memId : undefined
		log.info("memId : " + memId);
		
		int result = 0;
		
		File uploadPath = new File(this.empUploadPath, this.getEmpFolder(memId, empNm));
		
		// 파일 경로 확인
		if (!uploadPath.exists()) {
			uploadPath.mkdirs(); // 없다면 생성
		}
		//memId(empNm) : undefined(냥냥인호3)
		log.info("memId(empNm) : " + memId + "(" + empNm + ")");
		
		// 원본 파일명
		String fileName = multipartFile.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		fileName = uuid.toString() + "_" + fileName;
		
		// File객체 설계(복사할 대상 경로, 파일명)
		File saveFile = new File(uploadPath, fileName);
		
		EmployeeVO employeeVO = new EmployeeVO();
		try {
			// 파일 복사 실행
			multipartFile.transferTo(saveFile);
			
			// 1) Employee 테이블에 update
			employeeVO.setMemId(memId);
			employeeVO.setEmpImgNm(fileName);
			employeeVO.setEmpImgUrl("/upload/profile/emp/" + this.getEmpFolder(memId, empNm).replace("\\", "/") + "/" + fileName);
			
			/*
			UPDATE EMPLOYEE
				SET EMP_IMG_URL = 샴{empImgUrl},
				    EMP_IMG_NM = 샵{empImgNm}
				WHERE MEM_ID = 샵{memId}
				
				
			UPDATE EMPLOYEE SET EMP_IMG_URL = '/upload/profile/emp/undefined_냥냥인호3/96fc951a-3988-429e-89b5-3fe518340a61_airplane4.jpg', 
			EMP_IMG_NM = '96fc951a-3988-429e-89b5-3fe518340a61_airplane4.jpg' 
			WHERE MEM_ID = 'undefined' 
			 */
			result += this.employeeMapper.updateImg(employeeVO);
			
		} catch (IllegalStateException | IOException e) {
			log.error("파일 처리 중 오류 발생: " + e.getMessage(), e);
		} catch (Exception e) {
			log.error("업데이트 중 오류 발생: " + e.getMessage(), e);
		}
		
		//emgUpload result : 0
		log.info("emgUpload result : " + result);
		///upload/profile/emp/undefined_냥냥인호3/96fc951a-3988-429e-89b5-3fe518340a61_airplane4.jpg
		log.info("emplpyeeVO getempulr : " + employeeVO.getEmpImgUrl()); 
		
		return employeeVO.getEmpImgUrl();
	}

	// 직원 폴더 생성
	public String getEmpFolder(String memId, String empNm) {
		
		String forderName = memId + "_" + empNm; // 사원번호_김예영
		
		return forderName;
	}
	
	/*
	 * 협력업체 이미지 업로드
	 */
	@ResponseBody
	@PostMapping("/bpImgUpload")
	@Transactional
	public String bpUpload(
			@RequestParam("file") MultipartFile multipartFile,
			@RequestParam("memId") String memId,
			@RequestParam("bpNm") String bpNm
			) {
		log.info("bpImgUpload 도착");
		log.info("Received file: " + multipartFile.getOriginalFilename());
		log.info("bpNm : " + bpNm);
		log.info("memId : " + memId);
		
		int result = 0;
		
		File uploadPath = new File(this.bpUploadPath, this.getBpFolder(memId, bpNm));
		
		// 파일 경로 확인
		if (!uploadPath.exists()) {
			uploadPath.mkdirs(); // 없다면 생성
		}
		
		log.info("memId(bpNm) : " + memId + "(" + bpNm + ")");
		
		// 원본 파일명
		String fileName = multipartFile.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		fileName = uuid.toString() + "_" + fileName;
		
		// File객체 설계(복사할 대상 경로, 파일명)
		File saveFile = new File(uploadPath, fileName);
		
		BpVO bpVO = new BpVO();
		try {
			// 파일 복사 실행
			multipartFile.transferTo(saveFile);
			
			// 1) Employee 테이블에 update
			bpVO.setMemId(memId);
			bpVO.setBpImgNm(fileName);
			bpVO.setBpImgUrl("/upload/profile/bp/" + this.getBpFolder(memId, bpNm).replace("\\", "/") + "/" + fileName);
			
//			result += this.bpMapper.updateImg(bpVO);
			
		} catch (IllegalStateException | IOException e) {
			log.error("파일 처리 중 오류 발생: " + e.getMessage(), e);
		} catch (Exception e) {
			log.error("업데이트 중 오류 발생: " + e.getMessage(), e);
		}
		
		log.info("bpUpload result : " + result);
		log.info("bpVO getbpulr : " + bpVO.getBpImgUrl()); 
		
		return bpVO.getBpImgUrl();
	}
	
	


	// 프랜차이즈 폴더 생성
	public String getFranchiseFolder(String floor) {
		
		String forderName = floor;
		
		return forderName;
	}
	
	
	@Transactional
	public String bpUploadMethod(MultipartFile multipartFile,
			String memId, String bpNm
			) {
		log.info("bpUploadMethod 도착");
		log.info("받은 파일: " + multipartFile.getOriginalFilename());
		log.info("받은 bpNm : " + bpNm);
		log.info("받은  memId : " + memId);
		
		int result = 0;
		
		File uploadPath = new File(this.bpUploadPath, this.getBpFolder(memId, bpNm));
		
		// 파일 경로 확인
		if (!uploadPath.exists()) {
			uploadPath.mkdirs(); // 없다면 생성
		}
		
		log.info("memId(bpNm) : " + memId + "(" + bpNm + ")");
		
		// 원본 파일명
		String fileName = multipartFile.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		fileName = uuid.toString() + "_" + fileName;
		
		// File객체 설계(복사할 대상 경로, 파일명)
		File saveFile = new File(uploadPath, fileName);
		
		BpVO bpVO = new BpVO();
		try {
			// 파일 복사 실행
			multipartFile.transferTo(saveFile);
			
			// 1) Employee 테이블에 update
			bpVO.setMemId(memId);
			bpVO.setBpImgNm(fileName);
			bpVO.setBpImgUrl("/upload/profile/bp/" + this.getEmpFolder(memId, bpNm).replace("\\", "/") + "/" + fileName);
			
			/*
			UPDATE BP
			SET BP_IMG_URL = #{bpImgUrl},
			    BP_IMG_NM = #{bpImgNm}
			WHERE MEM_ID = #{memId}
			 */
			result += this.bpMapper.updateImg(bpVO);
			
		} catch (IllegalStateException | IOException e) {
			log.error("파일 처리 중 오류 발생: " + e.getMessage(), e);
		} catch (Exception e) {
			log.error("업데이트 중 오류 발생: " + e.getMessage(), e);
		}
		
		log.info("bpUpload result : " + result);
		log.info("bpVO getBpImgUrl : " + bpVO.getBpImgUrl()); 
		
		return bpVO.getBpImgUrl();
	}
	// 협력업체 폴더 생성
	public String getBpFolder(String memId, String bpNm) {
		
		//memId : undefined
		String forderName = memId + "_" + bpNm; // 협력업체 아이디_협력업체명
//		String forderName = bpNm; // 협력업체 아이디_협력업체명
		
		return forderName;
	}

	/*
	 * 협력업체 이미지 업로드
	 */
	@ResponseBody
	@PostMapping("/franchiseUpload")
	@Transactional
	public FloorInfoVO franchiseUpload(
			@RequestParam("file") MultipartFile multipartFile,
			@RequestParam("floor") String floor
			) {
		log.info("franchiseUpload 도착");
		log.info("Received file: " + multipartFile.getOriginalFilename());
		log.info("floor : " + floor);
		
		
		File uploadPath = new File(this.floorUploadPath, this.getFranchiseFolder(floor));
		
		// 파일 경로 확인
		if (!uploadPath.exists()) {
			uploadPath.mkdirs(); // 없다면 생성
		}
		
		log.info("uploadPath : " + uploadPath);
		
		// 원본 파일명
		String fileName = multipartFile.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		fileName = uuid.toString() + "_" + fileName;
		
		// File객체 설계(복사할 대상 경로, 파일명)
		File saveFile = new File(uploadPath, fileName);
		
		FloorInfoVO floorInfoVO = new FloorInfoVO();
		
		try {
			// 파일 복사 실행
			multipartFile.transferTo(saveFile);
			
			floorInfoVO.setMapImgNm(fileName);
			floorInfoVO.setMapImgUrl("/upload/floorInfo/" + this.getFranchiseFolder(floor).replace("\\", "/") + "/" + fileName);
			
			
		} catch (IllegalStateException | IOException e) {
			log.error("파일 처리 중 오류 발생: " + e.getMessage(), e);
		} catch (Exception e) {
			log.error("업데이트 중 오류 발생: " + e.getMessage(), e);
		}
		
		log.info("floorInfoVO getMapImgUrl : " + floorInfoVO.getMapImgUrl());
		log.info("floorInfoVO getMapImgNm : " + floorInfoVO.getMapImgNm());
		
		return floorInfoVO;
	}

}
