<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");

	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String date = request.getParameter("date");
	String room = request.getParameter("room");
	
	out.println(start);
	out.println(end);
	out.println(date);
	out.println(room);
%>