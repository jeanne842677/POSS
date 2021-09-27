package com.kh.poss.reserve.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;
import com.kh.poss.common.file.FileDTO;
import com.kh.poss.common.mms.MmsSender;
import com.kh.poss.member.model.dto.Member;
import com.kh.poss.reserve.model.dto.Reserve;
import com.kh.poss.reserve.model.dto.ReserveConfig;

public class ReserveDao {
	
	private JDBCTemplate template = JDBCTemplate.getInstance();
	Date date = new Date();
	
	public String isExsist(String userId, Connection conn) {
		  String existId = null;
	      ResultSet rset = null;
	      PreparedStatement pstm = null;
	      String query = "select user_id from poss_user where user_id=? and is_leave = 0";
	      try {
	    	 pstm = conn.prepareStatement(query); 
	    	 pstm.setString(1, userId);
	         rset = pstm.executeQuery();
	         if(rset.next()) {
	        	 Reserve reserve = new Reserve();
	 	         reserve.setUserId(rset.getString("user_id"));
	        	 existId = reserve.getUserId();
	         }
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset);
	      }  
	      return existId;
	}
	
	 public List<Reserve> selectBoardList(String userId, Connection conn) {
         List<Reserve> reserveList = new ArrayList<Reserve>();
          Reserve reserve = null;
          PreparedStatement pstm = null;
          ResultSet rset = null;
           
          String query = "select * from reserve where user_id = ? order by reserve_idx desc";
          
          try {
             
            pstm = conn.prepareStatement(query);
            pstm.setString(1, userId);
              rset = pstm.executeQuery();
          
              while(rset.next()) {
                 reserve = convertAllToReserve(rset);
                 reserveList.add(reserve);
              }
              
           } catch (SQLException e) {
              throw new DataAccessException(e);
           } finally {
              template.close(rset, pstm);
           }   
          
           System.out.println(reserveList);
            
           return reserveList;
           
   }
   
   public List<Reserve> selectDetailReserveList(String userId, String userName, String startDate, String endDate,
         int day, Connection conn) {
      
      List<Reserve> reserveList = new ArrayList<Reserve>();
      Reserve reserve = null;
      PreparedStatement pstm = null;
      ResultSet rset = null;
       String query = "";
      
          
      try {
         
         if(day == 0 || day == 2 || day == 6) {
            query = "select * from reserve where user_id = ? and name like ? and "
                  + "re_date between to_char(sysdate, 'yyyy-mm-dd') and to_char(sysdate+?, 'yyyy-mm-dd') "
                  + "order by re_date asc";
            
            pstm = conn.prepareStatement(query);
            pstm.setString(1, userId);
            pstm.setString(2, userName);
            pstm.setInt(3, day);
            rset = pstm.executeQuery();
         } else {
            query = "select * from reserve where user_id = ? and "
                  + "name like ? and to_char(re_date, 'yyyy-mm-dd') between ? and ? "
                  + "order by re_date asc";
            
            pstm = conn.prepareStatement(query);
            pstm.setString(1, userId);
            pstm.setString(2, userName);
            pstm.setString(3, startDate);
            pstm.setString(4, endDate);
            rset = pstm.executeQuery();
         }
         
         
         while(rset.next()) {
            reserve = convertAllToReserve(rset);
            reserveList.add(reserve);
         }
              
           } catch (SQLException e) {
              throw new DataAccessException(e);
           } finally {
              template.close(rset, pstm);
           }   
          
           System.out.println(reserveList);
            
           return reserveList;
   }
   
   public int countReservation(Connection conn, String userId) {
      int count = 0;
      ResultSet rset = null;
      PreparedStatement pstm = null;
      String query = "select COUNT(*) as count from reserve where user_id = ? and re_date = to_char(sysdate, 'yyyy-mm-dd') and is_cancel = 0"
            + " and is_visit = 0";
                  
      try {
         pstm = conn.prepareStatement(query);
         pstm.setString(1, userId);
         rset = pstm.executeQuery();
            
         if(rset.next()) {
            count = rset.getInt("count");
         }
      } catch (SQLException e) {
         throw new DataAccessException(e);
      } finally {
         template.close(pstm);
      }
         
      return count;
   }

	
	public int insertReserve(Reserve reserve, Connection conn) {
		
		int res = 0;
		long time = date.getTime();
	    java.sql.Date date1 = new java.sql.Date(time);
	    PreparedStatement pstm = null;
	    String query = "insert into reserve(reserve_idx,user_id,name,phone,num,re_date,reg_date,is_visit,is_cancel,content,re_time)"
	          + " values(sc_reserve_idx.nextval,?, ?, ?, ?, ?, ?, 0, 0, ?, ?)";
	    try {
	    	
	       pstm = conn.prepareStatement(query);
	       pstm.setString(1, reserve.getUserId());
	       pstm.setString(2, reserve.getName());
	       pstm.setString(3, reserve.getPhone());
	       pstm.setString(4, reserve.getNum());
	       pstm.setDate(5, reserve.getReDate());
	       pstm.setDate(6, date1);
	       pstm.setString(7, reserve.getContent());
	       pstm.setString(8, reserve.getReTime());
	       
	       res = pstm.executeUpdate();
	       } catch (SQLException e) {
	       throw new DataAccessException(e);
	       } finally {
	       template.close(pstm);
     }
	    return res;
	}

	public Reserve selectBoardList(String userId, String phone, Connection conn) {
	      Reserve reserve = null;
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      
	      String query = "select * from reserve where phone = ? and user_id = ? order by reg_date desc";
	      
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, phone);
	         pstm.setString(2, userId);
	         
	         rset = pstm.executeQuery();
	         
	         if(rset.next()) {
	        	 reserve = convertAllToReserve(rset);
	         }
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }  
	      return reserve;
	}	
	
	public int cancelReserve(String reserveIdx, Connection conn) {
		  int res = 0;
	      PreparedStatement pstm = null;
	      String query = "update reserve set is_cancel = '1' where reserve_idx = ?";
	            
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, reserveIdx);
	         
	         res = pstm.executeUpdate();
	       } catch (SQLException e) {
	            throw new DataAccessException(e);
	       } finally {
	            template.close(pstm);
	       }
	       return res;
	}
	
	public List<Reserve> searchReserve(String userId, String name, String phone, Connection conn) {
		  List<Reserve> reserveList = new ArrayList<Reserve>();
	      Reserve reserve = null;
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      String query = "select * from reserve where user_id = ? and name = ? and phone = ? and is_cancel != 1 and is_visit != 1 order by reg_date desc";
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, userId);
	         pstm.setString(2, name);
	         pstm.setString(3, phone);
	         rset = pstm.executeQuery();
	         
	         while(rset.next()) {
	            reserve = convertAllToReserve(rset);
	            reserveList.add(reserve);
	         }
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }   
	      System.out.println(reserveList);
	      return reserveList;
	}
	
	public Reserve selectReserve(String reserveIdx, Connection conn) {
		  Reserve reserve = null;
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      String query = "select * from reserve where reserve_idx=? and is_cancel != 1";
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, reserveIdx);
	         rset = pstm.executeQuery();
	         
	         if(rset.next()) {
	            reserve = convertAllToReserve(rset);
	         }
	         
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }
	      
	      System.out.println(reserve);
	      return reserve;
	}
	
	public ReserveConfig selectConfig(String userId, Connection conn) {

		ReserveConfig reserveConfig = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from reserve_config where user_id = ?";
		
		try {
	         
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			rset = pstm.executeQuery();
	         
	         while(rset.next()) {
	        	 reserveConfig = convertAllToConfig(rset);
	         }
	         
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}
		return reserveConfig;
	}
	
	public void modifyReserve(String userId, String startPeriod, String endPeriod, String openTime, String closeTime,
			String introductionOfStore, Connection conn) {
		
		CallableStatement cstm = null;
		String query = "{call SP_SETTING_RESERVE(?,?,?,?,?,?)}";
		

		try {
			cstm = conn.prepareCall(query);
			cstm.setString(1, userId);
			cstm.setString(2, openTime);
			cstm.setString(3, closeTime);
			cstm.setString(4, startPeriod);
			cstm.setString(5, endPeriod);
			cstm.setString(6, introductionOfStore);
			cstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(cstm);
		}
	}
	
	public void uploadImage(FileDTO fileDTO, String userId, Connection conn) {
		
		CallableStatement cstm = null;
		String query = "{call SP_MODIFY_IMAGE(?,?,?,?)}";
		

		try {
			cstm = conn.prepareCall(query);
			cstm.setString(1, userId);
			cstm.setString(2, fileDTO.getOriginFileName());
			cstm.setString(3, fileDTO.getRenameFileName());
			cstm.setString(4, fileDTO.getSavePath());
			cstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(cstm);
		}
		
	}
	
	public FileDTO selectImage(String userId, Connection conn) {
		FileDTO fileDTO = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from store_file where user_id = ?";

		try {

			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			rset = pstm.executeQuery();

			if(rset.next()) {
				fileDTO = new FileDTO();
				fileDTO.setOriginFileName(rset.getString("origin_file_name"));
				fileDTO.setRenameFileName(rset.getString("rename_file_name"));
				fileDTO.setSavePath(rset.getString("save_path"));
			}

		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}
		
		return fileDTO;
	}
	
	private Reserve convertAllToReserve(ResultSet rset) throws SQLException {
	      	Reserve reserve = new Reserve();
	        reserve.setReserveIdx(rset.getString("reserve_idx"));
	        reserve.setUserId(rset.getString("user_id"));
	        reserve.setSeatIdx(rset.getString("seat_idx"));
	        reserve.setName(rset.getString("name"));
	        reserve.setPhone(rset.getString("phone"));
	        reserve.setNum(rset.getString("num"));
	        reserve.setReDate(rset.getDate("re_date"));
	        reserve.setRegDate(rset.getDate("reg_date"));
	        reserve.setIsVisit(rset.getInt("is_visit"));
	        reserve.setIsCancel(rset.getInt("is_cancel"));
	        reserve.setContent(rset.getString("content"));
	        reserve.setReTime(rset.getString("re_time"));
	        return reserve;
	 }
	
	private ReserveConfig convertAllToConfig(ResultSet rset) throws SQLException{
		ReserveConfig reserveConfig = new ReserveConfig();
		reserveConfig.setUserId(rset.getString("user_id"));
		reserveConfig.setOpenTime(rset.getString("open_time"));
		reserveConfig.setCloseTime(rset.getString("close_time"));
		reserveConfig.setStartPeriod(rset.getString("start_period"));
		reserveConfig.setEndPeriod(rset.getString("end_period"));
		reserveConfig.setStoreInfo(rset.getString("store_Info"));;
		return reserveConfig;
	}
	
	public int confirmWaitingByMessage(HttpServletRequest request, HttpServletResponse response, Reserve reserve) {
	      int res = 0;
	      Member member = (Member) request.getSession().getAttribute("authentication");
	      String phone = reserve.getPhone();
	      String name = reserve.getName();
	      String storeName = member.getStore_name();
	      String reservationPeople = reserve.getNum();
	      java.sql.Date reservationDate = reserve.getReDate();
	      String reservationTime = reserve.getReTime();
	      MmsSender.setMessage(phone, storeName, "\n예약이 완료되었습니다.\n* 예약자 : " + name + "\n* 예약인원 : " + reservationPeople
	            + "명 \n* 예약일 : " + reservationDate + "\n* 예약시간 : " + reservationTime);
	      return res;
	   }

	   public int confirmWaitingByMessage(HttpServletRequest request, HttpServletResponse response, String userId, String reserveIdx, Connection conn) {
	      int res = 0;
	      Member member = (Member) request.getSession().getAttribute("authentication");
	      Reserve reserve = null;
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      System.out.println("유저아이디 :" + userId);
	      System.out.println("취소 할 인덱스 :" + reserveIdx);
	      String query = "select * from reserve where user_id = ? and  is_cancel = 1 and is_visit != 1 and reserve_idx = ?";
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, userId);
	         pstm.setString(2, reserveIdx);
	         rset = pstm.executeQuery();

	         if (rset.next()) {
	            reserve = convertAllToReserve(rset);
	         }
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }
	      System.out.println("다오리저브 : " + reserve);

	      String phone = reserve.getPhone();
	      String storeName = member.getStore_name();
	      String name = reserve.getName();
	      String reservationPeople = reserve.getNum();
	      java.sql.Date reservationDate = reserve.getReDate();
	      String reservationTime = reserve.getReTime();

	      MmsSender.setMessage(phone, storeName, "예약이 취소되었습니다.\n* 예약자 : " + name + "\n* 예약인원 : " + reservationPeople
	            + "명 \n* 예약일 : " + reservationDate + "\n* 예약시간 : " + reservationTime);
	      return res;
	   }

	

}
