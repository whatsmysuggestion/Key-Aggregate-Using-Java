<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="sign.*"%>

<%
		KeyGeneration keygen=new KeyGeneration();
		
		Elgamal_Encryption elgamal=new Elgamal_Encryption();

		String name=null,tname=null,disease=null,stage=null,drug=null,location=null;
		
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
											String sql="select * from profile where name='"+temp[1]+"'";
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
								
		String pkey = keygen.generate_Publickey(tp,tg,ts);
		
		Thread.sleep(100);
		
		String emkey=elgamal.encrypt(sk, pkey, tp, tg);
		
		temp1=emkey.split(",");
		
%>
<%		
						System.out.println("test"+temp[0]);
										Statement st4 = null;
										ResultSet rs4=null;
												
									try{
										
											Connection con4=databasecon.getconnection();
											st4=con4.createStatement();
											String sql4="select * from privacy where id='"+temp[0]+"'";
											rs4=st4.executeQuery(sql4);
											while(rs4.next()){
												name=rs4.getString("name");
												
												tname=rs4.getString("tname");
												disease=rs4.getString("disease");
												stage=rs4.getString("stage");
												drug=rs4.getString("drug");
												location=rs4.getString("location");
											}	
									}
									catch (Exception eq4) 
										{
											out.println(eq4.getMessage());
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
		
	<title>Security-Mediator</title>
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
    <h2 align="center">Storing Shared Data on the Cloud via Security-Mediator</h2>
    <br>
  </div>
						
			
  <!-- nav -->
  <nav class="cf"> 
  <ul id="nav" class="sf-menu">
    <li class="current-menu-item"><a href="security_mediator.jsp"><span>Signature</span></a></li>
    
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
        <h1 class="heading">Signature <small><a rel="nofollow" id="cancel-comment-reply-link" href="/themes/wp-simpler/archives/34#respond" style="display:none;">Cancel 
          reply</a></small></h1>
        <form method="post" name="contact" action="insert_sign.jsp"  id="commentform">
          <fieldset style="border: 2px solid #FFCC00">
          <legend><font color="#FFCC00"><strong><font size="4">Signature</font></strong></font></legend>
          <p class="comment-form-email"> 
            <label for="email">Share To<span class="required">*</span></label>
            <input id="name" name="tname" type="text" value="<%=tname%>" size="30" aria-required="true">
          </p>
          <br>
          <p class="comment-form-email"> 
            <label for="email">Signature<span class="required">*</span></label>
            <input id="password" name="sign" type="text" value="<%=temp1[1]%>" size="30" aria-required="true">
          </p>
          <br>
          <!-- allowed tags -->
          <!-- ENDS allowed tags -->
          <p class="form-submit" align="right"> 
            <input name="submit" type="submit" id="submit" value="Signature">
          </p>
          </fieldset>
        </form>
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
          
          <img src="img/images.jpg" width="225px" height="250px"> </div>
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