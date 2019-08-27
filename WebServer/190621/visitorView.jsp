<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import = "model.vo.VisitorVO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<VisitorVO> list = (ArrayList<VisitorVO>)request.getAttribute("list");
	if(list !=null){
%>
	<h2>방명록 글 리스트</h2>
	<table border ="1">
<%
		for(VisitorVO vo : list){
%>
			<tr>
			<td><%= vo.getName() %></td>
			<td><%= vo.getWriteDate() %></td>
			<td><%= vo.getMemo() %></td>
			</tr>
<%
		}
%>
	</table>
	
<%
	}else{
%>
	<h2>${msg }</h2>

<%
	}
%>
</body>
</html>