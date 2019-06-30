## Spring 실습

- Homework.java

```java
public class Homework {
	private String homeworkName;
	
	public Homework(String homeworkName) {
		this.homeworkName = homeworkName;
	}
	
	public String getHomeworkName() {
		return homeworkName;
	}

	public void setHomeworkName(String homeworkName) {
		this.homeworkName = homeworkName;
	}
}
```



- Student.java

```java
public class Student {
	private String name;
	private Homework myHomework;
	
	public Student() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Homework getMyHomework() {
		return myHomework;
	}

	public void setMyHomework(Homework myHomework) {
		this.myHomework = myHomework;
	}
	
	public String toString() {
		return  name + "는 "+myHomework.getHomeworkName()+"을(를) 학습합니다.";
	}	
}
```



- StudyApp.java

```java
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StudyApp {

	public static void main(String[] args) {
        ApplicationContext factory = new ClassPathXmlApplicationContext("exam2/bean.xml");
		Student student1 = (Student)factory.getBean("st1");
		Student student2 = (Student)factory.getBean("st2");
		Student student3 = (Student)factory.getBean("st3");
		
		System.out.println(student1.toString());
		System.out.println(student2.toString());
		System.out.println(student3.toString());
		
		((ClassPathXmlApplicationContext)factory).close();
	}

}

```



- bean.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:c="http://www.springframework.org/schema/c"
	xmlns:p="http://www.springframework.org/schema/p"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
	<bean id="h1" class="exam2.Homework" c:homeworkName="국어"/>
	<bean id="h2" class="exam2.Homework" c:homeworkName="영어"/>
	<bean id="h3" class="exam2.Homework" c:homeworkName="수학"/>
	
	<bean id="st1" class="exam2.Student" p:name="둘리" p:myHomework-ref="h1"/>
	<bean id="st2" class="exam2.Student" p:name="또치" p:myHomework-ref="h2"/>
	<bean id="st3" class="exam2.Student" p:name="도우너" p:myHomework-ref="h3"/>
</beans>

```

- c 태그 p 태그 사용하기 위한 네임스페이스 선언이 필요함.
- ref 이용하여 객체에 필요한 정보 가져와서 사용.



> 결과 화면

![캡처](C:\Users\USER\Desktop\캡처.JPG)