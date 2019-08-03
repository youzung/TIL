### Spring MVC 게시판

1. 프로젝트 생성
   - Spring Legacy Project
   - Spring MVC Project
   - my.spring.xxx(xxx가 매핑명됌)
2. 프로젝트 인코딩 UTF-8로 변경
3. pom.xml에 추가하기

```xml
<dependency>
	<groupId>com.jslsolucoes</groupId>
	<artifactId>ojdbc6</artifactId>
	<version>11.2.0.1.0</version>
</dependency>
<dependency>
	<groupId>org.springframework</groupId>
	<artifactId>spring-jdbc</artifactId>
	<version>5.0.2.RELEASE</version>
</dependency>
<dependency>
	<groupId>org.mybatis</groupId>
	<artifactId>mybatis</artifactId>
	<version>3.4.1</version>
</dependency>
	<dependency>
	<groupId>org.mybatis</groupId>
	<artifactId>mybatis-spring</artifactId>
	<version>1.3.2</version>
</dependency>
```

4. web.xml 에 한글 처리 위한 필터 추가

```xml
  <filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>UTF-8</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>
```

5. service-context.xml에 추가

```xml
<context:component-scan base-package="service" />
	<context:component-scan base-package="dao" />
	<context:component-scan base-package="vo" />

	<beans:bean id="dataSource"
		class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<beans:property name="driverClassName"
			value="oracle.jdbc.OracleDriver" />
		<beans:property name="url"
			value="jdbc:oracle:thin:@localhost:1521:XE" />
		<beans:property name="username" value="jdbctest" />
		<beans:property name="password" value="jdbctest" />
	</beans:bean>

	<beans:bean id="sqlSessionFactory"
		class="org.mybatis.spring.SqlSessionFactoryBean">
		<beans:property name="dataSource" ref="dataSource" />
		<beans:property name="configLocation"
			value="classpath:/mybatis-config.xml" />
		<beans:property name="mapperLocations"
			value="classpath:/*Mapper.xml" />
	</beans:bean>

	<beans:bean id="sqlSession"
		class="org.mybatis.spring.SqlSessionTemplate"
		destroy-method="clearCache">
		<beans:constructor-arg index="0"
			ref="sqlSessionFactory"></beans:constructor-arg>
	</beans:bean>
	
```

6. mybatis-config.xml 생성

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
  <settings>
     <setting name="jdbcTypeForNull" value="NULL" />
  </settings>  
</configuration>
```

7. DB 테이블, 시퀀스 생성
8. vo 생성
9. dao 생성
10. mapper.xml 파일 생성

```xml
<!--위에 추가-->
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
```



