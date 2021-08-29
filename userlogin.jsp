<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>

<%
ServletContext context=getServletContext();
String name1=context.getInitParameter("name1");  
String pass1=context.getInitParameter("pass1"); 

%>
<html>
<head>
<title>Key-Aggregate Cryptosystem</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;
String name = request.getParameter("name");
String password = request.getParameter("password");
String loginlocation = request.getParameter("location");
session.setAttribute("loginlocation",loginlocation);

try{
		
	Connection con=databasecon.getconnection();
	st = con.createStatement();
	String qry ="select * from profile where  name='"+name+"' AND password='"+password+"'"; 
	rs = st.executeQuery(qry);
	if(!rs.next()){
	out.println("Enter correct Email Id, password");
	
	}
	else{
		System.out.println("---------------------");
		System.out.println("Successfully login by "+rs.getString("name"));
		System.out.println("---------------------");
		session.setAttribute("myid",Integer.toString(rs.getInt("id")));
		session.setAttribute("myname",rs.getString("name"));
		session.setAttribute("myemail",rs.getString("email"));
		session.setAttribute("mygender",rs.getString("gender"));
		session.setAttribute("mylocation",rs.getString("location"));
		session.setAttribute("myp",rs.getString("prime"));
		session.setAttribute("myg",rs.getString("generator"));
		session.setAttribute("mys",rs.getString("privatekey"));
		response.sendRedirect("search.jsp");	
	}
	con.close();
	st.close();
}
catch(Exception ex){
	out.println(ex);
}
%>
</body>
</html>


