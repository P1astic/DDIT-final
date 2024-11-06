package kr.or.ddit.facility.vo;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.airport.vo.FloorInfoVO;
import kr.or.ddit.comn.vo.CommonCodeDetailVO;
import kr.or.ddit.human.vo.BpVO;
import lombok.Data;

@Data
public class FranchiseVO {
	
	private String memId;					// 입점업체 아이디
	private String frnSeCd;					// 입점업체 구분
	private String frnFloorLocation;		// 입접업체 위치 층 구분
	private String frnOpenTm;				// 운영 시작 시간
	private String frnCloseTm;				// 운영 종료 시간
	private String frnImgUrl;				// 업체 이미지 경로
	private String frnProd;					// 주요 상품
	private int frnRentCost;				// 입대료
	private int frnSecCost;					// 보증금
	private int frnAreaSize;				// 면적
	private String frnEnterDate;			// 입점일자
	private int frnKeyCost;					// 권리금
	private String frnZoneLocation;			// 업체 위치 구역
	private int rnum;
	private String mapId;					// floorInfo mapId
	
	private BpVO bpVO;
	
	private CommonCodeDetailVO commonCodeDetailVO;
	
	private FloorInfoVO floorInfoVO;
	
	private String frnPosition;			// 국내선/국제선
	private String frnFloor;			// 1F, 2F...
	
	private MultipartFile[] uploadFile;
	
}
