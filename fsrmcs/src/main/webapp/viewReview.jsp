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
<%@ page import="javax.servlet.http.HttpSession"%>
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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>View Review</title>
</head>

<body>

	<%
	try {
		Statement stat = null;
		ResultSet rs = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false", "root", "root");
		stat = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

		HttpSession ss = request.getSession();
		String paperid = request.getParameter("id");
		String reviewerID = request.getParameter("user_id");
		String userType = (String) ss.getAttribute("acctype");

		if (userType.equals("Reviewer")) {
	%>
	<jsp:include page="includes/reviewerNavbar.jsp"></jsp:include>
	<%
	} else if (userType.equals("Author")) {
	%>
	<jsp:include page="includes/authorNavbar.jsp"></jsp:include>
	<%
	} else {
	%>
	<jsp:include page="includes/ccNavbar.jsp"></jsp:include>
	<%
	}
	%>


	<div class="main">
		<div class="container">
		
			<%
			String sql = "select review_rating, review_remarks, review_date, reviewer_name FROM review WHERE paperid= '" + paperid
					+ "'";
			rs = stat.executeQuery(sql);
			
			// IF there are NO REVIEWS AT ALL for the paper
			if (rs.next() != true) {
				if (userType.equals("Reviewer")) {
				%>
				<div>
					<p class="mb-3 text-lg font-light text-gray-500 md:text-xl dark:text-gray-400">There is no review available yet</p>
					<a class="bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow" 
						href="reviewerHome.jsp">Return to Home</a>
				</div>
				<% 
				} else if (userType.equals("Author")) {
					%>
					<div>	
						<p class="mb-3 text-lg font-light text-gray-500 md:text-xl dark:text-gray-400">There is no review available yet</p>
						<a class="bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow" 
							href="authorHome.jsp">Return to Home</a>
					</div>
					<% 
				} else if (userType.equals("CC")) {
					%>
					<div>
						<p class="mb-3 text-lg font-light text-gray-500 md:text-xl dark:text-gray-400">There is no review available yet</p>
						<a class="bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow" 
							href="ccHome.jsp">Return to Home</a>
					</div>
					<% 
				}
			}
			rs.beforeFirst();
			while (rs.next()) {
			%>
			<!-- View comment UI -->

			<input hidden="hidden" type="text" name="papername" id="papername"
				value=<%=rs.getString(3)%> />

			<table
				class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
				<thead
					class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
					<tr>
						<th scope="row" class="py-3 px-6">Rating</th>
						<th scope="row" class="py-3 px-6">Remarks</th>
						<th scope="row" class="py-3 px-6">Date of Review</th>
						<th scope="row" class="py-3 px-6">Reviewer Name</th>

					</tr>
				</thead>
				<%
				do {
				%>
				<tbody>
					<tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
						<td scope="row"
							class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"><%=rs.getString(1)%> /7</td>
						<td class="text-black py-4 px-6"><%=rs.getString(2)%></td>
						<td class="py-4 px-6"><%=rs.getString(3)%></td>
						<td class="text-black py-4 px-6"><%=rs.getString(4)%></td>
					</tr>
					<%
					} while (rs.next());
					}
					con.close();
					} catch (Exception e) {
					e.getStackTrace();
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>

<script src="script.js"></script>
</html>