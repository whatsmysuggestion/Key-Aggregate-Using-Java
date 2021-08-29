<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*"%>

<%						
	String table_name=null; 
						
	String myname = (String)session.getAttribute("myname");
	
	String mylocation = (String)session.getAttribute("mylocation");
	
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
				<li class="current"><a href="#" ><h1>View Shared Message</h1></a></li>
				
			</ul>
			<!-- ENDS categories -->
			
			<!-- featured -->
			
			<%

				Statement st = null;
				ResultSet rs = null;
								
				try{
						
					Connection con=databasecon.getconnection();
					st = con.createStatement();
					String qry ="select * from "+table_name+" where tname='"+myname+"'"; 
					rs = st.executeQuery(qry);
					
					%>
						<table style="border:double; background-color:#FFCC33; font-size:20px;">
						  <tr bgcolor="#00FFFF"> 
							
							<th width="150px">Shared From</th>
							<th width="250px">Disease</th>
							<th width="150px">Stage</th>
							<th width="150px">Drug</th>
							<th width="150px">Location</th>
							<th width="150px">Message</th>
							<th width="150px">Cipher Key</th>
							<th width="150px">View</th>
						  </tr>
						  <tr><td colspan="4"><br></td></tr>
						  <%while(rs.next()){%>
						  <tr> 
							
							<td align="center"> 
							  <%=rs.getString("name")%>
							</td>
							<td align="center"> 
							  <%=rs.getString("disease")%>
							</td>
							<td align="center"> 
							  <%=rs.getString("stage")%>
							</td>
							<td align="center"> 
							  <%=rs.getString("drug")%>
							</td>
							<td align="center"> 
							  <%=rs.getString("location")%>
							</td>
							
							<td align="center"> 
							  <%=rs.getString("message")%>
							</td>
							<td align="center"> 
							  <%=rs.getString("public_key")%>
							</td>
							<td align="center">
								<a href="enter_master_key.jsp?vid=<%=rs.getInt("id")%>,<%=rs.getString("tname")%>,<%=rs.getString("name")%>">View</a>
							</td>
						  </tr>
						  
						  <%}%>
						</table>
						
					<%		
					
				}
				catch(Exception ex){
					out.println(ex);
				}
			%>
       
			<!-- ENDS featured -->
						
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
		<br><br><br><br><br>	
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
	<!-- end scripts -->

</body>
</html>