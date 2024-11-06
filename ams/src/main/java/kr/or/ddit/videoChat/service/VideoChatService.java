package kr.or.ddit.videoChat.service;

import java.util.List;

import kr.or.ddit.videoChat.vo.VideoChatMemberVO;
import kr.or.ddit.videoChat.vo.VideoChatVO;

public interface VideoChatService {

	// 채팅방 생성
	public int createRoom(VideoChatVO videoChatVO);

	// 채팅방 목록 조회
	public List<VideoChatMemberVO> getMyRoomIdList(String memId);
	public VideoChatVO getMyRoomInfo(String roomId);

	// 채팅방 종료
	public int deleteRoom(String roomId);

	// 참여자 추가
	public int insertMember(VideoChatMemberVO videoChatMemberVO);

	// 채팅방 참여자 목록 조회
	public List<VideoChatMemberVO> getMemList();

	// 채팅방 생성자의 videoChatMember insert
	public int insertCreator(VideoChatMemberVO creatorVO);

	public VideoChatVO getScheduleVideoChat(VideoChatVO videoChatVO);




}