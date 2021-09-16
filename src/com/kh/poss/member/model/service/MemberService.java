package com.kh.poss.member.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.mail.MailSender;
import com.kh.poss.member.model.dao.MemberDao;
import com.kh.poss.member.model.dto.Member;



//Service
//어플리케이션의 비즈니스로직을 작성
//사용자의 요청을 컨트롤러로부터 위임받아 해당 요청을 처리하기 위해 필요한 핵심적인 작업을 진행
//작업을 수행하기 위해 데이터베이스에 저장된 데이터가 필요하면 dao에게 요청
//비즈니스로직을 service가 담당하기 때문에 transaction관리를 Service가 닫당
//cimmit, rollback을 Service가 담당함 

//connection객체 생성, close처리
//commit과 rollback
//SQLException 예외처리(rollback)

public class MemberService {

	private MemberDao memberDao = new MemberDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();

	
	
	public Member memberAuthenticate(String userId, String password) {

		Connection conn = template.getConnection();
		Member member = null;

		try {

			member = memberDao.memberAuthenticate(userId, password, conn);
		} finally {
			template.close(conn);
		}
		return member;
	}

	
	
	public Member selectMemberById(String userId) {

		Connection conn = template.getConnection();
		Member member = null;

		try {
			member = memberDao.selectMemberById(userId, conn);
		} finally {
			template.close(conn);

		}

		return member;

	}

	
	public List<Member> selectMemberList() {

		Connection conn = template.getConnection();
		List<Member> memberList = null;

		try {
			memberList = memberDao.selectMemberList(conn);
		} finally {
			template.close(conn);

		}

		return memberList;

	}

	// insert구문에서는 commit과 rollback이 필요함
	public int insertMember(Member member)   {

		int res = 0;
		Connection conn = template.getConnection();;
		try {
			res = memberDao.insertMember(member, conn);
			template.commit(conn);

		} catch (Exception e) {     //보통 다른 문제가 발생할 수 도 있기 때문에 SQLException 대신 Exception 씀
			template.rollback(conn);
			throw e;
			
		} finally {
			template.close(conn);
		}

		return res;

	}

	public int updateMemeberPassword(String userId, String password) {

		int res = 0;
		Connection conn = template.getConnection();;

		try {

			res = memberDao.updateMemberPassword(userId, password, conn);
			template.commit(conn);
		} catch (Exception e) {

			template.rollback(conn);
			e.printStackTrace();
		} finally {

			template.close(conn);

		}

		return res;

	}

	public int deleteMember(String userId) {
		int res = 0;
		Connection conn = template.getConnection();;

		try {

			res = memberDao.deleteMember(userId, conn);
			template.commit(conn);

		} catch (Exception e) {

			template.rollback(conn);
			e.printStackTrace();

		} finally {
			template.close(conn);

		}

		return res;

	}


	
	
	//이메일 인증 관련 메소드
	public void authenticateByEmail(Member member) {
		
		MailSender mailSender = new MailSender();
		
		
		

		try {
			
			//요청할 서버 url : 지금은 내 서버 url임
			URL url = new URL("http://localhost:9090/mail?mailTemplate=join-auth-mail&userId="+member.getUserId()); 
			
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
				
				

				
				
				mailSender.sendMail(member.getEmail(), "자바에서 보낸 메일: 회원가입 축하합니다.", responseBody.toString());
				
				
			}

			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}

}
