package kr.or.ddit.telecom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.human.vo.MemberVO;
import kr.or.ddit.telecom.vo.ChatEmpVO;
import kr.or.ddit.telecom.vo.ChatMsgVO;
import kr.or.ddit.telecom.vo.ChatRoomVO;

@Mapper
public interface ChatMapper {

	List<ChatRoomVO> roomList(@Param("memId") String memId);

	int createRoom(ChatRoomVO chatRoomVO);

	int createChatEmp(ChatRoomVO chatRoomVO);

	int sendMessageforDB(ChatMsgVO chatMsgVO);

	List<ChatMsgVO> getMessageList(ChatMsgVO chatMsgVO);

	int exitChat(ChatEmpVO chatEmpVO);

	List<MemberVO> chatEmpList(ChatEmpVO chatEmpVO);

	int chatEmpCount(ChatEmpVO chatEmpVO);

}
