
//calendar basic cycle
//dependent on DOM objects
var prev = null;
$(document).ready(function() {
	var days = document.getElementById("days");
	days.innerHTML = arraytostr(datelist());
});

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