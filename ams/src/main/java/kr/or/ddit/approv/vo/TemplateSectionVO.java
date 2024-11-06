package kr.or.ddit.approv.vo;

import lombok.Data;


/**
 * @author 김인호
 * 결재서류 양식
 * 24.09.19
 */
@Data
public class TemplateSectionVO {
	private String tempSeCd;
	private String tempSeNm;
	private String tempSeClob;
	private String tempSeYn;
	private String atrzTypeCd;
}
