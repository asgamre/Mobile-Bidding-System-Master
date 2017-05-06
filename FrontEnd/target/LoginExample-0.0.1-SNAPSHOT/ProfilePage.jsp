<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

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
<link href="footer.css" rel="stylesheet" type="text/css" media="all" />
<link href="header.css" rel="stylesheet" type="text/css" media="all" />
<link href="profile.css" rel="stylesheet" type="text/css" media="all" />
<link href="cart.css" rel="stylesheet" type="text/css" media="all" />
<link href="modal.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="modal.js"></script>

</head>
<body style="margin-bottom:30px;">
			<!-- Navigation -->
	<!-- Nav -->
	<%@ include file="Header.jsp" %>
	
			<section>
	<div class="container" style="margin-top:80px;">
		<div class="row">
			<!-- Sidebar -->
			<%@ include file="Sidebar.jsp" %>
			

			<div class="col-md-9">
				<div class="editprofile" style="">
				<div class="center-block" style="margin: 0 auto;">
				<h1>Edit Profile</h1>
				<div class="row">
				<!-- edit form column -->
				<div class="col-md-12 personal-info">
					<h3>Personal info</h3>
				 <form class="form-horizontal" role="form" action="UpdateProfile.jsp"
					method="post"> 
				<!-- <form class="form-horizontal col-md-10" role="form" id="updateProfileForm"> -->	
					<div class="form-group">
						<label class="col-lg-3 control-label">Name:</label>
						<div class="col-lg-8">
							<input id="name" name="name" class="form-control" type="text"
								value="<%=session.getAttribute("name")%>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Email:</label>
						<div class="col-lg-8">
							<input id="email" name="email" class="form-control" type="text"
								value="<%=request.getAttribute("email")%>">
						</div>
					</div>

					<input id="userid" name="userid" type="hidden" value=<%=session.getAttribute("userid")%>>
					<div class="form-group">
						<label class="col-md-3 control-label">Username:</label>
						<div class="col-md-8">
							<input id="username" name="username" class="form-control"
								type="text" value="<%=request.getAttribute("username")%>">
						</div>
					</div>

					<!-- Multiple Radios (inline) -->
					<br>
					<div class="form-group">
						<label class="col-md-3 control-label">Gender:</label>
						<div class="form-check col-md-8">
						<c:choose>
								<c:when test="${gendertype==1}"> 
							<label class="form-check-inline" for="gender-M"> <input class="form-check-input"
								type="radio" id="gender-M" name="gender" value="M" checked/>Male </label> 
							<label class="form-check-inline" for="gender-F"> <input
								class="form-check-input" type="radio" id="gender-F" name="gender" value="F">Female </label>
								</c:when>
								<c:otherwise>
															<label class="form-check-inline" for="gender-M"> <input class="form-check-input"
								type="radio" id="gender-M" name="gender" value="M"/>Male </label> 
							<label class="form-check-inline" for="gender-F"> <input
								class="form-check-input" type="radio" id="gender-F" name="gender" checked value="F">Female </label>
								</c:otherwise>
						</c:choose>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label" for="lastlogindate">Last Login Date:</label>
						<div class="col-md-8">
							<input id="lastlogindate" name="lastlogindate" class="form-control"
								type="date" class="input-large" readonly value="<%=request.getAttribute("lastLoginDate")%>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="lastlogintime">Last Login Time:</label>
						<div class="col-md-8">
							<input id="lastlogintime" name="lastlogintime" class="form-control"
								class="input-large" readonly value="<%=request.getAttribute("lastLoginTime")%>">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label" for="location">Location:</label>
						<div class="col-md-8">
							<input id="location" name="location" class="form-control"
								class="input-large" readonly value="<%=request.getAttribute("location")%>">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							<input type="submit" id="updateProfileButton" class="btn btn-primary" value="Save Changes">

							<input type="reset" class="btn btn-default"	value="Cancel" style="margin-left: 20px">
						</div>
					</div>
				</form>
			</div>
		</div>
		</div>
		</div>
	</div>
	<hr>
			
		</div>
					
	</div>
	</section>
		<!-- footer -->
			<!--  Footer -->
	<%@ include file="Footer.jsp" %>
		

</body>
</html>