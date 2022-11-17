<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body class="body-login">
	<div class="container-login">
		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">
		<h1>Research Management Conference System</h1>	
		
		<form action="login" method="post" class="register-form"
							id="login-form" >
			<div class="form-control-login">
				<input type="text" name="email" id="email"/>
        		<Label>Email</Label>
			</div>
			<div class="form-control-login">
        		<input type="password" name="password" id="password">
        		<label>Password</label>
			</div>
			
			<input type="submit" name="signin" id="signin"
					class="form-submit" value="Log in" />
			<p class="text-login">Don't have an account yet? <a href="#">Register</a></p>
		</form>
	</div>
</body>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
	</script>
</html>

