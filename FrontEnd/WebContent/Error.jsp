<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link href="footer.css" rel="stylesheet" type="text/css" media="all" />
<link href="header.css" rel="stylesheet" type="text/css" media="all" />
<link href="profile.css" rel="stylesheet" type="text/css" media="all" />
<link href="cart.css" rel="stylesheet" type="text/css" media="all" />
<link href="modal.css" rel="stylesheet" type="text/css" media="all" />
<title>Error Page</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- font files -->
<link href='//fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,900,700italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!-- /font files -->
<!-- css -->
<link href="error.css" rel="stylesheet" type="text/css" media="all" />
<!-- /css -->
<!-- js files -->
<script src="js/modernizr.custom.js"></script>

<!-- Custom CSS -->
<!-- <link href="homestyle.css" rel="stylesheet"> -->

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link href="footer.css" rel="stylesheet" type="text/css" media="all" />
<link href="header.css" rel="stylesheet" type="text/css" media="all" />
<link href="profile.css" rel="stylesheet" type="text/css" media="all" />
<link href="cart.css" rel="stylesheet" type="text/css" media="all" />
<link href="modal.css" rel="stylesheet" type="text/css" media="all" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<script>
	function myFunction() {
		var myWindow = window.open("myposts.html", "_self");
	}
</script>

<script type="text/javascript" src="modal.js"></script>
</head>

<body style="margin-bottom:30px;">
		<!-- Nav -->
	<%@ include file="Header.jsp" %>
	
	<!-- <div id="wrapper"> -->

	
	<section>
	<div class="row">
	<div class="container-w3layouts agileinfo w3-agileits agileits-w3layouts w3-agile" style="height:350px;">
	<svg version="1.1" viewbox="0 0 800 300">
		<!-- add title for accessibility -->
		<title>Adding Background to Text using SVG clipPath</title> 
		<defs>  
			<clippath id="my-path">
				<text x="30" y="300">404</text>
			</clippath>
		</defs>
		<image xlink:href="content.jpg" clip-path="url(#my-path)" width="100%" height="100%" id="filler" preserveAspectRatio="none" />
	</svg>
</div>      
<p class="error-agileits wthree">Sorry! This Page Doesn't Exist.</p>
<form classs="col-offset-6" method="get" action="Home.jsp">
<input type="submit" class="btn btn-primary center-block btn-lg" value="Home"/>
</form>
			</div>
	</section>


	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<!--  Footer -->
	<%@ include file="Footer.jsp" %>


</body>

</html>
    