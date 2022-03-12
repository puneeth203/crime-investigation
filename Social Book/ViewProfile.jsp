<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.ObjectInputStream"%>
<%@ page import="java.io.ObjectOutputStream"%>
<%@ page import="com.database.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>

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
	String uname="";
	if(request.getAttribute("viewprofile")!=null)
	{
	 uname=request.getAttribute("viewprofile").toString();
	}
 	%>
 	
	
	<body>
				<div id="classheaddiv">
				<div style="float: left; margin-top: 15px">
					<label style="color: #F5FFFA; font-weight: bold; font-size: 50px;">
						Social Book
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
											<b>Hi :- <%=session.getAttribute("user")%></b>
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
<%--			<div style="background-color:black;color:white;font-size:25px;padding:20px;font-family:Square721 Ex BT;letter-spacing:2px;word-spacing:3px;text-align:center;">About</div></br></br>--%>
			<br/><br/>
				<div style="width: 650px;height: 550px;border: 1px solid;margin-left: 325px;">				
				<br/>
				<%
				Connection connn=null;
				PreparedStatement ps=null;
				ResultSet rs=null;
				connn = (Connection) getServletContext().getAttribute("connection");
				DatabaseConnection dbc = new DatabaseConnection();
				connn = dbc.getConnection();
				ps=connn.prepareStatement("select * from sosreg where firstname=?");
				ps.setString(1,uname);
				rs=ps.executeQuery();
				if(rs.next())
				{
					String fname=rs.getString("firstname");
					String img=rs.getString("url");
				%>
					<center>
						<div style="width: 100px;height: 100px;border: 1px solid;">
							<img alt="" src="<%=img%>" width="100px" height="100px">
						</div>
						
						<label style="font-family: sans;font-size: 18px;font-weight: bold;"><%=fname %></label>
					</center>
					<hr>
				<%}
				String school="",college="",company="",curcity="",homecity="",relationship="",mail="";
				ps=connn.prepareStatement("select * from userprofile where username=?");
				ps.setString(1,uname);
				rs=ps.executeQuery();
				if(rs.next())
				{
					school=rs.getString("school");
					mail=rs.getString("email");
					college=rs.getString("college");
					company=rs.getString("company");
					curcity=rs.getString("currentcity");
					homecity=rs.getString("hometown");
					relationship=rs.getString("relationship");
				}
				%>
				
				<center><label style="font-size: 20px;font-weight: bold;">Education</label></center>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;">Went To:</label>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;"><%=school %></label>
				<br/>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;">Went To:</label>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;"><%=college %></label>
				<hr/>
				<center><label style="font-size: 20px;font-weight: bold;">Organization</label></center>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;">Working In:</label>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;"><%=company %></label>
				<hr/>
				<center><label style="font-size: 20px;font-weight: bold;">Location</label></center>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;">Living In:</label>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;"><%=curcity %></label>
				<br/>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;">From:</label>
				<label style="font-size: 18px;font-family: sans;margin-left: 45px;"><%=homecity %></label>
				<hr/>
				<center><label style="font-size: 20px;font-weight: bold;">Status</label></center>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;">Relation Ship:</label>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;"><%=relationship %></label>
				<hr/>
				<center><label style="font-size: 20px;font-weight: bold;">Email Address</label></center>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;">Mail:</label>
				<label style="font-size: 18px;font-family: sans;margin-left: 15px;"><%=mail %></label>
				<br/></br>
				</div>
			</div>
			<br/>
			</body>
</html>