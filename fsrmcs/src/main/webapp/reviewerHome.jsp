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
<title>Reviewer Home</title>
</head>

<body>
	<jsp:include page="includes/reviewerNavbar.jsp"></jsp:include>

	<!-- Reviewer Home UI -->
	<div class="main">
		<div class="container">
			<!-- Title-->
			<h1 class="font-medium leading-tight text-5xl mt-0 mb-2">Reviewer home page</h1>
			<div>
				<!-- Card 1-->
				<div class="p-6">
				<a href="viewtoreview.jsp" class="block p-6 max-w-sm bg-white rounded-lg border border-gray-200 shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
	    			<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Leave review</h5>
	    			<p class="font-normal text-gray-700 dark:text-gray-400">The reviewers to submit and edit their review and rating. Ratings can be: Strong accept, Accept, Weak accept, Borderline paper, Weak reject, Reject or Strong reject</p>
				</a>
				</div>
				<!-- Card 2 -->
				<div class="p-6">
				<a href="indicatepreference.jsp" class="block p-6 max-w-sm bg-white rounded-lg border border-gray-200 shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
	    			<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Bid - Indicate type and max papers</h5>
	    			<p class="font-normal text-gray-700 dark:text-gray-400">The reviewers to bid for the papers they prefer to review and provide the maximum number of papers they would like to review.</p>
				</a>
				</div>
			</div>		
		</div>
	</div>

</body>
</html>