package com.kh.poss.common.mms;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class MmsSender {
	
	
	
	public static void setMessage(String phone , String context) {
		

		  String api_key = "NCSWYQ05MLTN4URX";
	      String api_secret = "GM14FK3ESJSI6ZHR3CEHKMBPLFU3YPI1";
	      Message coolsms = new Message(api_key, api_secret);
	      
	      

	      HashMap<String, String> params = new HashMap<String, String>();
	      params.put("to", phone);
	      params.put("from", "01095347492");
	      params.put("type", "SMS");
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
