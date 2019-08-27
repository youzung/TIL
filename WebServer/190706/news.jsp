<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "model.vo.NewsVO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

	h2{
		color : purple;
	}
	th:nth-child(1){
		color : blue;
	}
	th:nth-child(2){
		color : red;
	}
	th:nth-child(3){
		color : magenta;
	}
		th:nth-child(4){
		color : orange;
	}
		th:nth-child(5){
		color : lime;
	}
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
	NewsVO listOne = (NewsVO)request.getAttribute("listOne");
	@SuppressWarnings("unchecked")	
	ArrayList<NewsVO> list = (ArrayList<NewsVO>)request.getAttribute("list");	
	if(list !=null){
%>

<div align="center">
	<h2>뉴스 게시판</h2><hr>
	<table>
	<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
	</tr>
<%
		for (NewsVO vo : list){
%>
	<tr>
		<td><%= vo.getId() %></td>
		<td onclick ="updateNews('<%= vo.getId() %>')"><%= vo.getTitle() %></td>
		<td><%= vo.getWriter() %></td>
		<td><%= vo.getWritedate() %></td>
		<td><%= vo.getCnt() %></td>
	</tr>
<%
		}
%>
	</table>

<button onclick ="newsDiv(1);">뉴스 작성</button>
</div>
<%
}
%>
<script>
	function newsDiv(type){
		if(type==1){
			document.getElementById("write").style.display = 'block';
			//document.getElementById("update").style.display="none";	
		}else if(type==2){
			document.getElementById("update").style.display ='none';
		}else if(type==3){
			document.getElementById("write").style.display="none";
		}	
	}
	function deleteNews(cv){
		location.href = "/mvc/news?action=delete&id=" + cv;
		
	}
	function updateNews(cv){
		location.href = "/mvc/news?action=read&id=" + cv;
	}
</script>

<%
	if(listOne !=null){
%>
	<div id="update" align ="center">
	<form method = post action="/mvc/news">
		<input type="hidden" name = "action" value ="update">
		<input type="hidden" name="id" value="<%=listOne.getId() %>">
		<input id ="writer" type = "text" name = "writer" value = '<%= listOne.getWriter() %>'><br>
		<input id = "title" type = "text" name = "title" value ='<%=listOne.getTitle() %>'><br>
		<textarea id="context" name="content"><%=listOne.getContent() %></textarea><br>
		<div>
			<input type ="reset" onclick="newsDiv(2)" value = "확인">
			<input type="submit" value = "수정">
			<input type="reset" onclick="deleteNews('<%=listOne.getId()%>')"  value="삭제">
		</div>
	</form>
	</div>
<% 
	}
%>

<div id = "write" style="display:none" align="center">
	<form method="post" action="/mvc/news">
		<h2>뉴스 내용</h2>
		<input type ="hidden" name = "action" value ="insert">
		<input type ="text" name ="writer" id="m_writer" placeholder ="작성자명을 입력해 주세요." ><br>
		<input type ="text" name ="title" id="m_title" placeholder ="제목을 입력해 주세요."><br>
		<textarea rows="5" cols="30" name ="content" id="m_content" placeholder ="내용을 입력해 주세요."></textarea><br>
		<div>
			<input type ="submit" value = "저장">
			<input type="reset" value = "재작성">
			<input type="reset" onclick="newsDiv(3)" value="취소">
		</div>
	</form>
</div>
</body>
</html>