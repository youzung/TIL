

# R

> **R**는 통계 계산과 그래픽을 위한 프로그래밍 언어이자 소프트웨어 환경이다.뉴질랜드 오클랜드 대학의 로버트 젠틀맨(Robert Gentleman)과 로스 이하카(Ross Ihaka)에 의해 시작되어 현재는 R 코어 팀이 개발하고 있다. R는 GPL하에 배포되는 S프로그래밍 언어의 구현으로 GNU S라고도 한다. R는 통계 소프트웨어 개발과 자료 분석에 널리 사용되고 있으며, 패키지 개발이 용이해 통계 소프트웨어 개발에 많이 쓰이고 있다.



### [R의 구문]

#### R에서 지원하는 데이터 타입의 종류

1. R의 자료형

   - 문자형 : 문자, 문자열
   - 수치형 : 정수, 실수
   - 복소수형 : 실수 + 허수
   - 논리형 : 참값과 거짓값

   

2. R의 리터럴

   - 문자형 리터럴 :"가나다", '가나다',"",'','123',"abc"
   - 수치형 리터럴 : 100, 3.14, 0
   - 논리형 리터럴 : TRUE(T), FALSE(F) [Capital letter]
   - NULL(데이터 셋이 비어잇음을 의미)
   - NA(데이터셋의 내부에 존재하지 않는 값을 의미)
   - NaN(Mot a number : 숫자가 아님)
   - Inf(무한대값)

   

3. 타입 체크 함수들

   - is.character(x)
   - is.logical(x)
   - is.numeric(x)
   - is.double(x)
   - is.integer(x)
   - is.null, is.na, is.nan, is.finite, is.infinite, as.logical

   

4.  :star2: 자동 형 변환 룰

   ​	**문자형 (character) > 복소수형(complex)  > 수치형(numeric)  > 논리형(logical)**

   

5. 강제 형 변환 함수

   - as.character(x)
   - as.complex(x)
   - as.numeric(x)
   - as.double(x)
   - as.integer(x)

   

6. 자료형 확인 함수

   - class(x)
   - str(x)
   - mode(x)

   

#### R의 데이터 셋

> 데이터셋이 중요한 이유는 자료를 분석하기 위해서 다양한 형태의 개별 자료를 통합적으로 분헉하기 위해서다. 예를 들어 개인 신용분석을 위해서는 개인의 소득, 부채, 성별, 학력 등등의 숫자형, 문자형 요인(Factor)형 등의 자료를 데이터 셋에 담아야 한다.
>
> 특히 변수와 관측값형식의 자료를 분석하기 위해서는 데이터 프레임(data.frame)을 사용한다. 데이터프레임은 모든 변수에 대해서 관측값이 같은 길이를 갖도록 만들어 놓은 것이다. 



- 벡터(vector)

  - R에서 다루는 가장 기초적인 데이터셋(데이터구조)로서 1차원으로 사용된다.
  - 하나의 데이터 값도 벡터로 취급된다.
  - 동일 타입의 데이터만으로 구성된다.(문자형(character) > 수치형(numeric) > 논리형(logical))
  - 벡터 생성 방법 : c(), seq(), rep()연산자
  - 미리 정의된 내장 상수 벡터들 :LETTERS, letters, month.name, month.abb, pi
  - 인덱싱:1부터 시작하는 인덱스 값과 [인덱스]연산자 사용

  

- 팩터(factor)

  - 가능한 범주값(level) 만으로 구성되는 벡터이다.
  - 팩터 생성 방법 :factor(벡터), factor(벡터, levels = 레벨벡터), factor(벡터, levels=레벨벡터, ordered = TRUE)
  - 팩터의 레벨 정보 추출 : levels(팩터변수)

  

