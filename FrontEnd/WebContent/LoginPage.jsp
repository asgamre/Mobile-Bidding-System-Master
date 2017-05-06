<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Button trigger modal -->

<html>
<head>
<link href="style.css" rel="stylesheet">
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
</head>
<body>

	<div class="container">

		<br>
		<center>
			<br>
			<button class="btn btn-primary btn-lg" href="#signup"
				data-toggle="modal" data-target=".bs-modal-sm">Sign
				In/Register</button>
		</center>
		<br>

	</div>


	<!-- Modal -->

	<div class="modal fade bs-modal-sm" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<br>
				<div class="bs-example bs-example-tabs">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#signin" data-toggle="tab">Sign
								In</a></li>
						<li class=""><a href="#signup" data-toggle="tab">Register</a></li>
					</ul>
				</div>
				<div class="modal-body">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active in" id="signin">
							<form class="form-horizontal" action="Signin" method="get">
								<fieldset>
									<!-- Sign In Form -->
									<!-- Text input-->
									<div class="control-group">
										<label class="control-label" for="userid">Username:</label>
										<div class="controls">
											<input required="" id="username" name="username" type="text"
												class="form-control" placeholder="Username"
												class="input-medium" required="">
										</div>
									</div>

									<!-- Password input-->
									<div class="control-group">
										<label class="control-label" for="passwordinput">Password:</label>
										<div class="controls">
											<input required="" id="password" name="password"
												class="form-control" type="password" placeholder="********"
												class="input-medium">
										</div>
									</div>

									<!-- Button -->
									<div class="control-group">
										<label class="control-label" for="signin"></label>
										<div class="controls">
											<button id="signin" name="signin" class="btn btn-success center-block">Sign
												In</button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						<div class="tab-pane fade" id="signup">
							<form class="form-horizontal" action="Signup" method="post">
								<fieldset>
									<!-- Sign Up Form -->
									<!-- Text input-->
									<div class="control-group">
										<label class="control-label" for="Name">Name:</label>
										<div class="controls">
											<input id="name" name="name" class="form-control" placeholder="Name" 
											type="text" class="input-large" required="">
										</div>
									</div>

									<!-- Text input-->
									<div class="control-group">
										<label class="control-label" for="Email">Email:</label>
										<div class="controls">
											<input id="email" name="email" class="form-control" placeholder="Email"
												type="text" class="input-large" required="">
										</div>
									</div>
									
									<!-- Text input-->
									<div class="control-group">
										<label class="control-label" for="Address">Address:</label>
										<div class="controls">
											<input id="address" name="address" class="form-control" placeholder="Address"
												type="text" class="input-large" required="">
										</div>
									</div>
									
									<!-- Text input-->
									<div class="control-group">
										<label class="control-label" for="City">City:</label>
										<div class="controls">
											<input id="city" name="city" class="form-control" placeholder="city"
												type="text" class="input-large" required="">
										</div>
									</div>
									
									<!-- Text input-->
									<div class="control-group">
										<label class="control-label" for="State">State:</label>
										<div class="controls">
											<input id="state" name="state" class="form-control" placeholder="state"
												type="text" class="input-large" required="">
										</div>
									</div>
									
									<!-- Text input-->
									<div class="control-group">
										<label class="control-label" for="Country">Country:</label>
										<div class="controls">
											<input id="country" name="country" class="form-control" placeholder="country"
												type="text" class="input-large" required="">
										</div>
									</div>
									
			

									<!-- Text input-->
									<div class="control-group">
										<label class="control-label" for="userid">Username:</label>
										<div class="controls">
											<input id="username" name="username" placeholder="Username" class="form-control"
												type="text" class="input-large" required="">
										</div>
									</div>

									<!-- Password input-->
									<div class="control-group">
										<label class="control-label" for="password">Password:</label>
										<div class="controls">
											<input id="password" name="password" class="form-control" placeholder="Password"
												type="password" class="input-large" required=""> <em>1-8 Characters</em>
										</div>
									</div>

									<!-- Multiple Radios (inline) -->
									<br>
									<div class="control-group">
										<label class="control-label" for="gender">Gender:</label>
										<div class="controls" style="margin-left:20px;">
											<label class="radio inline" for="gender-0"> <input
												type="radio" name="gender" id="gender-0" value="M"
												checked="checked">Male
											</label> <label class="radio inline" for="gender-1"> <input
												type="radio" name="gender" id="gender-1" value="F">Female
											</label>
										</div>
									</div>

									<!-- Button -->
									<div class="control-group">
										<label class="control-label" for="confirmsignup"></label>
										<div class="controls">
											<button id="confirmsignup" name="confirmsignup"
												class="btn btn-success center-block">Sign Up</button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<center>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</center>
				</div>
			</div>
		</div>
	</div>
</body>
</html>