<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="ciphertext.*"%>
<%@page import="Key_Aggregate.*"%>
<%String id=request.getParameter("vid");
session.setAttribute("vid",id);
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
    
      <fieldset style="border: 2px solid #FFCC00">
      <legend><font color="#FFCC00"><strong><font size="4">Message</font></strong></font></legend>
      <form name="f" action="view_message.jsp" method="post">
                <p align="center"> 
                  <input type="text"  name="publickey" style="height: 2em; width: 12em; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1" placeholder="Enter Public key"  onkeypress="checkEnter(event)">
                </p>
              </form>
      </fieldset>
    
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