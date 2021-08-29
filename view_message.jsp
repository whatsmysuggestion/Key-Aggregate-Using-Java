<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="Key_Aggregate.*"%>
<%@page import="ciphertext.*"%>

<%
		ServletContext context = getServletContext();

		String dirName1 =context.getRealPath("\\Encrypt\\");

		String dirName2 =context.getRealPath("\\Gallery\\");
		
		String dirName3 =context.getRealPath("\\Decrypt\\");
		
		Reconstruction rsimage=new Reconstruction();

		String myname = (String)session.getAttribute("myname");
		
		String mylocation = (String)session.getAttribute("mylocation");
		
		String loginlocation = (String)session.getAttribute("loginlocation");
		
		String publickey=request.getParameter("publickey");
		
		String mytg=null,image_name=null,table_name=null;
		//Dummy
			int y=(int)(Math.random()*10000);
		
			String mkey=Integer.toString(y);
		//End Dummy
		
		if(loginlocation.equals("Bangalore")){
			table_name="bangalore";
			mytg="1";
		}
		if(loginlocation.equals("Chennai")){
			table_name="chennai";
			mytg="2";
		}
		if(loginlocation.equals("Delhi")){
			table_name="delhi";
			mytg="3";
		}
		if(loginlocation.equals("Mumbai")){
			table_name="mumbai";
			mytg="4";
		}
		
		KeyGeneration keygen=new KeyGeneration();
		
		Elgamal_Encryption elgamal=new Elgamal_Encryption(); 
		
		Elgamal_Decryption mydecrypt=new Elgamal_Decryption();
		
		Ciphertext call_ciphertext=new Ciphertext();

		String name=null,tname=null,disease=null,stage=null,drug=null,location=null,message=null,mymasterkey=null,EC_imagename=null;
		
		String id=(String)session.getAttribute("vid");
		String temp[]=null,temp1[]=null;
		temp=id.split(",");
		int nid=Integer.parseInt(temp[0]);
		String tp=null,tg=null,ts=null,sk=null;
		
				
						
										Statement st = null;
										ResultSet rs=null;
												
									try{
										
											Connection con=databasecon.getconnection();
											st=con.createStatement();
											String sql="select * from profile where name='"+myname+"'";
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
											String sql1="select * from profile where name='"+temp[2]+"'";
											rs1=st1.executeQuery(sql1);
											while(rs1.next()){
												sk=rs1.getString("privatekey");
												
											}	
									}
									catch (Exception eq1) 
										{
											out.println(eq1.getMessage());
										}
								
		String pkey = keygen.generate_Publickey(tp,mytg,ts);
		
		Thread.sleep(100);
		
		String emkey=elgamal.encrypt(sk, pkey, tp, mytg, mkey);
		
		temp1=emkey.split(",");
		
		String masterkey=mydecrypt.decrypt(temp1[0], publickey, tp);
		
