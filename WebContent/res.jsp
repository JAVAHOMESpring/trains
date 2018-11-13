<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title></title>
</head>
<body>
<% 
List<Map<String,Object>> list=(List<Map<String,Object>>)request.getAttribute("list");
//System.out.println(list.size()+"++++"+list);
if(null!=list && list.size()>0){
	%>
	<table align="center" border="1">
	    <tr>
	        <td>车次</td>
	        <td>出发站</td>
	        <td>终点站</td>
	        <td>出发时间</td>
	        <td>天数</td>
	        <td>价格</td>
	    </tr>
	    <tr>
	    <%
	        for( Map map : list){
	        	%>
	        	  <td><%= map.get("station") %></td>
	              <td><%= map.get("startstation") %></td>
			      <td><%= map.get("endstation") %></td>
			      <td><%= map.get("starttime") %></td>
			      <td><%= map.get("daytime") %></td>
			      <td><%= map.get("price") %></td>
	        	<%
	        }
	    %>
	      
	    </tr>	    
	</table>
	<a style="margin: auto;" href="index.jsp">查询其他车次</a>
	<%
}else{
	out.println("查无此车次...");
}
%>
</body>
</html>