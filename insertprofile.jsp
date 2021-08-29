<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage=""%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="sign.*,Key_Aggregate.*"%>

<html>
<head>
</head>
<body>

<%
		String name=null,gender=null,email=null,password=null,status="Allow",image=null,mobile=null,location=null,mlocation=null;
		
		int y=(int)(Math.random()*1000);
	
		KeyGeneration keygen=new KeyGeneration();
		
		String bint = keygen.generate_Primekey();
		session.setAttribute("bint",bint);
		String temp[]=bint.split(",",3);
		
		java.util.Date now = new java.util.Date();
		String date=now.toString();
	 	String DATE_FORMAT = "dd-MM-yyyy";
	 	SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     	String strDateNew = sdf.format(now) ;
		
		name=request.getParameter("name");
		email=request.getParameter("email");
		password=request.getParameter("password");
		gender=request.getParameter("gender");
		location=request.getParameter("location");
		
		if(location.equals("Bangalore")){
			mlocation="1";
		}
		if(location.equals("Chennai")){
			mlocation="2";
		}
		if(location.equals("Delhi")){
			mlocation="3";
		}
		if(location.equals("Mumbai")){
			mlocation="4";
		}
		
		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		
	try{
		
			Connection con1=databasecon.getconnection();
			st=con1.createStatement();
			String sql1="select max(id) from profile";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
		
		
					try {
						
						
						Connection con=databasecon.getconnection(); 
			
						PreparedStatement ps=con.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?,?,?,?,?)");
							
							ps.setInt(1,id);
							ps.setString(2,name);	
							ps.setString(3,email);
							ps.setString(4,password);
							ps.setString(5,gender);
							ps.setString(6,location);
							ps.setString(7,strDateNew);
							ps.setString(8,temp[0]);
							ps.setString(9,mlocation);
							ps.setString(10,Integer.toString(y));				
							
					
						int x=ps.executeUpdate();
					
						if(x!=0)
						{
							response.sendRedirect("home.html?message=Successfully Registered");
						}
						else
						{
							response.sendRedirect("home.html?message=fail");
						}
							
					} 
					catch (Exception e) 
					{
						out.println(e.getMessage());
					}
			}	
	}
	catch (Exception eq) 
		{
			out.println(eq.getMessage());
		}
		
	
 %>
</body>
</html>