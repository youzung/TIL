### JavaScript 마우스 커서 위치

- clientX, clientY

  - 클라이언트 영역 내의 가로, 세로 좌표를 제공, 여기서 클라이언트 영역은 현재 보이는 브라우저 화면이 기준이 됨
  - 브라우버 페이지에서의 x,y좌표 위치를 반환하나 스크롤은 무시하고 해당 페이지의 상단을 0으로 측정

  

- offsetX, offsetY

  - 이벤트 대상이 기준이 됨(화면 붕간에 있는 박스 내부에서 클릭한 위치를 찾을 때 해당 박스의 왼쪽 모서리 좌표가 0, 화면의 기준이 아님)
  - 전체 문서를 기준으로 함(스크롤 화면 포함)

  

- pageX, pageY

  - 전체 문서를 기준으로 x,y 좌표를 반환, 스크롤 화면을 포함해서 측정
  - 브라우저 페이지에서의 x,y좌표의 위치 반환

  

- screenX, screenY

  - 모니터 화면을 기준으로 좌표를 제공
  - 브라우저 화면이 아닌 자신의 모니터 화면 전체를 기준으로 좌표 측정

  

```java
	var posx = event.pageX-drop.offsetLeft;
	var posy = event.clientY-drop.offsetTop;
```

​	