<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Social Network Site</title>
		<link rel="stylesheet" href="styles.css" type="text/css" />

<script>
(function() {

	// Create input element for testing
	var inputs = document.createElement('input');

	// Create the supports object
	var supports = {};

	supports.autofocus = 'autofocus' in inputs;
	supports.required = 'required' in inputs;
	supports.placeholder = 'placeholder' in inputs;

	// Fallback for autofocus attribute
	if (!supports.autofocus) {

	}

	// Fallback for required attribute
	if (!supports.required) {

	}

	// Fallback for placeholder attribute
	if (!supports.placeholder) {

	}

	// Change text inside send button on submit
	var send = document.getElementById('register-submit');
	if (send) {
		send.onclick = function() {
			this.innerHTML = '...Sending';
		}
	}

})();
</script>
<style>
body {
  background-color: #0B5345  ;

}
</style>
	</head>

	<body>
		<%
			if (session.getAttribute("status") != null) 
			{
				session.setAttribute("status", "");
			}
		%>
		<div id="container" style="background-color: #FF5733">
			<div id="header" >
				<center>
<%--				<h1>				--%>
<%----%>
<%--					Advertisement Book--%>
<%--				</h1>--%>
				<h1  style="font-family:verdana;">Social Book</h1>
				</center>

			</div>
			<div id="nav" style="color: white;background: #FF5733"  style="font-family:verdana;">
				<form name="form" method="post" action="Login"
					onsubmit="return login()">
					<table width="958" height="150"
						style="width: 958px; height: 100px;" >
						<tr>
						<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%--						<label style="font-family: sans;font-size: 16px;color: green;"><input type="radio" name="loginuser" value="Admin">Admin</label>--%>
<%--  						<b>Admin</b>&nbsp;&nbsp;<input type="radio" name="loginuser" value="Admin">--%>
  						
  					</td>
  					<td>
<%--  					<label style="font-family: sans;font-size: 16px;color: green;"><input type="radio" name="loginuser" value="User">User</label>--%>
<%--						<b>User</b>&nbsp;&nbsp;<input type="radio" name="loginuser" value="User">--%>
  						
						</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																
								<b  style="font-family:verdana;">E-Mail:</b>
								<input type="text" name="usertext" />
							</td>
							<td>
								<b  style="font-family:verdana;">Password:</b>
								<input type="password" name="passtext" />
							</td>
							<td>
								<div>
									<input type="submit" value="Sign In"  style="background-color:#D1F2EB    ;"/>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label style="font-size: 10px; margin-left: 1px; color: #FFFF00"></label>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div id="body">
				<div id="content">
					<img src="Images/nn.jpg" width="580" height="684"
						class="pic_left" />
				</div>
				<div class="sidebar">
					<ul>
						<li>
							<form name="form1" method="post" action="Register"
								onsubmit="return Submit()">
								<marquee>
								<p style="color: red;">
									${Message}
								</p>
								</marquee>
								<marquee>
								<p style="color: red;">
									${Mes}
								</p>
								</marquee>
								<h4>
									<span  style="font-family:verdana;"><b> User Registration</b>
									<br />
										<br />
									</span>
								</h4>
								<div id="errorBox"></div>
								<b>First name:</b>&nbsp;
								<input type="text" name="first" placeholder="enter your firstname" required autofocus/>
								<br />
								<br />
								<b>Last name:&nbsp;&nbsp; </b>
								<input type="text" name="last" placeholder="enter your lastname" required autofocus/>
								<br />
								<br />
								<div  style="font-family:verdana;">
									<b>Email-id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
									<input type="email" name="mail"
										placeholder="enter your mail-id" required autofocus/>
									<br />
									<br />
								</div>
								<div>
									<b>Password:</b>&nbsp;&nbsp;&nbsp;
									<input type="password" name="pass"
										placeholder="enter your password" required autofocus/>
									<br />
									<br />
								</div>
								<div>
									<b>Mobile:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</b>
									<input type="text" name="mobile"
										placeholder="enter your mobile no" required autofocus/>
									<br />
									<br />
								</div>
								<div>
									<b>Location:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
									<input type="text" name="location"
										placeholder="enter your location" required autofocus/>
								</div>
								</br>
								<b>Birthday:</b> &nbsp;&nbsp;&nbsp;&nbsp;
								<input type="date" name="birth" required autofocus/>
								</br>
								</br>
								<b>Interests: &nbsp;&nbsp;&nbsp;</b>
								<select name="interests">
									<option value="" selected="selected"></option>
									<option value="movie">
										Movie
									</option>
									<option value="books">
										Medical
									</option>
									<option value="music">
										Music
									</option>
									<option value="sports">
										Sports
									</option>
									<option value="politics">
										Politics
									</option>
									<option value="education">
										Education
									</option>
									<option value="education">
										Travel
									</option>
									<option value="education">
										Food
									</option>
									<option value="others">
										Others
									</option>
								</select>
								<br />
								<br />
								<b>Gender:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="gender" value="Male">
									<label>
										Male
									</label>
									<input type="radio" name="gender" value="Female">
										<label>
											Female
										</label>
										<p>
											<input type="submit" value="Sign Up" id="sign_user" style="background-color:#0E6655  ;"">
												<p>
													Already registered? Sign in.
												</p>
												<br/>
							</form>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</body>
</html>
