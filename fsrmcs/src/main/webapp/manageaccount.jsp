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
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>Admin manage accounts</title>
</head>

<body>
	<jsp:include page="includes/adminNavbar.jsp"></jsp:include>

	<!-- Manage account UI -->

	<div class="overflow-x-auto relative shadow-md sm:rounded-lg">
		<%
		try {
			Statement stat = null;
			ResultSet rs = null;
			int customerid = 1;
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false", "root", "root");
			stat = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			String query = request.getParameter("search");
			String data;

			if (query != null) {
				data = "select * from user where name like '%" + query;
			} else
				data = "select * from user ORDER by name asc";
			rs = stat.executeQuery(data);
			if (rs.next() != true) {
				data = "select * from user ORDER by name asc";
				rs = stat.executeQuery(data);
		%>
		<input type="hidden" id="status" value="error">
		<%
		}
		rs.beforeFirst();
		while (rs.next()) {
		%>
		<table
			class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
			<thead
				class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
				<tr>
					<th scope="col" class="py-3 px-6">Name</th>
					<th scope="col" class="py-3 px-6">Email address</th>
					<th scope="col" class="py-3 px-6">Account type</th>
				</tr>
			</thead>
			<%
			do {
			%>
			<tbody>
				<tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
					<td scope="row"
						class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"><%=rs.getString(5)%></td>
					<td class="py-4 px-6"><%=rs.getString(2)%></td>
					<td class="py-4 px-6"><%=rs.getString(4)%></td>
					<td>
						<form class="contact100-form validate-form" action="deleteAccount"
							method="post" id="deleteForm">
							<div hidden="hidden">
								<input type="text" name="id" id="id" value=<%=rs.getString(1)%> />
							</div>
							<div>
								<button id="deleteAccount"
									class="bg-red-600 hover:bg-red-700 text-black w-24 py-2 rounded">Delete</button>
							</div>
						</form>
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
</body>
<script src="script.js"></script>
</html>
