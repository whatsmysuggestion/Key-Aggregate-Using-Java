<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*"%>
<%
String myname=(String)session.getAttribute("myname");
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
			
			<!-- categories -->
			<ul class="nav-categories cf">
				<li class="current"><a href="#"><h1>Search here</h1></a></li>
				
			</ul>
			<!-- ENDS categories -->
			<form name="f" action="search_share.jsp" method="post">
                <p align="center"> 
                  <input type="text"  name="sname" style="height: 2em; width: 12em; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1" placeholder="Search here"  onkeypress="checkEnter(event)">
                </p>
              </form>
			<!-- featured -->
			
			
       
			<!-- ENDS featured -->
						
		</div>
		<!-- ENDS MAIN -->
		
		<footer>
		
			<!-- twitter -->
			
  <div id="twitter-holder"> 
    <div class="ribbon"> </div>
  </div>
			
			
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
	<!-- end scripts -->

</body>
</html>