<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="ciphertext.*"%>
<%@page import="Key_Aggregate.*"%>

<%
		String name=null,tname=null,disease=null,stage=null,drug=null,location=null,message=null,image=null,myimagename=null;
		
		int pid=0,f=0;
		
		String myname = (String)session.getAttribute("myname");
		
		String mylocation = (String)session.getAttribute("mylocation");
		
		String table_name=null;
		
		if(mylocation.equals("Bangalore")){
			table_name="bangalore";
		}
		if(mylocation.equals("Chennai")){
			table_name="chennai";
		}
		if(mylocation.equals("Delhi")){
			table_name="delhi";
		}
		if(mylocation.equals("Mumbai")){
			table_name="mumbai";
		}
		
		KeyGeneration keygen=new KeyGeneration();
		
		Elgamal_Encryption elgamal=new Elgamal_Encryption();
		
		Encrypte_Image imagelay=new Encrypte_Image();
		
		Ciphertext call_ciphertext=new Ciphertext();
		
		Thread.sleep(100);
		ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery\\");
		String dirName1 =context.getRealPath("\\Encrypt\\");
		
		String paramname=null;
		File file1 = null;
		
		Statement st2=null;
		ResultSet rs2=null;
		String sql2="select max(id) from "+table_name;
		try
		{
			Connection con2=databasecon.getconnection(); 
			st2=con2.createStatement();
			rs2=st2.executeQuery(sql2);
			if(rs2.next())
			{
			if(rs2.getInt(1)==0)
			pid=1;
			else
			pid=rs2.getInt(1)+1;
			
			session.setAttribute("pid",Integer.toString(pid));
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB
	
				Enumeration params = multi.getParameterNames();
				while (params.hasMoreElements()) 
				{
					paramname = (String) params.nextElement();
					
					if(paramname.equalsIgnoreCase("tname"))
					{
						tname=multi.getParameter(paramname);
					}
					if(paramname.equalsIgnoreCase("disease"))
					{
						disease=multi.getParameter(paramname);
					}
					if(paramname.equalsIgnoreCase("stage"))
					{
						stage=multi.getParameter(paramname);
					}
					if(paramname.equalsIgnoreCase("drug"))
					{
						drug=multi.getParameter(paramname);
					}
					if(paramname.equalsIgnoreCase("location"))
					{
						location=multi.getParameter(paramname);
					}
					if(paramname.equalsIgnoreCase("message"))
					{
						message=multi.getParameter(paramname);
					}
					if(paramname.equalsIgnoreCase("image"))
					{
						image=multi.getParameter(paramname);
					}
				}
				
				//int f = 0;
			Enumeration files = multi.getFileNames();	
			while (files.hasMoreElements()) 
			{
				paramname = (String) files.nextElement();
				if(paramname.equals("d1"))
				{
					paramname = null;
				}
				
				if(paramname != null)
				{
					f = 1;
					image = multi.getFilesystemName(paramname);
					String fPath = context.getRealPath("\\Gallery\\"+image);
					file1 = new File(fPath);
					myimagename=file1.getName();
					session.setAttribute("myimagename",myimagename);
					
								String myimage="Encrypted_"+myimagename;
								session.setAttribute("myimage",myimage);
								String p11=dirName+"\\"+myimagename;
								String p22=dirName+"\\"+"encrypt_images.jpeg";
								String p33=dirName1+"\\"+myimage;
								imagelay.myencrypt(p11,p22,p33);
					
					FileInputStream fs = new FileInputStream(file1);
					list.add(fs);
				}		
			}
					}
					}
	catch(Exception ex)
		{
			System.out.println(ex);
		}
%>

<%
			
		int y=(int)(Math.random()*10000);
		
		String masterkey=Integer.toString(y);
	
		String id=request.getParameter("id");
		session.setAttribute("signid",id);
		String temp[]=null,temp1[]=null;
		temp=id.split(",");
		
		String tp=null,tg=null,ts=null,sk=null;
						
										Statement st = null;
										ResultSet rs=null;
												
									try{
										
											Connection con=databasecon.getconnection();
											st=con.createStatement();
											String sql="select * from profile where name='"+tname+"'";
											rs=st.executeQuery(sql);
											while(rs.next()){
												tp=rs.getString("prime");
												tg=rs.getString("generator");
												ts=rs.getString("privatekey");
											}	
									}
									catch (Exception eq) 
										{
											out.println(eq.getMessage());
										}
										
										Statement st1 = null;
										ResultSet rs1=null;
												
									try{
										
											Connection con1=databasecon.getconnection();
											st1=con1.createStatement();
											String sql1="select * from profile where name='"+myname+"'";
											rs1=st1.executeQuery(sql1);
											while(rs1.next()){
												sk=rs1.getString("privatekey");
												
											}	
									}
									catch (Exception eq1) 
										{
											out.println(eq1.getMessage());
										}
								
		String pkey = keygen.generate_Publickey(tp,tg,ts);
		
		Thread.sleep(100);
		
		String emkey=elgamal.encrypt(sk, pkey, tp, tg, masterkey);
		
		temp1=emkey.split(",");
		
%>
<%

		try{
			FileInputStream fs1 = null;
			Connection con=databasecon.getconnection(); 

			PreparedStatement ps=con.prepareStatement("insert into "+table_name+" values(?,?,?,?,?,?,?,?,?,?,?)");
			    
       			ps.setInt(1,pid);
				ps.setString(2,myname);
				ps.setString(3,tname);
				ps.setString(4,call_ciphertext.get_Ciphertext(disease));
				ps.setString(5,call_ciphertext.get_Ciphertext(stage));
				ps.setString(6,call_ciphertext.get_Ciphertext(drug));
				ps.setString(7,call_ciphertext.get_Ciphertext(location));
				ps.setString(8,call_ciphertext.get_Ciphertext(message));
				ps.setString(9,temp1[2]);
				ps.setString(10,call_ciphertext.get_Ciphertext(masterkey));
				ps.setString(11,myimagename);
				ps.setString(12,image);
				
       if(f == 0)
			ps.setObject(12,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(12,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("share_message.jsp?message=success");
			}
			else
			{
				response.sendRedirect("share_message.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
%>