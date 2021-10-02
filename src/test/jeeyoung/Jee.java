package test.jeeyoung;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


/**
 * Servlet implementation class Jee
 */
@WebServlet("/jee/*")
public class Jee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Jee() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length - 1]); // 콘솔 확인용 코드 (추후 삭제 예정)

		switch (uri[uri.length - 1]) {
		case "mms":
			sendWaitingMessage(request, response);
			break;
		case "mmsTest" :
			mmsTest(request,response);
			break;
		case "socket" :
			socket(request,response);
			break;
	
		}
	}

	private void socket(HttpServletRequest request, HttpServletResponse response) {
		
		
		
	}

	private void mmsTest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
		  
	      String api_key = "NCSLBJW1MNQDYWXB";
	      String api_secret = "14RB1KQWXFFS876H8TUVOPAVFEF2SLUJ";
	      Message coolsms = new Message(api_key, api_secret);
	      HashMap<String, String> params = new HashMap<String, String>();
	      params.put("to", "01094244977");
	      params.put("from", "01094244977");
	      params.put("type", "LMS");
	      params.put("subject", "[구현포차]");
	      params.put("text", "\n고객님의 입장 순서 앞에 3팀이 대기중 입니다.\n곧 입장 하실 예정이니 매장 앞에서 대기해 주시길 바랍니다!\n\n* 호출 시 안계실 경우 웨이팅이 취소될 수 있으니 유의해 주시기 바랍니다.");
	      params.put("app_version", "test app 1.2"); 

	      try {
	         JSONObject obj = (JSONObject) coolsms.send(params);
	         System.out.println(obj.toString());
	      
	      } catch (CoolsmsException e) {
	         System.out.println("에러");
	      }
	   //   response.sendRedirect("/waiting/waiting-page");

		   

		
	}

	private void sendWaitingMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.sendRedirect("/mms?phone=01088329612&context=예진아 사랑해&redirectUri=/index");
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
