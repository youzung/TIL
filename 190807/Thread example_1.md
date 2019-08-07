## Thread example_1

```java
class ThreadEx01 {
	public static void main(String args[]) {
		ThreadEx1_1 t1 = new ThreadEx1_1();

		Runnable r  = new ThreadEx1_2();
		Thread   t2 = new Thread(r);	  // 생성자 Thread(Runnable target)

		t1.setName("This is Thread!!");
		t1.start(); //thread를 기동시키는 method = java.lang.thread가 갖고 있음.
		t2.start();
		 System.out.println(Thread.currentThread().getName());
	}
}

class ThreadEx1_1 extends Thread {
	public void run() {
		for(int i=0; i < 5; i++) {
			
			System.out.println(getName()); // 조상인 Thread의 getName()을 호출
		}
	}
}

class ThreadEx1_2 implements Runnable {
	public void run() {
		for(int i=0; i < 5; i++) {
			Thread.currentThread(); //- 현재 실행중인 Thread를 반환한다.
		    System.out.println(Thread.currentThread().getName());
		}
	}
}
```



> 실행 결과

![캡처](C:\Users\student\Desktop\캡처.PNG)

- thread의 이름을 출력 하면 자동적으로 Thread-0, Thread-1 , ... 의 식으로 이름이 생성 된다.

- setName()으로 thread의 이름을 바꿀 수 있다.

- start() = thread를 기동시키는 method로 java.lang.thread가 갖고 있으며 자원을 부여하고, run 메서드를 호출한다. 