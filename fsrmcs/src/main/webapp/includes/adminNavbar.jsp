<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" href="css/style.css" />

<nav class="nav">
	<div class="container-nav">
		<label class="logo"><a href="adminHome.jsp">RMCS Logged in
				as: <%=session.getAttribute("name")%></a></label>
		<ul>
			<li><a href="createaccount.jsp">Create account</a></li>
			<li><a href="manageaccount.jsp">Manage accounts</a></li>
			<li><a href="logout" id="logoutBtn">Logout</a></li>
		</ul>
	</div>
</nav>