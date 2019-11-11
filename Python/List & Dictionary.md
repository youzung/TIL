## List

- 여러개의 값을 담을 수 있는 변수

  ``` python
  list1 = [1,2,3,4,5]
  ```

- 값 읽어오기

  - 리스트를 사용할때는 0번째가 첫번째
  - 첫번째 값 `list1[0]`

  - 두번째 값 `list1[1]`
  - 뒤에서 첫번째 값 `list1[-1]`
  - 뒤에서 두번째 값 `list1[-2]`
  - 리스트에 들어있는 값 보다 큰 값을 읽어오려고 하면 에러
    - 예. 위의 list1에서 `list1[5]` 또는 `list1[-6]`은 에러

- 값 쓰기
  - 변수와 같이 `list1[0]=10`이라고 하면 list의 첫번째 값이 10으로 변경



 ### 리스트 수정

#### 리스트에 새로운 값을 추가하는 방법

- `list1=[1,2,3]`이라고 할 때
- append를 이용
  - `list1.append(4)`
  - append를 이용하면 리스트에 새로운 값이 추가된다.
- 뒤에 새로운 리스트를 더하기
  - `list2=list1+[4]`
  - list1은 그대로 두고, 새로운 리스트를 만들어 낸다.

#### 리스트에 값이 들어있는지 확인하는 방법

- in 연산을 이용

  ```
  #12라는 값이 리스트에 들어있는지 확인하는 코드
  n=12
  if n in list1:
      print('{}가 리스트에 있다.'.format(n))
  ```

#### 리스트에서 필요 없는 값을 지우는 방법

- del을 이용해서 특정 위치의 값을 지우기
  - `del list1[10]` 리스트의 10번째 값을 지워라
- remove를 이용해서 특정 값을 지우기
  - `list1.remove(40)`을 하면 리스트에 40이라는 값이 있는경우 삭제
  - 여러개의 값이 있는 경우 가장 앞에 있는 하나만 지워짐



## 딕셔너리

#### 딕셔너리 만들기

#### 딕셔너리

- 여러 값을 저장해 두고 필요한 값을 꺼내 쓰는 기능
- 이름표를 이용하여 값을 꺼내 사용
- 사용할 때는 리스트와 비슷한 방식

```python
wintable = {
    '가위' : '보',
    '바위' : '가위',
    '보' : '바위',
}

print(wintable['가위'])
```

#### 딕셔너리 수정하기

- 추가

  ```python
  dict['three'] = 3
  ```

- 수정

  ```python
  dict['one'] = 11
  ```

- 삭제

  ```python
  del(dict['one'])
  dict.pop('two')
  ```



#### 딕셔너리와 반복문

#### 딕셔너리 반복문 활용

- 경우에 따라 가져올 값을 정할 수있다.

  ```
  for key in ages.keys(): # keys() 생략 가능
      print(key)
  ```

  ```
  for value in ages.values():
      print(value)
  ```

- key와 value 둘다 가져올 수 있다.

  ```
  for key, value in ages.items():
      print('{}의 나이는 {} 입니다'.format(key, value))
  ```

- 딕셔너리는 값의 순서를 지키지 않는다.



## 리스트와 비교

#### 공통점

|               |        List        |         Dictionary          |
| :-----------: | :----------------: | :-------------------------: |
|   **생성**    | list = [ 1, 2 ,3 ] | dict = { 'one':1, 'two':2 } |
|   **호출**    |     list[ 0 ]      |        dict[ 'one' ]        |
|   **삭제**    |  del( list[ 0 ] )  |    del( dict[ 'one' ] )     |
| **개수 확인** |    len( list )     |         len( dict )         |
|  **값 확인**  |     2 in list      |    'two' in dict.keys( )    |
| **전부 삭제** |   list.clear( )    |        dict.clear( )        |

#### 차이점

|          |                          List                          |                   Dictionary                    |
| :------: | :----------------------------------------------------: | :---------------------------------------------: |
| **순서** | 삭제 시 순서가 바뀌기 때문에 인덱스에 대한 값이 바뀐다 | key로 값을 가져오기 때문에 삭제 여부와 상관없다 |
| **결합** |                     list1 + list2                      |              dict1.update( dict2 )              |
