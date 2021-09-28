package com.kh.poss.menu.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;
import com.kh.poss.menu.model.dto.Menu;
import com.kh.poss.menu.model.dto.MenuCat;

public class MenuDao {

	private JDBCTemplate template = JDBCTemplate.getInstance();

	public int insertCate(MenuCat menuCat, Connection conn) {
		
		int res = 0;
		PreparedStatement pstm = null;
		String query = "insert into menu_cat"
				+ " values(sc_menu_cat_idx.nextval,? ,?, ?, ?)";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, menuCat.getUserId());
			pstm.setString(2, menuCat.getName());
			pstm.setString(3, menuCat.getIcon());
			pstm.setString(4, menuCat.getColor());
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}
		return res;
	}

	public List<MenuCat> selectCateList(String userId, Connection conn) {
		  List<MenuCat> menuCatList = new ArrayList<>();
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      String query = "select * from menu_cat where user_id = ? order by cat_idx";
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, userId);
	         rset = pstm.executeQuery();
	         
	         while(rset.next()) {
	        	MenuCat menuCat= new MenuCat();
	        	menuCat.setCatIdx(rset.getString("cat_idx"));
	        	menuCat.setUserId(rset.getString("user_id"));
	        	menuCat.setName(rset.getString("name"));
	        	menuCat.setIcon(rset.getString("icon"));
	        	menuCat.setColor(rset.getString("color"));
	        	menuCatList.add(menuCat);
	         }
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }   
	      return menuCatList;
	}

	public int modifyCate(MenuCat menuCat , Connection conn) {
		 int res = 0;
	      PreparedStatement pstm = null;
	      String query = "update menu_cat set name=?, icon=?, color=? where cat_idx=?";
	            
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, menuCat.getName());
	         pstm.setString(2, menuCat.getIcon());
	         pstm.setString(3, menuCat.getColor());
	         pstm.setString(4, menuCat.getCatIdx());
	         
	         res = pstm.executeUpdate();
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(pstm);
	      }
	      return res;
	}

	public int deleteCate(String catIdx, Connection conn) {
	      int res = 0;
	      PreparedStatement pstm = null;
	      String query = "delete from menu_cat where cat_idx=?";
	            
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, catIdx);
	         
	         res = pstm.executeUpdate();
	       } catch (SQLException e) {
	            throw new DataAccessException(e);
	       } finally {
	            template.close(pstm);
	       }
	       return res;
	}

	

	public int insertMenu(Menu menu, Connection conn) {
		
		int res = 0;
		PreparedStatement pstm = null;
		String query = "insert into menu(menu_idx , cat_idx, name, price, icon ,color)"
				+ " values(sc_menu_idx.nextval,? ,?, ?, ? , ?)";
		try {
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, menu.getCatIdx());
			pstm.setString(2, menu.getName());
			pstm.setInt(3, menu.getPrice());
			pstm.setString(4, menu.getIcon());
			pstm.setString(5, menu.getColor());
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}
		return res;
	}
	
	public List<Menu> selectMenuList(String catIdx, Connection conn) {
		 List<Menu> menuList = new ArrayList<>();
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      String query = "select * from menu where cat_idx = ?order by cat_idx";
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, catIdx);
	         rset = pstm.executeQuery();
	         
	         while(rset.next()) {
	        	Menu menu= new Menu();
	        	menu.setMenuIdx(rset.getString("menu_idx"));
	        	menu.setCatIdx(rset.getString("cat_idx"));
	        	menu.setName(rset.getString("name"));
	        	menu.setPrice(rset.getInt("price"));
	        	menu.setTotalCnt(rset.getInt("total_cnt"));
	        	menu.setIcon(rset.getString("icon"));
	        	menu.setColor(rset.getString("color"));
	  
	        	menuList.add(menu);
	         }
	         
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }   
	      
	      return menuList;
	}
	
	
	
	
	//메뉴수정
	public int modifyMemu(Menu menu , Connection conn) {
		 int res = 0;
	      PreparedStatement pstm = null;
	      String query = "update menu_cat set name=?, icon=?, color=? where menu_idx=?";
	            
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, menu.getName());
	         pstm.setString(2, menu.getIcon());
	         pstm.setString(3, menu.getColor());
	         pstm.setString(4, menu.getMenuIdx());
	         
	         res = pstm.executeUpdate();
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(pstm);
	      }
	      return res;
	}
	


	public int deleteMenu(String menuIdx, Connection conn) {
	      int res = 0;
	      PreparedStatement pstm = null;
	      String query = "delete from menu where menu_idx=?";
	            
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, menuIdx);
	         
	         res = pstm.executeUpdate();
	       } catch (SQLException e) {
	            throw new DataAccessException(e);
	       } finally {
	            template.close(pstm);
	       }
	       return res;
	}
	
	
	


}
