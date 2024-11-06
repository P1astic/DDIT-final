package kr.or.ddit.telecom.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChatMsgVO {
	private int msgNo;
	private String memId;
	private String msgContent;
	private Date msgDt;
	private String chatRoomNo;
	
	private String empNm;
	private String bpNm;
	
	private String empImgUrl;
	private String bpImgUrl;
}
