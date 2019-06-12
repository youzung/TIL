### setInterval 활용하여 색상 변경

---

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<script>
	$(document).ready(function () {
	
	var d = new Date();
	var today = d.getDay();
	
	var weekDays = new Array('일','월','화','수','목','금','토');
	var colors = new Array('red','orange','yellow','lime','blue','cyan','pink');
	
	var days = weekDays[today];
	
	var myColor = setInterval(color,2000)
	
	function color(){
		var color = Math.floor(Math.random()*7) +1;
		var c = colors[color];
		$('span').css('color',c);
	}
		
	/*
		colorNum = parseInt(Math.random()*oxffffff);
		colorNum = colorNum.toString(16);
		console.log(colorNum);
		$('span').css('color','#'+colorNum);
	*/
	document.body.innerHTML += "<h1> 오늘은 <span>"+ days +"</span>요일입니다. </h1>";
	});
	
</script>
</body>

```

