package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail = request.getParameter("email");
		String uname = request.getParameter("name");
		String acctype = request.getParameter("acctype");
		String password = request.getParameter("password");

		Connection conn = null;
		RequestDispatcher dispatcher = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false","root","root");
			PreparedStatement pst = conn.prepareStatement("INSERT INTO user(useremail,password,acctype,name) values(?,?,?,?)");

					pst.setString(1, uemail);
					pst.setString(2, password);
					pst.setString(3, acctype);
					pst.setString(4, uname);
					pst.executeUpdate();

					request.setAttribute("status", "success");
					dispatcher = request.getRequestDispatcher("adminHome.jsp");
					dispatcher.forward(request, response);
				}
		
		catch(IllegalStateException ignore) {
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
