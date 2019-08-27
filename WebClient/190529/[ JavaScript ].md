## [ JavaScript ]

- Java 
  - 범용 언어, OOP,
  - 썬 마이크로시스템즈 -> 오라클
- JavaScript 
  -  동적인 웹페이지 제작에 사용되는 언어, OOP
  -  넷스케이프 -> ECMA(오픈언어)
  - 정적인 웹 페이지를 생성하는 HTML을 보완하는 프로그래밍 언어
  - 라이브스크립트 
  - CSS와 동일하게 HTML 문서안에 작성해도 되고 독립된 파일(.js)로 만든 다음 HTML문서안으로 import 가능

------

### [JavaScript 구문 정리]

```javascript
var v1; //변수 선언시 타입을 지정해 주지 않아도 됌
document.writeln(v1 + "<br>");
v1 = 100; 
document.writeln(v1 + "<br>");
v1 = '가나다';
document.writeln(v1 + "<br>");
    
var v1; //같은 변수 선언해도 에러 안나므로 주의 해야 함
document.writeln(true === 1); //등가연산자 3개는 타입비교
        
var num = 9;
num % 2 == 0 && document.writeln(num +"은(는) 짝수");//앞의 식이 참이면 뒤의 식 수행
num % 2 == 0 || document.writeln(num +"은(는) 홀수");//앞의 식이 거짓이면 뒤의 식 수행
        
```

