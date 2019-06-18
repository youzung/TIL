## Queue

1. 백준 2164번 카드2 

```java
public class Main {

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int num = Integer.parseInt(br.readLine());
		Queue<Integer> queue = new LinkedList<>();
		int answer = 0;

		for(int i =1; i<=num; i++) {
			queue.add(i);
		}
		
		while(queue.size()!=1) {
			queue.poll();
			queue.add(queue.peek());
			queue.poll();
			
		}
		answer = queue.peek();
		System.out.print(answer);
	}

}

```

- queue의 사이즈가 1일 때를 찾아야 하는데 while문의 조건식에서 1보다 클 때로 설정하고 answer을 while문 안에서 얻도록 하고 실행하니까 답은 나오지만 틀린 결과로  나와서 조건식을 사이즈가 1이 아닐때 까지 while문을 실행하도록 하였다.

