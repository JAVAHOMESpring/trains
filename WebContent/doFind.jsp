<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.sun.org.apache.bcel.internal.classfile.ClassFormatException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
//设置编码集 
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
//获取请求参数 
String start = request.getParameter("startstation");
String end = request.getParameter("endstation");
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

//加载类驱动 
try{
	Class.forName("com.mysql.jdbc.Driver");
}catch(ClassFormatException e ){
	e.printStackTrace();
}
try{
	//获取连接对象 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trains","root","a");
	//编写sql语句 
	String sql = "select * from station where startstation=? and endstation=?  ";
    //预处理sql语句 
	pstmt=con.prepareStatement(sql);
    //设置参数 
    pstmt.setObject(1,start);
    pstmt.setObject(2,end);
    //执行 SQL语句 
    rs=pstmt.executeQuery();
    List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    Map<String,Object> map = null;
    while(rs.next()){
    	map = new HashMap<String,Object>();
    	map.put("id",rs.getObject("id"));
    	map.put("station",rs.getObject("station"));
    	map.put("startstation",rs.getObject("startstation"));
    	map.put("endstation",rs.getObject("endstation"));
    	map.put("starttime",rs.getObject("starttime"));
    	map.put("daytime",rs.getObject("daytime"));
    	map.put("price",rs.getObject("price"));
    }
    list.add(map);
    request.setAttribute("list", list);
    request.getRequestDispatcher("res.jsp").forward(request, response);
    
}catch( Exception e){
	e.printStackTrace();
	
}finally{
	rs.close();
	pstmt.close();
	con.close();
}


%>