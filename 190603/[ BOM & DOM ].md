## [ BOM & DOM ]

---

### BOM ( Browser Object Model )

> 브라우저가 제공하는 자바스크립트 API ( 미리 객체를 생성해서 제공 )
>
> window, location, document, history,  screen, navigator



- window : 최상위 객체로, 각 탭별, iframe 별로 하나씩 존재
- location : 현재 보여지고 있는 웹 페이지에 대한 URL정보를 보관하는 객체
- document : 현재의 문서에 대한 정보를 보관하는 객체
- history : 현재의 브라우저가 접근했던 URL의 정보를 보관하는 객체
- screen : 클라이언트 머신의 화면 크기나 해상도 등의 정보를 얻을 수 있는 객체
- navigator : 현재의 문서에 대한 정보를 보관하는 객체



#### window

- id = setInterval( func, milliseconds )

  clearInterval(id) 			// setInterval을 해제, 주기적으로

- id = setTimeout( func, milliseconds )

  clearTimeout(id)			//한번만 수행

- alert()

- confirm()

- prompt()

- open()



#### location

- href				// 속성
- reload    		// 현재 페이지 새로고침



#### history

- go()				// go(-1) 전페이지



#### location

- user-agent
-  getLocation()



---



### DOM ( Document Object Model )

> HTML 파서들은 파싱한 HTML 문서의 각각의 태그들, 태그의 속성들, 태그의 텍스트 형식의 컨텐트들 모두 자바스크립트 객체로 생성한다. 자바스크립트에서 접근 가능하도록 지원하기 위해.
>
>  document 객체의 자손 객체로 등록한다.  document.body



- document.getElementById("id속성값")
- document.getElementsClassName("class속성값")
- document.getElementsTagName("태그명")
- document.getQuerySelector("CSS선택자")
- document.getQuerySelectorAll("CSS선택자")



---



### 이벤트 핸들러 구현

> 웹 페이지상에서 발생되는 일 
>
> 1. 브라우저에서 자동으로 발생 ( load > 렌더링 끝나면 발생)
>
> 2. 사용자의 액션에 의해서 발생 
>
>    ( click, mouseover, mouseenter, mouseout, keyin, keypress, keyout, scroll, change, submit, reset .. )
>
> 
>
> 타겟 : 이벤트 발생된 대상 객체
>
> 이벤트 핸들러(리스너) : 이벤트가 발생했을 떄 수행되는 코드를 담고 있는 함수
>
> 이벤트 모델 : 특정한 타겟에서 정해진 이벤트가 발생했을 때 핸들러가 수행되도록 구현하는 방법
>
> 	1. 인라인 이벤트 모델 (지역 : 태그마다 구분)
>  	2. 고전 이벤트 모델 (전역 : 자바스크립트 코드영역)
>  	3. 표준 이벤트 모델 (전역)



#### - 인라인 이벤트 모델

- 태그의 속성으로 등록

- on으로 시작해야 함(onclick, onmouseover, ...) 
- onXXX = "코드" (ex) onclick(onClick, onCLICK) = "수행문장1; 수행문장2; 수행문장3")



#### - 고전 이벤트 모델

- DOM 객체를 찾는다.
- 찾은 DOM객체.onxxx(on 뒤에 오는 거 반드시 소문자!) = 함수;
- DOM객체.onxxx = null;



#### - 표준 이벤트 모델

- DOM 객체를 찾는다.
- DOM객체.addEventListener("xxx", 함수)
- DOM객체.removeEventListener("xxx", 함수)









