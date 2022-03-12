
<%@page import="service.AdDao"%>
<%@page import="java.util.List"%>
<%@page import="model.UserPojo"%>
<%@page import="com.Dao.Daoconnection"%>
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
					<label style="color: #2C3E50  ; font-weight: bold; font-size: 30px;">
						Social yubu Admin
					</label>
				</div>
				<!---End-logo---->
				<!---start-top-menu-search---->
				<div class="top-menu">
					<div class="top-nav">
						<ul>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="PoliceDetails.jsp">Police</a></li>
							<li><a href="javascript:void(0)">&nbsp;</a></li>
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
				<h1 align="center" style="font-size: 30px; font-family:Arial">Social Yubu  User</h1>	<br/><br/>	<br/>		
						
 <table id="customers">
  <tr>
    <th>FristName</th>
    <th>LastName</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Location</th>
    <th>BirthDate</th>
    <th>Gender</th>
    <th>Interest</th>
  </tr>
  <%
  Daoconnection dao = new Daoconnection();
  List<UserPojo> list = dao.getSocialUserDetails();
	for (UserPojo userPojo : list) {
  %>
          <tr>
          <td><%=userPojo.getFristName() %></td>
          <td><%=userPojo.getLastName() %></td>
          <td><%=userPojo.getEmail() %></td>
          <td><%=userPojo.getMobile() %></td>
          <td><%=userPojo.getLocation() %></td>
          <td><%=userPojo.getBirthdate() %></td>  
          <td><%=userPojo.getGender()%></td>
          <td><%=userPojo.getInterset()%></td>
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

