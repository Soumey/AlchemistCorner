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
						<h2 class="form-title">Add New Item to database</h2>
					
						<form method="post" action="AddProduct" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"></label> <input
									type="text" name="name" id="name" placeholder="Product Name" />
							</div>
							<div class="form-group">
								<label for="description"></label> <input
									type="text" name="description" id="description" placeholder="description" />
							</div>
							<div class="form-group">
								<label for="category"></label> <input
									type="text" name="category" id="category" placeholder="category" />
							</div>
							<div class="form-group">
								<label for="price"></label>
								<input type="text" name="price" id="price"
									placeholder="price" />
							</div>
							<div class="form-group">
								<label for="image"></label>
								<input type="text" name="image" id="image"
									placeholder="image link" />
							</div>
							
							<div class="form-group">
								
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Add Item" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/alchemist.png" alt="sing up image">
						</figure>
						
						<a href="index.jsp" class="signup-image-link">Get me back</a>
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