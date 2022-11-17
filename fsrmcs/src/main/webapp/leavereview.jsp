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
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />	
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<title>Reviewer Leave Review</title>
</head>

<body>
	<jsp:include page="includes/reviewerNavbar.jsp"></jsp:include>
	
	<!-- Leave review UI -->
	<%
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false","root","root");
	Statement stmt;
	ResultSet rs;
	String id = request.getParameter("id");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		stmt = con.createStatement();
		String sql = "SELECT * from papers WHERE paper_id =" + id;
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
		%>
		
		<div class="container-lr">
			<h1 class="leading-tight text-2xl mt-0 mb-2"><%=rs.getString(7)%></h1>
			<div class="star-widget">
				<form class="form-lr" method="post" action="leaveReviewServlet">
						<input type="hidden" name="paperid" id="paperid" value="<%=id%>"/>
						<input type="radio" name="rate" id="rate-7" value="7">
						<label for="rate-7" class="fas fa-star"></label>
						
						<input type="radio" name="rate" id="rate-6" value="6">
						<label for="rate-6" class="fas fa-star"></label>
						        
						<input type="radio" name="rate" id="rate-5" value="5">
						<label for="rate-5" class="fas fa-star"></label>
						        
						<input type="radio" name="rate" id="rate-4" value="4">
						<label for="rate-4" class="fas fa-star"></label>
						        
						<input type="radio" name="rate" id="rate-3" value="3">
						<label for="rate-3" class="fas fa-star"></label>
						        
						<input type="radio" name="rate" id="rate-2" value="2">
						<label for="rate-2" class="fas fa-star"></label>
						        
						<input type="radio" name="rate" id="rate-1" value="1">
						<label for="rate-1" class="fas fa-star"></label>
						
						<header></header>
						<div class="textarea-lr">
							<textarea cols="30" id = "remarks" name="remarks" placeholder="Enter review here"></textarea>
						</div>		
						
						<div class="btn-lr">
							<button type="submit">Submit review</button>
						</div>			
				</form>
			</div>
		</div>
		<%
		};
		con.close();
		}
		catch (Exception e) {
		e.getStackTrace();
		}
		%>
</body>
</html>