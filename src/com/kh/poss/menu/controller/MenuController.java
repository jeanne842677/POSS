package com.kh.poss.menu.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.poss.common.exception.PageNotFoundException;
import com.kh.poss.common.file.FileDTO;
import com.kh.poss.common.file.FileUtil;
import com.kh.poss.common.file.MultiPartParams;
import com.kh.poss.member.model.dto.Member;
import com.kh.poss.menu.model.dto.Menu;
import com.kh.poss.menu.model.dto.MenuCat;
import com.kh.poss.menu.model.service.MenuService;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/menu/*")
public class MenuController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MenuService menuService = new MenuService();
	
	public MenuController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length - 1]);

		switch (uri[uri.length - 1]) {
		case "select": // 메뉴선택
			select(request, response);
			break;
		case "modify": // 메뉴 수성
			modify(request, response);
			break;
		case "add-cate" :
			addCate(request, response);
			break;
		case "modify-cate" :
			modifyCate(request, response);
			break;
		case "delete-cat" :
			deleteCat(request, response);
			break;
		case "menu-list" :
			menuList(request, response);
			break;
		case "add-menu" :
			addMenu(request, response);
			break;
		case "delete-menu" :
			deleteMenu(request, response);
			break;

		case "select-cate" :
			selectCate(request, response);
			break;
		default:
			throw new PageNotFoundException();

		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}









	private void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String table = request.getParameter("table");
		String idx = request.getParameter("idx");
		System.out.println(table);
		System.out.println(idx);

		String userId = ((Member) request.getSession().getAttribute("authentication")).getUserId();
		List<MenuCat>  menuCatList = menuService.selectCateList(userId);
		request.setAttribute("menuCatList", menuCatList);
		request.getRequestDispatcher("/menu/menu-select").forward(request, response);

	}

	private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = ((Member) request.getSession().getAttribute("authentication")).getUserId();
		List<MenuCat> menuCatList = menuService.selectCateList(userId);
		System.out.println(menuCatList);
		
		request.setAttribute("menuCatList", menuCatList);
		request.getRequestDispatcher("/menu/menu-modify").forward(request, response);

	}
	
	private void addCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String icon = request.getParameter("icon");
		MenuCat menuCat= new MenuCat();
		
		String userId = ((Member) request.getSession().getAttribute("authentication")).getUserId();
		menuCat.setUserId(userId);
		menuCat.setIcon(icon);
		menuCat.setColor(color);
		menuCat.setName(name);
		System.out.println(userId);
		menuService.insertCate(menuCat);
		
		response.sendRedirect("/menu/modify");
		
	}

	
	private void modifyCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		

		String catIdx = request.getParameter("catIdx");
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String icon = request.getParameter("icon");
		MenuCat menuCat= new MenuCat();
		menuCat.setCatIdx(catIdx);
		menuCat.setIcon(icon);
		menuCat.setColor(color);
		menuCat.setName(name);
		
		menuService.modifyCate(menuCat);
		
		

		response.sendRedirect("/menu/modify");
		
	}
	
	
	private void deleteCat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		

		String catIdx = request.getParameter("catIdx");
		menuService.deleteCate(catIdx);

		response.sendRedirect("/menu/modify");
		
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	
	private void menuList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String catIdx = request.getParameter("catIdx");
		String userId = ((Member) request.getSession().getAttribute("authentication")).getUserId();
		List<MenuCat> menuCatList = menuService.selectCateList(userId);
		List<Menu> menuList = menuService.selectMenuList(catIdx);
		
		request.setAttribute("menuCatList", menuCatList);
		request.setAttribute("menuList", menuList);
		
		
		for(MenuCat mc : menuCatList) {
			
			if(mc.getCatIdx().equals(catIdx)) {
				
				request.setAttribute("thisCat", mc);
				System.out.println(mc);
				break;
			}
			
		}
	
		

		request.getRequestDispatcher("/menu/menu-modify2").forward(request, response);
		
		
		
	}
	
	

	private void addMenu(HttpServletRequest request, HttpServletResponse response) throws IOException {
		

		String catIdx = request.getParameter("catIdx");
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		String color = request.getParameter("color");
		String icon = request.getParameter("icon");
		
		Menu menu = new Menu();
		menu.setCatIdx(catIdx);
		menu.setName(name);
		menu.setPrice(price);
		menu.setColor(color);
		menu.setIcon(icon);
		menuService.insertMenu(menu);
		
		response.sendRedirect("/menu/menu-list?catIdx="+catIdx);
		
		
		
	}
	
	private void deleteMenu(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String catIdx = request.getParameter("catIdx");
		String menuIdx = request.getParameter("menuIdx");
		menuService.deleteMenu(menuIdx);
		

		response.sendRedirect("/menu/menu-list?catIdx="+catIdx);
		
		
	}
	
	


	private void selectCate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String catIdx = request.getParameter("catIdx");
		List<Menu> menuList = menuService.selectMenuList(catIdx);
		Gson gson = new Gson();
		String menuListJson = gson.toJson(menuList);
		
		System.out.println(menuListJson);
		
		response.setHeader("Content-Type", "application/json; charset=utf-8");
		response.getWriter().print(menuListJson);
		
	}


}
