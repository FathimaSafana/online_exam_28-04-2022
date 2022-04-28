<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
		height: 100vh;
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
	let u = 0;
	let p = 0;
	if (username.value === '') {
		setErrorFor(username, 'Please enter the username');
		u = 0;
	}
	else if (!isUsername(username.value)) {
		setErrorFor(username, 'Username contains small letters,numbers,underscore,dot only');
		u = 0;
	} else {
		setSuccessFor(username);
		u = 1;
	}
	if (password.value === '') {
		setErrorFor(password, 'Please enter the password');
		p = 0;
	} else if (!isPassword(password.value)) {
		setErrorFor(password, 'Password should contain atleast 8 character,1 capital,small letter,number&special character');
		p = 0;
	}
	else {
		setSuccessFor(password);
		p = 1;
	}
	if (u == 1 && p == 1) {
		return true;
	}
	else
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
	return /^(?=[a-z0-9._]{3,20}$)(?![0-9])(?!.*[_.]{2})[^_.].*[^_.]$/.test(username);
}
function isPassword(password) {
	return /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-=]).{8,}$/.test(password);
}
</script>
</head>


<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">

<div class="container">
	<div class="header">
		<h2>Login Here</h2>
	</div>
			<form action="homescreen.jsp" method="post" class="form" name="form" onsubmit="return checkInputs()">
			    <div class="form-control">
			<label for="username">Username</label><br>
			<input style="width: 100%" type="text" placeholder="Enter Username" id="username" name="username" /><br>
			<small>Error message</small>
		</div>
		<div class="form-control">
			<label for="password">Password</label><br>
			<input style="width: 95%" type="password" placeholder="Enter Password" id="password" name="password" />
			<span class="eye" onclick="myFunction()">
			<i id="hide1" class="fa fa-eye"></i>
			<i id="hide2" class="fa fa-eye-slash"></i>
			</span>
			<small>Error message</small>
		</div>
		<input type="submit" value="Login" name="homescreen" ><br>
				
				
				<p>
					Don't have an account? <a href="studentregister.jsp">Register</a>
				</p>
			</form>
		</div>
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
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>   
	<script type="text/javascript">
	var status= document.getElementById("status").value;
	if(status=="failed") {
		swal("Sorry","Wrong Username or Password","error");
	}
	if(status=="resetSuccess") {
		swal("Congrats","Password Reset Successfully","success");
	}
	if(status=="resetFailed") {
		swal("Sorry","Password Reset Failed","error");
	}
	if(status=="success") {
		swal("Good job!","Account Created Successfully","success");
	}
	
	</script>
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