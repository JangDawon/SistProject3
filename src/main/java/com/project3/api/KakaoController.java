package com.project3.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KakaoController {
	private kakao_restapi kakao_restapi = new kakao_restapi();
    
    @RequestMapping(value = "/login_kakao.do", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
    public String kakaoLogin(@RequestParam("code") String code) {
        System.out.println("token");
    	//System.out.println(access_token);
        return "home";
    }

}
