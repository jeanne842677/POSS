package com.kh.poss.menu.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.menu.model.dao.MenuDao;
import com.kh.poss.menu.model.dto.Menu;
import com.kh.poss.menu.model.dto.MenuCat;

public class MenuService {

	private JDBCTemplate template = JDBCTemplate.getInstance();
	private MenuDao menuDao = new MenuDao();

	public int insertCate(MenuCat menuCat) {
		
		
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = menuDao.insertCate(menuCat , conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		return res;

		
		
	}

	public List<MenuCat> selectCateList(String userId) {
		List<MenuCat> menuCatList = null;
		Connection conn = template.getConnection();
		try {
			menuCatList = menuDao.selectCateList(userId, conn);
		} finally {
			template.close(conn);
		}
		return menuCatList;
	}

	
	public int modifyCate(MenuCat menuCat) {
		
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = menuDao.modifyCate(menuCat , conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		return res;
		
	}

	public int deleteCate(String catIdx) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = menuDao.deleteCate(catIdx, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
		
	}
	
	public int insertMenu(Menu menu) {
		
		
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = menuDao.insertMenu(menu , conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		return res;

		
		
	}

	public List<Menu> selectMenuList(String catIdx) {
		List<Menu> menuList = null;
		Connection conn = template.getConnection();
		try {
			menuList = menuDao.selectMenuList(catIdx, conn);
		} finally {
			template.close(conn);
		}
		
		
		
		return menuList;
	}
	
	
	
	
	public int deleteMenu(String menuIdx) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = menuDao.deleteMenu(menuIdx, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
		
	}
}
