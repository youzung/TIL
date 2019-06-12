### jQuery 이벤트 처리

- 이벤트 이름(함수)

- on("이벤트이름", 함수)
  - addEventListener

- off() 

  - removeEventListener

- one("이벤트이름", 함수)

  - 한번만 수행 가능 ($(this).off()와 동일)




### 이미지 클릭하여 반투명 하게 만들기


```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<title>Insert title here</title>
<style>
	table {
		margin : 0 auto;
	}

</style>
</head>
<body>
<h1>고양이 반투명하게 만들기</h1>
<hr>

<table>
<tr>
	<td><img src = cat/g1.png></td>
	<td><img src = cat/g2.png></td>
	<td><img src = cat/g3.png></td>
	<td><img src = cat/g4.png></td>
	<td><img src = cat/g5.png></td>
</tr>
<tr>
	<td><img src = cat/g6.png></td>
	<td><img src = cat/g7.png></td>
	<td><img src = cat/g8.png></td>
	<td><img src = cat/g9.png></td>
	<td><img src = cat/g10.png></td>
</tr>
</table>
<hr>
<div align = "center">
<button id = "clear">모두 진하게</button>
<button id = "blur">모두 반투명하게</button>
</div>
<script>
	 $(document).ready(function () {
		 $('h1').css('color','pink');
		 
		 $('img').css({width : 200, height : 200});
		 
         $('img').on('click', function () {
        	 $(this).css('opacity',  0.4);
         });
         
         $('#clear').on('click', function () {
        	 $('img').css({opacity :  1});
         });
         
         $('button:last').on('click', function () {
        	 $('img').css({opacity :  0.4});
         });         
     });

</script>
</body>
</html>
```