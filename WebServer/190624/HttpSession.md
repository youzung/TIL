### HttpSession 객체를 이용한 상태정보 유지

- request.getSession() : HttpSession 객체를 추출하거나 새로이 생성한다.
- session.setAttribute("xxx", new Data()) : 보관하려는 정보를 객체로 만들어 HttpSession객체에 저장한다. "xxx" 라는 이름으로 객체의 참조 값을 보관한다.
- session.getAttribute("xxx") : "xxx" 라는 이름으로 보관된 객체의 참조 값을 리턴한다.
- session.removeAttribute("xxx") : "xxx"라는 이름으로 보관된 객체의 참조 값을 삭제한다.
- session.invalidate() : HttpSesson 객체를 강제로 삭제한다.

---

## 요청 재지정

> 요청 재지정이란 클라이언트에서 요청한 페이지 대신 다른 페이지를 클라이언트가 보게 되는 기능으로서 redirect 방법과 forward 방법으로 나뉜다

- redirect : HttpServletResoponse의 sendRedirect() 메서드를 사용한다.
- forward : RequestDispatcher의 forward() 메서드를 사용한다.

### forward

```java
request.getRequestDispatcher("URI입력").forward(request, response);

ReuquestDispatcher rd = request.getRequestDispatcher("URI입력");
rd.forward(request,response);
```

- 동일한 요청상에서 다른 자원에 요청을 넘겨서 대신 응답하게 함
- 동일한 서버의 동일 웹 어플리케이션에 존재하는 대상만 가능
- 브라우저의 주소필드의 URL이 바뀌지 않음
- 두 자원이 HttpServletRequest 객체 공유
- include() 메서드 사용될 수 있음(요청 페이지 **안에** 다른 페이지의 처리 내용이 포함되어 **같이 응답**하게 된다.)



### Redirect

```java
response.sendRedirect("http://www.naver.com/");
```

- 다른 자원을 다시 요청하여 응답하게 함
- Web 상의 모든 페이지로 요청 재지정 가능
- 브라우저의 주소필드의 URL이 바뀜
- 재지정 대상에 대한 요청 자체를 브라우저가 하게됨
- 두 자원이 HttpServletRequest객체를 공유하지 않음

---

## 객체 공유

> 객체의 스코프란 객체가 생성되어 유지되는 기간을 의미하며 Page Scope, Reuquest Scope, Session Scope, Application Scope로 구성된다.

- Page Scope : Servlet 또는 JSP가 수행되는 동안만 유효한 객체가 된다.
- Request Scope : Web 클라이언트로 부터의 요청이 끝날 때까지 유효한 객체가 된다. (HttpServletRequest객체에 객체를 보관)
- Session Scope : 요청을 보내온 Web클라이언트가 기동되어 있는 동안 유효한 객체가 된다. (HttpSession객체에 객체를 보관)
- Application Scope : 서버가 기동되어 있는 동안 유효한 객체가 된다. (ServletContext 객체에 객체를 보관한다.)

> HttpServletRequest, HttpSession 그리고 ServletContext는 모두 객체를 저장하는 방으로 사용하는 것이 가능하며 다음과 같은 객체의 저장, 추출, 삭제 기능의 메서드를 지원한다.

- public void setAttribute(String key, Object value)
- public Object getAttribute(String key)
- public void removeAttribute(String key)

