
function datelist()
{
	var now = new Date();
	var last = (new Date(now.getFullYear(), now.getMonth(), 0)).getDate();
	var start = now.getDay();
	
	var list = "";
	console.log(start);
	for(var i = 0; i < start-1; i++) {
		list += "<li></li>";
	}
	
	for(var i = 0; i < last; i++) {
		list += "<li>" + (i+1) + "</li>";
	}
	
	return list;
}