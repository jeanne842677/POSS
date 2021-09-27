package com.kh.poss.reserve.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.exception.PageNotFoundException;
import com.kh.poss.common.file.FileDTO;
import com.kh.poss.common.file.FileUtil;
import com.kh.poss.common.file.MultiPartParams;
import com.kh.poss.reserve.model.dto.Reserve;
import com.kh.poss.reserve.model.dto.ReserveConfig;
import com.kh.poss.reserve.model.service.ReserveService;

@WebServlet("/reserve/*")
public class reserveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReserveService reserveService = new ReserveService();

	public reserveController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length - 1]); // 콘솔 확인용 코드 (추후 삭제 예정)
		String userId = uri[uri.length - 2];
		if (isExist(request, response, userId) != null) {
			switch (uri[uri.length - 1]) {
			case "confirm": // 예약 전체내역 확인 폼으로 이동
				confirm(request, response, userId);
				break;
				
			case "modify": // 예약 설정 폼으로 이동
				modify(request, response, userId);
				break;
				
			case "reserve-modify":
				reserveModify(request, response, userId);
				break;
				
			case "upload":
				uploadImage(request, response, userId);
				break;
				
			case "okay": // 예약 조회 내역으로 이동
				okay(request, response, userId);
				break;
				
			case "cancel": // 예약 취소 내역 폼으로 이동
				cancel(request, response, userId);
				break;
				
			case "reserve-cancel":
				reserveCancel(request, response, userId);
				break;

			case "reservation-form": // 고객용 예약 폼으로 이동
				resform(request, response, userId);
				break;

			case "reservation-insert": // 예약 정보를 db에 저장
				resInsert(request, response, userId);
				break;
				
			case "reservation-info": // 전화번호로 예약정보를 찾아 reservation-confirm에 전달
				resInfo(request, response, userId);
				break;
				
			case "reservation-confirm": // 고객용 예약 확인 폼으로 이동
				resConfirm(request, response, userId);
				break;
				
			case "reservation-cancel": // 고객용 예약 확인 폼에서 예약 취소시 is_cancel 1로 변경
				resCancel(request, response, userId);
				break;
				
			case "reservation-lookup": // 고객용 예약 조회 폼으로 이동
				resLookup(request, response, userId);
				break;
				
			case "reservation-search": // lookup에서 받은 정보로 예약 리스트를 찾아 고객용 예약 확인 폼으로 이동
				resSearch(request, response, userId);
				break;
				
			case "reservation-select": // lookup에서 받은 정보로 예약 리스트를 찾아 고객용 예약 확인 폼으로 이동
				resSelect(request, response, userId);
				break;
				
			default:
				throw new PageNotFoundException();
			}
		} else {
			throw new PageNotFoundException();
		}

	}

	private String isExist(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {
		String existId = reserveService.isExsist(userId);
		return existId;

	}

	private void confirm(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {

		request.getSession().setAttribute("userId", userId);

		if (request.getParameter("name") == null && request.getParameter("startDate") == null
				&& request.getParameter("endDate") == null && request.getParameter("day") == null) {
			List<Reserve> reserveList = reserveService.selectReserveList(userId);
			request.getSession().setAttribute("reserveList", reserveList);
			request.getRequestDispatcher("/reserve/reserve-confirm").forward(request, response);
		} else {

			String userName = "%";
			String startDate = "1999-01-01";
			String endDate = "2099-12-31";
			int day = 500;

			if (request.getParameter("name") != "") {
				userName = "%" + request.getParameter("name") + "%";
			}

			if (request.getParameter("startDate") != "") {
				startDate = request.getParameter("startDate");
			}

			if (request.getParameter("endDate") != "") {
				endDate = request.getParameter("endDate");
			}

			if (request.getParameter("day") != null) {
				day = Integer.parseInt(request.getParameter("day"));
			}

			List<Reserve> reserveList = reserveService.selectDetailReserveList(userId, userName, startDate, endDate,
					day);
			request.getSession().setAttribute("reserveList", reserveList);
			request.setAttribute("userId", userId);
			request.getRequestDispatcher("/reserve/reserve-confirm").forward(request, response);
		}

	}

	private void modify(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {

		ReserveConfig reserveConfig = reserveService.selectConfig(userId);

		request.setAttribute("userId", userId);
		request.setAttribute("reserveConfig", reserveConfig);
		request.getRequestDispatcher("/reserve/reserve-modify").forward(request, response);

	}
	
	private void uploadImage(HttpServletRequest request, HttpServletResponse response, String userId) throws ServletException, IOException {
		FileUtil util = new FileUtil();
		MultiPartParams multiPart = util.fileUpload(request);


		List<FileDTO> files = multiPart.getFilesInfo();
		reserveService.uploadImage(files.get(0), userId);
		response.sendRedirect("/reserve/" + userId + "/modify");
		
	}

	private void reserveModify(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {

		String startPeriod = request.getParameter("start");
		String endPeriod = request.getParameter("end");
		String openTime = request.getParameter("openTime");
		String closeTime = request.getParameter("endTime");
		String introductionOfStore = request.getParameter("content");

		System.out.println(startPeriod + ", " + endPeriod + ", " + openTime + ", " + closeTime + ", " + userId);

		reserveService.modifyReserve(userId, startPeriod, endPeriod, openTime, closeTime, introductionOfStore);
		response.sendRedirect("/reserve/" + userId + "/modify");

	}

	private void okay(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {

		if (request.getParameter("name") == null && request.getParameter("startDate") == null
				&& request.getParameter("endDate") == null && request.getParameter("day") == null) {
			List<Reserve> reserveList = reserveService.selectReserveList(userId);
			request.getSession().setAttribute("reserveList", reserveList);
			request.getRequestDispatcher("/reserve/reserve-okay").forward(request, response);
		} else {

			String userName = "%";
			String startDate = "1999-01-01";
			String endDate = "2099-12-31";
			int day = 500;

			if (request.getParameter("name") != "") {
				userName = "%" + request.getParameter("name") + "%";
			}

			if (request.getParameter("startDate") != "") {
				startDate = request.getParameter("startDate");
			}

			if (request.getParameter("endDate") != "") {
				endDate = request.getParameter("endDate");
			}

			if (request.getParameter("day") != null) {
				day = Integer.parseInt(request.getParameter("day"));
			}

			List<Reserve> reserveList = reserveService.selectDetailReserveList(userId, userName, startDate, endDate,
					day);
			request.getSession().setAttribute("reserveList", reserveList);
			request.setAttribute("userId", userId);
			request.getRequestDispatcher("/reserve/reserve-okay").forward(request, response);
		}

	}

	private void cancel(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {

		if (request.getParameter("name") == null && request.getParameter("startDate") == null
				&& request.getParameter("endDate") == null && request.getParameter("day") == null) {
			List<Reserve> reserveList = reserveService.selectReserveList(userId);
			request.getSession().setAttribute("reserveList", reserveList);
			request.getRequestDispatcher("/reserve/reserve-cancel").forward(request, response);
		} else {

			String userName = "%";
			String startDate = "1999-01-01";
			String endDate = "2099-12-31";
			int day = 500;

			if (request.getParameter("name") != "") {
				userName = "%" + request.getParameter("name") + "%";
			}

			if (request.getParameter("startDate") != "") {
				startDate = request.getParameter("startDate");
			}

			if (request.getParameter("endDate") != "") {
				endDate = request.getParameter("endDate");
			}

			if (request.getParameter("day") != null) {
				day = Integer.parseInt(request.getParameter("day"));
			}

			List<Reserve> reserveList = reserveService.selectDetailReserveList(userId, userName, startDate, endDate,
					day);
			request.getSession().setAttribute("reserveList", reserveList);
			request.setAttribute("userId", userId);
			request.getRequestDispatcher("/reserve/reserve-cancel").forward(request, response);
		}
	}

	private void reserveCancel(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {

		String reserveIdx = request.getParameter("reserveIdx");
		System.out.println(reserveIdx);

		if (reserveService.cancelReserve(reserveIdx) > 0) {
			response.sendRedirect("/reserve/" + userId + "/cancel");
		} else {
			return;
		}

		int isSuccessSendwaitingMessage = reserveService.confirmWaitingByMessage(request, response, userId, reserveIdx);

		if (isSuccessSendwaitingMessage > 0) {
			System.out.println("발송 완료");
		} else {
			System.out.println("발송 실패");
		}

	}

	// 고객용 예약 폼으로 이동
	private void resform(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {
	      ReserveConfig reserveConfig = reserveService.selectConfig(userId);
	      
	      if(reserveConfig != null) {
	         FileDTO fileDTO = reserveService.selectImage(userId);
	         
	         SimpleDateFormat testFormat = new SimpleDateFormat("HH:mm");
	         Calendar cal = Calendar.getInstance();
	         String[] timeArr = null;

	         try {

	            long closeSeq = testFormat.parse(reserveConfig.getCloseTime()).getTime();
	            long openSeq = testFormat.parse(reserveConfig.getOpenTime()).getTime();

	            long timeCalc = 0;

	            if (closeSeq > openSeq) {
	               timeCalc = closeSeq - openSeq;
	            } else {
	               closeSeq += 86400000;
	               timeCalc = closeSeq - openSeq;
	            }

	            int parseTimeCalc = (int) (timeCalc / 3600000);
	            int diff = 2 * (parseTimeCalc) + 1;

	            timeArr = new String[diff];

	            cal.setTime(testFormat.parse(reserveConfig.getOpenTime()));

	            for (int i = 0; i < timeArr.length; i++) {
	               timeArr[i] = testFormat.format(cal.getTime());
	               System.out.println(cal.getTime());
	               cal.add(Calendar.MINUTE, 30);
	            }

	         } catch (ParseException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }

	         request.setAttribute("timeArr", timeArr);
	         request.setAttribute("userId", userId);
	         request.setAttribute("reserveConfig", reserveConfig);
	         request.setAttribute("imageFile", fileDTO);
	         request.getRequestDispatcher("/reserve/reservation-form").forward(request, response);
	      } else {
	         response.sendRedirect("/index");
	      }
	}

	// 예약 정보를 db에 저장
	private void resInsert(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {
		String seatIdx = request.getParameter("seatIdx");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String num = request.getParameter("num");
		String tempReDate = request.getParameter("reDate");
		String reTime = request.getParameter("time");
		String content = request.getParameter("content");

		Date reDate = Date.valueOf(tempReDate);

		Reserve reserve = new Reserve();
		reserve.setUserId(userId);
		reserve.setSeatIdx(seatIdx);
		reserve.setName(name);
		reserve.setPhone(phone);
		reserve.setNum(num);
		reserve.setReDate(reDate);
		reserve.setReTime(reTime);
		reserve.setContent(content);
		// 글쓰기 버튼시 db에 등록할 로직 구현 {}

		System.out.println(reserve);

		int irSuccess = reserveService.insertReserve(reserve);
		int isSuccessSendwaitingMessage = reserveService.confirmWaitingByMessage(request, response, reserve);

		if (isSuccessSendwaitingMessage > 0) {
			System.out.println("발송 완료");
		} else {
			System.out.println("발송 실패");
		}

		if (irSuccess == 1) {
			System.out.println("예약 등록 성공");
		} else {
			System.out.println("예약 등록 실패");
		}
		response.sendRedirect("/reserve/" + userId + "/reservation-info?phone=" + phone);
	}

	// 전화번호로 예약정보를 찾아 reservation-confirm에 전달
	private void resInfo(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {

		String phone = request.getParameter("phone");
		Reserve reserve = new Reserve();
		reserve.setUserId(userId);
		reserve.setPhone(phone);
		reserve = reserveService.selectReserveInfo(userId, phone);

		request.setAttribute("reserve", reserve);
		System.out.println(reserve);
		request.setAttribute("userId", userId);
		request.getRequestDispatcher("/reserve/reservation-confirm").forward(request, response);
	}

	// 고객용 예약 확인 폼으로 이동
	private void resConfirm(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {

		request.getRequestDispatcher("/reserve/reservation-confirm").forward(request, response);
	}

	// 고객용 예약 확인 폼에서 예약 취소시 is_cancel 1로 변경
	private void resCancel(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {
		String reserveIdx = request.getParameter("reserveIdx");
		int crSuccess = reserveService.cancelReserve(reserveIdx);
		if (crSuccess == 1) {
			System.out.println("예약 취소 성공");
		} else {
			System.out.println("예약 취소 실패");
		}

		int isSuccessSendwaitingMessage = reserveService.confirmWaitingByMessage(request, response, userId, reserveIdx);

		if (isSuccessSendwaitingMessage > 0) {
			System.out.println("발송 완료");
		} else {
			System.out.println("발송 실패");
		}
		response.sendRedirect("/reserve/" + userId + "/reservation-lookup");
	}

	// 고객용 예약 조회 폼으로 이동
	private void resLookup(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {
		request.setAttribute("userId", userId);
		request.getRequestDispatcher("/reserve/reservation-lookup").forward(request, response);
	}

	// lookup에서 받은 정보로 예약 리스트를 찾아 고객용 예약 확인 폼으로 이동
	private void resSearch(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		List<Reserve> reserveList = new ArrayList<Reserve>();
		reserveList = reserveService.searchReserve(userId, name, phone);
		request.setAttribute("reserveList", reserveList);
		request.setAttribute("userId", userId);
		request.getRequestDispatcher("/reserve/reservation-select").forward(request, response);
	}

	// select에서 선택된 예약번호로 reserve객체 하나 받아와서 confirm에 넘겨주기
	protected void resSelect(HttpServletRequest request, HttpServletResponse response, String userId)
			throws ServletException, IOException {
		String reserveIdx = request.getParameter("reserveIdx");
		Reserve selectReserve = reserveService.selectReserve(reserveIdx);
		request.setAttribute("selectReserve", selectReserve);
		request.setAttribute("userId", userId);
		request.getRequestDispatcher("/reserve/reservation-confirm").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}