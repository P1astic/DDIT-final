package kr.or.ddit.telecom.vo;

import java.util.List;

import lombok.Data;

@Data
public class ChatRoomVO {
	private String chatRoomNo;
	private String memId;
	private String chatRoomTitle;
	private int chatRoomStat;
	private String createDt;
	
	private List<ChatEmpVO> chatEmpVOList;
}