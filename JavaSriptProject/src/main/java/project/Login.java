package project;

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
@WebServlet("/userlogin")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher=null;
		 
		if (username != "fathima" && password!="Fathima@123") {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
		    PreparedStatement pst=con.prepareStatement("select * from register where username=? and password=?");
		    pst.setString(1, username);
		    pst.setString(2, password);
		    ResultSet rs=pst.executeQuery();
		    if(rs.next()) {
		    	session.setAttribute("username", rs.getString("username"));
		    	dispatcher=request.getRequestDispatcher("admin.jsp");
		    }else {
		    	request.setAttribute("status", "failed");
		    	dispatcher=request.getRequestDispatcher("appointment.jsp");
		    }
		    dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
	}

}