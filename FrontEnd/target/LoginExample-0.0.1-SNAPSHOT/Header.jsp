<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-fixed-top navbar-custom"
			style="height: 80px;" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header col-md-3">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> Menu <i
							class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="Home.jsp">BookBids</a>
				</div>
				<!-- <div class="search_box"> -->
				<div class="col-md-5 col-offset-6 centered">
					<form method="get" action="SearchPost.jsp">
						<div class="col-lg-8">
							<input type="text" class="form-control" name="search"
								placeholder="Search" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Search';}" />
						</div>
						<button type="submit" class="btn btn-primary">Search</button>
					</form>
				</div>
				<div class="col-md-1 navbar-right">
					<form method="get" action="Logout" id="logoutform">
						<input type="hidden" name="latitude" id="latitude" value=""/>
						<input type="hidden" name="longitude" id="longitude" value=""/>
						<input class="btn btn-primary" type="submit" name="logout" value="Logout">
					</form>
				</div>
			</div>
		</nav>
    