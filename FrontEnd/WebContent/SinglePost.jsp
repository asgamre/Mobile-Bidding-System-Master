<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="http://mottie.github.io/tablesorter/css/theme.default.css"
	rel="stylesheet">
<!-- <script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Single Post</title>
</head>
<body>

	<!-- Nav -->
	<%@ include file="Header.jsp"%>

	<section>
		<div class="container" style="margin-top: 80px;">
			<div class="row">
				<!-- Sidebar -->
				<%@ include file="Sidebar.jsp"%>

				<div class="col-md-9 table-responsive">
					<h2 style="font-weight: bold"><%=request.getAttribute("mobile")%></h2>
					<p style="font-size: 16px">
						<span"><span>By:</span><span
							style="color: #3B5998; font-weight: bold"> <%=request.getAttribute("companyName")%></span></span>
						
						<span style="margin-left: 10px;"><i
							class="glyphicon glyphicon-usd"></i> <span
							style="color: #3B5998; font-weight: bold"><%=request.getAttribute("price")%>
						</span></span>
					</p>
					<c:choose>
						<c:when test="${postowner!=sessionuser}">
							<button class="btn btn-primary btn-md" data-title="bid"
								data-toggle="modal" data-target="#edit">Add Bid</button>
							<div class="modal fade" id="edit" tabindex="-1" role="dialog"
								aria-labelledby="Bid" aria-hidden="Bid">
								<div class="modal-dialog">
									<div class="modal-content">
										<form action="AddBid.jsp" method="post">
											<input type="hidden" name="postid"
												value=<%=request.getAttribute("postid")%>>
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">
													<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
												</button>
												<h4 class="modal-title custom_align" id="Heading">Bid</h4>
											</div>
											<div class="modal-body">
												<div class="form-group">
													<input class="form-control" name="price" id="price"
														type="text" placeholder="Bid Price">
												</div>
											</div>
											<div class="modal-footer ">
												<input type="submit" class="btn btn-primary btn-md"
													value="Add Bid" />
											</div>
										</form>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>

							<c:choose>
								<c:when test="${listBids.size()==0}">
									<h3>This post does not have any bids</h3>
								</c:when>
								<c:otherwise>

									<table class="js-dynamitable table" border="0" cellpadding="0"
										cellspacing="1">
										<thead>
											<tr>
												<th>Username<span
													class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
													<span
													class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
												</th>
												<th>Bidder Name<span
													class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
													<span
													class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
												</th>
												<th>Bid Date<span
													class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
													<span
													class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
												</th>
												<th>Bid Price<span
													class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
													<span
													class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
												</th>
											</tr>
											<tr>
												<th><input class="js-filter  form-control" type="text"
													value=""></th>
												<th><input class="js-filter  form-control" type="text"
													value=""></th>
												<th><input class="js-filter  form-control" type="text"
													value=""></th>
												<th><input class="js-filter  form-control" type="text"
													value=""></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listBids}" var="bid">
												<tr>
													<td class="col1"><c:out value="${bid.username}" /></td>
													<td><c:out value="${bid.name}" /></td>
													<td><c:out value="${bid.bidDate}" /></td>
													<td class="col3"><c:out value="${bid.bidPrice}" /></td>
													<td class="col3"><c:out value="${bid.bidPrice}" /></td>
													
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${listBids.size()==0}">
									<h3>This post does not have any bids</h3>
								</c:when>
								<c:otherwise>

									<table class="js-dynamitable table" border="0" cellpadding="0"
										cellspacing="1">
										<thead>
											<tr>
												<th>Username<span
													class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
													<span
													class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
												</th>
												<th>Name<span
													class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
													<span
													class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
												</th>
												<th>Bid Date<span
													class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
													<span
													class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
												</th>
												<th>Bid Price<span
													class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
													<span
													class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
												</th>
											</tr>
											<tr>
												<th><input class="js-filter  form-control" type="text"
													value=""></th>
												<th><input class="js-filter  form-control" type="text"
													value=""></th>
												<th><input class="js-filter  form-control" type="text"
													value=""></th>
												<th><input class="js-filter  form-control" type="text"
													value=""></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listBids}" var="bid">
												<tr>
													<td class="col1"><c:out value="${bid.username}" /></td>
													<td><c:out value="${bid.name}" /></td>
													<td><c:out value="${bid.bidDate}" /></td>
													<td class="col3"><c:out value="${bid.bidPrice}" /></td>
													<td>
														<form method="post" action="ShoppingCart.jsp">
															<input type="hidden" name="bidId" value="${bid.bidId}" />
															<input type="hidden" name="postId" value="${bid.postId}" />
															<input type="submit" class="btn btn-primary" name="cart" value="Add to Cart"></input>
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:otherwise>
							</c:choose>

						</c:otherwise>
					</c:choose>


				</div>
			</div>
		</div>
	</section>

	<!--  Footer -->
	<%@ include file="Footer.jsp"%>

	<script type="text/javascript" src="dynamitable.jquery.min.js"></script>
</body>
</html>