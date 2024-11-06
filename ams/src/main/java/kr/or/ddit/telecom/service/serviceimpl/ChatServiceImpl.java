package kr.or.ddit.telecom.service.serviceimpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.human.vo.MemberVO;
import kr.or.ddit.telecom.mapper.ChatMapper;
import kr.or.ddit.telecom.service.ChatService;
import kr.or.ddit.telecom.vo.ChatEmpVO;
import kr.or.ddit.telecom.vo.ChatMsgVO;
import kr.or.ddit.telecom.vo.ChatRoomVO;

@Service
public class ChatServiceImpl implements ChatService{

	@Inject
	ChatMapper chatMapper;
	
	@Override
	public List<ChatRoomVO> roomList(String memId) {
		// TODO Auto-generated method stub
		return this.chatMapper.roomList(memId);
	}

	@Override
	public int createRoom(ChatRoomVO chatRoomVO) {
		// TODO Auto-generated method stub
		return this.chatMapper.createRoom(chatRoomVO);
	}

	@Override
	public int createChatEmp(ChatRoomVO chatRoomVO) {
		// TODO Auto-generated method stub
		return this.chatMapper.createChatEmp(chatRoomVO);
	}

	@Override
	public int sendMessageforDB(ChatMsgVO chatMsgVO) {
		// TODO Auto-generated method stub
		return this.chatMapper.sendMessageforDB(chatMsgVO);
	}

	@Override
	public List<ChatMsgVO> getMessageList(ChatMsgVO chatMsgVO) {
		// TODO Auto-generated method stub
		return this.chatMapper.getMessageList(chatMsgVO);
	}

	@Override
	public int exitChat(ChatEmpVO chatEmpVO) {
		// TODO Auto-generated method stub
		return this.chatMapper.exitChat(chatEmpVO);
	}

	@Override
	public List<MemberVO> chatEmpList(ChatEmpVO chatEmpVO) {
		// TODO Auto-generated method stub
		return this.chatMapper.chatEmpList(chatEmpVO);
	}

	@Override
	public int chatEmpCount(ChatEmpVO chatEmpVO) {
		// TODO Auto-generated method stub
		return this.chatMapper.chatEmpCount(chatEmpVO);
	}

}
