package kr.or.ddit.videoChat.vo;


import java.util.List;

import lombok.Data;

@Data
public class VideoChatVO {
	
	private int rnum;
	private int roomNo;
	private String roomId;
	private String roomTitle;
	private String roomEdDate;
	private String roomStDate;
	private int roomMaxJoin;
	private int roomCurrJoin;
	private String memId;
	private String scheId;
	private String roleId;
	
	private List<VideoChatMemberVO> videoChatMemVOList;
	
	
}
