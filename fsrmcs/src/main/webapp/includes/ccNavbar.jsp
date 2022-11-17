<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" href="css/style.css" />

<nav class="nav">
	<div class="container-nav">
		<label class="logo"><a href="ccHome.jsp">RMCS Logged in
				as: <%=session.getAttribute("name")%></a></label>
		<ul>
			<li><a href="viewallocatetable.jsp">Allocate papers</a></li>
			<li><a href="acceptrejectpaper.jsp">Accept-Reject papers</a></li>
			<li><a href="logout" id="logoutBtn">Logout</a></li>
		</ul>
	</div>
</nav>