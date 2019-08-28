### 세션 : HttpSession 객체

>  HttpSession 객체는 요청을 보내온 클라이언트 단위로 객체가 한 개만 생성되는 객체로서 한 번 생성되면 해당 클라이언트가 종료될 때까지 객체가 유지된다.
>
> 클라이언트별로 어떤 정보를 원하는 시간까지 유지하고싶을 때 사용한다. 



- Scope : 메모리에 저장장소가 만들어진 후 언제까지 유지되는가?

  - page scope 

    - 요청된 서버 프로그램이 수행하는 동안 : 지역변수

  - request scope

    - 요청된 서버 프로그램이 수행하고 응답하기 전까지 : HttpServletRequest 객체에 저장된 객체

  - session scope

    - 세션이 유지되는 동안 (클라이언트가 살아있는 동안) : HttpSession 객체에 저장된 객체

  - application scope

    - 서버가 기동되고 나서 종료될 때 까지 : 멤버변수, ServletContext 객체에 저장된 객체

    

### Servlet

- 지역변수 : 요청된 서블릿이 수행되는 동안, 클라이언트별로 각각 메모리 할당, 수행 끝나면 사라짐

- 멤버변수 : 서버가 종료될때 까지, 메모리 영역을 할당. 모든 클라이언트에 의해 공유

- HttpSession 객체에 보관 : 클라이언트 별로 개별적으로 저장, 원할 때 까지 유지하고 싶을 때 (ex, 쇼핑카트)



**[HttpSession 객체는 언제까지 유지되는가?]**

1. 브라우저가 기동되어 있는 동안
2. invalidate() 메서드가 호출되기 전까지
3. inactive interval 시간이 적용되기 전까지 (마지막으로 요청하고 나서 30분)



- 쿠키 : 하이퍼 텍스트의 기록서(HTTP)의 일종으로서 인터넷 사용자가 어떠한 웹사이트를 방문할 경우 그 사이트가 사용하고 있는 서버를 통해 인터넷 사용자의 컴퓨터에 설치되는 작은 기록 정보 파일을 일컫는다. 



**세션 객체 보관 방법**

1. 객체로 만든다.(배열 객체)
2. 저장 : session.setAttribute("이름", 객체)
3. 삭제 : session.removeAttribute("이름")
4. 추출: session.getAttribute("이름")
   - 리턴타입이 object이므로 강제 형변환 필수!
