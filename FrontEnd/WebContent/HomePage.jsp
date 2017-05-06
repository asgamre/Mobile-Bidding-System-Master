<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>HomePage</title>
<style>
 body {
   background-image: url(background.jpg);
   background-size:cover;
 }
</style>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

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
	function getPosition() {
		//alert("Over here");
	}
</script>

<script type="text/javascript" src="modal.js"></script>

</head>

<body style="margin-bottom:30px;">

	<!-- Nav -->
	<%@ include file="Header.jsp" %>

	<section>
	<div class="container" style="margin-top:80px;">
		<div class="row">
			<!-- Sidebar -->
			<%@ include file="Sidebar.jsp" %>

			<div class="col-md-8">
			<table style="margin-top: 10px;" id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <tr>
                   <th>Mobile Name</th>
                   <th>Company Name</th>
                     <th>Price</th>
         			<th>Post Date</th>
                      </tr>
                       
                   </thead>
    							<tbody>
								<c:forEach items="${output}" var="product">
									<tr>
										<td><a href="GetPost.jsp?postid=${product.postID}">${product.mobileName}</a></td>
										<td><c:out value="${product.companyName}" /></td>
										<td><c:out value="${product.price}" /></td>
										<td><c:out value="${product.postDate}" /></td>
									</tr>
								</c:forEach>
							</tbody>
        
</table>
			
			</div>
		</div>
	</div>
	</section>

	<!--  Footer -->
	<%@ include file="Footer.jsp" %>

	<script type="text/javascript">
	var lat = document.getElementById("latitude");
	var log = document.getElementById("longitude");
	$(document).ready(function(){
		getLocation();
	});	
	function getLocation() {

    	if (navigator.geolocation) {
        	navigator.geolocation.getCurrentPosition(showPosition);
    	} else {
        //x.innerHTML = "Geolocation is not supported by this browser.";
    	}
	}
    function showPosition(position) {
    	//alert(position.coords.latitude);
        lat.value = position.coords.latitude;
        log.value = position.coords.longitude;
    }	

</script>
</body>

</html>
