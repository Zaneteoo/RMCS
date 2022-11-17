package servlets; 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;  

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
@WebServlet("/reviewerUpdateBidServlet")
public class ReviewerUpdateBidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewerUpdateBidServlet() {
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
		String uPrefType = request.getParameter("prefType");
		
		int uMaxNum = Integer.parseInt(request.getParameter("maxNum"));
		HttpSession session = request.getSession();
		int uID = Integer.valueOf((String) session.getAttribute("iduser"));
		
		Connection conn = null; 
		RequestDispatcher dispatcher = null; 
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false","root","root");
			PreparedStatement pst = conn.prepareStatement("UPDATE bids SET paper_type=?, preferred_number=? WHERE user_id = '" + uID + "'");
			//PreparedStatement pst = conn.prepareStatement("INSERT INTO bids (user_id, paper_type, preferred_number) values (?, ?, ?) ");
			
			pst.setString(1,  uPrefType);
			pst.setInt(2, uMaxNum);
			pst.executeUpdate();
			
			
			dispatcher = request.getRequestDispatcher("reviewerHome.jsp");
			dispatcher.forward(request, response);
			
		} catch (IllegalStateException ignore) {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}