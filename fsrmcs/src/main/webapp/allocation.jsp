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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
<title>CC Allocate Paper</title>
</head>

<body>
	<jsp:include page="includes/ccNavbar.jsp"></jsp:include>
	<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
	
	<%
	int paperid;
	Connection con;
	Statement stmt;
	ResultSet rs;
	paperid = Integer.parseInt(request.getParameter("id"));
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false", "root", "root");
		stmt = con.createStatement();
		String sql = "select * from papers where paper_id=" + paperid;

		rs = stmt.executeQuery(sql);
		while (rs.next()) {
	%>
	
	<!-- Allocate paper UI -->
	<div class="bg-white max-w-md rounded p-16 text-center shadow-md">
		<h1 class="text-3xl">Allocation of reviewers</h1>
	
		<div class="my-4 pt-0 text-left">
			<label>Paper Name</label>
			<input class="border block w-full p-2 mt-2 rounded" readonly="readonly" type="text" value=<%=rs.getString(7)%> />
		</div>
	<%
	String pst2 = "select name from user where acctype = 'Reviewer'";
	Statement stats = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rss = stats.executeQuery(pst2);
	
	rss.beforeFirst();
	
	while (rss.next()) {
	%>
		<form class="contact100-form validate-form" action="UpdateAccountReviewerAllocation" method="post" id="register-form">
				<input type="hidden" name="paperid" id="paperid" value=<%=rs.getString(1)%> />
				<div class="validate-input my-4 pt-0 text-left">
					<div class="pb-2">
						<label>Allocate to</label>
					</div>
					<select name="reviewerName" id="reviewerName" class="block p-2 mb-6 w-full text-sm text-gray-900 bg-gray-100 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
						<option value="">Select a Reviewer</option>
	<%
	do {
	%>
						<option value="<%=rss.getString(1)%>"><%=rss.getString(1)%></option>
	<%
	} while (rss.next());
	}
	;
	%>
					</select>
				</div>
				<div class="pt-20" id="UpdateAccountReviewerAllocation">
					<input type="submit" name="UpdateAccountReviewerAllocation" id="UpdateAccountReviewerAllocation"
							class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded"
							value="Confirm Reviewer" />
				</div>
		</form>
	</div>
	<%
	}
	;
	con.close();
	} catch (Exception e) {

	e.getStackTrace();
	}
	%>
</body>
</html>