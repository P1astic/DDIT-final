package kr.or.ddit.telecom.service;

import java.util.List;

import kr.or.ddit.human.vo.MemberVO;
import kr.or.ddit.telecom.vo.ChatEmpVO;
import kr.or.ddit.telecom.vo.ChatMsgVO;
import kr.or.ddit.telecom.vo.ChatRoomVO;

public interface ChatService {

	List<ChatRoomVO> roomList(String memId);

	int createRoom(ChatRoomVO chatRoomVO);

	int createChatEmp(ChatRoomVO chatRoomVO);

	int sendMessageforDB(ChatMsgVO chatMsgVO);

	List<ChatMsgVO> getMessageList(ChatMsgVO chatMsgVO);

	int exitChat(ChatEmpVO chatEmpVO);

	List<MemberVO> chatEmpList(ChatEmpVO chatEmpVO);

	int chatEmpCount(ChatEmpVO chatEmpVO);
	
	
	
}
