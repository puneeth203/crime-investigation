<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">
    	<title>Social Network Site</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script src="jquery/jquery.min.js"></script>
  	</head>
	
	<%
	String img="";
	if(request.getAttribute("url")!=null)
	{
	 img=request.getAttribute("url").toString();
	}
 	%>
 	
	<%
	String st="";
	if(request.getAttribute("user")!=null)
	{
	st=request.getAttribute("user").toString();
	}
	%>
	
	<body>
			
				<div id="classheaddiv">
				<div style="float: left; margin-top: 15px">
					<label style="color: #F5FFFA; font-weight: font-family:verdana bold; font-size: 50px;">
						Social Yubu
					</label>
				</div>
				<div style="float: left; padding-top: 32px; padding-left: 85px;">
					<label onclick="loginaction()">
					</label>
				</div>				
				<div class=classlogindiv>
					<form name="f" method="post">
						<table width="200" height="70">
							<tr>
							     <td id="logoutid">
									<a href="profile.jsp" style="color: white;">Home</a>
								</td>
								<td><label style="margin-left: 10px">&nbsp;</label></td>
								<td>
									<div class="wrapusernamediv">
										<label style="font-size: 15px;color: white;">
											<b>Hi:- <%=session.getAttribute("user")%></b>
										</label>
									</div>
								</td>
								<td><label style="margin-left: 150px">&nbsp;</label></td>
								<td>
									|
								</td>
								<td id="logoutid">
									<a href="Logout" style="color: white;">Logout</a>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<marquee direction="left">
					<p style="color: red;">
						${error}
					</p>
					<p style="color: red;">
						${msg}
					</p>

				</marquee>
			</div>
			<div>
			<div style="border:1px solid #C9DB25;background-color:black;color:white;font-size:25px;padding:20px;font-family:Square721 Ex BT;letter-spacing:2px;word-spacing:3px;text-align:center;">Profile Picture</div></br></br>
			<center>
			<img style="padding-left:30px;" src=" <%=session.getAttribute("url")%>" width="200" height="200"/>
			
			
			<form action="ImageUpload" method="post" enctype="multipart/form-data">
			<input type="file" name="file"></br>
			<input class="reghover" type="submit" value="Upload File"></br>
			</form>
			</center>	
			</div>
			<div>
			<center>
<%--			<form action="profile.jsp">--%>
<%--			<input type="submit" class="reghover2" value="Enter Into Your Profile Page"/>--%>
<%--			</form>--%>
			<form action="About.jsp">
			<input type="submit" class="reghover2" value="Add Profile"/>
			</form>
			</center>
			</div>
			</body>
</html>