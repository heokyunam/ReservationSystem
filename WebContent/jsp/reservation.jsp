<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="main.java.com.overtheinfinite.reservation.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String room = request.getParameter("room");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	
	DBMB dbmb = new DBMB();
	Reservation r = new Reservation(dbmb);
	r.init(start, end, 
			Integer.parseInt(room), 
			Integer.parseInt(year), 
			Integer.parseInt(month), 
			Integer.parseInt(date));
	String exMsg = "¼º°ø";
	try {
		if(r.canReservate()) {
			r.reservate();
		}
	}catch(Exception e) {
		exMsg = e.getMessage();
	}
	
%>

<%=exMsg %>