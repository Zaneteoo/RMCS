<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" href="css/style.css"/>

<nav class="nav">
  <div class="container-nav">
    <label class="logo"><a href="reviewerHome.jsp">RMCS Logged in as: <%=session.getAttribute("name")%></a></label>
    <ul>
      <li><a href="viewtoreview.jsp">Leave review</a></li>
      <li><a href="indicatepreference.jsp">Bid - Indicate type and max papers</a></li>
      <li><a href="logout" id="logoutBtn">Logout</a></li>
    </ul>
  </div>
</nav>