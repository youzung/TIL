## Thread

### process & thread

- process : 현재 실행중인 **프로그램**(메모리) (실행이 끝나면 더이상 프로세스가 아님)

  - program : 실행 가능한 파일(HDD)
  - process :  실행중인 프로그램, 자원(resource)와 thread로 구성
    - 실행중인 process : 리눅스에서는 ps로 확인가능

- thread : 프로세스 내에서 실제 작업을 수행, 모든 프로세스는 하나 이상의 thread를 갖고 있다.

  - JVM이 thread를 기동시켜서 main을 호출한다.(=main thread)
  - 프로그램은 **최소한** 하나의 main thread로 실행된다.
  - 프로세스 내에서 실제 작업을 진행하는 흐름을 뜻한다.

- process : thread = 공장  : 일꾼

  - single thread process = resource + thread 
    - thread가 하나 = main thread만 존재 (JVM이 자동으로 기동)
  - multi thread process (Spring MVC도 이에 해당) = resource + thread + ... + thread 
    - main thread가 아닌 thread들은 직접 생성하여 사용
    - 운영체제에 따라 구현하는 방법이 다름
    - java의 multi thread programming은 운영체제에 무관함

- 멀티 프로세스 vs 멀티 스레드

  - 하나의 새로운 프로세스를 생성하는 것 보다 하나의 새로운 스레드를 생성하는 것이 더 적은 비용이 든다.
  - 브라우저 = 멀티 스레드

  

### 멀티 스레드의 장단점

- 멀티 스레드의 장점
  - 자원을 효율적으로 사용할 수 있다.
  - 사용자에 대한 응답성이 향상된다.
  - 작업이 분리되어 코드가 간결해진다.
- 멀티스레드의 단점
  - 동기화에 주의해야한다.
  - 교착상태가 발생하지 않도록 주의해야한다.
  - 각 스레드가 효율적으로 고르게 실행될 수 있게 해야한다.
- 필요한 기능만큼 스레드 클래스를 생성해야 한다.
- 스레드의 구현과 실행
  	1. Thread 클래스를 상속
   	2. Runnable 인터페이스를 구현



### start() & run()

- call stack

  - thread단위로 쌓인다.
  - main이 먼저 쌓이고 start가 쌓인 후 추가로 기동된 call stack에 run이 올라간다.(추가로 올라간 call stack에서는 run이 main의 역할을 하게 됨)
  - 추가 스레드의 수행이 끝나면 call stack은 사라지게 된다.

  

### single thread & multi thread

- 싱글스레드의 단점 : 하나의 작업이 끝나야 다른 작업 가능(하나의 작업의 대기상태에 대한 낭비가 발생)
- 멀티스레드 : 하나의 작업이 끝나지 않아도 다른 작업을 실행 할 수 있다.



### Round-Robin & Priority

- Round-Robin : 시분할 시스템을 위해 설계된 선점형 스케줄링의 하나로, 프로세스들 사이에 우선순위를 두지 않고, 순서대로 시간단위로 CPU를 할당하는 방식의 CPU 스케줄링 알고리즘이다.
- Priority : 스레드가 수행하는 작업의 중요도에 따라 스레드의 우선순위를 서로 다르게 지정하여 특정 스레드가 더 많은 작업시간을 갖게 할 수 있다.



### Daemon Thread

> 데몬 스레드는 다른 일반스레드의 작업을 돕는 보조적인 역할을 수행하는 스레드이다.
>
> 일반 스레드가 모두 종료되면 데몬 스레드는 강제적으로 자동 종료된다.

- 데몬스레드는 일반 스레드의 작성방법과 실행방법이 같으며, 스레드를 생성한 다음 실행하기 전에 setDaemon(true)를 호출하기만 하면 된다.

- 리눅스 : daemon(백그라운드에서 돌아가는 것 - 스레드를 데몬으로 만들 수 있음)

- 윈도우 : service

