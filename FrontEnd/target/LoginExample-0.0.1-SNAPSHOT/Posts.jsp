<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<!-- <script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> -->
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

<title>My Posts</title>
</head>
<body>
	<!-- Nav -->
	<%@ include file="Header.jsp" %>

	<section>
	<div class="container" style="margin-top: 80px;">
		<div class="row">
			<!-- Sidebar -->
			<%@ include file="Sidebar.jsp" %>

			<div class="col-md-9 table-responsive">
				<c:choose>
					<c:when test="${output.size()==0}">
						<h3>This user does not have any posts</h3>
					</c:when>
					<c:otherwise>
						<table class="js-dynamitable table" border="0" cellpadding="0"
							cellspacing="1">
							<thead>
								<tr>
									<th>Book Name<span
										class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
										<span
										class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
									</th>
									<th>Author Name<span
										class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
										<span
										class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
									</th>
									<th>Publisher Name<span
										class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
										<span
										class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
									</th>
									<th>Price<span
										class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
										<span
										class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
									</th>
									<th>Post Date<span
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
									<th><input class="js-filter  form-control" type="text"
										value=""></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${output}" var="product">
									<tr>
										<td><a href="GetPost.jsp?postid=${product.postID}">${product.bookName}</a></td>
										<td><c:out value="${product.authorName}" /></td>
										<td><c:out value="${product.publisherName}" /></td>
										<td><c:out value="${product.price}" /></td>
										<td><c:out value="${product.postDate}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</div>

		</div>
	</div>
	</section>


	<!--  Footer -->
	<%@ include file="Footer.jsp" %>

	<script type="text/javascript" src="dynamitable.jquery.min.js"></script>
</body>
</html>