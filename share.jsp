<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
		
	<title>EXTENDED VISUAL CRYPTOGRAPHY</title>
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
			
  <div id="social-bar-holder"> 
    <ul id="social-bar" class="cf">
      <li class="dribbble"><a href="#"  title="Dribbble" ></a></li>
      <li class="facebook"><a href="#"  title="Facebook" ></a></li>
      <li class="forrst"><a href="#"  title="forrst" ></a></li>
      <li class="googleplus"><a href="#"  title="googleplus" ></a></li>
      <li class="twitter"><a href="#"  title="twitter" ></a></li>
    </ul>
  </div>
			<div class="cf"></div>
			<!-- ENDS social-bar -->
			
			<div id="logo" class="cf">
				<h3 align="center">AN EXTENDED VISUAL CRYPTOGRAPHY SCHEME </h3><br>
				<h3 align="center">WITHOUT PIXEL EXPANSION FOR HALFTONE IMAGES</h3>
			</div>
			
			<!-- nav -->
			<nav class="cf">
				<ul id="nav" class="sf-menu">
					
    <li><a href="search.jsp"><span>View</span></a></li>
					
    <li class="current-menu-item"><a href="share.jsp"><span>Share</span></a></li>
					
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
        <h4 class="heading">Share Image <small><a rel="nofollow" id="cancel-comment-reply-link" href="/themes/wp-simpler/archives/34#respond" style="display:none;">Cancel 
          reply</a></small></h4>
        <form method="post" name="contact" action="uploadimage.jsp" enctype="multipart/form-data"  id="commentform">
          <p class="comment-form-author">
            <label for="author">To<span class="required">*</span></label>
            <input id="name" name="toname" type="text" value="" size="30" aria-required="true">
          </p>
          <p class="comment-form-email">
            <label for="email">Title<span class="required">*</span></label>
            <input id="password" name="title" type="text" value="" size="30" aria-required="true">
          </p>
          <p class="comment-form-email">
            <label for="email">Message<span class="required">*</span></label>
            <textarea name="message" style="height:100px"></textarea>
          </p>
          <p class="comment-form-email">
            <label for="email">Grayscale Image(Dimensions: 250 X 250)<span class="required">*</span></label>
            <input id="files" name="image" type="file" value="" size="30" aria-required="true">
          </p>
          <script>
					  function handleFileSelect(evt) {
						var file = evt.target.files; // FileList object
					
						// Loop through the FileList and render image files as thumbnails.
						for (var i = 0, f; f = file[i]; i++) {
					
						  // Only process image files.
						  if (!f.type.match('image.*')) {
							continue;
						  }
					
						  var reader = new FileReader();
					
						  // Closure to capture the file information.
						  reader.onload = (function(theFile) {
							return function(e) {
							  // Render thumbnail.
							  var span = document.createElement('span');
							  span.innerHTML = ['<img class="thumb" src="', e.target.result,
												'" title="', theFile.name, '"/>'].join('');
							  document.getElementById('list').insertBefore(span, null);
							};
						  })(f);
					
						  // Read in the image file as a data URL.
						  reader.readAsDataURL(f);
						}
					  }
					
					  document.getElementById('files').addEventListener('change', handleFileSelect, false);
					</script>
          <br>
          <!-- allowed tags -->
          <!-- ENDS allowed tags -->
          <p class="form-submit"> 
            <input name="submit" type="submit" id="submit" value="Share">
          </p>
        </form>
      </div>
      <!-- ENDS Respond -->
    </div>
			<!-- ENDS posts list -->			
			
			<!-- sidebar -->
        	<aside id="sidebar">
        		
        		<ul>
	        		
	        		<li class="block">
	        			<div class="sidebar-top"></div>
		        		<div class="sidebar-content">
			        		<h2 class="heading">Grayscale Image</h2>
			        		
							<div class="ads cf">
								
								<output id="list"></output>
								
							</div>
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
			
  <div id="bottom"> 
    <div id="widget-trigger-holder"><a id="widget-trigger" href="#" title="View More" class="poshytip"></a></div>
  </div>
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