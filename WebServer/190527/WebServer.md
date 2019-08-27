## Web Server

- 이클립스에서 서버 start!

- 브라우저(크롬)에서 first.html 요청

  - http://localhost:8000/edu/first.html

  - http://localhost(또는 ip주소) :port번호/프로젝트이름/파일명  >> HTTP URL 문자

    - (프로젝트이름/파일명) : URI 문자열 = 서버에게 전송하는 것
    - 프로젝트 이름 = 컨텍스트패스* 
    - 최상위 폴더(document root) = WebContent

    ​									

- 렌더링 : 소스를 읽어서 웹 브라우저에 표시해주는 것 



## Web Client

---

- 웹 표준 : 특정 브라우저에서만 사용하는 비 표준화된 기술을 배제하고, W3C라는 조직에서 정한 표준 기술만을 사용하여, 웹 페이지 작성시 문서의 구조와 표현 방법 그리고 상호 동작을 구분하여 구현하는 것

  - HTML : 웹 문서의 구조 담당

  - CSS : 표현 담당

  - 자바스크립트 : 동작 담당

    => 3가지 요소가 유기적으로 결합하여 작동하면 웹 문서가 가벼워지며 유지보수 및 수정시에도 간편하고 빨리 처리할 수 있게 됨

- HTML5 : W3C의 HTML WG을 통해서 만들어지고 있는 차세대 마크업 언어 표준

  - 플랫폼 중립적
  - 액티브 X, 플래시, 실버라이트, 자바FX없이도 웹브라우저에서 다양한 기능 사용가능

  - 시맨틱한 마크업 + 풍부한 웹 어플리케이션 = HTML5



#### HTML5 문서 구성

- 태그(tag)	:	**<title>** 웹문서내용**</title>**
- 내용(content) 	:	<title>**웹문서내용**</title>
- 엘리먼트(element) 	:	**<title>웹문서내용</title>**
- 속성(attribute) 	:	<title color = "red"></title>
- 속성값(value) 	:	<itle color = "red"></title>

