## JSON

> JSON(제이슨, JavaScript Object Notation)은, 인터넷에서 자료를 주고 받을 때 그 자료를 표현하는 방법이다. 자료의 종류에 큰 제한은 없으며, 특히 컴퓨터 프로그램의 변수값을 표현하는 데 적합하다. 형식은 자바스크립트의 구문 형식을 따르지만, 프로그래밍 언어나 플랫폼에 독립적이므로 많은 언어에서 이용할 수 있다.



#### JSON의 장점

- JSON은 텍스트로 이루어져 있으므로, 사람과 기계가 모두 읽고 쓰기 쉽다.
- 프로그래밍 언어와 플랫폼에 독립적이므로, 서로 다른 시스템간에 객체를 교환하기에 좋다.
- JSON은 개방형 표준이며, 읽기 및 쓰기가 쉽고 가볍다.

```json
{
    "status" : "OK",
    "data" : {
        "trends" : {
            "uv" : [
                {"date" : "20190622", "value" : 1},
            	{"date" : "20190623", "value" : 2},
        		{"date" : "20190624", "value" : 3}
                    ]
          },
            "trends_low_sample" : false,
            "query_cost" : 13,
            "trends_frequency" : "monthly"
    }
}
```



#### XML과 JSON 비교

![1561212689675](C:\Users\USER\AppData\Roaming\Typora\typora-user-images\1561212689675.png)