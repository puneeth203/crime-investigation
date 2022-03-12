<%@page import="service.AdDao"%>
<%@page import="java.util.List"%>
<%@page import="model.UserPojo"%>
<%@page import="com.Dao.Daoconnection"%>
<%@page import="model.SocaldataReq"%>
<!DOCTYPE HTML>
	<head>
		<title>Admin</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
	</head>
<link rel="stylesheet" href="css/Table.css" type="text/css"></link>
	<body>
		<!---start-wrap---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				<!---start-logo---->
				<div class="logo">
					<label style="color: #17202A  ; font-weight: bold; font-size: 30px;">
						Social Yubu Admin
					</label>
				</div>
				<!---End-logo---->
				<!---start-top-menu-search---->
				<div class="top-menu">
					<div class="top-nav">
						<ul>
							<li><a href="admin_menu.jsp">Home</a></li>
							<li><a href="UserLog.jsp">Social Users</a></li>
							<li><a href="PoliceDetails.jsp">Police </a></li>
							<li style="margin-left: 650px"><a href="index.jsp">Signout</a></li>
						</ul>
					</div>
					<div class="search">
						
					</div>
					<div class="clear"> </div>
				</div>
				<div class="clear"> </div>
				<!---End-top-menu-search---->
			</div>
			<!---End-header---->
		</div>
		<div class="clear"> </div>
		<!---start-content---->
		<div class="main-content">
			<div class="wrap">
			<div class="left-sidebar">
				<div class="sidebar-boxs">
					<div class="clear"> </div>
					<div class="type-videos">
						<h3></h3>
						<ul>
							<br/>
							<li><img src="images/ad.jpg" style="height: 475px;width: 250px"/></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="right-content">
				<div class="right-content-heading">
					<div class="right-content-heading-left">
						<h3> </h3>
					</div>
					<div class="right-content-heading-right">
						<div class="social-icons">
			                <ul>
			                    <li><a class="facebook" href="#" target="_blank"> </a></li>
			                    <li><a class="twitter" href="#" target="_blank"></a></li>
			                    <li><a class="googleplus" href="#" target="_blank"></a></li>
			                    <li><a class="pinterest" href="#" target="_blank"></a></li>
			                    <li><a class="dribbble" href="#" target="_blank"></a></li>
			                    <li><a class="vimeo" href="#" target="_blank"></a></li>
			                </ul>
					</div>
					</div>
					<div class="clear"> </div>
				</div>
				<div class="section group">		
				<h1 align="center" style="font-size: 30px; font-family:Arial">Police Investigation</h1><br/><br/>	<br/>		
				
				<%String mrg=(String)request.getAttribute("msg"); 
				if(mrg!=null){%>
				<h3 align="center"><%=mrg %>   </h3>
				<%	
				}
				%>
						
 <table id="customers">
  <tr>
    <th>PoliceName</th>
    <th>Criminal Name</th>
    <th>Date</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Status</th>
    <th>Click</th>
    <th>Chat Data</th>
    
    
  </tr>
  <%
  Daoconnection dao = new Daoconnection();
  List<SocaldataReq> list = dao.getPoliceDetails();
	for (SocaldataReq userPojo : list) {
  %>
          <tr>
          <td><%=userPojo.getPolicename() %></td>
          <td><%=userPojo.getName() %></td>
          <td><%=userPojo.getDate() %></td>
          <td><%=userPojo.getEmail()%></td>
          <td><%=userPojo.getPhone()%></td>
          <td><%=userPojo.getStatus()%></td>
          <%if(userPojo.getStatus().equals("pending") ){%>
        	  <td><a href="CriminalDataCollection?cname=<%=userPojo.getName()%>&cemail=<%=userPojo.getEmail()%>&cphone=<%=userPojo.getPhone() %>">Process</a></td>
         <% }else { %> 
         <td><img src="images/right.png" width="30px"></img></td>
        <%} %>
          <td><a href="ChatingDataCollection?email=<%=userPojo.getEmail()%>&cname=<%=userPojo.getName()%>"><button style="background-color: aqua">click here...</button></a></td>
          </tr>
          <%} %>
                 </table>
                <div>
               </div>				
			  </div>
			 </div>
			<div class="clear"> </div>
			</div>
		</div>
		<div class="clear"> </div>
		<!---End-content---->
		<!---start-copy-right---->
		<div class="copy-right">
			<p> &copy; 2019 All rights reserved</p>
		</div>
		<!---End-copy-right---->
		<!---End-wrap---->
	</body>

