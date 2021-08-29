<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="ciphertext.*"%>
<%@page import="Key_Aggregate.*"%>

<%
		String name=null,tname=null,disease=null,stage=null,drug=null,location=null,message=null,image=null,myimagename=null,index=null,myimage=null,mytg=null;
		
		int pid=0,f=0;
		
		String myname = (String)session.getAttribute("myname");
		
		String mylocation = (String)session.getAttribute("mylocation");
		
		int y=(int)(Math.random()*10000);
		
		String masterkey=Integer.toString(y);
		session.setAttribute("master_key",masterkey);
		
		Connection con=databasecon.getconnection(); 
		
		String table_name=null;
		
		if(mylocation.equals("Bangalore")){
			table_name="bangalore";
			index="1";
			mytg="1";
		}
		if(mylocation.equals("Chennai")){
			table_name="chennai";
			index="2";
			mytg="2";
		}
		if(mylocation.equals("Delhi")){
			table_name="delhi";
			index="3";
			mytg="3";
		}
		if(mylocation.equals("Mumbai")){
			table_name="mumbai";
			index="4";
			mytg="4";
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
					
								 myimage="Encrypted_"+myimagename;
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
		
		String temp[]=null,temp1[]=null;
		
		
		String tp=null,tg=null,ts=null,sk=null;
						
										Statement st = null;
										ResultSet rs=null;
												
									try{
										
											st=con.createStatement();
											String sql="select * from profile where name='"+tname+"'";
											rs=st.executeQuery(sql);
											while(rs.next()){
												tp=rs.getString("prime");
												tg=rs.getString("generator");
												ts=rs.getString("privatekey");
												
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
											}	
									}
									catch (Exception eq) 
										{
											out.println(eq.getMessage());
										}
										
										
								
		String pkey = keygen.generate_Publickey(tp,mytg,ts);
		
		Thread.sleep(100);
		
		String emkey=elgamal.encrypt(sk, pkey, tp, mytg, masterkey);
		
		temp1=emkey.split(",");
		session.setAttribute("public_key",temp1[2]);
		
%>
<%
	System.out.println("Key-Aggregate Cryptosystem");
	System.out.println("***************");
	System.out.println("Key Generation");
	System.out.println("***************");
	System.out.println("\n");
		System.out.println("Public Key: "+temp1[2]);
		System.out.println("Master Key: "+temp1[2]);
	System.out.println("\n");
	System.out.println("***************");
	System.out.println("Encryption");
	System.out.println("***************");
	
	System.out.println("\n");
		System.out.println("Public Key: "+temp1[2]);
		//System.out.println("Index : "+index);
	System.out.println("\n");
		System.out.println("Ciphertext");
	System.out.println("\n");
		System.out.println("Disease: "+call_ciphertext.get_Ciphertext(disease));
		System.out.println("Stage: "+call_ciphertext.get_Ciphertext(stage));
		System.out.println("Drug: "+call_ciphertext.get_Ciphertext(drug));
		System.out.println("Location: "+call_ciphertext.get_Ciphertext(location));
		System.out.println("Message: "+call_ciphertext.get_Ciphertext(message));
	System.out.println("\n");
	System.out.println("***************");
%>
<%

		try{
			FileInputStream fs1 = null;
			

			PreparedStatement ps=con.prepareStatement("insert into "+table_name+" values(?,?,?,?,?,?,?,?,?,?,?,?)");
			    
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
		/*
			if(x!=0)
			{
				response.sendRedirect("public_master_key.jsp?message=success");
			}
			else
			{
				response.sendRedirect("public_master_key.jsp?message=fail");
			}
			*/	
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
%>

<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
		
	<title>Key-Aggregate Cryptosystem</title>
	<meta name="description" content="">
	
	<!-- Mobile viewport optimized: h5bp.com/viewport -->
	<meta name="viewport" content="width=device-width">
	
	
	<link rel="stylesheet" media="screen" href="css/superfish.css" /> 
	<link rel="stylesheet" href="css/nivo-slider.css" media="all"  /> 
	<link rel="stylesheet" href="css/tweet.css" media="all"  />
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" media="all" href="css/lessframework.css"/>
	
	
	<!-- All JavaScript at the bottom, except this Modernizr build.
	   Modernizr enables HTML5 elements & feature detects for optimal performance.
	   Create your own custom Modernizr build: www.modernizr.com/download/ -->
	<script src="js/modernizr-2.5.3.min.js"></script>
</head>
<body>
	
	<!-- WRAPPER -->
	<div class="wrapper cf">
		<header class="cf">
			
			<!-- social-bar -->
			
  
<div id="social-bar-holder"> <br>
  <h2 align="center">Key-Aggregate Cryptosystem for Scalable Data Sharing </h2>
  <br>
  <h2 align="center">in Cloud Storage</h2>
  <br>
</div>
						
			
  <!-- nav -->
  <nav class="cf"> 
  <ul id="nav" class="sf-menu">
    
  <li><a href="search.jsp"><span>Search</span></a></li>
	  
	
  <li><a href="share_message.jsp"><span>Share Message</span></a></li>
					
    
  <li><a href="select_share.jsp"><span>View</span></a></li>
					
    
  <li><a href="home.html"><span>Logout</span></a></li>
  </ul>
  <div id="combo-holder"></div>
  </nav> 
  <!-- ends nav -->
  </header> 
  <!-- MAIN -->
  <div role="main" id="main" class="cf">
			
			<!-- posts list -->
			
    
<div id="posts-list" class="cf"> 
  <!-- Comments wrap-->
  <!-- ENDS Comments wrap -->
  <!-- Respond -->
  <div id="respond"> 
    <h1 class="heading">Secret Message <small><a rel="nofollow" id="cancel-comment-reply-link" href="/themes/wp-simpler/archives/34#respond" style="display:none;">Cancel 
      reply</a></small></h1>
    <form method="post" name="contact" action="share_message.jsp"  id="commentform">
      <fieldset style="border: 2px solid #FFCC00">
      <legend><font color="#FFCC00"><strong><font size="4">Message</font></strong></font></legend>
      <p class="comment-form-email"> 
        <label for="email">Share To<span class="required">*</span></label>
        <input id="name" name="tname" type="text" value="<%=tname%>" size="30" aria-required="true">
      </p>
      <br>
      <p class="comment-form-author"> 
        <label for="author">Disease<span class="required">*</span></label>
        <input id="name" name="disease" type="text" value="<%=call_ciphertext.get_Ciphertext(disease)%>" size="30" aria-required="true">
      </p>
      <p class="comment-form-email"> 
        <label for="email">Stage<span class="required">*</span></label>
        <input id="password" name="stage" type="text" value="<%=call_ciphertext.get_Ciphertext(stage)%>" size="30" aria-required="true">
      </p>
      <p class="comment-form-email"> 
        <label for="email">Drug<span class="required">*</span></label>
        <input id="password" name="drug" type="text" value="<%=call_ciphertext.get_Ciphertext(drug)%>" size="30" aria-required="true">
      </p>
      <p class="comment-form-email"> 
        <label for="email">Location<span class="required">*</span></label>
        <input id="password" name="location" type="text" value="<%=call_ciphertext.get_Ciphertext(location)%>" size="30" aria-required="true">
      </p>
      <p class="comment-form-email"> 
        <label for="email">Message<span class="required">*</span></label>
        <textarea name="message" style="height:100px"><%=call_ciphertext.get_Ciphertext(message)%></textarea>
      </p>
      <p class="comment-form-email"> 
        <label for="email">Picture<span class="required">*</span></label>
        <img  src="Encrypt/<%=myimage%>"> </p>
      <br>
      <!-- allowed tags -->
      <!-- ENDS allowed tags -->
      <p class="form-submit" align="right"> 
        <input name="submit" type="submit" id="submit" value="Share">
      </p>
      </fieldset>
    </form>
  </div>
  <!-- ENDS Respond -->
</div>
			
    <!-- ENDS posts list -->
    <!-- sidebar -->
    <aside id="sidebar"> 
	<br><br><br>
    <ul>
      <li class="block"> 
        <div class="sidebar-top"></div>
		
        <div class="sidebar-content"> 
			<br>
          
		  <!--Key gen-->
		  <fieldset style="border: 2px solid #FFCC00">
          <legend><font color="#FFCC00"><strong><font size="4">Key's</font></strong></font></legend>
          <p class="comment-form-email"> 
            <label for="email">Public Key<span class="required">*</span></label>
            <input id="name" name="tname" type="text" value="<%=temp1[2]%>" size="30" aria-required="true">
          </p>
          <br>
          <p class="comment-form-email"> 
            <label for="email">Master Key<span class="required">*</span></label>
            <input id="password" name="sign" type="text" value="<%=masterkey%>" size="30" aria-required="true">
          </p>
          <br>
          
          </fieldset>
		  <!--End Key gen>
        </div>
        <div class="sidebar-bottom"></div>
      </li>
    </ul>
    </aside> 
    <!-- ENDS sidebar -->
  </div>
		<!-- ENDS MAIN -->
		
		<footer>
		
			<!-- twitter -->
			
  <div id="twitter-holder"> 
    <div class="ribbon-left"></div>
    <div class="ribbon"> 
      <div id="tweets-bar" class="tweet"></div>
    </div>
    <div class="ribbon-right"></div>
  </div>
			<!-- ENDS twitter -->
			
			
			<!-- widgets -->
			
			<!-- ENDS widgets -->
			
			<!-- bottom -->
			
  
			<!-- ENDS bottom -->
			
		</footer>
		
		
	</div>
	<!-- ENDS WRAPPER -->
	
	<!-- JavaScript at the bottom for fast page loading -->
	
	<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.7.1.min.js"><\/script>')</script>
	
	<!-- scripts concatenated and minified via build script -->
	<script src="js/custom.js"></script>
	
	<!-- superfish -->
	<script  src="js/superfish-1.4.8/js/hoverIntent.js"></script>
	<script  src="js/superfish-1.4.8/js/superfish.js"></script>
	<script  src="js/superfish-1.4.8/js/supersubs.js"></script>
	<!-- ENDS superfish -->
	
	<script src="js/tweet/jquery.tweet.js" ></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/jquery.nivo.slider.js" ></script>
	<script src="js/css3-mediaqueries.js"></script>
	<script src="js/tabs.js"></script>
	<script  src="js/poshytip-1.1/src/jquery.poshytip.min.js"></script>
	<script src="js/moveform.js"></script>
	<!-- end scripts -->

</body>
</html>