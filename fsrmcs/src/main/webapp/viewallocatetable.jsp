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
<title>CC View Allocate Table</title>
</head>

<body>
	<jsp:include page="includes/ccNavbar.jsp"></jsp:include>
	<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
	
	<!-- View allocate table UI -->
	<div class="overflow-x-auto relative shadow-md sm:rounded-lg">
		<!-- Search bar above allocation table -->
		<div class="searchbar relative w-3/6 py-4">
			<form action="" method="post">
					<div
						class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
						<svg aria-hidden="true"
							class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="none"
							stroke="currentColor" viewBox="0 0 24 24"
							xmlns="http://www.w3.org/2000/svg">
							<path stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
						</svg>
					</div>
					
					<input type="text" name="search" placeholder="Search paper name here"
							class="search block p-4 pl-10 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" />
			</form>
		</div>

		<!-- Allocation table -->
		<%
		try {
		    Statement stat = null;
		    ResultSet rs = null;
		
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false", "root", "root");
		    stat = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		    String query = request.getParameter("search");
		    String data;
		
		    if (query != null) {
		        data = "select * from papers WHERE papername LIKE"  + "'%" + query + "%'";
		    } else
		        data = "select * from papers ORDER by paper_id asc";
		    rs = stat.executeQuery(data);
		    if (rs.next() != true) {
		        data = "select * from papers ORDER by paper_id asc";
		        rs = stat.executeQuery(data);
		
		}
		rs.beforeFirst();
		while (rs.next()) {
		
		%>
					<table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
						<thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
							<tr>
								<th scope="col" class="py-3 px-6">Case ID</th>
								<th scope="col" class="py-3 px-6">Paper</th>
								<th scope="col" class="py-3 px-6">Decision</th>
								<th scope="col" class="py-3 px-6">Currently allocated to</th>
							</tr>
						</thead>
		<%
		do {
		%>
						<tbody>
							<tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
								<td scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"><%=rs.getString(1)%></td>
								<td class="text-black py-4 px-6"><%=rs.getString(7)%>
									<form action="downloadServlet" onclick="myAlertFunction(event)">
										<input type="hidden" name="paperName" id="paperName" value="<%=rs.getString(7)%>"> 
										<input type="submit" name="test" id="test" value="Download" class="bg-blue-200 hover:bg-blue-600 text-gray-800 font-bold py-1 px-1 rounded inline-flex items-center">
									</form></td>
								<td class="py-4 px-6"><a class="bg-green-400 hover:bg-green-700 text-black w-24 p-2 rounded" href=./allocation.jsp?id=<%=rs.getInt(1)%>> Allocation </a></td>
								<td class="text-black py-4 px-6"><%=rs.getString(5)%></td>
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


<!-- JS for Notification of download -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
	var status = document.getElementById("status").value;
	if (status == "success") {
		swal("Success", 
			"Download success in User/Downloads", 
			"success"
			).then((placeholder) => {
				window.location.href = "ccHome.jsp";
			});
	}
</script>

</html>