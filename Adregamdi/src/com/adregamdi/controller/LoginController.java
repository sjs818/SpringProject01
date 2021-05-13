package com.adregamdi.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.adregamdi.dto.UserDTO;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping("/user")
public class LoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Resource(name="loginUserDTO") 
	private UserDTO loginUserDTO;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naver_login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);

		model.addAttribute("url", naverAuthUrl);
		return "user/naver_login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String email = (String) response_obj.get("email");
		String id = (String) response_obj.get("id");
		String mobile = (String) response_obj.get("mobile");
		String name = (String) response_obj.get("name");
		System.out.println(email);
		System.out.println(id);
		System.out.println(mobile);
		System.out.println(name);
		
		
		// if ( id != db) -> 저장
		
		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionEmail", email);
		session.setAttribute("sessionNo", id);
		session.setAttribute("sessionPhone", mobile);
		session.setAttribute("sessionName", name);
		model.addAttribute("result", apiResult);
		
		
		/*
		 * if(session != null) { loginUserDTO.setUser_email((String)
		 * session.getAttribute("sessionEmail")); loginUserDTO.setUser_id((String)
		 * session.getAttribute("sessionEmail")); loginUserDTO.setUser_phone((String)
		 * session.getAttribute("sessionPhone")); loginUserDTO.setUser_name((String)
		 * session.getAttribute("sessionName")); loginUserDTO.setUserLogin(true);
		 * System.out.println(loginUserDTO.getUser_email());
		 * System.out.println(loginUserDTO.getUser_id());
		 * System.out.println(loginUserDTO.getUser_name());
		 * System.out.println(loginUserDTO.getUser_phone()); }
		 */
		
		return "user/login_success";
		
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "main";
	}

}
