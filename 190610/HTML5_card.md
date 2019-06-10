### HTML5로 카드 만들기



![캡처](C:\Users\student\Desktop\캡처.PNG)



- 배경색과 테두리색변경

  ```javascript
  function changeBgColor(){
  	var bgcolor = document.getElementById("bgcolor").value;
  	content.style.backgroundColor = bgcolor;
  }
  
  function changeBdColor(){
  	var bdcolor = document.getElementById("bdcolor").value;
  	document.getElementById("dropbox").style.color = bdcolor;
  }
  
  ```

  

- 캔버스에 click이벤트 발생시켜 클릭 위치에 메시지 출력하기

```javascript
function inputMsg(event){
	
	var posx = event.clientX-drop.offsetLeft;
	var posy = event.clientY-drop.offsetTop;
	
	var msg = document.getElementById("msg").value;
	var msgcolor = document.getElementById("msgcolor").value;
	
	canvas.fillStyle = msgcolor;
	canvas.font = "30px 맑은 고딕";
	canvas.fillText(msg,posx,posy);
	
}
```



- 저장하기, 지우기 읽어오기

```javascript
function save(){
	localStorage.setItem("content", content.toDataURL());
}

function remove(){
	console.log("CLEAR");
	canvas.clearRect(0,0,content.width,content.height);
}

function read(){
	var img = new Image();
	img.src = localStorage.getItem("content");
	img.onload = function(){
		canvas.drawImage(img,0,0);
	}
}
```



- drag & drop

```javascript
function initiate(){
	var images = document.querySelectorAll("#picturesbox > img");
	for(var i =0; i<images.length; i++){
		images[i].addEventListener('dragstart',dragged,false);
		images[i].addEventListener('dragend',ending,false);
	}
	
	drop = document.getElementById('canvas');
	canvas = drop.getContext('2d');
	
	drop.addEventListener('dragover', function(e){e.preventDefault();}, false);
	drop.addEventListener('drop', dropped, false);
}

function ending(e){
	elem = e.target;
}

function dragged(e){
	var elem = e.target;
	e.dataTransfer.setData('a', elem.getAttribute('id'));
	e.dataTransfer.setDragImage(e.target, 0,0);
}

function dropped(e){
	e.preventDefault();
	var id = e.dataTransfer.getData('a');
	var elem = document.getElementById(id);
	
	var posx = e.pageX-drop.offsetLeft;
	var posy = e.pageY-drop.offsetTop;
	
	canvas.drawImage(elem,posx,posy,110,165);
}


window.addEventListener('load',initiate,false);
```

