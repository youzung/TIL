## Daemon Thread

```java
class DaemonThread implements Runnable  {
	static boolean autoSave = false;

	public static void main(String[] args) {
		Thread t = new Thread(new ThreadEx17());
		t.setDaemon(true);		// 이 부분이 없으면 종료되지 않는다.
		t.start();

		for(int i=1; i <= 20; i++) {			
			try{
				Thread.sleep(1500);
			} catch(InterruptedException e) {}
			System.out.println(i);
			
			if(i==5)
				autoSave = true;
		}

		System.out.println("프로그램을 종료합니다.");
	}

	public void run() {
		while(true) {
			try { 
				Thread.sleep(3 * 1000);	// 3초마다
			} catch(InterruptedException e) {}	

			// autoSave의 값이 true이면 autoSave()를 호출한다.
			if(autoSave) {
				autoSave();
			}
		}
	}

	public void autoSave() {
		System.out.println("작업파일이 자동저장되었습니다.");
	}
}
```

> 실행 결과

![캡처](C:\Users\student\Desktop\캡처.PNG)

- 엄마스레드가 하는 일 : 1.5초마다 1~20까지 출력
- 3초마다 autoSave()
- Daemon화 시켜주지 않으면 무한루프

