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
@WebServlet("/leaveCommentServlet")

public class LeaveCommentServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public LeaveCommentServlet() {
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
		
		@Override
		protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			Statement stat = null;  
			Connection conn = null; 
			RequestDispatcher dispatcher = null; 
			String data; 
	
			HttpSession session = request.getSession();
			String comment = request.getParameter("UploadComments");
			String id = request.getParameter("id");
			String name = (String) session.getAttribute("name");
			
			try {

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rmcs?useSSL=false","root","root");
                stat = conn.createStatement();


                PreparedStatement pst = conn.prepareStatement("INSERT INTO comment (comments, timestamps, idpaper, name) values (?, ?, ?, ?)");

                    pst.setString(1, comment);
                    pst.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now())); // inputs time of submission into DB 
                    pst.setString(3, id);
                    pst.setString(4,name);
                    pst.executeUpdate();	
					
				// RE-Direct after submitting comment
				HttpSession ss = request.getSession();
				String userType = (String) ss.getAttribute("acctype");

				if (userType.equals("Reviewer")) {
				
					dispatcher = request.getRequestDispatcher("reviewerHome.jsp");
					dispatcher.forward(request, response);
				
				} else if (userType.equals("Author")) {
				
					dispatcher = request.getRequestDispatcher("authorHome.jsp");
					dispatcher.forward(request, response);
				} else {
					dispatcher = request.getRequestDispatcher("ccHome.jsp");
					dispatcher.forward(request, response);
				}

					
			} catch (IllegalStateException ignore) {
				
					
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		
	}

}

