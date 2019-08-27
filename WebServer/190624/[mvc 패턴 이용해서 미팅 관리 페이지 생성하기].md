### [mvc 패턴 이용해서 미팅 관리 페이지 생성하기]

#### HTML > VO 구현 > DAO 구현 > Servlet 구현

1. meetingForm.html

   ```html
   <!DOCTYPE html>
   <html>
   <head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   </head>
   <body>
   <form method = "post" action = "/mvc/meeting">
   <h2>미팅 스케줄 작성</h2>
   <hr>
   미팅 대상 이름 : <input type="text"  name="name">
   <br>
   미팅 목적 : <br>
   <textarea rows="3" cols="30" name = "title" ></textarea>
   <br>
   날짜와 시간 :  <input type="datetime-local" name="meetingDate">
   <br><br>
   <input type = "submit" value = "등록">
   <input type = "reset" value = "재등록">
   </form>
   <hr>
   <form method = "get" action ="/mvc/meeting">
   검색어 : <input type = "search" name = "keyword" >
   <input type = "submit" value = "검색">
   <hr>
   <button type="button" onclick="location.href='/mvc/meeting' ">미팅 스케쥴 보기</button>
   </form>
   </body>
   </html>
   ```

   

2. MeetingVO.java

   ```java
   package model.vo;
   
   public class MeetingVO {
   	private int id;
   	private String name;
   	private String title;
   	private String meetingDate;
   	
   	public int getId() {
   		return id;
   	}
   	public void setId(int id) {
   		this.id = id;
   	}
   	public String getName() {
   		return name;
   	}
   	public void setName(String name) {
   		this.name = name;
   	}
   	public String getTitle() {
   		return title;
   	}
   	public void setTitle(String title) {
   		this.title = title;
   	}
   	public String getMeetingDate() {
   		return meetingDate;
   	}
   	public void setMeetingDate(String meetingDate) {
   		this.meetingDate = meetingDate;
   	}
   	@Override
   	public String toString() {
   		return "MeetingVO [id=" + id + ", name=" + name + ", title=" + title + ", meetingDate=" + meetingDate + "]";
   	}	
   }
   
   ```

   

3. MeetingDAO.java(interface) 

   ```java
   package model.dao;
   
   import java.util.List;
   import model.vo.MeetingVO;
   
   public interface MeetingDAO{
   	public List<MeetingVO> listAll();
   	public boolean insert(MeetingVO vo);
   	public List<MeetingVO> search(String keyword);
   	public boolean delete(int eNo);
   }
   ```

   

