package com.kh.poss.common.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

//dao안에 중복되는 메서드를 줄여줄 템플릿

//SingleTon pattern : 인스턴스를 여러번 생성해도 1번만 호출하도록 처리하는 디자인 패턴

//1. 생성자를 private으로 만듦  
//2. static 필드변수를 만듦   :싱글톤 패턴
//3. getInstance() 메서드 만듦

public class JDBCTemplate {

	private static JDBCTemplate instance;

	 PoolDataSource pds;
	// 드라이버 열기
	private JDBCTemplate() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@possdb_high?TNS_ADMIN=C:/CODE/before/e_servlet/Wallet_possDB";
			String userId = "ADMIN";
			String password = "Rngusgowh123";
			
			final String CONN_FACTORY_CLASS_NAME="oracle.jdbc.pool.OracleDataSource";
			
			 pds = PoolDataSourceFactory.getPoolDataSource();

			    // Set the connection factory first before all other properties
			    pds.setConnectionFactoryClassName(CONN_FACTORY_CLASS_NAME);
			    pds.setURL(url);
			    pds.setUser(userId);
			    pds.setPassword(password);
			    pds.setConnectionPoolName("JDBC_UCP_POOL");

			    // Default is 0. Set the initial number of connections to be created
			    // when UCP is started.
			    pds.setInitialPoolSize(5);

			    // Default is 0. Set the minimum number of connections
			    // that is maintained by UCP at runtime.
			    pds.setMinPoolSize(5);

			    // Default is Integer.MAX_VALUE (2147483647). Set the maximum number of
			    // connections allowed on the connection pool.
			    pds.setMaxPoolSize(20);

			    // Default is 30secs. Set the frequency in seconds to enforce the timeout
			    // properties. Applies to inactiveConnectionTimeout(int secs),
			    // AbandonedConnectionTimeout(secs)& TimeToLiveConnectionTimeout(int secs).
			    // Range of valid values is 0 to Integer.MAX_VALUE. .
			    pds.setTimeoutCheckInterval(5);

			    // Default is 0. Set the maximum time, in seconds, that a
			    // connection remains available in the connection pool.
			    pds.setInactiveConnectionTimeout(10);
			

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static JDBCTemplate getInstance() {
		if (instance == null) {
			instance = new JDBCTemplate();
		}
		return instance;

	}

	// 데이터 베이스와 연결 수립: Connection 객체 만들기
	public Connection getConnection() {
		Connection conn = null;


		try {

			conn = pds.getConnection();
			// 트랜젝션 관리를 개발하기 하기 위해 Auto commit 끄기
			conn.setAutoCommit(false); // 세션 완료시에는 commit이 됨.
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;

	}

	// 3. commit /rollback

	public void commit(Connection conn) {

		try {
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void rollback(Connection conn) {

		try {
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 4. close()
	public void close(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {// finally블록에 썼던 이 구문에는, 이 분기가 반드시 필요함!!
				// finally메소드 분리할 때 주의할 것.
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void close(Statement stmt) {
		try {
			if (stmt != null && !stmt.isClosed()) {// 이 예외처리가 반드시 필요함!!
				stmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void close(ResultSet rset) {
		try {
			if (rset != null && !rset.isClosed()) {// 이 예외처리가 반드시 필요함!!
				rset.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void close(ResultSet rset, Statement stmt, Connection conn) {

		close(rset);
		close(stmt);
		close(conn);
		/*
		 * try {
		 * 
		 * 
		 * if (rset != null && !rset.isClosed()) { rset.close(); } if (stmt != null &&
		 * !stmt.isClosed()) { stmt.close(); }
		 * 
		 * if (conn != null && !conn.isClosed()) { conn.close(); }
		 * 
		 * 
		 * } catch (SQLException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */

	}

	public void close(Statement stmt, Connection conn) {
		close(stmt);
		close(conn);
	}

	public void close(ResultSet rset, Statement stmt) {
		close(rset);
		close(stmt);

	}

}
