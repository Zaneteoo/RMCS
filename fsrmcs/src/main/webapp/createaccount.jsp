<%
try {
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    if (session.getAttribute("name")==null) {
        response.sendRedirect("login.jsp");
    }
    else {}
}
catch(Exception ex) {
    out.println(ex);
}
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.8.11/tailwind.min.css"
	integrity="sha512-KO1h5ynYuqsFuEicc7DmOQc+S9m2xiCKYlC3zcZCSEw0RGDsxcMnppRaMZnb0DdzTDPaW22ID/gAGCZ9i+RT/w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>Admin Create Account</title>
</head>

<body class="body-createacc-admin">
	<jsp:include page="includes/adminNavbar.jsp"></jsp:include>

	<!-- Create account UI -->
	<div class="bg-white rounded p-16 text-center shadow-md">
		<form class="contact100-form validate-form" action="register"
				method="post" id="register-form">

			<h1 class="text-3xl">Create account</h1>
			<p class="text-sm text-gray-700">Under Account type, input either
				Author, Reviewer, System Admin or CC</p>

			<div class="wrap-input100 validate-input my-4 pt-0 text-left"
				data-validate="Valid email is required: ex@abc.xyz">
				<label for="email" class="text-gray-900">Email</label> <input
					class="input100 border block w-full p-2 mt-2 rounded" type="email"
					name="email" id="email" placeholder="Enter Email" />
			</div>

			<div class="wrap-input100 validate-input my-4 pt-0 text-left"
				data-validate="Name is required">
				<label for="name" class="text-gray-900">Name</label> <input
					class="input100 border block w-full p-2 mt-2 rounded" type="text"
					name="name" id="name" placeholder="Enter Name" />
			</div>

			<div class="wrap-input100 validate-input my-4 pt-0 text-left"
				data-validate="Contact is required">
				<label for="acctype" class="text-gray-900">Account type</label> <input
					class="input100 border block w-full p-2 mt-2 rounded" type="text"
					name="acctype" id="acctype" placeholder="Enter Account type" />
			</div>

			<div class="wrap-input100 validate-input my-4 pt-0 text-left"
				data-validate="Password is required">
				<label for="password" class="text-gray-900">Password</label> <input
					class="input100 border block w-full p-2 mt-2 rounded"
					type="password" name="password" id="password"
					placeholder="Enter Password" />
			</div>

			<button
				class="contact100-form-btn btn-update bg-black text-white py-2 mt-4 inline-block w-full rounded">Create
				account</button>
		</form>
	</div>

</body>
</html>

