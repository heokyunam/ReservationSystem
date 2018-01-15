<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="main.java.com.overtheinfinite.reservation.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Test Reservation</title>
</head>
<link rel="stylesheet" type="text/css" href="css/calendar.css"></link>
<body>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="js/rs.js?ver=1"></script>
<script>
<%
DBMB dbmb = new DBMB();
Room r = new Room(dbmb);
%>

</script>

<div class="month">      
  <ul>
    <li class="prev" onclick="prevMonth()">&#10094;</li>
    <li class="next" onclick="nextMonth()">&#10095;</li>
    <li id = "year">
      <span id="month">August</span><br/>
      <span style="font-size:18px" id="fullyear">2018</span>
    </li>
  </ul>
</div>

<ul class="weekdays">
  <li>Mo</li>
  <li>Tu</li>
  <li>We</li>
  <li>Th</li>
  <li>Fr</li>
  <li>Sa</li>
  <li>Su</li>
</ul>

<ul class="days" id="days">
</ul>

<div>
	<div>
		시작 시간 :
		<input type="time" id="start_time" value="12:00"></input>
	</div>
	
	<div>
		끝 시간 :
		<input type="time" id="end_time" value="13:00"></input>
	</div>
	
	<div>
		예약 호수 : 
		<select name="browser" id="room">
			<%=r.roomListString() %>
		</select>
	</div>
		
	<div>
		<input type="button" value = "예약" onclick="reservate()"></input>
	</div>
	<div>
		예약 이름 : 
		<input id="reservation_name"></input>
	</div>
	<div>
		예약 설명:
		<input id="reservation_description"></input>
	</div>
	
</div>

</body>
</html>