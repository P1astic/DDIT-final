package kr.or.ddit.comn.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.comn.mapper.FileDetailMapper;
import kr.or.ddit.comn.vo.FileDetailVO;
import lombok.extern.slf4j.Slf4j;

//자바빈 객체로 등록
@Slf4j
@Controller
public class UploadController {
	
	//DI, IoC
	//root-context.xml에 <bean.. 으로 존재함 c:\\upload
	@Autowired
	String uploadPath;
	
	@Autowired
	FileDetailMapper fileDetailMapper;
	
	/**다중 이미지 업로드
	 * return : 20240808001(FILE_GROUP.FILE_GROUP_NO)
	 */	
	@Transactional
	public long multiImageUpload(MultipartFile[] multipartFiles) {
		long fileGroupNo = 0L;
		int result = 0;
		int counter = 1;//FILE_SN 컬럼을 위함(20240808001의1)(20240808001의2)
		//연월일 폴더 설정
		// C:\\upload
		// + "\\" + 
		// 2024\\08\\08
		File uploadPath = new File(this.uploadPath, this.getFolder());
		
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		//원본 파일명
		String fileName = "";
		//MIME(Multipurpost Internet Mail Extension) 타입
		String contentType = "";
		//파일 크기
		long fileSize = 0L; 
		
		//하나의 파일 그룹에 여러개의 파일이 포함
		//fileSn      : 1			2			3
		//fileGroupNo : 20240917001	20240917001	20240917001
		//반복 전에 fileGroupNo를 추츨해야 함
		fileGroupNo = this.fileDetailMapper.getFileGroupNo();
		log.info("fileGroupNo : " + fileGroupNo);
		
		//향상된 for문(multipartFiles : 파일들)
		for(MultipartFile multipartFile : multipartFiles) {
			fileName = multipartFile.getOriginalFilename();
			contentType = multipartFile.getContentType();
			fileSize = multipartFile.getSize();
			
			UUID uuid = UUID.randomUUID();
			fileName = uuid.toString() + "_" + fileName;
			
			//File객체 설계(복사할 대상 경로, 파일명)
	// C:\\upload\\2024\\08\\08 + "\\" + asdfasdf_개똥이.jpg
			File saveFile = new File(uploadPath,fileName);
			
			try {
				//파일 복사 실행
				//파일객체.transferTo(설계)
				multipartFile.transferTo(saveFile);
				
				//2) FILE_DETAIL 테이블에 insert
				FileDetailVO fileDetailVO = new FileDetailVO();
				fileDetailVO.setFileSn(counter++);
				fileDetailVO.setFileGroupNo(fileGroupNo);
				fileDetailVO.setFileOrgnlFileNm(multipartFile.getOriginalFilename());
				fileDetailVO.setFileStrgFileNm(fileName);//uuid + 파일명
				// /upload/ == C:\\upload\\ + 2024\\08\\08 + "\\" + asdfasdf_파일명.jpg
				fileDetailVO.setFileFilePathNm("/upload/" +
							this.getFolder().replace("\\", "/") +
							"/" + fileName
						);
				fileDetailVO.setFileSz(fileSize);
				fileDetailVO.setFileFileExtnNm(
						fileName.substring(fileName.lastIndexOf(".")+1));//asdfasdf_파일명.jpg
				fileDetailVO.setFileMime(contentType);
				fileDetailVO.setFileFancysize(
					makeFancySize(String.valueOf(fileSize))
				);//bytes -> MB
				fileDetailVO.setFileFileStrgYmd(null);
				fileDetailVO.setFileDwnldCnt(0);
				
				result += this.fileDetailMapper.insertFileDetail(fileDetailVO);
				
			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
			}
		}//end for
		
		log.info("result : " + result);
		
		return fileGroupNo;
	}