- 행렬(matrix)

  - 2차원의 벡터이다.
  - 동일타입의 데이터만 저장 가능
  - 인덱싱:[행의 인덱싱, 열의 인덱싱],[행의 인덱싱, ],[,열의 인덱싱], drop 속성-행렬구조 유지 여부
  - 행렬 생성 방법 
    -  matrix(data = 벡터, now = 행의 갯수, ncol=열의 갯수)
    - matrix(data = 벡터, nrow = 행의 갯수, ncol = 열의 갯수, byrow = TRUE)
    - rbind(벡터들,,,), cbind(벡터들,,,), dim(m)=행렬이 몇 차원인지 체크
    - nrow(행렬), ncol(행렬)
  - colnames(m), rownames(m), rowSums(m), colSums(m), rowMeans(m), colMeans(m)

  

- 배열(array)

  - 3차원 벡터이다.
  - 동일타입의 데이터만 저장 가능
  - 인덱싱 : [행의 인덱싱, 열의 인덱싱, 층(면)의 인덱스]
- R의 연산자
  
  
  
- 데이터 프레임(data frame)

  - 2차원 구조

  - 열 단위로 서로 다른 타입의 데이터들로 구성 가능

  - 모든 열의 데이터 개수(행의 개수)는 동일해야 한다.

  - 데이터 프레임 생성 방법

    - data.frame(벡터들...)
    - data.frame(열이름 = 벡터...)
    - data.frame(벡터들..., stringAsFactors = FALSE)
    - as.data.frame(벡터 또는 행렬 등)

  - 데이터 프레임 변환 

    - rbind(df, 벡터)
    - cbind(df, 벡터)
    - merge(df1, df2, by='key 변수')

  - 데이터 프레임의 구조 확인 : str(df)

  - 인덱싱 : [행의 인덱싱, 열의 인덱싱], [열의인덱싱], df$컬럼이름, [[열인덱싱]]

    - subset(df, select=컬럼명들, subset =(조건))

    

