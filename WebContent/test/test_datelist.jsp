<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Test DateList</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/calendar.css"></link>
<body>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="../js/date_system.js"></script>
<script>
//JSON.parse(...) ���ڿ��� ������Ʈ�� �Ľ��Ѵٰ� ��

</script>

<div class="month">      
  <ul>
    <li class="prev">&#10094;</li>
    <li class="next">&#10095;</li>
    <li id = "year">
      August<br>
      <span style="font-size:18px">2018</span>
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
		���� �ð� :
		<input type="time"></input>
	</div>
	
	<div>
		���� ȣ�� : 
	</div>
		
	<div>
		<input type="button" value = "����"></input>
	</div>
	
</div>

</body>
</html>