	//한개의 파일만 업로드할때
	@Transactional
	public long singleFileUpload(MultipartFile singleFile) {
		long fileGroupNo = 0L;
		int result = 0;
		int counter = 1;//FILE_SN 컬럼을 위함(20240808001의1)(20240808001의2)
		//연월일 폴더 설정
		// C:\\upload
		// + "\\" + 
		// 2024\\08\\08
		File uploadPath = new File(this.uploadPath, this.getFolder());
		
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		//원본 파일명
		String fileName = "";
		//MIME(Multipurpost Internet Mail Extension) 타입
		String contentType = "";
		//파일 크기
		long fileSize = 0L; 
		
		//하나의 파일 그룹에 여러개의 파일이 포함
		//fileSn      : 1			2			3
		//fileGroupNo : 20240917001	20240917001	20240917001
		//반복 전에 fileGroupNo를 추츨해야 함
		fileGroupNo = this.fileDetailMapper.getFileGroupNo();
		log.info("fileGroupNo : " + fileGroupNo);
		
		//향상된 for문(multipartFiles : 파일들)
			fileName = singleFile.getOriginalFilename();
			contentType = singleFile.getContentType();
			fileSize = singleFile.getSize();
			
			UUID uuid = UUID.randomUUID();
			fileName = uuid.toString() + "_" + fileName;
			
			//File객체 설계(복사할 대상 경로, 파일명)
	// C:\\upload\\2024\\08\\08 + "\\" + asdfasdf_개똥이.jpg
			File saveFile = new File(uploadPath,fileName);
			
			try {
				//파일 복사 실행
				//파일객체.transferTo(설계)
				singleFile.transferTo(saveFile);
				
				//2) FILE_DETAIL 테이블에 insert
				FileDetailVO fileDetailVO = new FileDetailVO();
				fileDetailVO.setFileSn(counter++);
				fileDetailVO.setFileGroupNo(fileGroupNo);
				fileDetailVO.setFileOrgnlFileNm(singleFile.getOriginalFilename());
				fileDetailVO.setFileStrgFileNm(fileName);//uuid + 파일명
				// /upload/ == C:\\upload\\ + 2024\\08\\08 + "\\" + asdfasdf_파일명.jpg
				fileDetailVO.setFileFilePathNm("/upload/" +
							this.getFolder().replace("\\", "/") +
							"/" + fileName
						);
				fileDetailVO.setFileSz(fileSize);
				fileDetailVO.setFileFileExtnNm(
						fileName.substring(fileName.lastIndexOf(".")+1));//asdfasdf_파일명.jpg
				fileDetailVO.setFileMime(contentType);
				fileDetailVO.setFileFancysize(
					makeFancySize(String.valueOf(fileSize))
				);//bytes -> MB
				fileDetailVO.setFileFileStrgYmd(null);
				fileDetailVO.setFileDwnldCnt(0);
				
				result += this.fileDetailMapper.insertFileDetail(fileDetailVO);
				
			} catch (IllegalStateException | IOException e) {
				log.error(e.getMessage());
			}
		
		log.info("result : " + result);
		
		return fileGroupNo;
	}	
	
	//연/월/일 폴더 생성
	public String getFolder() {
		//2022-11-16 형식(format) 지정
		//간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//날짜 객체 생성(java.util 패키지)
		Date date = new Date();
		//2022-11-16
		String str = sdf.format(date);
		//2024-01-30 -> 2024\\01\\30
		return str.replace("-", File.separator);
	}
	
	//이미지인지 판단. 썸네일은 이미지만 가능하므로..
	public boolean checkImageType(File file) {
		//MIME(Multipurpose Internet Mail Extensions) : 문서, 파일 또는 바이트 집합의 성격과 형식. 표준화
		//MIME 타입 알아냄. .jpeg / .jpg의 MIME타입 : image/jpeg
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			log.info("contentType : " + contentType);
			//image/jpeg는 image로 시작함->true
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//이 파일이 이미지가 아닐 경우
		return false;
	}
	
	//fancySize 리턴("1059000")	
	public String makeFancySize(String bytes) {
		log.info("bytes : " + bytes);
		String retFormat = "0";
		//숫자형문자->실수형으로 형변환(1059000)
		Double size = Double.parseDouble(bytes);
		
		String[] s = { "bytes", "KB", "MB", "GB", "TB", "PB" };
		
		if (bytes != "0") {
		  //bytes->KB
		  int idx = (int) Math.floor(Math.log(size) / Math.log(1024));
		  DecimalFormat df = new DecimalFormat("#,###.##");
		  double ret = ((size / Math.pow(1024, Math.floor(idx))));
		  retFormat = df.format(ret) + " " + s[idx];
		} else {
		  retFormat += " " + s[0];
		}
		
		return retFormat;
	}
}