4. MeetingJDBCDAO.java

   ```java
   package model.dao;
   
   import java.sql.Connection;
   import java.sql.DriverManager;
   import java.sql.PreparedStatement;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   import java.sql.Statement;
   import java.util.ArrayList;
   
   import model.vo.MeetingVO;
   
   public class MeetingJDBCDAO implements MeetingDAO{
   	public ArrayList<MeetingVO> listAll(){
   		ArrayList<MeetingVO> list = new ArrayList<>();
   		try {
   			Class.forName("oracle.jdbc.OracleDriver");
   		} catch(Exception e) {
   			System.out.println(e.getMessage());
   		}
   		try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jdbctest","jdbctest");
   				Statement stmt = conn.createStatement();
   				ResultSet rs = stmt.executeQuery("select id, name, title, to_char(meetingDate,'yyyy\"년\" mm\"월\" dd\"일\" hh24\"시 \"mi\"분\"') from meeting");){	
   			MeetingVO vo;
   			while(rs.next()) {
   				vo = new MeetingVO();
   				vo.setId(rs.getInt(1));
   				vo.setName(rs.getString(2));
   				vo.setTitle(rs.getString(3));
   				vo.setMeetingDate(rs.getString(4));
   				list.add(vo);
   			}
   		}catch(SQLException e) {
   			e.printStackTrace();
   		}
   		return list;
   	}
   	
   	public ArrayList<MeetingVO> search(String keyword){
   		ArrayList<MeetingVO> list = new ArrayList<>();
   		try {
   			Class.forName("oracle.jdbc.OracleDriver");
   		} catch(Exception e) {
   			System.out.println(e.getMessage());
   		}
   		try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jdbctest","jdbctest");
   				Statement stmt = conn.createStatement();
   				ResultSet rs = stmt.executeQuery("select id, name, to_char(meetingDate,'yyyy\"년\" mm\"월\" dd\"일\" hh24\"시 \"mi\"분\"'), "
   						+ "title from meeting where title like '%"+keyword + "%'");){	
   			MeetingVO vo;
   			while(rs.next()) {
   				vo = new MeetingVO();
   				vo.setId(rs.getInt(1));
   				vo.setName(rs.getString(2));
   				vo.setMeetingDate(rs.getString(3));
   				vo.setTitle(rs.getString(4));
   				list.add(vo);
   			}
   		}catch(SQLException e) {
   			e.printStackTrace();
   		}
   		return list;
   	}
   	
   	public boolean insert(MeetingVO vo) {
   		boolean result = true;
   		try {
   			Class.forName("oracle.jdbc.OracleDriver");
   		} catch(Exception e) {
   			System.out.println(e.getMessage());
   		}
   		try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jdbctest","jdbctest");
   				//시간 전달 방법 > get방식으로 쿼리 어떻게 오는지 확인하고 포맷 맞춰서 설정하는 것도 하나의 방법!
   			PreparedStatement pstmt = conn.prepareStatement("insert into meeting values(meeting_seq.nextval, ? ,?, to_date(? , 'yyyy-mm-dd\"T\"hh24:mi'))");){			
   			pstmt.setString(1, vo.getName());
   			pstmt.setString(2, vo.getTitle());
   			pstmt.setString(3, vo.getMeetingDate());
   			pstmt.executeUpdate();
   			
   		}catch(SQLException e){
   			result = false;
   			e.printStackTrace();
   		}
   		return result;
   	}
   	
   	public boolean delete(int id) {
   		boolean result = true;
   		try {
   			Class.forName("oracle.jdbc.OracleDriver");
   		} catch(Exception e) {
   			System.out.println(e.getMessage());
   		}
   		try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jdbctest","jdbctest");
   				PreparedStatement pstmt = conn.prepareStatement("delete from meeting where id = ?");){
   			pstmt.setInt(1,id);
   			int deleteNum = pstmt.executeUpdate();
   			if(deleteNum != 1)
   				result = false;
   		}catch(SQLException e){
   			result = false;
   			e.printStackTrace();
   		}
   		return result;
   	}
   }
   
   ```

   

5. MeetingTest.java(JUnit)

   ```java
   package model.dao;
   
   import java.util.ArrayList;
   
   import org.junit.Test;
   
   import model.vo.MeetingVO;
   
   public class MeetingTest {
   
   	@Test
   	public void test() {
   		MeetingJDBCDAO dao = new MeetingJDBCDAO();
   		MeetingVO vo = new MeetingVO();
   		vo.setName("라이언");
   		vo.setTitle("화요일 저녁 6시에 만납시다!");
   		//vo.setMeetingDate("to_date('2019-07-01T13:40' yyyy\"년\" mm\"월\" dd\"일\" hh24\"시 \"mi\"분\"')");
   		vo.setMeetingDate("2019-07-01T13:40");
   		dao.insert(vo);
   		ArrayList<MeetingVO> list = dao.listAll();
   		for(MeetingVO data : list)
   			System.out.println(data);
   		/*
   		 * System.out.println("화요일이 들어간 글**"); list = dao.search("화요일");
   		 */
   
   		for(MeetingVO data : list)
   			System.out.println(data);
   	}
   	
   }
   
   ```

   

6. MeetingView.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "model.vo.MeetingVO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head><style>
	td{
		border-bottom : 2px dotted green;
	}
	tr:hover{
		background-color : pink;	
		font-weight : bold;
	}
	td:nth-child(3){
		width : 400px;
	}
</style>
<body>
<%
	ArrayList<MeetingVO> list = (ArrayList<MeetingVO>)request.getAttribute("list");
	if(list !=null){
%>
	<h2>미팅 스케쥴</h2><hr>
	<table>
<%
		for(MeetingVO vo : list){
%>
			<tr>
			<td><%= vo.getName() %></td>
			<td><%= vo.getTitle() %></td>
			<td><%= vo.getMeetingDate() %></td>
			<td><a href ='/mvc/meeting?id=<%= vo.getId() %>'><img src = "/mvc/images/delete.png" width = '30'></a></td>
			</tr>
<%
		}
%>
	</table>	
<%
	}else{
%>
	<h2>${ msg }</h2>

<%
	}
%>
<hr>
<a href ="/mvc/htmlexam/meetingForm.html">미팅 홈 화면으로 가기</a>
</body>
</html>
```

