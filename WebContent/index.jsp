<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<div align="center">
<form action="doFind.jsp" method="post">
<table>
  <caption>查询车次</caption>
  <tr>
      <td>起始站：</td>
       <td><input type="text" name ="startstation"/></td>
  </tr>
  <tr>
      <td>终点站：</td>
       <td><input type="text" name ="endstation"/></td>
  </tr>
  <tr>
      <td colspan="2"><input type="submit" value="查询"/></td>
  </tr>
</table>


</form>
</div>

</body>
</html>