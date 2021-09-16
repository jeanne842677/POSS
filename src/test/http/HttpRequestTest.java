package test.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test/http/*")
public class HttpRequestTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HttpRequestTest() {
        super();
        
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] uriArr = request.getRequestURI().split("/");
		
		switch(uriArr[uriArr.length-1]) {
		case "connect": 
			testHttpUrlConnection();
			break;
			
		default :
			break;
		
		
		}
		
	}
	
	
	//내가 내 서버로 요청 보내기
	private void testHttpUrlConnection() {
		
		try {
			
			//요청할 서버 url : 지금은 내 서버 url임
			URL url = new URL("http://localhost:9090/mail?mailTemplate=join-auth-mail"); 
			
			//http방식으로 보낼거기 때문에 커넥션 연결
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");  //겟방식으로 보내기
			
			StringBuffer responseBody = new StringBuffer();
			
			try (InputStream is = conn.getInputStream();
				BufferedReader br = new BufferedReader(new InputStreamReader(is));) {
				String line=null;
				while((line=br.readLine()) != null) {
					
					responseBody.append(line);
					
				}
				
				System.out.println(responseBody);
				
				
				
				
			}

			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}
