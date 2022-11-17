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

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/leaveReviewServlet")

public class LeaveReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LeaveReviewServlet() {
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

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// initialization of variables
		Statement stat = null;
		// ResultSet rs = null;
		Connection conn = null;
		RequestDispatcher dispatcher = null;
		String data;

		HttpSession session = request.getSession();
		int idpapers;

		int uRatingScore = Integer.parseInt(request.getParameter("rate"));
		String uRemarks = request.getParameter("remarks");
		String papername = request.getParameter("papername");
		String pId = request.getParameter("paperid");
		String rName = (String) session.getAttribute("name");
		int uId = Integer.valueOf((String) session.getAttribute("iduser"));

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false", "root", "root");
			stat = conn.createStatement();

			PreparedStatement pst = conn.prepareStatement(
					"INSERT INTO review (review_rating, review_remarks, review_date, paperid, reviewer_name, user_id) values (?, ?, ?, ?, ?, ?)");

			pst.setInt(1, uRatingScore);
			pst.setString(2, uRemarks);
			pst.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now())); // inputs time of submission into DB
			pst.setString(4, pId);
			pst.setString(5, rName);
			pst.setInt(6, uId);
			pst.executeUpdate();

			dispatcher = request.getRequestDispatcher("reviewerHome.jsp");
			dispatcher.forward(request, response);

		} catch (IllegalStateException ignore) {

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
