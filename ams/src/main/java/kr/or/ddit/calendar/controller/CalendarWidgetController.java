package kr.or.ddit.calendar.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;

@Controller
public class CalendarWidgetController {
	//달력기본화면
//	@RequestMapping(value = "/adms/calendar/management/list.do")
//	public String lnb04List(RedirectAttributes redirectAttributes, HttpServletRequest request, @ModelAttribute("searchVO") tbl_calendarVO searchVO, ModelMap model) throws Exception {
//	 
//	    
//	    int isAdm = 0;
//	 
//	    LoginVO loginVO = loginService.getLoginInfo();
//	      if(loginVO.getAuthCode().contentEquals("1")) isAdm =1;
//	      model.addAttribute("isAdm", isAdm);
//	 
//	    return "tiles:adms/calendar/management/list";
//	}
//	 
//	 
//	//달력데이터조회
//	@RequestMapping(value = "/adms/calendar/management/read_ajx.do" ,method = RequestMethod.POST)
//	@ResponseBody
//	public String getCalData(
//	        @ModelAttribute("searchVO") tbl_calendarVO searchVO,
//	        HttpServletRequest request,
//	        HttpServletResponse res,
//	        ModelMap model) throws Exception {
//	    
//	    JSONObject obj = new JSONObject();
//	    
//	    res.setContentType("text/html; charset=UTF-8");
//	    PrintWriter out = res.getWriter();
//	    
//	    searchVO.setSite_code(loginService.getSiteCode());
//	    List<tbl_calendarVO> list = calendarService.getCalData(searchVO);
//	 
//	    obj.put("success", "ok");
//	    obj.put("list",net.sf.json.JSONArray.fromObject(list));
//	    out.print(obj);
//	    return null;
//	}
	 
	 
//	//달력데이터등록화면
//	@RequestMapping(value = "/adms/calendar/management/create_ajx.do",method = RequestMethod.POST)
//	@ResponseBody
//	public String createAction(
//	        @RequestBody String filterJSON,
//	        HttpServletRequest request,
//	        HttpServletResponse res,
//	        ModelMap model) throws Exception {
//	    LoginVO loginVO = loginService.getLoginInfo();
//	    JsonObject obj = new JSONObject();
//	    
//	    res.setContentType("text/html; charset=UTF-8");
//	    PrintWriter out = res.getWriter();
//	 
//	    //================================ json Object parse ============================
//	    ObjectMapper mapper = new ObjectMapper();            
//	    tbl_calendarVO searchVO = (tbl_calendarVO)mapper.readValue(filterJSON,new TypeReference<tbl_calendarVO>(){ });
//	    //================================ json Object parse ============================
//	    searchVO.setSite_code(loginService.getSiteCode());
//	    searchVO.setCret_id(loginVO.getId());
//	    searchVO.setCret_ip(request.getRemoteAddr());
//	    
//	    
//	    calendarService.createCalendar(searchVO);
//	    
//	 
//	    obj.put("success", "ok");
//	    out.print(obj);
//	    return null;
//	}
	 
	 
//	//달력데이터업데이트
//	@RequestMapping(value = "/adms/calendar/management/update_ajx.do",method = RequestMethod.POST)
//	@ResponseBody
//	public String updateAction(
//	        @RequestBody String filterJSON,
//	        HttpServletRequest request,
//	        HttpServletResponse res,
//	        ModelMap model) throws Exception {
//	    LoginVO loginVO = loginService.getLoginInfo();
//	    JSONObject obj = new JSONObject();
//	    
//	    res.setContentType("text/html; charset=UTF-8");
//	    PrintWriter out = res.getWriter();
//	 
//	    //================================ json Object parse ============================
//	    ObjectMapper mapper = new ObjectMapper();            
//	    tbl_calendarVO searchVO = (tbl_calendarVO)mapper.readValue(filterJSON,new TypeReference<tbl_calendarVO>(){ });
//	    //================================ json Object parse ============================
//	    searchVO.setSite_code(loginService.getSiteCode());
//	    searchVO.setModi_id(loginVO.getId());
//	    searchVO.setModi_ip(request.getRemoteAddr());
//	    
//	    
//	    calendarService.updateCalendar(searchVO);
//	    
//	 
//	    obj.put("success", "ok");
//	    out.print(obj);
//	    return null;
//	}
	 
	 
	//달력데이터삭제
//	@RequestMapping(value = "/adms/calendar/management/delete_ajx.do",method = RequestMethod.POST)
//	@ResponseBody
//	public String deleteAction(
//	        @RequestBody String filterJSON,
//	        HttpServletRequest request,
//	        HttpServletResponse res,
//	        ModelMap model) throws Exception {
//	    LoginVO loginVO = loginService.getLoginInfo();
//	    JSONObject obj = new JSONObject();
//	    
//	    res.setContentType("text/html; charset=UTF-8");
//	    PrintWriter out = res.getWriter();
//	 
//	    //================================ json Object parse ============================
//	    ObjectMapper mapper = new ObjectMapper();            
//	    tbl_calendarVO searchVO = (tbl_calendarVO)mapper.readValue(filterJSON,new TypeReference<tbl_calendarVO>(){ });
//	    //================================ json Object parse ============================
//	    searchVO.setSite_code(loginService.getSiteCode());
//	    searchVO.setModi_id(loginVO.getId());
//	    searchVO.setModi_ip(request.getRemoteAddr());
//	    
//	    
//	    calendarService.deleteCalendar(searchVO);
//	    
//	 
//	    obj.put("success", "ok");
//	    out.print(obj);
//	    return null;
//	}
}