%>
<%		
						//System.out.println("test"+temp[0]);
										Statement st4 = null;
										ResultSet rs4=null;
												
									try{
										
											Connection con4=databasecon.getconnection();
											st4=con4.createStatement();
											String sql4="select * from "+table_name+" where id='"+nid+"'";
											rs4=st4.executeQuery(sql4);
											while(rs4.next()){
												name=rs4.getString("name");												
												disease=rs4.getString("disease");
												stage=rs4.getString("stage");
												drug=rs4.getString("drug");
												location=rs4.getString("location");
												message=rs4.getString("message");
												mymasterkey=call_ciphertext.get_Plaintext(rs4.getString("master_key"));
												image_name=rs4.getString("image_name");
												
												EC_imagename="Encrypted_"+image_name;
												
											}	
									}
									catch (Exception eq4) 
										{
											out.println(eq4.getMessage());
										}
										
										System.out.println("***Challenge***");
										System.out.println("Name: "+name);
										System.out.println("Disease: "+disease);
										System.out.println("Stage: "+stage);
										System.out.println("Drug: "+drug);
										System.out.println("Location: "+location);
										System.out.println("Message: "+message);
										System.out.println("******");
										
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
        <h1 class="heading">View Shared Data <small><a rel="nofollow" id="cancel-comment-reply-link" href="/themes/wp-simpler/archives/34#respond" style="display:none;">Cancel 
          reply</a></small></h1>
        <%if(mymasterkey.equals(masterkey)){
		  								System.out.println("***Response***");
										System.out.println("Name: "+name);
										System.out.println("Disease: "+call_ciphertext.get_Plaintext(disease));
										System.out.println("Stage: "+call_ciphertext.get_Plaintext(stage));
										System.out.println("Drug: "+call_ciphertext.get_Plaintext(drug));
										System.out.println("Location: "+call_ciphertext.get_Plaintext(location));
										System.out.println("Signature: "+mymasterkey);
										System.out.println("******");
										
										String myimage="Encrypted_"+image_name;
												String DC_image="Decrypted"+image_name;
												
												String p11=dirName1+"\\"+myimage;
												String p22=dirName2+"\\"+image_name;
												String p33=dirName3+"\\"+DC_image;
												rsimage.Image_Reconstruction(p11,p22,p33);
		  	%>
        <form method="post" name="contact" action="insert_sign.jsp"  id="commentform">
          <fieldset style="border: 2px solid #FFCC00">
          <legend><font color="#FFCC00"><strong><font size="4">Secret Shared</font></strong></font></legend>
          <p class="comment-form-email"> 
            <label for="email">Share From<span class="required">*</span></label>
            <input id="name" name="tname" type="text" value="<%=name%>" size="30" aria-required="true">
          </p>
          <br>
          <p class="comment-form-author"> 
            <label for="author">Disease<span class="required">*</span></label>
            <input id="name" name="disease" type="text" value="<%=call_ciphertext.get_Plaintext(disease)%>" size="30" aria-required="true">
          </p>
          <p class="comment-form-email"> 
            <label for="email">Stage<span class="required">*</span></label>
            <input id="password" name="stage" type="text" value="<%=call_ciphertext.get_Plaintext(stage)%>" size="30" aria-required="true">
          </p>
          <p class="comment-form-email"> 
            <label for="email">Drug<span class="required">*</span></label>
            <input id="password" name="drug" type="text" value="<%=call_ciphertext.get_Plaintext(drug)%>" size="30" aria-required="true">
          </p>
          <p class="comment-form-email"> 
            <label for="email">Location<span class="required">*</span></label>
            <input id="password" name="location" type="text" value="<%=call_ciphertext.get_Plaintext(location)%>" size="30" aria-required="true">
          </p>
		  <p class="comment-form-email"> 
        <label for="email">Message<span class="required">*</span></label>
        <textarea name="message" style="height:100px"><%=call_ciphertext.get_Plaintext(message)%></textarea>
      		</p>
			<p class="comment-form-email"> 
            <label for="email">Picture:<span class="required">*</span></label>
            <img src="Decrypt/<%=DC_image%>">
          </p>
          </fieldset>
        </form>
        <%
		  }
		  else{
		  								System.out.println("***Response***");
										System.out.println("Name: "+name);
										System.out.println("Disease: "+disease);
										System.out.println("Stage: "+stage);
										System.out.println("Drug: "+drug);
										System.out.println("Location: "+location);
										System.out.println("Message: "+message);
										System.out.println("Signature: "+masterkey);
										System.out.println("******");
		  	%>
        <form method="post" name="contact" action="#"  id="commentform">
          <fieldset style="border: 2px solid #FFCC00">
          <legend><font color="#FFCC00"><strong><font size="4">Signature</font></strong></font></legend>
          <p class="comment-form-email"> 
            <label for="email">Share From<span class="required">*</span></label>
            <input id="name" name="tname" type="text" value="<%=name%>" size="30" aria-required="true">
          </p>
          <br>
          <p class="comment-form-author"> 
            <label for="author">Disease<span class="required">*</span></label>
            <input id="name" name="disease" type="text" value="<%=disease%>" size="30" aria-required="true">
          </p>
          <p class="comment-form-email"> 
            <label for="email">Stage<span class="required">*</span></label>
            <input id="password" name="stage" type="text" value="<%=stage%>" size="30" aria-required="true">
          </p>
          <p class="comment-form-email"> 
            <label for="email">Drug<span class="required">*</span></label>
            <input id="password" name="drug" type="text" value="<%=drug%>" size="30" aria-required="true">
          </p>
          <p class="comment-form-email"> 
            <label for="email">Location<span class="required">*</span></label>
            <input id="password" name="location" type="text" value="<%=location%>" size="30" aria-required="true">
          </p>
		  <p class="comment-form-email"> 
        <label for="email">Message<span class="required">*</span></label>
        <textarea name="message" style="height:100px"><%=message%></textarea>
      </p>
	  <p class="comment-form-email"> 
            <label for="email">Picture:<span class="required">*</span></label>
            <img  src="Encrypt/<%=EC_imagename%>">
          </p>
          </fieldset>
        </form>
        <%
		  }
		  %>
      </div>
      <!-- ENDS Respond -->
    </div>
			
    <!-- ENDS posts list -->
    <!-- sidebar -->
    <aside id="sidebar"> <br>
    <br>
    <br>
    <ul>
      <li class="block"> 
        <div class="sidebar-top"></div>
        <div class="sidebar-content"> <br>
          
          <img src="img/Response.jpg" width="225px" height="250px"> </div>
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
	
	<!-- end scripts -->

</body>
</html>