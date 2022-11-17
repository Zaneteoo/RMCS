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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.8.11/tailwind.min.css"
	integrity="sha512-KO1h5ynYuqsFuEicc7DmOQc+S9m2xiCKYlC3zcZCSEw0RGDsxcMnppRaMZnb0DdzTDPaW22ID/gAGCZ9i+RT/w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>CC Home</title>
</head>

<body>
	<jsp:include page="includes/ccNavbar.jsp"></jsp:include>
	
	<!-- CC Home UI -->
	<div class="main">
		<div class="container">
			<!-- Home Page Title-->
			<h1 class="font-medium leading-tight text-5xl mt-0 mb-2" >CC home page</h1>
			<div>
				<!-- Card 1-->
				<div class="p-6">
				<a href="viewallocatetable.jsp" class="block p-6 max-w-sm bg-white rounded-lg border border-gray-200 shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
	    			<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Allocate papers</h5>
	    			<p class="font-normal text-gray-700 dark:text-gray-400">The conference chairs to allocate papers to reviewers. Allocation can be done automatically or manually</p>
				</a>
				</div>
				<!-- Card 2 -->
				<div class="p-6">
				<a href="acceptrejectpaper.jsp" class="block p-6 max-w-sm bg-white rounded-lg border border-gray-200 shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
	    			<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Accept / Reject papers</h5>
	    			<p class="font-normal text-gray-700 dark:text-gray-400">The conference chairs to view the reviews and ratings, and decide whether a paper should be accepted or rejected after the reviewing process completes. Once all decision have been made, the conference chairs should also be able to see a list of accepted and rejected papers</p>
				</a>
				</div>
			</div>		
		</div>
	</div>
	
</body>
</html>