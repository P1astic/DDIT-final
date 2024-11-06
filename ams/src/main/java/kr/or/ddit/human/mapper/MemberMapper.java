package kr.or.ddit.human.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.human.vo.BpVO;
import kr.or.ddit.human.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
/**
 * //	다음 직원번호를 가져옴
	public String getEmpNum();
	
//	신규 직원 등록
	public int createPost(EmpVO empVO);
	
//	모든 직원 정보 가져오기
	public List<EmpVO> getEmpAll();
	
//	직원 상세 보기(관리자가 있으면 관리자 정보도 포함) 
	public List<EmpVO> detail(EmpVO empVO);
	
//	직원 삭제
	public int deletePost(EmpVO empVO);
	
	//직원 목록
	public List<EmpVO> list(Map<String,String> map);
	
	//직원 1명의 정보를 리턴
	public EmpVO showMj(EmpVO empVO);
	
	//목록의 행 수를 구함
	public int getTotal(Map<String,String> map);
 * @param username
 * @return
 */
	
	//사용자 로그인
	//<select id="memLogin" parameterType="memVO" resultMap="memMap">
	public MemberVO getLogin(String username);
	
//	public BpVO getBpLogin(String username);
	
//	//map{memId:a001,password:java}
//	public int updatePwd(Map<String,Object> map);

	//임시 비밀번호 발급
	public int updatePwd(MemberVO memberVO);
	
	//메일체크
	public MemberVO checkEmail(MemberVO memberVO);

	
	// 임시 비밀번호 생성
	public String randomPassword() ;
	
	// 임시 비밀번호 DB 업데이트 
//	public String updatePassword();
	
	// 임시 비밀번호 이메일 발급
	public String sendEmail();
	
}









