<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.database.DatabaseConnection"%>

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
	HttpSession hs=request.getSession(false);
	String email=(String)hs.getAttribute("email");
	String img="";
	if(request.getAttribute("status")!=null)
	{
	 img=request.getAttribute("status").toString();
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
					<label style="color: #F5FFFA; font-family:verdana font-weight: bold; font-size: 50px;">
						Social Book
					</label>
				</div>
				<div style="float: left; padding-top: 32px; padding-left: 85px;">
					<label onclick="log inaction()">
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
					<p style="color: blue;">
						${error}
					</p>
					<p style="color: blue;">
						${msg}
					</p>
				</marquee>
			</div>
			<div>
			<br/><br/>
			
				<div style="width: 500px;height: 650px;border: 1px solid;margin-left: 400px; align : center">				
				<br/>
				<%
				Connection cone = (Connection) getServletContext().getAttribute("connection");
				DatabaseConnection databaseConnection = new DatabaseConnection();
				cone = databaseConnection.getConnection();
				//System.out.println("coneccton--*1*---"+cone);
				Statement stmet = cone.createStatement();
				String query="select * from userprofile where email='"+email+"'";
				ResultSet rs=stmet.executeQuery(query);
				String username="";
				String school="";
				String college="";
				String company="";
				String currentcity="";
				String hometown="";
				String relationship="";
				while(rs.next()){
					username=rs.getString("username");
					school=rs.getString("school");
					college=rs.getString("college");
					company=rs.getString("company");
					currentcity=rs.getString("currentcity");
					hometown=rs.getString("hometown");
					relationship=rs.getString("relationship");
				}%>
				<form action="About" method="post"> 
					<img src="Images/Grad.png" width="25" height="25" style="margin-left: 15px;"/>
					<input type="text" name="school" style="width: 450px;height:35px;font-size: 18px;color: black;font-family: sans;margin-left: 15px;"placeholder="School" required value="<%=school %>">
					<br/>
					<img src="Images/Grad.png" width="25" height="25" style="margin-left: 15px;"/>
					<br/>
					<input type="text" name="college" style="width: 450px;height:35px;font-size: 18px;color: black;font-family: sans;margin-left: 15px;"placeholder="College" required value="<%= college%>">
					<br/>
					<img src="Images/work.png" width="25" height="25" style="margin-left: 15px;"/><br/><br/>
					<input type="text" name="company" style="width: 450px;height:35px;font-size: 18px;color: black;font-family: sans;margin-left: 15px;"placeholder="Working At" required value="<%=company %>">
					<br/>
					<img src="Images/home.png" width="25" height="25" style="margin-left: 15px;"/><br/><br/>
					<input type="text" name="livesin" style="width: 450px;height:35px;font-size: 18px;color: black;font-family: sans;margin-left: 15px;"placeholder="Lives In" required value="<%=currentcity %>">
					<br/>
					<img src="Images/Location.png" width="25" height="25" style="margin-left: 15px;"/><br/><br/>
					<input type="text" name="hometown" style="width: 450px;height:35px;font-size: 18px;color: black;font-family: sans;margin-left: 15px;"placeholder="Home Town" required value="<%=hometown %>">
					<br/>
					<img src="Images/relation.png" width="25" height="25" style="margin-left: 15px;"/><br/><br/>
					<input type="text" name="relation" style="width: 450px;height:35px;font-size: 18px;color: black;font-family: sans;margin-left: 15px;"placeholder="RelationShip" required value="<%=relationship %>">
					<br/><br/>
					<center>
					<input type="submit" value="SUBMIT" style="font-family: sans;font-family: sans;font-size: 18px;font-weight: bold;width: 100px;cursor: pointer;">
					</center>
					</form>
					
				</div>
			</div>
			
			</body>
</html>