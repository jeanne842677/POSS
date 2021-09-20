package com.kh.poss.common.mms;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MmsSender {
	
	
	
	public void setMessage(String phone , String context) {
		

		  String api_key = "NCSLBJW1MNQDYWXB";
	      String api_secret = "14RB1KQWXFFS876H8TUVOPAVFEF2SLUJ";
	      Message coolsms = new Message(api_key, api_secret);
	      
	      

	      HashMap<String, String> params = new HashMap<String, String>();
	      params.put("to", phone);
	      params.put("from", "01094244977");
	      params.put("type", "SMS");
	    //  params.put("subject", "[구현포차]");
	      params.put("text", context);
	      params.put("app_version", "test app 1.2"); 

	      try {
	         JSONObject obj = (JSONObject) coolsms.send(params);
	         System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	         System.out.println(e.getMessage());
	         System.out.println(e.getCode());
	      }
		
		
	}
	

}
