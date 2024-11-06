package kr.or.ddit.airport.vo;

import java.sql.Clob;

import kr.or.ddit.airplane.vo.AirLineVO;
import kr.or.ddit.facility.vo.FranchiseVO;
import lombok.Data;

/*
 * 24.10.09 김예영
 *  층별 시설도 위해 생성
 */
// alias : floorInfoVO

@Data
public class FloorInfoVO {
	private String mapId;			// 고유 시설 위치 아이디 (map001)
	private String mapNm;			// 시설명(롯데리아)
	private String mapImgUrl;		// 이미지 경로
	private String mapImgNm;		// 이미지 명
	private String memId;			// 협력업체 아이디
	private String mapFloor;		// 층 수
	private String mapInout;		// 국내선/국제선
	
	
	private String comDetCdCn;		// 분류 명
	
	private FranchiseVO franchiseVO;	// 협력업체 테이블과 1:1
	
	private AirLineVO airLineVO;
	
}
