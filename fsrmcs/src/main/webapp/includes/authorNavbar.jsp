<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" href="css/style.css" />

<nav class="nav">
	<div class="container-nav">
		<label class="logo"><a href="authorHome.jsp">RMCS Logged
				in as: <%=session.getAttribute("name")%></a></label>
		<ul>
			<li><a href="upload.jsp">Upload paper</a></li>
			<li><a href="viewPaperStatus.jsp">View paper status and comments</a></li>
			<li><a href="logout" id="logoutBtn">Logout</a></li>
		</ul>
	</div>
</nav>