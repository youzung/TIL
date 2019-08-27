## Single thread & Multi thread

### Single thread

```java
class SingleThread {
	public static void main(String[] args) throws Exception	{
		String input = 
			JOptionPane.showInputDialog("아무 값이나 입력하세요."); 
		System.out.println("입력하신 값은 " + input + "입니다.");

		for(int i=10; i > 0; i--) {
			System.out.println(i);
			try {
				Thread.sleep(1000);
			} catch(Exception e ) { }
		}
	}
}
```

> 실행 결과

![캡처](C:\Users\student\Desktop\캡처.PNG)

- 값을 입력받아야지 스레드가 실행된다.



## Multi thread

```java
class MultiThread {
	public static void main(String[] args) throws Exception 	{
		ThreadEx7_1 th1 = new ThreadEx7_1();
		th1.start();
		String input = JOptionPane.showInputDialog("아무 값이나 입력하세요."); 
		System.out.println("입력하신 값은 " + input + "입니다.");
	}
}
class MultiThread_1 extends Thread {
	public void run() {
		for(int i=10; i > 0; i--) {
			System.out.println(i);
			try {
				sleep(1000);
			} catch(Exception e ) {}
		}
	}
}
```

> 실행 결과

![asdf](C:\Users\student\Desktop\asdf.PNG)

- 값을 입력받지 않아도 스레드가 실행된다.

  