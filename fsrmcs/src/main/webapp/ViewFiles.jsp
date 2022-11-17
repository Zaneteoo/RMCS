<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Patient List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<body>
  <!-- Navigation bar, add our functions/UIs here -->
  <nav class="nav">
    <div class="container">
 <h1 class="logo"><a href="home.jsp">Logged in as: <%=session.getAttribute("name")%></a></h1>
      <ul>
        <li><a href="home.jsp" class="active">Home</a></li>
        <li><a href="logout"
						id="logoutBtn">Logout</a></li>
        <li><a href="Upload.jsp">Upload Files</a></li>
        <li><a href="#">Function3</a></li>
      </ul>
    </div>
  </nav>

  <!-- Main content(s) -->
  <div class="main">
    <div class="container">
     <form action="downloadFileServlet" method="post" class="register-form"
							id="login-form" >
							</form>
							<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />

    </div>
  </div>

  <!-- javascript -->
  <script src="script.js"></script>
</body>
</html>