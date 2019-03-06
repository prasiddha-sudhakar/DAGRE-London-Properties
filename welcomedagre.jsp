<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Douglas and Gordon real estates</title>
</head>
<style>
table, th, td {
	border: 1px solid #eee;
	border-collapse: collapse;
	padding: 5px;
}

input {
	color: #00f;
	width: 50%;
}

body {
	font-family: "Verdana", Georgia, Serif;
}

input[type='checkbox'] {
	float: left;
	width: 20px;
}

input[type='checkbox']+label {
	display: block;
	width: 30px;
}
</style>
<script type="text/javascript">
	function checkBeforeSubmit() {
		// Check if the three key fields - first name, last name and email are not left blank
		var a = document.forms["userdetails"]["fname"].value;
		var b = document.forms["userdetails"]["lname"].value;
		var c = document.forms["userdetails"]["email"].value;
		if (a == null || a == "", b == null || b == "", c == null || c == "") {
			alert("Please fill all required fields");
			return false;
		}

		// Checking if passwords are the same
		//Store the password field objects into variables ...
		var pass1 = document.getElementById('pass1');
		var pass2 = document.getElementById('pass2');
		var returnvalue = false;
		//Store the Confimation Message Object ...
		var message = document.getElementById('confirmMessage');
		//Set the colors we will be using ...
		var goodColor = "#66cc66";
		var badColor = "#ff6666";
		//Compare the values in the password field 
		//and the confirmation field
		if (pass1.value == pass2.value) {
			//The passwords match. 
			//Set the color to the good color and inform
			//the user that they have entered the correct password 
			pass2.style.backgroundColor = goodColor;
			returnvalue = true;
		} else {
			//The passwords do not match.
			//Set the color to the bad color and
			//notify the user.
			pass2.style.backgroundColor = badColor;
			alert("Passwords do not match");
			return false;
		}

		// checking if the user agrees to Douglas and Jordon's Terms and conditions
		if (document.getElementById("tandc").checked == false) {
			return userconfirmation = confirm("Do you agree to Douglas and Gordon's Terms and Condition");
		}
		return true;
	}
</script>

<body>

	<head>
<style>
.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
	background-color: #3e8e41;
}

#myInput {
	border-box: box-sizing;
	background-image: url('searchicon.png');
	background-position: 14px 12px;
	background-repeat: no-repeat;
	font-size: 16px;
	padding: 14px 20px 12px 45px;
	border: none;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f6f6f6;
	min-width: 230px;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown a:hover {
	background-color: ff0000
}

.show {
	display: block;
}
</style>
</head>
<body>

<div class="dropdown">
<button onclick="myFunction()" class="dropbtn">Douglas and Gordon</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="#about">About</a>
  </div>
</div>

	<h1 align="center">Douglas And Gordon Real Estate Agents</h1>
	
	<script>
	/* When the user clicks on the button,
	 toggle between hiding and showing the dropdown content */
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}

	function filterFunction() {
		var input, filter, ul, li, a, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		div = document.getElementById("myDropdown");
		a = div.getElementsByTagName("a");
		for (i = 0; i < a.length; i++) {
			if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
				a[i].style.display = "";
			} else {
				a[i].style.display = "none";
			}
		}
	}
</script>
	
	<table style width=100% align="center">
		<tr>
			<td>
				<form action="dagrelogin">
					<table align="right">
						<tr>
						<!––  If the user already has an account, they will be able to login here ––>
							<td colspan="2">Existing members: Sign-in</td>
						</tr>
						<tr>
						<!–– Taking in the user's email ––>
							<td>EMail</td>
							<td><input type="email" name="email"></td>

						</tr>
						<tr>
						<!––  Taking in the user's password ––>
							<td>Password</td>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
						<!––  The user can submit their login credentials or reset them if a mistake is made to re-type the credentials ––>
							<td><input type="submit" value="Submit"></td>
							<td><input type="reset" value="Reset"></td>
						</tr>
						<!––  The forgot password mechanism would be placed here ––>
						<tr>
						<!––  Here is where the program would be extended (allowing users to login via social media) ––>
							<td colspan="2">
								<p>Login with your Social Media</p> <img src="fb.jpg"
								style="width: 100px; height: 100px;"></img> <img
								src="twitter.jpg" style="width: 100px; height: 100px;"></img> <img
								src="googleplus.png" style="width: 100px; height: 100px;"></img>
								<img src="linkedin.png" style="width: 100px; height: 100px;"></img>
							</td>
						</tr>
					</table>
				</form>
			</td>

			<td>
				<table>
					<form name="userdetails" action="dagreCreateUser"
						onsubmit="return checkBeforeSubmit()">
						<tr>
							<td colspan="2">
								<p>Not a member? Signup for the finest, highest quality
									housing suitable for you</p>
							</td>
						</tr>
						<tr>
							<td>Title</td>
							<td><select name="title">
									<option selected value="Mr">Mr</option>
									<option value="Mrs">Mrs</option>
									<option value="Ms">Ms</option>
							</select></td>
						</tr>
						<tr>
							<td>First Name<font color="red"> *</font></td>
							<td><input type="text" name="fname"></td>
						</tr>
						<tr>
							<td>Last Name<font color="red"> *</font></td>
							<td><input type="text" name="lname"></td>
						</tr>
						<tr>
							<td>Email address<font color="red"> *</font></td>
							<td><input type="email" name="email"></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="password" name="password" id="pass1"></td>
						</tr>
						<tr>
							<td>Confirm Password</td>
							<td><input type="password" name="confirm_password"
								id="pass2"returnfalse;"></td>
						</tr>
						<tr>
							<td colspan="2"><font color="red"><i>* Mandatory
										fields to complete</i></font></td>
						</tr>
						<tr>
							<td colspan="2">
								<p>
									<input type="checkbox" name="tandc" id="tandc" value="">I
									agree to Douglas and Gordon's terms and conditions</input>
								</p>
								<p>
									<input type="checkbox" name="contactme" id="contactme"
										value="N">Douglas and Gordon can contact me regarding
									relevant properties</input>
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="submit" value="Submit"></td>
							<td><input type="reset" value="Reset"></td>
						</tr>
					</form>
				</table>
			</td>
			<td align="right" valign="bottom">
				<input type="button" value="Continue as a guest" onclick="javascript:location.href='guestlogin.jsp'"></td>
		</tr>
	</table>

</body>


</html>