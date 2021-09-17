package com.kh.poss.member.model.service;


import java.sql.Connection;

import com.kh.poss.common.db.JDBCTemplate;
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

	

	

}
