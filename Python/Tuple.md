

## 튜플

- 한번 정해진 순서를 바꿀 수 없다.

- 튜플 선언

  ```
  tuple1 = (1, 2, 3, 4)
  
  tuple2 = 1, 2, 3, 4
  
  mylist = [1,2,3,4]
  tuple3 = tuple(mylist)
  ```

- 튜플은 값의 변경과 삭제가 불가능

### packing, unpacking

#### packing

- 하나의 변수에 여러개의 값을 넣는 것

#### unpacking

- 패킹된 변수에서 여러개의 값을 꺼내오는 것

```python
c = (3, 4)
d, e = c    # c의 값을 언패킹하여 d, e에 값을 넣었다
f = d, e    # 변수 d와 e를 f에 패킹
```

#### 튜플의 활용

- 두 변수의 값을 바꿀 때 임시변수가 필요 없다.
- 함수의 리턴 값으로 여러 값을 전달할 수 있다.



### 튜플을 이용한 함수의 리턴값

#### 튜플 리스트 활용

```python
for a in enumerate(list):
    print('{}번째 값: {}'.format(a[0], a[1]))

for a in enumerate(list):
    print('{}번째 값: {}'.format(*a))
```

#### 튜플 딕셔너리 활용

```python
for a in dict.items():
    print('{}의 나이는:{}'.format(a[0], a[1]))

for a in dict.items():
    print('{}의 나이는:{}'.format(*a))
```