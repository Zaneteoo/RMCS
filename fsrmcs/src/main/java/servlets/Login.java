package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("password");

		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false", "root",
					"root");
			PreparedStatement pst = conn.prepareStatement("SELECT * from user where useremail = ? and password =?",
					ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pst.setString(1, uemail);
			pst.setString(2, upwd);

			ResultSet rs = pst.executeQuery();
			rs.beforeFirst();
			if (rs.next()) {
				if (rs.getString("acctype").equals("Admin")) {
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("acctype", rs.getString("acctype"));
					session.setAttribute("iduser", rs.getString("iduser"));
					dispatcher = request.getRequestDispatcher("adminHome.jsp");
					response.sendRedirect("adminHome.jsp");
				} else if (rs.getString("acctype").equals("Author")) {
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("acctype", rs.getString("acctype"));
					session.setAttribute("iduser", rs.getString("iduser"));
					dispatcher = request.getRequestDispatcher("authorHome.jsp");
					response.sendRedirect("authorHome.jsp");
				} else if (rs.getString("acctype").equals("Reviewer")) {
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("acctype", rs.getString("acctype"));
					session.setAttribute("iduser", rs.getString("iduser"));
					dispatcher = request.getRequestDispatcher("reviewerHome.jsp");
					response.sendRedirect("reviewerHome.jsp");
				} else if (rs.getString("acctype").equals("CC")) {
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("acctype", rs.getString("acctype"));
					session.setAttribute("iduser", rs.getString("iduser"));
					dispatcher = request.getRequestDispatcher("ccHome.jsp");
					response.sendRedirect("ccHome.jsp");
				}

				else {
					request.setAttribute("status", "failed");
					dispatcher = request.getRequestDispatcher("login.jsp");
				}

			}

			dispatcher.forward(request, response);
		} catch (IllegalStateException ignore) {
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
