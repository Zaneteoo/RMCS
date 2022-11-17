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
<title>View Comment</title>
</head>

<body>
	<div>
	<%
	try {

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false", "root", "root");
		Statement stmt;
		ResultSet rs;
		String id = request.getParameter("id");
		String paperName = request.getParameter("appid");
		request.setAttribute("paperName", paperName);
		request.setAttribute("id", id);
		
		HttpSession ss = request.getSession();
		String userType = (String) ss.getAttribute("acctype");

	if (userType.equals("Reviewer")) {
	%>
	<jsp:include page="includes/reviewerNavbar.jsp"></jsp:include>
	<%
	} else if (userType.equals("Author")) {
	%>
	<jsp:include page="includes/authorNavbar.jsp"></jsp:include>
	<%
	} else if (userType.equals("CC")) {
	%>
	<jsp:include page="includes/ccNavbar.jsp"></jsp:include>
	<%
	}

	Class.forName("com.mysql.cj.jdbc.Driver");
	stmt = con.createStatement();

	
	String sql = "select comments,idpaper,timestamps,papername,name FROM rmcs.comment, rmcs.papers WHERE idpaper=" + id +" AND paper_id =" + id + " ORDER by timestamps desc";
	rs = stmt.executeQuery(sql);
	%>
	<div class="my-4 pt-0 text-left">
		<label class="block mb-2 text-lg">Paper Name</label>
		<input type="text" name="paperName" id="paperName" value="<%=request.getAttribute("paperName")%>" readonly
			class="border block w-full p-2 mt-2 rounded" />
	</div>
				
	<div>
		<form  method="post" action="leaveCommentServlet">
				<input type="hidden" name="id" id="id" value="<%=request.getAttribute("id")%>"readonly/>
				<div class="w-full mb-4 border border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-700 dark:border-gray-600">
		            <div class="px-4 py-2 bg-white rounded-t-lg dark:bg-gray-800">
						<textarea class="w-full px-0 text-sm text-gray-900 bg-white border-0  focus:outline-none dark:text-white" id="UploadComments" name="UploadComments" placeholder="Enter Comment here"></textarea>
		            </div>
		
		            <div class="flex items-center justify-between px-3 py-2 border-t dark:border-gray-600">
		            <button type="submit" class="inline-flex items-center p-2 text-base font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 hover:bg-blue-800">Post Comment</button>
		            </div>
	            </div>     
		</form>
	</div>	


	<!-- Comment box table -->
	<div class="overflow-x-auto relative">
		<table class="w-full text-left  ">
			<thead>
				<tr class="bg-gray-300">
					<th scope="col" class="py-3 px-6">Name</th>
					<th scope="col" class="py-3 px-6">Comments</th>
					<th scope="col" class="py-3 px-6">Time</th>					
				</tr>
			</thead>
			<% 
			while(rs.next())
			{	
			do
			{
			%>
			<tbody class="border-b">
				<tr>
				<td scope="row" class="p-3"><%=rs.getString(5)%></td>
				<td class="p-3"><%=rs.getString(1)%></td>
				<td class="p-3"><%=rs.getString(3)%></td>
				</tr>
				<%
        	}
    		while(rs.next());
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