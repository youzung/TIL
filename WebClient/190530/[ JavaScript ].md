## [ JavaScript]

- 자바스크립트의 데이터 타입

  - number
  - boolean
  - string
  - undefined(null)
  - object
  - function

  

- 제어문

  - for
  - while
  - do-while
  - if
  - switch
  - break
  - continue

  

- 배열

  - 배열 생성 방법 

    - 배열 리터럴 : [값1, 값2, 값3, ... ]

    - 표준 API(Array())로 객체를 생성하여 만드는 방법 

      ​						: new Array() , new Array(숫자), new Array(값1, 값2, ... )

#### [배열의 특징]

- 객체로 취급된다.
- 요소 개수를 가변적으로 처리할 수 있다.
- 배열이 생성된 이후에도 배열의 크기를 변경할 수 있다.
- 하나의 배열에 저장되는 데이터 타입의 제한이 없다.
- 인덱스는 0부터 시작한다.
- length라는 속성을 사용하여 배열의 크기를 알 수 있다.

```javascript
<script>
	var a1 = [];
	document.write("<h3>" + typeof a1 + "</h3>");
	document.write("<h3>" + Array.isArray(a1) + "</h3>");
	document.write("<h3>" + a1.length + "</h3>");
	document.write("<h3>" +a1[0] + "</h3>");

	var a1 = new Array(); // [ ] 
	var a2 = new Array(10); //argument로 숫자로 오면 > 배열의 크기 : 10
	var a3 = new Array('가'); // 배열의 크기 : 1
	var a4 = new Array(10, 20); // argument로 숫자가 오지만 2개이상 오면 : 원소값
</script>
```

### [ 함수 정의와 활용 ]

##### 선언적 함수정의(명시적 함수 정의)

```javascript
function 함수명([매개변수 리스트]){
		:
    return 리턴값;
}
```

- 리턴값 없이 리턴했을 때 : undefined
- 함수명();
- var v = 함수명();
- 함수명(아규먼트리스트);



#### 표현적 함수정의

```javascript
function([매개변수리스트]){
			:	
}
var 함수명 = function([매개변수리스트]){
						:	
			}

f1(function(){......})
```



- 함수 호출시 아규먼트의 갯수가 제한없는 함수 만들기

```javascript
function out(){
    arguments
}
```

함수가 호출되는 시점에 arguments라는 지역변수가 자동으로 초기화된다.

함수호출시 전달되는 아규먼트들을 유사배열 객체에 담아서 arguments 변수에 할당한다.

