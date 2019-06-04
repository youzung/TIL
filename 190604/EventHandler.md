### 이벤트 핸들러 이용해서 구구단 출력하기

---



#### 1. 인라인 방식

```HTML
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	body{
		border : 2px solid skyblue;
	}
	h1 {
		text-align : center;
	}
	
	div{
		align-content : center;
	}
	
	button{
		width : 10%;
		height : 20%;
		background-color : white;
		border : 1px solid skyblue;
		text-align : center;
		border-radius : 5px;
	}

</style>
</head>
<h1>구구단</h1>
<div align = "center">
<button onclick="multi(1);">1단</button>
<button onclick="multi(2);" >2단</button>
<button onclick="multi(3);" >3단</button>
<button onclick="multi(4);" >4단</button>
<button onclick="multi(5);" >5단</button>
<button onclick="multi(6);" >6단</button>
<button onclick="multi(7);" >7단</button>
<button onclick="multi(8);" >8단</button>
<button onclick="multi(9);" >9단</button>
</div>
<p id = "demo" align = "center"></p>
<body>

<script>

function multi(e) {
	
	var res = "";
	
	for(var i =1; i<10; i++){
		res +=  e + " x " + i + "=" + e*i +"<br>";
	}
	
	document.getElementById("demo").innerHTML = res;
}
</script>

</body>
</html>
```





#### 2. 고전 방식

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	body{
		border : 2px solid skyblue;
	}
	h1 {
		text-align : center;
	}
	
	div{
		align-content : center;
	}
	
	button{
		width : 10%;
		height : 20%;
		background-color : white;
		border : 1px solid skyblue;
		text-align : center;
		border-radius : 5px;
	}

</style>
</head>
<body>
<h1>구구단</h1>
<button id = 1>1단</button>
<button id = 2>2단</button>
<button id = 3>3단</button>
<button id = 4>4단</button>
<button id = 5>5단</button>
<button id = 6>6단</button>
<button id = 7>7단</button>
<button id = 8>8단</button>
<button id = 9>9단</button>
<p id = "demo" align = "center"></p>
<script>
var dan = document.getElementById("demo")[0];
for(var i=1; i<10; i++){
	var target = document.getElementById(i);
	target.onclick = multi;
}

function multi(e){
	var num = e.target.id;
	var res = "";
	
	for(var i =1; i<10; i++){
		res +=  num + " x " + i + "=" + num*i +"<br>";
	}
	
	document.getElementById("demo").innerHTML = res;
}


</script>
</body>
</html>
```



#### 4. 표준 방식

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	body{
		border : 2px solid skyblue;
	}
	h1 {
		text-align : center;
	}
	
	div{
		align-content : center;
	}
	
	button{
		width : 10%;
		height : 20%;
		background-color : white;
		border : 1px solid skyblue;
		text-align : center;
		border-radius : 5px;
	}

</style>
</head>
<body>
<h1>구구단</h1>
<button id = 1>1단</button>
<button id = 2>2단</button>
<button id = 3>3단</button>
<button id = 4>4단</button>
<button id = 5>5단</button>
<button id = 6>6단</button>
<button id = 7>7단</button>
<button id = 8>8단</button>
<button id = 9>9단</button>
<p id = "demo" align = "center"></p>
<script>
var dan = document.getElementById("demo")[0];

for(var i=1; i<10; i++){
	var target = document.getElementById(i);
	target.addEventListener("click",multi);
}

function multi(e){
	var num = e.target.id;
	var res = "";
	
	for(var i =1; i<10; i++){
		res +=  num + " x " + i + "=" + num*i +"<br>";
	}
	
	document.getElementById("demo").innerHTML = res;
}


</script>
</body>
</html>
```

