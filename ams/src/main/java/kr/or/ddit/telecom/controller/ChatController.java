package kr.or.ddit.telecom.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.human.service.DeptService;
import kr.or.ddit.human.service.EmployeeService;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import kr.or.ddit.human.vo.MemberVO;
import kr.or.ddit.telecom.service.ChatService;
import kr.or.ddit.telecom.vo.ChatEmpVO;
import kr.or.ddit.telecom.vo.ChatMsgVO;
import kr.or.ddit.telecom.vo.ChatRoomVO;
import lombok.extern.slf4j.Slf4j;


@RequestMapping("/chat")
@Slf4j
@Controller
public class ChatController {

	@Inject
	ChatService chatService;
	@Inject
	DeptService deptService;
	@Inject
	EmployeeService employeeService;
	
	@Autowired
	private SimpMessagingTemplate messagingTemplate;
	
	
	@MessageMapping("/sendMessage")
	public void sendMessage(ChatMsgVO chatMsgVO) {
		log.info("chatMsgVO" + chatMsgVO);
		
        messagingTemplate.convertAndSend("/chat/messages/" + chatMsgVO.getChatRoomNo(), chatMsgVO);
	}
	
	@ResponseBody
	@PostMapping("/sendMessageforDB")
	public Map<String, String> sendMessageforDB(@RequestBody ChatMsgVO chatMsgVO){
		
		log.info("chatMsgVO : " + chatMsgVO);
		
		int insertResult = this.chatService.sendMessageforDB(chatMsgVO);
		Map<String, String> response = new HashMap<>();
		
		if(insertResult != 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		
		return response;
	}
	
	@GetMapping("/chatMain")
	public String chatMain(HttpSession loginSession, Model model) {
		
		String memId = (String) loginSession.getAttribute("userId");
		List<ChatRoomVO> chatRoomVOList = this.chatService.roomList(memId);
		
		log.info("chatRoomVOList : " + chatRoomVOList);
		
		model.addAttribute("chatRoomVOList", chatRoomVOList);
		return "chat/chatMain";		
	}
	
	@ResponseBody
	@PostMapping("/createRoom")
	public Map<String, String> createRoom(@RequestBody ChatRoomVO chatRoomVO){
		
		log.info("chatRoomVO + " + chatRoomVO);
		
		chatRoomVO.setChatRoomNo(chatRoomVO.getChatRoomTitle()+ "_" + UUID.randomUUID().toString());
		log.info("createRoom chatRoomVO : " + chatRoomVO);
		Map<String, String> response = new HashMap<>();
		
		
		int creatRoomResult = this.chatService.createRoom(chatRoomVO);
		if(creatRoomResult != 0) {
			int insertEmpResult = this.chatService.createChatEmp(chatRoomVO);
			log.info("insertChatEMp result : " + insertEmpResult);
			if(insertEmpResult != 0) {
				response.put("result", "success");
			}else {
				response.put("result", "error");
			}
		}
		
		return response;
	}
	
	@ResponseBody
	@PostMapping("/getMessageList")
	public List<ChatMsgVO> getMessageList(@RequestBody ChatMsgVO chatMsgVO){
		
		List<ChatMsgVO> chatList = this.chatService.getMessageList(chatMsgVO);
		log.info("chatList : " + chatList);
		
		return chatList;
	}
	
	@ResponseBody
	@PostMapping("/getDeptList")
	public List<DeptVO> getDeptList(){
		List<DeptVO> deptVOList = this.deptService.deptList();
		
		return deptVOList;
	}
	
	@ResponseBody
	@PostMapping("/getEmpList")
	public List<MemberVO> getEmpList(@RequestParam String deptCd){
		List<MemberVO> memberVOList = this.employeeService.getEmpListForChat(deptCd);
		
		log.info("memberVOList : " + memberVOList);
		
		return memberVOList;
	}
	
	@ResponseBody
	@PostMapping("/exitChat")
	public Map<String, String> exitChat(@RequestBody ChatEmpVO chatEmpVO){
		int exitResult = this.chatService.exitChat(chatEmpVO);
		
		Map<String, String> response = new HashMap<>();
		if(exitResult != 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");			
		}
		
		
		return response;
	}
	
	@ResponseBody
	@PostMapping("/chatEmpList")
	public List<MemberVO> chatEmpList(@RequestBody ChatEmpVO chatEmpVO){
		
		List<MemberVO> memberVOList = this.chatService.chatEmpList(chatEmpVO);
		log.info("memberVOList : " + memberVOList);
		return memberVOList;
	}
	
	@ResponseBody
	@PostMapping("/chatEmpCount")
	public int chatEmpCount(@RequestBody ChatEmpVO chatEmpVO) {
		
		int chatEmpCount = this.chatService.chatEmpCount(chatEmpVO);
		
		if(chatEmpCount > 0) {
			return chatEmpCount;
		}else {
			return chatEmpCount;
		}
	}
}
