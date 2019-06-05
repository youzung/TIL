## Drag & Drop

---

>드래그와 드롭은 컴퓨터에서 아주 많이 사용하는 사용자 인터페이스 중의 하나다. 사용자는 객체를 마우스로 끌어서 다른 애플리케이션에 놓을 수 있다.



- 드래그되는 요소의 속성 draggable을 true로 설정

```html
	<img id = "img1" src = "tv.png" draggable = "true">
```



- dragstart 이벤트

  dragstart이벤트는 사용자가 드래그를 시작할 때 발생한다.  이때 해야하는 가장 중요한 작업은 dataTransfer 객체에 setData() 호출을 통하여 데이터를 설정하는 작업이다. 즉 어떤 형식의 어떤 데이터가 이동되는지를 설정하는 것이다. dataTransfer 객체가 이동되는 데이터를 가지고 간다. 

```html
	function handleDragStart(e){
		e.dataTransfer.setData("Text", e.target.id);
	}
```



- drag 이벤트

  드래그하는 도중에 계속해서 발생하는 이벤트이다. 사용자가 마우스 버튼을 누른  상태에서 계속 이동시키면 드래그 소스 객체에서 drag 이벤트가 발생한다. 이 이벤트가 발생했을 떄 반드시 수행해야 하는 작업은 없다.



- dragenter 이벤트

  마우스로 드래그하다가 새로운 요소 안으로 들어가면 dragenter 이벤트가 발생한다. 이 이벤트가 발생하면 새로운 요소가 타겟 요소인지를 검사해서 타겟 요소이면 drop 이벤트를 처리 하는 콜백 함수를 설정할 수 있다. 만약 미리 설정하였다면 이 이벤트에서도 할 일은 없다.



- dragleave 이벤트

  마우스로 드래그하다가 요소를 빠져나가면 dragleave 이벤트가 발생한다. 역시 특별한 경우가 아니면 처리할 필요는 없다.



- dragover 이벤트

  dragover 이벤트는 드래그 동작 도중에 마우스가 다른 요소 위에 있다는 것을 의미한다. 이 이벤트는 마우스가 현재 놓여 있는 요소에서 발생한다. 만약 타겟 요소에서 dragover이벤트가 발생하였다면 드롭을 허용하는 처리를 해야 한다. 디폴트로 요소 위에서 다른 요소가 드롭될 수 없다. 따라서 드롭을 허용하려면, 이러한 디폴트 처리를 방지해야 한다. 디폴트 처리를 방지하려면 event.preventDefault()메서드를 호출하면 된다.

  ```html
  	function allowDorp(e){
  		e.preventDefault();
  	}
  ```



- drop 이벤트

  반드시 처리해야 하는 이벤트. drop 이벤트는 사용자가 마우스 버튼을 놓았을 때 발생한다. dataTransfer객체에서 getData()메서드를 이용해 필요한 데이터를 꺼내면 된다.



#### drag & drop을 이용한 실습

```html
<script>
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
	
		canvas.drawImage(elem,posx,posy,100,100);
	}

	window.addEventListener('load',initiate,false);
</script>
```

