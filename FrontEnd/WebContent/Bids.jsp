<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

<title>My Bids</title>
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
						<h3>This user does not have any bids</h3>
					</c:when>
					<c:otherwise>
						<table class="js-dynamitable table" border="0" cellpadding="0"
							cellspacing="1">
							<thead>
								<tr>
									<th>Mobile Name<span
										class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
										<span
										class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
									</th>
									<th>Company Name<span
										class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
										<span
										class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
									</th>
									<th>Bid_Price<span
										class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
										<span
										class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
									</th>
									<th>Bid_Date<span
										class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span>
										<span
										class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span>
									</th>
									<th>
									Remove
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
								<c:forEach items="${output}" var="bid">
									<tr>
										<td><c:out value="${bid.mobileName}"/></td>
										<td><c:out value="${bid.companyName}" /></td>
										<td><c:out value="${bid.bidprice}" /></td>
										<td><c:out value="${bid.BidDate}" /></td>
										<td>
										<form  method="post">
                    <input type="hidden" name="bid_id" value="${bid.bidID}"/>
                    <input type="hidden" name="action" value="remove"/>
                    
                    <input type="submit" class="btn btn-primary" value="remove"> </form>
										</td>
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