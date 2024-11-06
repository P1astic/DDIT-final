package kr.or.ddit.userPass.service.serviceImpl;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import kr.or.ddit.userPass.service.UserService;
import net.nurigo.java_sdk.api.Message;
//import net.nurigo.sdk.message.model.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class IUserServiceImpl implements UserService {


	
	 // 인증번호(전화번호, 인증번호)
    public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
        String api_key = "발급 받은 본인 api 키";
        String api_secret = "발급 받은 본인 시크릿 키";
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<>();
        params.put("to", phoneNumber);    // 수신전화번호
        params.put("from", "본인 휴대번호");    // 발신전화번호
        params.put("type", "SMS");
        params.put("text", "빵야빵야(屋) 인증번호 " + "["+cerNum+"]" + "를 입력하세요.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = coolsms.send(params);  // 문자 보내기
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {  // 문자전송 실패 시 메세지
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
    }


}
