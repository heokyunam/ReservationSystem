<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="main.java.com.overtheinfite.ProductManager.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>This is Starting Point</title>
</head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="css/calendar.css"></link>
<body>
<script src="js/calendar2.js"></script>
<script>
	var days;
	var index = -1;
	$(document).ready(function() {
		
		document.getElementById("days").innerHTML = arraytostr(datelist());
		days = document.getElementById("days").children;
		console.log(days);
		
	});
	
	$(function() {
		$('.days li').click(function() {
			var num = Number($(this).text());
			$(this).html("<span class='active'>" + num + "</span>");
			
			if(index >= 0) {
				var span = days[index-1].children[0];
				console.log(span);
				span.className = "";
			}			
			
			index = num;
			selectDay(num);
		});
		//JSON.parse(...) 문자열을 오브젝트로 파싱한다고 함
	});
	
	function selectDay(day) {
		//alert(day);
	}
</script>
<script src="js/calandar.js"></script>
<h1>CSS Calendar</h1>

<div class="month">      
  <ul>
    <li class="prev">&#10094;</li>
    <li class="next">&#10095;</li>
    <li>
      August<br>
      <span style="font-size:18px">2017</span>
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
  <li>1</li>
  <li>2</li>
  <li>3</li>
  <li>4</li>
  <li>5</li>
  <li>6</li>
  <li>7</li>
  <li>8</li>
  <li>9</li>
  <li>10</li>
  <li>11</li>
  <li>12</li>
  <li>13</li>
  <li>14</li>
  <li>15</li>
  <li>16</li>
  <li>17</li>
  <li>18</li>
  <li>19</li>
  <li>20</li>
  <li>21</li>
  <li>22</li>
  <li>23</li>
  <li>24</li>
  <li>25</li>
  <li>26</li>
  <li>27</li>
  <li>28</li>
  <li>29</li>
  <li>30</li>
  <li>31</li>
</ul>

<%= new Product("abcd", 1,1,1).toJSON() %>
</body>
</html>