package kr.or.ddit.videoChat.service.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.videoChat.mapper.VideoChatMapper;
import kr.or.ddit.videoChat.service.VideoChatService;
import kr.or.ddit.videoChat.vo.VideoChatMemberVO;
import kr.or.ddit.videoChat.vo.VideoChatVO;

@Service
public class VideoChatServiceImpl implements VideoChatService {
	
	@Inject
	VideoChatMapper videoChatMapper;

	// 채팅방 생성
	@Override
	public int createRoom(VideoChatVO videoChatVO) {
		return this.videoChatMapper.createRoom(videoChatVO);
	}

	// 채팅방 목록 조회
	@Override
	public List<VideoChatMemberVO> getMyRoomIdList(String memId) {
		return this.videoChatMapper.getMyRoomIdList(memId);
	}
	@Override
	public VideoChatVO getMyRoomInfo(String roomId) {
		return this.videoChatMapper.getMyRoomInfo(roomId);
	}	

	
	// 채팅방 종료
	@Override
	public int deleteRoom(String roomId) {
		return this.videoChatMapper.deleteRoom(roomId);
	}

	// 참여자 추가
	@Override
	public int insertMember(VideoChatMemberVO videoChatMemberVO) {
		return this.videoChatMapper.insertMember(videoChatMemberVO);
	}

	// 채팅방 참여자 목록 조회
	@Override
	public List<VideoChatMemberVO> getMemList() {
		return this.videoChatMapper.getMemList();
	}

	// 채팅방 생성자의 videoChatMember insert
	@Override
	public int insertCreator(VideoChatMemberVO creatorVO) {
		return this.videoChatMapper.insertCreator(creatorVO);
	}

	@Override
	public VideoChatVO getScheduleVideoChat(VideoChatVO videoChatVO) {
		return this.videoChatMapper.getScheduleVideoChat(videoChatVO);
	}


}
