<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://mottie.github.io/tablesorter/css/theme.default.css"
	rel="stylesheet">
<!-- <link href="style.css" rel="stylesheet"> -->
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

	
	 <!-- Custom CSS -->
	<!--<link href="style.css" rel="stylesheet">  -->

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	 <link href="Carousel Template for Bootstrap_files/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="Carousel Template for Bootstrap_files/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="Carousel Template for Bootstrap_files/ie-emulation-modes-warning.js.download"></script>


<script type="text/javascript" src="modal.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="Carousel Template for Bootstrap_files/carousel.css" rel="stylesheet">
	
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<link href="footer.css" rel="stylesheet" type="text/css" media="all" />
<link href="header.css" rel="stylesheet" type="text/css" media="all" />
<link href="profile.css" rel="stylesheet" type="text/css" media="all" />
<link href="cart.css" rel="stylesheet" type="text/css" media="all" />
<link href="modal.css" rel="stylesheet" type="text/css" media="all" />
<title>Shopping Cart</title>
</head>
<body>
<!-- Nav -->
	<%@ include file="Header.jsp" %>
	
		<section>
	<div class="container" style="margin-top:80px;">
		<div class="row">
						<!-- Sidebar -->
			<%@ include file="Sidebar.jsp" %>
			<div class="col-md-8">
<h2>Hello:<%=session.getAttribute("name") %> </h2>
				<c:choose>
					<c:when test="${listItems.size()==0}">
						<h3>You do not have any items in your shopping cart</h3>
					</c:when>
					<c:otherwise>
									   <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Book name</th>
                            <th>Bid Price</th>
                            <th>Quantity</th>
                            <th>TotalPrice</th>
                            <th>Remove</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                      
                    <c:forEach items="${listItems}" var="item">
                    <tr>
                    <td></td>
                   	<td><c:out value="${item.bookname}"/></td>
                    <td><c:out value="${item.bidPrice}"/></td>
                    <td>
                    
                    <input type="text" name="quan" value="${item.quantity}" onChange="myfunc(this.value,${item.shoppingcartid})" />
                    
                   
                    </td>
                    <td><c:out value="${item.totalPrice}"/></td>
                    <td>
                    <form  method="post">
                    <input type="hidden" name="shoppingcartid" value="${item.shoppingcartid}"/>
                    <input type="hidden" name="action" value="remove"/>
                    
                    <input type="submit" class="btn btn-primary" value="remove"> </form>
                    </td>
                    <td>
                     <form id="myform" method="post" action="CartUpdate">
                    <input type="hidden" name="action1" value="update"/>
                    <input type="hidden" name="quantity" id="${item.shoppingcartid}" value="">
                    <input type="hidden" name="shoppingcartid" value="${item.shoppingcartid}"/>
                   	 
                  	<input type="submit" class="btn btn-primary" value="edit">
					
                   </form>
						                   
                    </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <form method="post" action="Checkout.jsp">
                
                <button type="submit" class="btn btn-primary" name="checkout">Checkout</button>
                </form>
					</c:otherwise>
				</c:choose>
				</div>
				</div>
				</div>
				</section>
	<!--  Footer -->
	<%@ include file="Footer.jsp" %>

</body>

<script type="text/javascript">
                   	function myfunc(val,val2){
						
                   		
						document.getElementById(val2).value=val;
						
                   	}
					</script>


</html>