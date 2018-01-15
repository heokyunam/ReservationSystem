//calendar basic cycle
//dependent on DOM objects
var prev = null;
var year, month;
$(document).ready(function() {
	var days = document.getElementById("days");
	days.innerHTML = arraytostr(datelist());
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
	if(prev == null) {
		alert("날짜가 선택되지 않았습니다.");
		return;
	}
	var date = prev.children('span').html();//prev is li element
	var room = roomDOM.options[roomDOM.selectedIndex].value;
	
	var startDOM = $("#start_time")[0];
	var endDOM = $("#end_time")[0];
	
	var start = startDOM.value;
	var end = endDOM.value;
	
	var obj = {
		start : start,
		end : end,
		room : room,
		year : year,
		month : month-1,
		date : date
	};
	
	$.post("../jsp/reservation.jsp", obj,
		function(data) {
			alert(data);
		}
	);
}

$(function() {
	$('.days .day').click(function() {
		var num = Number($(this).text());
		$(this).html("<span class='active'>" + num + "</span>");
		if(prev != null) {
			prev.html(prev.children('span').html());
		}
		
		prev = $(this);
	});
});

function getDate() {
	return prev;
}

//util function :  make li array
function datelist()
{
	var now = new Date();
	var last = (new Date(now.getFullYear(), now.getMonth(), 0)).getDate();
	var start = now.getDay();
	
	var list = [];
	console.log(start);
	for(var i = 0; i < start-1; i++) {
		list.push("<li></li>");
	}
	
	for(var i = 0; i < last; i++) {
		list.push("<li class='day'>" + (i+1) + "</li>");
	}
	return list;
}

//util function : array to str. just append it
function arraytostr(arr) {
	var data = "";
	for(var  i = 0; i < arr.length; i++) {
		data += arr[i];
	}
	return data;	
}