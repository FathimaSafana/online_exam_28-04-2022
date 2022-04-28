 <%   
     String username = request.getParameter("username");
     String password = request.getParameter("password");
     
     if((username.equals("fathima") && password.equals("Fathima@123")))
     {
		 
            response.sendRedirect("showall.jsp");
        }
     else
     {
           out.println("Login Fail");
     }
%>