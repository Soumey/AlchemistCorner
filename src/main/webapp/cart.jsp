<%@page import="java.util.*" %>
<%@ page import="com.soumey.product.ProductDetails" %>
<%@ page import="com.soumey.product.Cart" %>
<%@ page import="com.soumey.product.ListProductsServlet" %>
<%@ page import="com.soumey.product.ProductDetails" %>
<%
ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct=null;
if(cart_list !=null)
{
	ListProductsServlet servlet = new ListProductsServlet();
	cartProduct = servlet.getCartProducts(cart_list);
	
	request.setAttribute("cart_list", cart_list);
}
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Add New Item</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h3>Total price: 544 $</h3>
 						<a class="mx-3 btn btn-primary" href="#"> Check out</a>
						<table class= "table table-loght">
 				<thead>
 					<tr>
 						<th scope="col">Name</th>
 						<th scope="col">Category</th>
 						<th scope="col">Price</th>
 						<th scope="col">Buy Now</th>
 						<th scope="col">Cancel</th>
 					</tr>
 				</thead>
 				<tbody>
 				
 				
 				
 				<% if(cart_list != null)
 					{
 					
 					for(Cart c:cart_list)
 					{ %>
 					
 						<tr><%out.println(c.getName()); %>
 						<td><% out.println(c.getCategory()); %></td>
 						<td><% out.println(c.getPrice());%> $ </td>
 						<td>
 							<form action="" method="post" class="form-inline">
 							<input type="hidden" name="id" value="<%out.println(c.getId()); %>" class="form-input">
 							<div class="form group d-flex justify-content-between">
 								<a class="btn btn-sm tbn-decre" href=""><i class="fas fa-minus-square"></i></a>
 								<input type="text" name="quantity" class="form-control" value="1" readonly>
 								<a class="btn btn-sm btn-incre" href=""><i class="fas fa-plus-square"></i></a>
 							</div>
 							</form>
 						</td>
 						<td>
 						<a class="btn btn-sm bg-danger"><button style="background-color:red; color:white; border:none;"> Remove</button></a>
 						</td>
 					<% 	
 					}
 					}
 					
 					%>
 					
						
					</div>
					
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	var status=document.getElementById("status").value;
	if(status=="success")
		{
			swal("Product Added");
		}
	
	</script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>