## for in range

### range 함수

- 필요한 만큼의 숫자를 생성

  ``` python
  for i in range(5):
      print(i)
  ```

  

### enumerate

- 리스트가 있는 경우 순서와 리스트의 값을 전달

  ```python
  names = ['철수', '영희', '영수']
  for i, name in enumerate(names) : 
      print('{}번:{}'.format(i+1), name)
  ```

  