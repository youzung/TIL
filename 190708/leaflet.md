### leaflet

> map을 그릴 수 있게 지원하는 자바스크립트 라이브러리

- 타일 형식으로 지도를 끌어옴

- zoom level

  - 1 : 세계지도 전체 표시
  - 18 : 최대 확대

- L. = jQuery의 $. 과 같은 기능(셀렉터)

- openPopup() 

  - 팝업을 보여줌, (처음부터, 클릭시)
  - 마커를 클릭해야 나타나게 하려면 명시X

  

### HTML5 API

> Active-X와 같은 추가(플러그인, 확장) 프로그램을 활용하여 해결할 수 밖에 없었던 웹앱 개발에서 표준적인 방법을 제시하기 위해 W3C 주도로 만들어진 JavaScriptAPI이다. 

- Canvas API
- Web Storage
- Web Socket
- Ajax (upgraded)
  - 다양한 형식(text, image...)의 응답 가능
  - 발생 이벤트가 다양해짐(loadEvent, endEvent, startEvent...)
  - CORS(Cross Origin Resource Sharing) 스펙 지원
- geolocation API
  - 웹앱이 수행되는 클라이언트의 위치 정보(위도, 경도)를 추출
  - watchPosition()
    - 계속해서 위치 정보 확인(일정 거리 움직이면)
  - getCurrentPosition()
    - 한번만 위치 정보 확인
  - geocoding 서비스
    - 위도, 경도 json(xml)으로 응답

### [Open API]

- 비상용화된 API
  - 자바 : 클래스
  - 자바스크립트 : 함수, 객체
  - 파이썬 : 모듈
- 데이터를 요청할 때 사용하는 URL 문자열과 Query 문자열 규격



