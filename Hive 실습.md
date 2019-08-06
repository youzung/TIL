## Hive 실습

> 브라우저에서 숫자를 클릭하면 해당 숫자의 노선 정보를 브라우저 테이블 형식으로 출력하기
>
> :warning:  DAO 에서 rs = stmt.executeQuery("select * from subway where linep='" + line +"'"); 작은 따옴표 안줘서 결과값이 안나옴! 주의 할 것

![1234](C:\Users\student\Desktop\1234.PNG)

![subway](C:\Users\student\Desktop\김유정_hive\subway.PNG)



1. SubwayVO 생성

```java
package vo;

public class SubwayVO {
	private String line;
	private String time;
	private String ride;
	private String takeoff;
	public String getLine() {
		return line;
	}
	public void setLine(String line) {
		this.line = line;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getRide() {
		return ride;
	}
	public void setRide(String ride) {
		this.ride = ride;
	}
	public String getTakeoff() {
		return takeoff;
	}
	public void setTakeoff(String takeoff) {
		this.takeoff = takeoff;
	}
}
```

2. SubwayDAO 생성

```java
@Repository
public class SubwayDAO {
	public List<SubwayVO> select(String line) {
		List<SubwayVO> list = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("org.apache.hive.jdbc.HiveDriver");
			conn = DriverManager.getConnection("jdbc:hive2://192.168.111.120:10000/mydb", "root", "password");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from subway where linep='" + line +"'");
			SubwayVO vo = null;
			while (rs.next()) {
				vo = new SubwayVO();
				vo.setLine(rs.getString(1));
				vo.setTime(rs.getString(2));
				vo.setRide(rs.getString(3));
				vo.setTakeoff(rs.getString(4));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

}
```



3. SubwayController 생성

```java
@Controller
public class SubwayController {
	@Autowired
	SubwayDAO dao;
	@RequestMapping("/subwayView")
	ModelAndView select(String line) {
		ModelAndView mav = new ModelAndView();
		List<SubwayVO> list = dao.select(line);
		mav.addObject(line ,list);
		mav.setViewName("subwayView");
		return mav;	
	}	
}
```



4. subwayView.jsp 생성

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="vo.SubwayVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지하철</title>
<style>
table {
	margin: 0 auto;
	width: 50%;
	border: 1px solid black;
}

td, th {
	border: 1px solid black;
}
</style>
</head>
<body>
<h1>지하철 정보</h1><hr>
	<%
		List<SubwayVO> line_1 = (List<SubwayVO>) request.getAttribute("line_1");
		List<SubwayVO> line_2 = (List<SubwayVO>) request.getAttribute("line_2");
		List<SubwayVO> line_3 = (List<SubwayVO>) request.getAttribute("line_3");
		List<SubwayVO> line_4 = (List<SubwayVO>) request.getAttribute("line_4");
	%>
	<%
		if (line_1 != null) {
	%>
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<th>Line</th>
			<th>Time</th>
			<th>Ride</th>
			<th>Takeoff</th>
		</tr>
		<%
			for (SubwayVO vo : line_1) {
		%>
		<tr>
			<td><%=vo.getLine()%></td>
			<td><%=vo.getTime()%></td>
			<td><%=vo.getRide()%></td>
			<td><%=vo.getTakeoff()%></td>
		</tr>

		<%
			}
		%>
	</table>
	<%
		} else if (line_2 != null) {
	%>
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<th>Line</th>
			<th>Time</th>
			<th>Ride</th>
			<th>Takeoff</th>
		</tr>
		<%
			for (SubwayVO vo : line_2) {
		%>
		<tr>
			<td><%=vo.getLine()%></td>
			<td><%=vo.getTime()%></td>
			<td><%=vo.getRide()%></td>
			<td><%=vo.getTakeoff()%></td>
		</tr>

		<%
			}
		%>
	</table>
	<%
		} else if (line_3 != null) {
	%>
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<th>Line</th>
			<th>Time</th>
			<th>Ride</th>
			<th>Takeoff</th>
		</tr>
		<%
			for (SubwayVO vo : line_3) {
		%>
		<tr>
			<td><%=vo.getLine()%></td>
			<td><%=vo.getTime()%></td>
			<td><%=vo.getRide()%></td>
			<td><%=vo.getTakeoff()%></td>
		</tr>

		<%
			}
		%>
	</table>
	<%
		} else if (line_4 != null) {
	%>
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<th>Line</th>
			<th>Time</th>
			<th>Ride</th>
			<th>Takeoff</th>
		</tr>
		<%
			for (SubwayVO vo : line_4) {
		%>
		<tr>
			<td><%=vo.getLine()%></td>
			<td><%=vo.getTime()%></td>
			<td><%=vo.getRide()%></td>
			<td><%=vo.getTakeoff()%></td>
		</tr>

		<%
			}
			}
		%>
	</table>


</body>
</html>
```

