## try except

#### 예외 처리

```python
try:
    # 에러가 발생할 가능성이 있는 코드
except Exception: # 에러 종류
    #에러가 발생 했을 경우 처리할 코드
```

- 경우에 따라 예외 처리 대신 if else를 사용 할 수 있다.



### 예외의 이름을 모를 때

#### 예외 이름을 모르는 경우 처리 방법

```python
try:
    # 에러가 발생할 가능성이 있는 코드
except Exception as ex: # 에러 종류
    print('에러가 발생 했습니다', ex) # ex는 발생한 에러의 이름을 받아오는 변수
```



### raise

#### 예외 발생

- 사용자가 직접 에러를 발생시키는 기능
- `raise Exception # 에러 종류`
- 많이 사용하면 코드를 읽기 어려워진다.