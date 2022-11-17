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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.8.11/tailwind.min.css"
	integrity="sha512-KO1h5ynYuqsFuEicc7DmOQc+S9m2xiCKYlC3zcZCSEw0RGDsxcMnppRaMZnb0DdzTDPaW22ID/gAGCZ9i+RT/w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>Admin Home</title>
</head>

<body>
	<jsp:include page="includes/adminNavbar.jsp"></jsp:include>
	
	<!-- Admin Home UI -->
	<div class="main">
		<div class="container">
			<!-- Title-->
			<h1 class="font-medium leading-tight text-5xl mt-0 mb-2">Admin home page</h1>
			<div>
				<!-- Card 1-->
				<div class="p-6">
				<a href="createaccount.jsp" class="block p-6 max-w-sm bg-white rounded-lg border border-gray-200 shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
	    			<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Create account</h5>
	    			<p class="font-normal text-gray-700 dark:text-gray-400">Manage different types of users and user profiles (system admin, conference chair, reviewers and authors.</p>
				</a>
				</div>
				<!-- Card 2 -->
				<div class="p-6">
				<a href="manageaccount.jsp" class="block p-6 max-w-sm bg-white rounded-lg border border-gray-200 shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
	    			<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Manage accounts</h5>
	    			<p class="font-normal text-gray-700 dark:text-gray-400">Manage different types of users and user profiles. Delete profiles.</p>
				</a>
				</div>
			</div>		
		</div>
	</div>
	
</body>
</html>