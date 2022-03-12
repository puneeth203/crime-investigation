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
<%@page import="com.database.UserDao"%>
<%@page import="com.Module.Massagepojo"%>

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
		<style>
p {
  border-left: 6px solid red;
  background-color: lightgrey;
}
</style>
  	<link rel="stylesheet" href="css/msg.css" type="text/css"></link></head>
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
			
				<%
				String image=(String)request.getAttribute("image");
				String name=(String)request.getAttribute("sname");
				String sender=(String)request.getAttribute("sendername");
				
				System.out.print("-------------------------------|||||||||"+image);
				%>
<%--					<center>--%>
<%--						<div style="width: 100px;height: 100px;border: 1px solid;">--%>
<%--							<img alt="" src="<%=image%>" width="100px" height="100px">--%>
<%--						</div>--%>
<%--						--%>
<%--						<label style="font-family: sans;font-size: 18px;font-weight: bold;"></label>--%>
<%--					</center>  --%>
					<hr>
				
		<div>		
				
<div class="chat">
               
  <div class="mine messages">
    <div class="message last">
    <%	UserDao dao=new UserDao();
               String mass=null;
				List<Massagepojo> list=dao.getMassageDetails();
				for(Massagepojo massage:list){
					mass=massage.getLog();
       %>
       <p><%=mass %></p>
      <%} %>
     </div>
  </div>
  <div class="yours messages">
    <div class="message">
      <br>
    </div>
    
  </div>
</div>
	</div>				
				<form action="Massage" method="get">
				<div align="right">
				<input type="hidden" value="<%=image%>" name="image">
				<input type="hidden" value="<%=name%>" name="name">
				<input type="hidden" value="<%=sender%>" name="sendername">
				<h2><input type="text" name="massage"><button>Send</button></h2></div>
				</form>
				<br/></br>
			
			<br/>
		
			</body>
</html>