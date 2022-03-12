<!DOCTYPE HTML>
	<head>
		<title>Admin</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
	</head>
	<body>
		<!---start-wrap---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				<!---start-logo---->
				<div class="logo">
					<label style="color: #212F3D  ; font-weight: bold; font-size: 30px;">
						Social Yubu Admin
					</label>
				</div>
				<!---End-logo---->
				<!---start-top-menu-search---->
				<div class="top-menu">
					<div class="top-nav">
						<ul>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="javascript:void(0)" style="color: black;">Admin Login</a></li>
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
							<li><img src="images/ad.jpg" style="height: 600px;width: 250px"/></li>
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
						

<div>

<div class="form-container1">
<br/><br/>
<p style="font-size: 30px;margin-left: 100px font-family : verdana ">ADMIN LOGIN</p><hr/><br/>
   <%
if(request.getAttribute("msg")!=null){
	String msg=(String)request.getAttribute("msg");
%>
<div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%=msg %></strong>
</div><p>&nbsp;</p>
<%}%>
     <form action="Admin" method="post">
      <label>Admin Email
      <input type="email" name="email"  required style="border-color: gray;">
      </label>
      <label>Admin password
      <input type="password" placeholder="&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;&#8226;" name="password"  required style="border-color: gray;">
      </label>
      <label>&nbsp;</label>
      <label>
      <input type="submit" style="background:#F8C471  ;height: 40px;width: 180px;color: white;border-radius:10px" value="Sign In">
      </label>
      </form>
</div>


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
</html>

