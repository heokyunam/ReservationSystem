<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="main.java.com.overtheinfinite.reservation.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String room = request.getParameter("room");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	String name = request.getParameter("name");
	String description = request.getParameter("description");
	//post로 받음
	
	DBMB dbmb = new DBMB();
	Reservation r = new Reservation(dbmb);
	r.init(start, end, 
			Integer.parseInt(room), 
			Integer.parseInt(year), 
			Integer.parseInt(month), 
			Integer.parseInt(date));
	//예약에서 중복확인시 필요한 부분만 일단 대입
	
	String exMsg = "성공";
	try {
		if(r.canReservate()) {
			r.reservate(name, description);
			//이름과 주석을 추가
		}
		else {
			exMsg = "예약시간이 겹칩니다.";
		}
	}catch(Exception e) {
		exMsg = e.getMessage();
		e.printStackTrace();
	}
	
%>
<%=exMsg %>