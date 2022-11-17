package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.File;
import java.io.FileOutputStream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Blob;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/downloadServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB

public class FileDownloadDBServlet extends HttpServlet {
	// database connection settings
	private String dbURL = "jdbc:mysql://localhost:3306/rmcs?useSSL=false";
	private String dbUser = "root";
	private String dbPass = "root"; // change accordingly to your machine's mySQL password.

	// size of byte buffer to send file
	private static final int BUFFER_SIZE = 4096;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
;

		Connection conn = null; // connection to the database
		ResultSet result = null;
		String message = null; // message will be sent back to client
		HttpSession session = request.getSession();


		InputStream input = null;
		FileOutputStream output = null;
		RequestDispatcher dispatcher = null;

		String paperName = request.getParameter("paperName");
		String userType = (String) session.getAttribute("acctype");
		

		try {
			// connects to the database
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

			// queries the database
			String sql = "SELECT photo FROM papers WHERE papername = " + "'" + paperName + "'"; // this is hardcoded pls
																								// change
			PreparedStatement statement = conn.prepareStatement(sql);
			
			

			result = statement.executeQuery();

			String userHome = System.getProperty("user.home"); // gets home directory of user

			File downFile = new File(userHome + "/Downloads/" + paperName + ".pdf");

			output = new FileOutputStream(downFile);
			if (result.next()) {
				input = result.getBinaryStream("photo"); // this is to read the blob

				byte[] buffer = new byte[1024];
				while (input.read(buffer) > 0) {
					output.write(buffer); // writes to local file
				}

				request.setAttribute("status", "success");

			}
			

			if (userType.equals("Author")) {
				dispatcher = request.getRequestDispatcher("authorHome.jsp");
				response.sendRedirect("authorHome.jsp");
			} else if (userType.equals("Reviewer")) {

				dispatcher = request.getRequestDispatcher("reviewerHome.jsp");
				response.sendRedirect("reviewerHome.jsp");
			} else if (userType.equals("CC")) {

				dispatcher = request.getRequestDispatcher("ccHome.jsp");
				response.sendRedirect("ccHome.jsp");
			}

			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}



		} catch (SQLException ex) {
			ex.printStackTrace();
			response.getWriter().print("SQL Error: " + ex.getMessage());
		} catch (IOException ex) {
			ex.printStackTrace();
			response.getWriter().print("IO Error: " + ex.getMessage());
		} finally {
			if (conn != null) {
				// closes the database connection
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
	}
}