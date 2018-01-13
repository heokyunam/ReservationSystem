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
Reservation r = new Reservation(dbmb);
String roomList = r.roomList().toString();
%>

$(document).ready(function() {
	initRoomList();
	
});

function initRoomList() {
	var roomList = <%=roomList%>;
	var datalist = $("#browser");
	var html = "";
	for(var i = 0; i < roomList.length; i++) {
		html += "<option value='";
		html += roomList[i];
		html += "'>'"
	}
	datalist.text(html);
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
		date : date,
		room : room
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
    <li class="prev">&#10094;</li>
    <li class="next">&#10095;</li>
    <li id = "year">
      <span id="month">August</span><br/>
      <span style="font-size:18px" id="year">2018</span>
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