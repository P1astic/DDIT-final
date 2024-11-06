package kr.or.ddit.auth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.ddit.auth.service.AuthService;
import kr.or.ddit.auth.util.RolePagination;
import kr.or.ddit.auth.vo.AuthVO;
import kr.or.ddit.comn.service.LoginService;
import kr.or.ddit.comn.vo.AuthMenuVO;
import kr.or.ddit.comn.vo.MnVO;
import kr.or.ddit.human.service.DeptService;
import kr.or.ddit.human.service.EmployeeService;
import kr.or.ddit.human.vo.DeptVO;
import kr.or.ddit.human.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 홍정호 권한페이지 관련 컨트롤러 24.9.13. 최초생성
 *
 */
@RequestMapping("/emp/role")

@Slf4j
@Controller
public class RoleController {
	
	@Inject
	private AuthService authService;
	
	@Inject
	private DeptService deptService;
	
	@Inject
	private EmployeeService employeeService;
	
	@Inject
	private LoginService loginService;
	
	/**
	 * @author 홍정호
	 * 
	 * 24.9.19. 권한을 부여받은 사람의 목록을 보여주는 페이지
	 * ROLE_ADMIN 권한이 없으면 ACCESS DENIED 페이지로 넘어감
	 * 
	 * @return
	 */
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(value="authCode",required=false, defaultValue="") String authCode,
			@RequestParam(value="deptCd",required=false, defaultValue="") String deptCd,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			HttpSession loginSession) {
		
//		List<String> roleNames = (List<String>) loginSession.getAttribute("roleNames");
		
		
		Map<String, Object> authMap = new HashMap<String,Object>();
		authMap.put("authCode", authCode);
		authMap.put("deptCd", deptCd);
		authMap.put("currentPage", currentPage);
		log.info("map : " + authMap);
		
		List<AuthVO> authVOList = this.authService.authList();
//		log.info("authVOList : " + authVOList);
		
		List<DeptVO> deptVOList = this.deptService.deptList();
//		log.info("deptVOList : " + deptVOList);
		
		List<EmployeeVO> authEmpList = this.employeeService.authEmpList(authMap);
//		log.info("authEmpList : " + authEmpList);
//		log.info("authEmpList size : " + authEmpList.size());
		
		int total = this.employeeService.getAuthEmpTotal(authMap);
		
		RolePagination<EmployeeVO> articlePage = new RolePagination<EmployeeVO>(total, currentPage, 15, authEmpList, authMap);
		
		model.addAttribute("authVOList", authVOList);
		model.addAttribute("deptVOList", deptVOList);
		model.addAttribute("authEmpList", authEmpList);
		model.addAttribute("articlePage", articlePage);
		
		return "emp/role/list";
	}
	
	/**
	 * @author 홍정호
	 * 24.9.19. 로그인한 사용자의 권한별 메뉴를 설정하는 페이지
	 */
	@GetMapping("/menuSetting")
	public String menuSetting(HttpSession loginSession, Model model) {
		
		List<AuthVO> authVOList = this.authService.authList();
		
		model.addAttribute("authVOList", authVOList);
		log.info("authVOList : " + authVOList);
		
		List<String> roleNames = (List<String>) loginSession.getAttribute("roleNames");
		Map<String, Object> roleNamesMap = new HashMap<String, Object>();
		for(int i = 0; i < roleNames.size(); i++) {
			roleNamesMap.put((String)roleNames.get(i), roleNames.get(i));
		}
		
		List<AuthMenuVO> authMenuList = this.loginService.authMenuList(roleNamesMap);
		
		model.addAttribute("menuList", loginSession.getAttribute("menuList"));
		model.addAttribute("authMenuList", authMenuList);
		
		log.info("menuList : " + loginSession.getAttribute("menuList"));
		
		return "emp/role/menuSetting";
	}
	
	@ResponseBody
	@PostMapping(value="/loadMenu")
	public String loadMenu(@RequestBody AuthVO authVO) {
		
		Map<String, Object> roleNamesMap = new HashMap<String, Object>();
		roleNamesMap.put(authVO.getAuthCode(), authVO.getAuthCode());
		
		List<AuthMenuVO> loadAuthMenuVO = this.loginService.authMenuList(roleNamesMap);
		
		Gson gson = new Gson();
		String authMenuListJson = gson.toJson(loadAuthMenuVO);
		
		return authMenuListJson;
	}
	
	@ResponseBody
	@PostMapping(value="/menuSave")
	public String menuSave(@RequestBody Map<String, Object> requestBody) {
        String authCode = (String) requestBody.get("authCode");
        List<Map<String, String>> mnCdList = (List<Map<String, String>>) requestBody.get("mnVOList");

        List<MnVO> mnVOList = new ArrayList<>();
        for (Map<String, String> mnCdMap : mnCdList) {
            MnVO mnVO = new MnVO();
            mnVO.setMnCd(mnCdMap.get("mnCd"));
            mnVO.setCheckedYn(mnCdMap.get("checkedYn")); // 'Y' 또는 'F'
            mnVOList.add(mnVO);
        }
        
        log.info("mnVOList ; " + mnVOList);

        // 메뉴 권한 업데이트 처리
        authService.menuSave(authCode, mnVOList);

        
        return "success";
	}
	
	@ResponseBody
	@PostMapping("/registAuth")
	public Map<String, String> registAuth(HttpSession loginSession, Model model, @RequestBody AuthVO authVO) {
		
		List<AuthVO> authVOList = this.authService.authList();
		
		
		int registAuthResult = authService.registAuth(authVO);
		
		
		Map<String, String> response = new HashMap<>();
		
	    if (registAuthResult > 0) {
	        response.put("result", "success");
	    } else {
	        response.put("result", "error");
	    }
	    
	    model.addAttribute("authVOList", authVOList);
	    model.addAttribute("menuList", loginSession.getAttribute("menuList"));
	    return response;
	}
	
	@ResponseBody
	@PostMapping("/deleteAuth")
	public Map<String, String> deleteAuth(HttpSession loginSession, Model model, @RequestBody AuthVO authVO){
		
		List<AuthVO> authVOList = this.authService.authList();
		
		int deleteAuthResult = authService.deleteAuth(authVO); // 권한 삭제
		log.info("deleteAuthResult : ", deleteAuthResult);
		
		Map<String, String> response = new HashMap<>();
		
		if(deleteAuthResult != 0) {
			response.put("result", "success");
		}else {
			response.put("result", "error");
		}
		
		model.addAttribute("authVOList", authVOList);
		model.addAttribute("menuList", loginSession.getAttribute("menuList"));		
		return response;
	}
	
	@ResponseBody
	@PostMapping("/authCheck")
	public int authCheck(@RequestBody AuthVO authVO) {
		log.info("authCheck : " + authVO);
		
		int result = authService.authCheck(authVO);
		
		return result;
	}
}
