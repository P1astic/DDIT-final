package kr.or.ddit.comn.vo;

import lombok.Data;

@Data
public class CommonCodeDetailVO {
	private String comDetCd; // 상세코드
	private String comCdGroup; // 코드그룹
	private String comDetCdNm; // 코드그룹내용
	private String comDetCdCn; // 코드명
}