- 리스트(list)

  - 저장 가능한 데이터의 타입, 데이터 셋의 종류에 제한이 없다. 벡터, 행렬, 배열, 데이터 프레임 드의 서로 다른 구조의 데이터를 하나로 묶을 수 있는 자료구조이다.
  - R에서는 통계 분석 결과가 리스트 구조로 제시되는 경우가 많으며 서로 다른 구조의 다수의 데이터 객체를 개별로 따로 따로 관리하는 것 보다는, 이것들을 리스트라는 한 바구니에 가지런히 정리해서 모아놓으면 관리하기 편하다.
  - list() 함수로 리스트를 생성하고, [,[[,$ 를 통해 부분집합을 뽑아낸다.
    - [ : 리스트가 포함한 하위리스트를 뽑아낸다.
    - [[,  $: 하위 리스트가 포함한 원소를 추출하고, 계층구조 수준을 한 단계 제거한다.
  - unlist() : 리스트 해제, 리스트를 벡터로 반환한다.

  

#### R의 데이터 입출력

- 출력

  - print(x, ...)
    - print(출력데이터 [, 옵션들])
  - cat()
    - cat(..., 옵션들...)

- 파일에 출력

  - write.csv(파일명)
  - write.table(파일명)

  

**[지금까지 만들어진 데이터셋과 함수 저장하기]**

- 모두 저장

  - save(list=ls(), file="all.rda")
- 읽어오기 : load("all.rda")
- 한 개 저장 : save(변수명, file="one.rda")

**[파일에서 데이터 읽어들이기]**

- nums<-scan("sample_num.txt")
- words_ansi<-scan("sample_ansi.txt", what="")
- words_utf8<-scan("sample_utf8.txt", what="", encoding="UTF-8")
- lines_ansi<-readLines("sample_ansi.txt")
- lines_utf8<-readLines("sample_utf8.txt",encoding="UTF-8")
- df1<-read.csv("CSV파일 또는 CSV를 응답하는 URL")
- df2<-read.table("일정한 단위(공백 또는 탭등)로 구성되어 있는 텍스트 파일 또는 URL")(필요에 따라서 stringsAsFactors 속성 사용)



#### R의 제어문

> 주어진 명령을 수행하는데 있어서 조건에 따라서 수행여부를 정하고자 하는 경우, 필요한 만큼 반복 수행하려는 경우 모두 제어문을 사용한다. 전자의 경우에는 조건문인 if 문을 사용하며 후자의 경우에는 반복문인 for, while, repeat문을  사용한다. 제어문을 적용하여 수행하려는 명령이 여러개이면 블록({})로 구성한다.

- if문

  ```R
  if(조건)
  	수행 명령문장
  	
  if(조건)
  	수행명령문장1
  else
  	수행명령문장2
  ```

- ifelse함수

  - ifelse(조건, 조건이 참일 때 명령문1, 조건이 거짓일 때 명령문2)

- switch 함수

  - switch(EXPR=수치데이터, 식1, 식2, 식3, ... )
  - switch(EXPR=문자열데이터, 비교값1 = 식1, 비교값2 = 식2, ... )

- 반복문

  ```R
  for(변수 in 데이터셋)
  	반복수행명령문장
  while(조건)
  	반복수행명령문장
  repeat명령문(while(True)와 동일)
  :적어도 한 번 이상 명령문을 실행, 무한 루프에서 벗어나기 위해 분기문을 반드시 포함.
  ```


- 분기문

  - Break

    - 해당 루프(반복문)을 종료

    - Next - 현재 반복을 종료하고 실행위치를 다음 반복문으로 이동.

      - 반복문 내에서는 화면에 결과 출력시 출력함수(print()또는 cat()를 사용해야한다.)

      

#### R의 함수 정의와 호출

> R프로그래밍의 주요 구성 요소로서 특정 작업을 독립적으로 수행하는 프로그램 코드 집합.
>
> 함수를 사용하여 반복적인 연산을 효과적으로 할 수 있음.



##### [함수의 처리 과정]

- 시작(입력) : 매개변수를 통해 아규먼트값을 받아옴
- 실행(연산) : 연산, 변환 등,,
- 종료(출력) :  수행 결과를 데이터셋으로 반환, 출력 등,,,



##### [함수 정의]

```R
함수명<- function([매개변수]){
	함수의 수행코드(수행명령문장들...)
	[return(리턴하려는값)]
}
```



##### [함수 호출]

```
변수명<-함수명()
변수명<-함수명(아규먼트)
함수명()
함수명(아규먼트)
```



- 호출시 함수가 정의하고 있는 배개변수 사양에 맞춰서 아규먼트를 전달해야 한다.
  - 리턴값이 없는 함수는 NULL이 리턴한다. 
  - 리턴값은 return()이라는 함수를 호출하여 처리하며 return()문이 생략된 경우에는 마지막으로 출력된 데이터 값이 자동으로 리턴된다. 가급적 리턴함수를 사용하여 명확히 구현하는 것이 필요하다.
  - 아규먼트의 타입을 제한하려는 경우에는 is.xxxx()한수를 활용한다.
  - 기본값을 갖는 매개변수 선언하여 선택적으로 전다로디는 아규먼트를 처리할 수 있다.
  - 아규먼트의 개수와 타입을 가변적으로 처리 가능하며 리턴값의 경우에도 선택적으로 처리 가능하다.
  - 함수 안에서 만들어진 지역변수는 함수내에서만 사용 가능하다.
- 함수 안에서의 변수 대입은 무조건 지역 변수를 만들어서 대입하는 결과가 된다.
- 함수내에서 전역변수에 값을 저장하려는 경우 대입연산자로 <<-(전역대입연산자)를 사용한다.



##### [함수의 정의와 호출 예제들]

```R
f1<-function() print("TEST")

f2<-function(num){print("TEST"); print(num)}

f3<-function(p="R")print(p)

f4<-function(p1="ㅋㅋㅋ",p2) for(i in 1:p2) print(p1)

f5<-function(...){print("TEST"); data<-c(...);print(length(data))}

f6<-function(...){
    print("수행시작")
    data<-c(...)
    for(item in data){
        print(item)
    }
    return(length(data))
}

f7<-function(...){
    data<-c(...)
    sum<-0;
    for(item in data){
        if(is.numeric(item))
            sum<-sum+item
        else
            print(item)
    }
    return(sum)
}

f8<-function(...){
    data<-list(...)
    sum<-0;
    for(item in data){
        if(is.numeric(item))
            sum<-sum+item
        else
            print(item)
    }
    return(sum)
}
```



