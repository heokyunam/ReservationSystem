<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="main.java.com.overtheinfinite.reservation.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Test Reservation</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/calendar.css"></link>
<body>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="../js/date_system.js"></script>
<script>
<%
DBMB dbmb = new DBMB();
Room r = new Room(dbmb);
%>

var year, month;
$(document).ready(function() {
	var date = new Date();
	year = date.getFullYear();
	month = date.getMonth()+1;
	updateYM();
});

function updateYM() {
	$("#fullyear").text(year + "년");
	$("#month").text(month + "월");	
}

function prevMonth() {
	month--;
	if(month == 0) {
		month = 12;
		year--;
	}
	updateYM();
}

function nextMonth() {
	month++;
	if(month > 12) {
		month = 1;
		year++;
	}
	updateYM();
}

function reservate() {
	var roomDOM = $("#room")[0];
	var date = prev.children('span').html();//prev is li element
	var room = roomDOM.options[roomDOM.selectedIndex].value;
	
	var startDOM = $("#start_time")[0];
	var endDOM = $("#end_time")[0];
	
	var start = startDOM.value;
	var end = endDOM.value;
	
	var obj = {
		start : start,
		end : end,
		room : int(room),
		year : int(year),
		month : int(month-1),
		date : int(date)
	};
	
	$.post("../jsp/reservation.jsp", obj,
		function(data) {
			console.log(data);
		}
	);
}
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
	
</div>

</body>
</html>