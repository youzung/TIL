## Mybatis

### XML 파일에서 SqlSessionFactory 빌드하기

> 모든 Mybatis 애플리케이션은 SqlSessionFactory 객체를 사용한다. SqlSessionFactory 객체는 SqlSessionFactoryBuilder를 사용하여 만들수 있따. SqlSessionFactoryBuilder는 XML 설정파일에서 SqlSessionFactory 객체를 빌드할 수 있다.
>
> XML 파일에서 SqlSessionFactory객체를 빌드하는 것은 매우 간단하다. 설정을 위해 클래스패스 자원을 사용하는 것을 추천하나 파일 경로나 file:// URL로부터 만들어진 InputStream객체를 사용할 수도 있다. Mybatis는 클래스패스와 다른 위치에서 자원을 로드하는 것으로 좀 더 쉽게 해주는 Resources라는 유틸성 클래스를 가지고 있다.



![`1](C:\Users\USER\Desktop\`1.JPG)



### Mybatis 설정파일

```xml
<configuration>
	<environments default = "development">
    	<environment id = "development">
        	<transactionManager type = "JDBC"/>
            <dataSource type ="POOLED">
            	<property name = "driver" value = "oracle.jdbc.OracleDriver"/>
                <property name = "url" value = "jdbc:oracle:thin:@localhost:1521:xe"/>                   <property name = "username" value = "ora"/>
                <property name ="password" value="ora"/>                            
            </dataSource>
        </environment>
    </environments>
</configuration>
              
```



### Mybatis 매핑파일

```xml
<?xml version="1.0" encoding ="UTF-8" ?>
<!DOCTYPE mapper PUBLIC"-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="resource.VisitorMapper">
	<select id = "selectVisitor" resultType="model.vo.VisitorVO">
        select * from visitor
    </select>
    <select id = "searchVisitor" parameterTyepr="java.lang.String" resultType = "model.vo.VisitorVO">
    	select * from visitor where memo like '%'||#{key}||'%'
    </select>
</mapper>
```



### Mybatis 구현

### - SqlSession

HTTP 요청을 받을때마다 만들고 응답을 리턴할때마다 SqlSession을 닫는다. 언제나 finally블록에서 닫아야만한다. 다음은 SqlSession을 닫는 것을 확인하는 표준적인 형태다.

```java
SqlSession session = sqlSessionFactory.openSession();
try{
    session.insert(...);
    session.update(...);
    session.delete(...);
}finally{
    session.close();
}
-----------------------------------------------------------
try(SqlSession session = sqlSessionFacotry.openSession()){
    session.insert(...);
    session.update(...);
    session.delete(...);
}
```



#### - SqlSession의 주요 메서드

```java
T selectOne(String Statement, Object parameter);
List<E> selectList(String statment, Object parameter);
Map<K,V> selectMap(String statement, Object parameter, String mapkey);
int insert(String statment, Object parameter);
int update(String statment, Object parameter);
int delete(String statment, Object parameter);
```



#### - Mapper 파일 작성

- typeAliase
  - 타입 별칭은 자바 타입에 대한 짧은 이름, 오직 XML설정에서만 사용되며, 타이핑을 줄이기 위해 존재한다.

```xml
<typeAliases>
	<typeAlias alias = "Author" type="domain.blog.Author"/>
    <typeAlias alias = "Blog" type="domain.blog.Blog"/>
    <typeAlias alias = "Comment" type="domain.blog.Comment"/>
    <typeAlias alias = "Post" type="domain.blog.Post"/>
    <typeAlias alias = "Section" type="domain.blog.Section"/>
</typeAliases>
```

