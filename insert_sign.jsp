<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head><title>Profile Matching</title>
</head>
<body>

<%
		String signid=(String)session.getAttribute("signid");
		String temp[]=null,temp1[]=null;
		temp=signid.split(",");
		int pid=Integer.parseInt(temp[0]);
		//String threshold=request.getParameter("threshold");
		//String share=request.getParameter("share");
		String sign=request.getParameter("sign");
		String status="Signature";
		
		ResultSet rs1=null;
			
			
					try {			
						Connection con=databasecon.getconnection(); 

						Statement st=con.createStatement();
           
          				String sql="update privacy set signature='"+sign+"',status='"+status+"' where id='"+pid+"'";
             			st.executeUpdate(sql);
											
						response.sendRedirect("security_mediator.jsp?message=success");
					} 
					catch (Exception e) 
					{
						out.println(e.getMessage());
					}
			
			//Shamir secret sharing scheme
				
			
	
 %>

</body>
</html>