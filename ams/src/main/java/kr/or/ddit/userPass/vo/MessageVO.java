package kr.or.ddit.userPass.vo;

import lombok.Data;

@Data
public class MessageVO {

	private String from; //발신번호
	private String to; //수신번호
	private String text; //내용
}
