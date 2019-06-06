## Stack & Queue

>  **Stack**은 마지막에 들어간 데이터가 가장 먼저 꺼내지는 **LIFO**(Last In First Out)구조로 되어있고, **Queue**는 처음에 저장한 데이터를 가장 먼저 꺼내는 **FIFO**(First In First Out)구조로 되어있다.



- Stack 메서드

| 메서드               | 설명                                            |
| :------------------- | ----------------------------------------------- |
| boolean empty()      | 스택이 비어 있는지 알려준다.                    |
| Object peek()        | 스택의 맨 위에 저장된 객체를 반환한다.          |
| Object pop()         | 스택의 맨 위에 저장된 객체를 꺼낸다.            |
| Object push()        | 스택에 객체를 저장한다.                         |
| int search(Object o) | 스택에 주어진 객체를 찾아서 그 위치를 반환한다. |



---



- Queue 메서드



| 메서드                  | 설명                                                         |
| ----------------------- | ------------------------------------------------------------ |
| Object element()        | 삭제 없이 저장된 요소를 읽어온다. Queue가 비었을 때 Exception 발생 |
| boolean offer(Object o) | 큐에 객체를 저장한다.                                        |
| Object peek()           | 삭제없이 읽어 온다.                                          |
| Object poll()           | 큐에서 꺼내온다. 비었을 때 null 반환                         |
| Object remove()         | 큐에서 꺼내온다. 비었을 떄 Exception 발생                    |



---

> 소스코드

```java
	public static void main(String[] args){
        Stack s = new Stack();
        Queue q = new LinkedList();
        
        s.push("0");
        s.push("1");
        s.push("2");
        
        q.offer("0");
        q.offer("1");
        q.offer("2");
        
        System.out.println("Stack");
        while(!s.empty()){
            System.out.print(s.pop()); // 2 1 0
        }
        
        System.out.println("Queue");
        while(!q.empty()){
            System.out.print(q.poll());	//0 1 2
        }
    }
```

