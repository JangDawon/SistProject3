package com.project3.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("certifyService")
public class certifyServiceImpl {
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
		String api_key = "NCSQPIAHBGUPITMJ";
	    String api_secret = "AXHSZJNOIWLP5UBJRHJZLFFEZ4IVL6HT";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);
	    params.put("from", "01087969571");
	    params.put("type", "SMS");
	    params.put("text", cerNum);
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
	}
}
