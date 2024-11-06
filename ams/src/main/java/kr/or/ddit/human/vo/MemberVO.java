package kr.or.ddit.human.vo;

import java.util.List;

import kr.or.ddit.auth.vo.AuthLinkVO;
import lombok.Data;

@Data
public class MemberVO {
//사용자
	private String memId;
	private String password;
	private int enabled;
	
	private EmployeeVO employeeVO;
	private BpVO bpVO;
	private JobGradeVO jobGradeVO;
	private DeptVO deptVO;
	
	//MEMBER :AUTH_RINK = 1 : N => 사용자는 여러개의 권한을 가질 수 있다.
	private List<AuthLinkVO> authLinkVOList;
	
}
