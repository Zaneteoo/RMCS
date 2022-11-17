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
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js%22%3E"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js%22%3E"></script>
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js%22%3E"></script>
<script
    src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
    src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.8.11/tailwind.min.css"
    integrity="sha512-KO1h5ynYuqsFuEicc7DmOQc+S9m2xiCKYlC3zcZCSEw0RGDsxcMnppRaMZnb0DdzTDPaW22ID/gAGCZ9i+RT/w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>Author Upload Paper</title>
</head>

<body class="body-uploadpaper-author">
	<jsp:include page="includes/authorNavbar.jsp"></jsp:include>

	<!-- Upload paper UI -->
	<div class="bg-white rounded p-16 text-center shadow-md">
		<h1 class="text-3xl">Upload paper</h1>
		<p class="text-sm text-gray-700">By uploading, you confirm that the submission is your own work</p>

		<form method="post" action="uploadServlet" enctype="multipart/form-data">
				<div class="my-4 pt-0 text-left">
					<label class="block mb-2 text-lg">Author Name</label> 
					<input class="border block w-full p-2 mt-2 rounded" type="text" id="name" name="name"
							value="<%=session.getAttribute("name")%>" readonly />
				</div>
				
				<div class="my-4 pt-0 text-left">
					<label class="block mb-2 text-lg">Paper Name</label> 
					<input class="border block w-full p-2 mt-2 rounded"
							type="text" id="papername" name="papername"/>
				</div>
				
				<div class="my-4 pt-0 text-left">
					<label class="block mb-2 text-lg">Paper type</label> 
					<select name="papertype" id="papertype" required class="block p-2 mb-6 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
						<option value="Educational">Educational</option>
						<option value="Argumentative">Argumentative</option>				
					</select>
				</div>
				
				<div class="my-4 pt-0 text-left pb-20">
					<input class="bg-gray-300 border block w-full p-2 mt-2 rounded"
						type="file" name="photo" size="50" />
				</div>
				
				<div class="w-48 m-auto m-0 inline">
					<button class="bg-blue-700 text-white w-48 py-2 m-auto m-0 inline rounded" 
							type="submit" value="Save">Upload
					</button>
					<button class="bg-gray-200 text-black w-48 py-2 m-auto m-0 inline rounded">Cancel</button>
				</div>
		</form>
	</div>
</body>

</body>
<script src="script.js"></script>
</html>