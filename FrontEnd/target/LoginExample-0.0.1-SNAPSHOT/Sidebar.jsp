<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="col-md-3">
				<div class="profile">
				<div  class="profile-sidebar">
					<div class="profile-usertitle">
						<div style="font-size: 20px;" class="profile-usertitle-name">
							<%=session.getAttribute("name")%>
						</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
					<form method="get" action="ShoppingCart.jsp">
					<div class="profile-userbuttons">
					<button type="button" class="btn btn-success btn-sm" data-toggle="modal"
						data-target="#myModalHorizontal">Add Post</button>
					
					<button type="submit" class="btn btn-success btn-sm">Cart</button>
					</div>
					</form>
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="Home.jsp"> <i
									class="glyphicon glyphicon-home"></i> Overview
							</a></li>
							<li><a href="GetProfile.jsp"> <i
									class="glyphicon glyphicon-user"></i> My Profile
							</a></li>
							<li><a href="GetMyPosts.jsp"> <i
									class="glyphicon glyphicon-flag"></i> My Posts
							</a></li>
						</ul>
					</div>
					<!-- END MENU -->
					
					<div class="modal fade" id="myModalHorizontal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- Modal Header -->
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
									</button>
									<h4 class="modal-title" id="myModalLabel"
										style="font-weight: bold; text-align: center">ADD POST</h4>
								</div>

								<!-- Modal Body -->
								<div class="modal-body">
									<form class="form-horizontal" role="form" id="addPostForm" action="AddPost.jsp" method="post">
										<div class="form-group">
											<label class="col-md-3 control-label" for="title">Book
												Title:</label>
											<div class="col-md-8">
												<input id="title" placeholder="Book Title"
													class="form-control" type="text" name="title" required>
											</div>
										</div>
										<input type="hidden" name="userid" id="userid"
											value=<%=session.getAttribute("userid")%>></input>
										<div class="form-group">
											<label class="col-md-3 control-label" for="aname">Author
												Name:</label>
											<div class="col-md-8">
												<input id="authorName" placeholder="Author Name"
													class="form-control" type="text" name="authorName">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label" for="pname">Publisher
												Name</label>
											<div class="col-md-8">
												<input type="text" placeholder="Publisher Name"
													class="form-control" id="publisherName"
													name="publisherName">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label" for="price">Expected
												Price:</label>
											<div class="col-md-8">
												<input id="price" placeholder="Expected Price"
													class="form-control" type="text" name="price" required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-md-6 control-label"></label>
											<div class="col-md-8">
												<input type="submit" class="btn btn-primary center-block" value="Submit"
													id="addPostButton"></input>
											</div>
										</div>
									</form>
								</div>

								<!-- Modal Footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
					<!-- <div id="logoutbutton">
						<form method="get" action="Logout">
							<input class="btn btn-primary" type="submit" name="logout" value="Logout">
						</form>
					</div> -->
				</div>
			</div>