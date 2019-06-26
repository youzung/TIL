### JSTL

> JSP Standard Tag Library , 아파치 오픈 그룹이 만든 JSP의 커스텀태그 모음
>
> core 라이브러리, format(i18n) 라이브러리, sql 라이브러리, xml 라이브러리, 함수 라이브러리



#### core 라이브러리

> 간단한 프로그램 로직 구현을 대신할 수 있는 기능의 커스텀 태그들이 지원되는 라이브러리. JSP에서 JSTL의 core라이브러리를 사용하면 다음과 같이 taglib지시자 태그를 정의해야 한다. uri 속성에는 정해진 URL 문자열을 사용해야 하며 prefix는 임의로 설정할 수 있지만 일반적으로 core의 약어인 c를 많이 사용한다.

```jsp
<%@ taglib prefix ="c" url = "http://java.sun.com/jsp/jstl/core" @>
```



1. **\<c:set>태그**

   \<c:set> 태그는 JSTL 태그에서 사용되는 EL변수를 만들고 값을 설정할 때 또는 EL변수의 프로퍼티 값을 설정할 때 사용한다. EL 변수란 EL식에서 사용되는 변수로서 page, request, session 그리고 application의 4개 스코프에 저장된 객체의 이름이다. 표준 액션태그의 \<jsp:useBean> 태그와 \<jsp:setProperty>태그의 기능을 합친 것과 동일한 기능을 지원한다.

   ```jsp
   <c:set var = "varName" value = "varValue" [scope="영역"]></c:set>
   <c:set var = "varName" [scope="영역"]>varValue</c:set>
   ```

   - var : 값을 저장할 EL변수의 이름
   - value : 변수의 값을 설정
   - scope : 변수를 저장할 영역을 설정. 값은 page, request, session그리고 application 중 하나를 사용한다. 기본값은 page

   

- **\<c:set> 태그로 객체의 프로퍼티 값을 설정하는 형식**

  ```jsp
  <c:set target ="대상" property ="프로퍼티이름" value="값"/>
  <c:set target ="대상" property ="프로퍼티이름">값</c:set>
  ```

  - target : 프로퍼티 값을 설정할 대상 객체를 설정 
  - property : 값을 설정할 프로퍼티의 이름을 정의
  - value : 설정할 프로퍼티의 값

  

2. **\<c:remove>태그**

   \<c:remove>태그는 \<c:set>태그로 만든 EL 변수를 삭제할 때 사용한다.

   ```jsp
   <c:remove var = "varName" [scope="영역"]/>
   ```

   삭제할 때 scope를 지정하지 않으면 동일한 이름으로 저장된 모든 영역의 변수를 모두 삭제한다.

   ```jsp
   <c:set var="name" value="홍길동" scope="request"/>
   <c:remove var="name"/>
   ```

3. **\<c:out>태그**

   \<c:out> 태그는 JspWriter객체를 이용하여 데이터를 출력할 때 사용하는 태그로서 다음과 같이 사용할 수 있다.

   ```jsp
   <c:out value="value" [escapeXML="(true|false)"] [default="defaultValue"]/>
   
   <c:out value ="value" [escapeXml="(true|false)"]>
   	defaultValue
   </c:out>
   ```

4. **\<c:if>태그**

   \<c:if>태그는 Java언어의 if문과 동일한 기능을 제공한다. else절 기능을 지원하지 않으며 단순 if문만을 지원한다.

   ```jsp
   <c:if test="조건">
   	...
   </c:if>
   ```

   다음과 같이 \<c:if>태그에 var속성을 사용하면 test속성의 계산 결과를 EL변수로 저장할 수 있다.

   ```jsp
   <c:if test="<%= some condition%>" var="testResult">
   	...
   </c:if>
   ```

   

5. **\<c:choose>,\<c:when>,\<c:otherwise>태그**

   \<c:choose>태그는 Java의 switch구문과 if-else또는 if-else if 구문을 혼합한 형태로서 다수의 조건문을 하나의 블록에서 수행하고자 할 떄 사용한다.

   ```jsp
   <c:choose>
   	<c:when test= "${member.level =='trial'}">
   		...
   	</c:when>
   	<c:when test= "${member.level =='regular'}">
   		...
   	</c:when>
   	<c:otherwise>
   		...
   	</c:otherwise>
   </c:choose>
   	
   ```

   

6. **\<c:forEach>태그**

   \<c:forEach>태그는 배열, Collection 또는 Map객체에 저장되어 있는 값들을 순차적으로 처리할 때 사용할 수 있는 태그로서, Java의 for, do-while등을 대신해서 사용할 수 있다.

   ```jsp
   <c:forEach var="i" begin ="1" end="10" step="2">
   	${i} 사용
   </c:forEach>
   ```

   var 속성에 지정한 변수 i는 1부터 10까지의 값 중에서 2씩 증가하는 1,3,5,7,9의 값을 갖게 된다.(step은 생략 가능하며 생략되면 1이 사용된다.)

   ```jsp
   <c:forEach var="item" items="<%= someItemList%>" varStatus="status">
   	${status.index+1} 번째 항목 ${item.name}
   </c:forEach>
   ```

   Java의 for each 문처럼 List와 같은 컬렉션을 items에 사용할 수 있다. \<c:forEach>를 사용하면 getter 메서드를 사용할 필요 없이 객체의 속성값을 간단하게 읽어올 수 있다. varStatus 속성은 \<c:forEach>태그를 사용하여 처리될 루프 정보를 담은 LoopTagStatus객체를 저장할 변수명을 값으로 갖게 된다.