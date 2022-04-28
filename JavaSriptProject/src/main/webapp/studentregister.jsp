<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.logging.Level" %>
<%@page import="java.util.logging.Logger" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.ArrayList" %>
 
 
<html>
    <head>    
        <title> Registration Form</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
 <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="homestyle.css">
	<style type="text/css">
	.banner {
		height: 200vh;
	}
	.eye {
	 position: absolute;
	}
	#hide1 {
	 display: none;
	}
	</style>
  
    <script type="text/javascript">
    function checkInputs() {
		var username = document.getElementById('username');
		var password = document.getElementById('password');
		var email = document.getElementById('email');
		
		let u = 0;
		let p = 0;
		let e = 0;
		
		if (username.value === '') {
			setErrorFor(username, 'Please enter the username');
			u = 0;
		} else if (!isUsername(username.value)) {
			setErrorFor(username,
					'Username contains small letters,numbers,underscore,dot only');
			u = 0;
		} else {
			setSuccessFor(username);
			u = 1;
		}
		
		if (password.value === '') {
			setErrorFor(password, 'Please enter the password');
			p = 0;
		} else if (!isPassword(password.value)) {
			setErrorFor(
					password,
					'Password should contain atleast 8 character,1 capital,small letter,number&special character');
			p = 0;
		} else {
			setSuccessFor(password);
			p = 1;
		}
		if (email.value === '') {
			setErrorFor(email, 'Please enter your email');
			e = 0;
		} else if (!isEmail(email.value)) {
			setErrorFor(email, 'Invalid email');
			e = 0;
		} else {
			setSuccessFor(email);
			e = 1;
		}
		if (u == 1 && p == 1  && e == 1 ) {
			return true;
			
		} else
			return false;
	}
    function setErrorFor(input, message) {
		var formControl = input.parentElement;
		var small = formControl.querySelector('small');
		formControl.className = 'form-control error';
		small.innerText = message;
	}
	function setSuccessFor(input) {
		var formControl = input.parentElement;
		formControl.className = 'form-control success';
	}
	function isUsername(username) {
		return /^(?=[a-z0-9._]{3,20}$)(?![0-9])(?!.*[_.]{2})[^_.].*[^_.]$/
				.test(username);
	}
	function isPassword(password) {
		return /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-=]).{8,}$/
				.test(password);
	}	
	function isEmail(email) {
		return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
				.test(email);
	}	
	</script>	
	</head>
		
    <%
   
    String msg = "";
    String color = "";
    Connection conn;  
   if(request.getMethod().compareToIgnoreCase("post")==0)
   {
   try
   {
   String username = request.getParameter("username");
      String password = request.getParameter("password");
      String email = request.getParameter("email");
     
     
      Class.forName("com.mysql.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
     
      String query = "INSERT INTO `register`(`username`, `password`, `email`) VALUES (?,?,?)";
     
      PreparedStatement pst = conn.prepareStatement(query);
      System.out.println(query);
     
      pst.setString(1, username);
      pst.setString(2, password);
      pst.setString(3, email);
  
     
      pst.executeUpdate();
      color = "green";
      msg = "Registration succesfull Click on the Login button and login";
      
     
     
   }catch(Exception ex){
   ex.printStackTrace();
   color = "red";
   msg = "Error Occured";
   }
   }
    %>    
    

  <body>
  <div class="form-group col-12 p-0">
         <h4 style="color:<%= color %>"><%= msg %></h4>
          <a href="studentlogin.jsp">Login</a>
         
</div>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
      <div class="container">
			<div class="header">
				<h2>Sign Up</h2>
			</div>
			<form action="studentregister.jsp" method="post" class="form" id="form" name="myForm"
				onsubmit="return checkInputs()">
				
				<div class="form-control">
					<label >Username:  </label>
					<input style="width: 50%" type="text" placeholder="Enter Username"
						id="username" name="username" /><br> <small>Error message</small>
				</div>
				
				<br>
				<div class="form-control">
					<label >Password:  </label>
					<input style="width: 50%" type="password" placeholder="Enter Password"
						id="password" name="password" maxlength="16"/>
						<span class="eye" onclick="myFunction()">
			<i id="hide1" class="fa fa-eye"></i>
			<i id="hide2" class="fa fa-eye-slash"></i>
			</span>
						<small>Error message</small>
				</div>
				<br>
				
				<div class="form-control">
					<label >Email:  </label><input
						style="width: 50%" type="email" placeholder="Enter Your Email"
						id="email" name="email" /><br> <small>Error message</small>
				</div>
				<br>
				<input type="submit" value="Register" name="studentlogin">
				
			</form>

		</div>
	


	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		<script type="text/javascript">
	function myFunction() {
		var x=document.getElementById("password");
		var y=document.getElementById("hide1");
		var z=document.getElementById("hide2");
		if(x.type==='password') {
			x.type="text";
			y.style.display="block";
			z.style.display="none";
		}
		else {
			x.type="password";
			y.style.display="none";
			z.style.display="block";
		}
	}
	</script>
 </body>
</html>