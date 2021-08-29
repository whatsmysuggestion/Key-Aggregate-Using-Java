<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%
		String myname=(String)session.getAttribute("myname");
		String myemail=(String)session.getAttribute("myemail");
		String mylocation=(String)session.getAttribute("mylocation");
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
        <form method="post" name="contact" action="insert_message.jsp"  id="commentform" enctype="multipart/form-data">
          <p class="comment-form-email"> 
            <label for="email">Share To<span class="required">*</span></label>
            <br>
            <select name="tname" style="width:575px; height:35px">
              <option value="" >Select Name</option>
              <%		
						
										Statement st4 = null;
										ResultSet rs4=null;
												
									try{
										
											Connection con4=databasecon.getconnection();
											st4=con4.createStatement();
											String sql4="select * from profile where location='"+mylocation+"'";
											rs4=st4.executeQuery(sql4);
											while(rs4.next()){%>
              <option value="<%=rs4.getString("name")%>"><%=rs4.getString("name")%></option>
              <%}	
									}
									catch (Exception eq4) 
										{
											out.println(eq4.getMessage());
										}
								 %>
            </select>
          </p>
          <br>
          <p class="comment-form-author"> 
            <label for="author">Disease<span class="required">*</span></label>
            <input id="name" name="disease" type="text" value="" size="30" aria-required="true">
          </p>
          <p class="comment-form-email"> 
            <label for="email">Stage<span class="required">*</span></label>
            <input id="password" name="stage" type="text" value="" size="30" aria-required="true">
          </p>
          <p class="comment-form-email"> 
            <label for="email">Drug<span class="required">*</span></label>
            <input id="password" name="drug" type="text" value="" size="30" aria-required="true">
          </p>
          <p class="comment-form-email"> 
            <label for="email">Location<span class="required">*</span></label>
            <input id="password" name="location" type="text" value="" size="30" aria-required="true">
          </p>
          <p class="comment-form-email"> 
            <label for="email">Message<span class="required">*</span></label>
            <textarea name="message" style="height:100px"></textarea>
          </p>
          <p class="comment-form-email"> 
            <label for="email">Picture<span class="required">*</span>(250 X 250)</label>
            <input id="password" name="image" type="file" value="" size="30" aria-required="true">
          </p>
          <br>
          <!-- allowed tags -->
          <!-- ENDS allowed tags -->
          <p class="form-submit" align="right"> 
            <input name="submit" type="submit" id="submit" value="Send Message">
          </p>
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
          
		  <img src="img/kids-sharing-secret.jpg" width="225px" height="250px">
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