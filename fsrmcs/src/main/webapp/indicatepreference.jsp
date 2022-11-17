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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="ISO-8859-1">
<%@ page import="java.sql.*" %>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.8.11/tailwind.min.css"
	integrity="sha512-KO1h5ynYuqsFuEicc7DmOQc+S9m2xiCKYlC3zcZCSEw0RGDsxcMnppRaMZnb0DdzTDPaW22ID/gAGCZ9i+RT/w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>Reviewer Indicate Preference</title>
</head>

<body>
	<jsp:include page="includes/reviewerNavbar.jsp"></jsp:include>
	
	<!-- Indicate preference UI -->
	<%
	Statement stat = null; 
	ResultSet rs = null; 
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false", "root", "root");
	stat = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	String query = request.getParameter("search");
	String data;
	
	String uId=(String)session.getAttribute("iduser");
	
	data = "SELECT paper_type, preferred_number FROM bids WHERE user_id ="+ uId; 	
	rs = stat.executeQuery(data); 
	
	// IF there are NO BIDS MADE by the reviewer before
	if (rs.next() == false) {
	
	%>
		<div class="bg-white max-w-2xl rounded p-16 text-center shadow-md">
		<h1 class="text-3xl">Indicate your preference</h1>
	
		<form method="post" action="reviewerInsertBidServlet">
				<div class="my-4 pt-0 text-left">
					<label class="text-gray-900">Previous preferred paper type</label> 
					<input readonly="readonly" class="border block w-full p-2 mt-2 rounded bg-gray-200" type="text" id="oldPrefType" value="No Preference">
				</div>
			
				<div class="my-4 pt-0 text-left">
					<label class="text-gray-900">Indicate new preferred paper type</label>
			              <select name="prefType" id="prefType"
			                  		class="block p-2 mb-6 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
			                  		required>
			                  <option value="No Preference">No Preference</option>
			                  <option value="Educational">Educational</option>
			                  <option value="Argumentative">Argumentative</option>
			              </select>
				</div>
			
				<div class="my-4 pt-0 text-left">
					<label class="text-gray-900">Previous maximum papers preferred</label> 
					<input readonly="readonly" class="border block w-full p-2 mt-2 rounded bg-gray-200" type="text"
							id="oldPrefMax" value="Not indicated">
				</div>
			
				<div class="my-4 pt-0 text-left">
					<label class="text-gray-900">New maximum papers preferred</label> 
					<input class="border block w-full p-2 mt-2 rounded" type="text"
							id="maxNum" name="maxNum">
				</div>
				
				<div class="w-48 m-auto m-0 inline">
					<button class="bg-blue-700 text-white w-48 py-2 m-auto m-0 inline rounded" type="submit" value="Save">Save changes</button>
				</div>
		</form>
	</div>
	<%
	}
	// If there are BIDS MADE by reviewer previously
	rs.beforeFirst();
	while (rs.next()) {
	%>
	<div class="bg-white max-w-2xl rounded p-16 text-center shadow-md">
		<h1 class="text-3xl">Indicate your preference</h1>
	
		<form method="post" action="reviewerUpdateBidServlet">
				<div class="my-4 pt-0 text-left">
					<label class="text-gray-900">Previous preferred paper type</label> 
					<input readonly="readonly" class="border block w-full p-2 mt-2 rounded bg-gray-200" type="text" id="oldPrefType" value="<%=rs.getString(1)%>">
				</div>
			
				<div class="my-4 pt-0 text-left">
					<label class="text-gray-900">Indicate new preferred paper type</label>
			              <select name="prefType" id="prefType"
			                  		class="block p-2 mb-6 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
			                  		required>
			                  <option value="No Preference">No Preference</option>
			                  <option value="Educational">Educational</option>
			                  <option value="Argumentative">Argumentative</option>
			              </select>
				</div>
			
				<div class="my-4 pt-0 text-left">
					<label class="text-gray-900">Previous maximum papers preferred</label> 
					<input readonly="readonly" class="border block w-full p-2 mt-2 rounded bg-gray-200" type="text"
							id="oldPrefMax" value=<%=rs.getString(2)%>>
				</div>
			
				<div class="my-4 pt-0 text-left">
					<label class="text-gray-900">New maximum papers preferred</label> 
					<input class="border block w-full p-2 mt-2 rounded" type="text"
							id="maxNum" name="maxNum">
				</div>
				
				<div class="w-48 m-auto m-0 inline">
					<button class="bg-blue-700 text-white w-48 py-2 m-auto m-0 inline rounded" type="submit" value="Save">Save changes</button>
				</div>
		</form>
	</div>
	<%
	};
	con.close();
	} catch (Exception e) {

	e.getStackTrace();
	}
	%>
</body>

<script src="script.js"></script>
</html>