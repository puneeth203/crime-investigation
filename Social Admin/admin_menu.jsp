<%@page import="service.AdDao"%>
<%@page import="java.util.List"%>
<%@page import="model.AdPojo"%>
<!DOCTYPE HTML>
<head>
<title>Admin</title>
<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />

<script type="text/javascript">
	window.onload=function(){
		<%
		if(request.getAttribute("notification")!=null){
		%>
		document.getElementById('hell').click();
		<%}else{%>
		document.getElementById('vm').style.display='none';
		document.getElementById('videoup').style.display='block';
		<%}%>
	}
	function callVM(){
		document.getElementById('videoup').style.display='none';
		document.getElementById('vm').style.display='block';
	}
	function callHome(){
		document.getElementById('videoup').style.display='block';
		<%
		
		%>
		
		document.getElementById('vm').style.display='none';
	}
</script>	
<style>
table {
  margin-left: -590px;
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 1320px;
}
th{
background:black;
color: white;
border-radius:15px;
}
td{
border: 2px solid #dddddd;
}
td, th {
  /*border: 1px solid #dddddd;*/
  text-align: left;
  padding: 8px;
}
</style>
	</head>
	<body>
		<!---start-wrap---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				<!---start-logo---->
				<div class="logo">
					<label style="color: #2C3E50; font-weight: bold; font-size: 30px;">
						Social Yubu Admin
					</label>
				</div>
				<!---End-logo---->
				<!---start-top-menu-search---->
				<div class="top-menu">
					<div class="top-nav">
						<ul>
							<li><a href="admin_menu.jsp">Home</a></li>
							<li><a href="UserLog.jsp">Social Yubu Users</a></li>
							<li><a href="PoliceDetails.jsp">Police</a></li>
							
<%--							<li><a href="javascript:void(0)" onclick="callVM()"  id="hell">Advetisements</a></li>--%>
							<li style="margin-left: 650px"><a href="index.jsp">Signout</a></li>
						</ul>
					</div>
<%--					<div class="search">--%>
<%--						<form>--%>
<%--							<input type="text" class="textbox" value="Search:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">--%>
<%--							<input type="submit" value=" " />--%>
<%--						</form>--%>
<%--					</div>--%>
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
						<p><span style="margin-left: 150px">Welcome :-</span>&nbsp;<font style="color:#DC7633  "><b>Admin</b></font>&nbsp;...!!</p>
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
<div class="form-container1" style="margin-left: 260px">
<div id="videoup">
<br/><br/><br/><br/><br/><br/>
<%
if(request.getAttribute("msg")!=null){
	String msg=(String)request.getAttribute("msg");
%>
<div class="alert" style="width: 230px">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
 <center> <strong><%=msg %></strong></center>
</div><p>&nbsp;</p><%}%>
    <h1>CHOOSE CATEGORY AND IMAGE FOR NLP </h1>
   
<form action="AddAds" method="get" enctype="multipart/form-data">
<p style="color:#0089ff;">----------------</p><br/><br/>

<label style="color:olive">CATEGORY: <br/><br/>
 <h2>Natural Language Processing</h2>
 <br/>
<select required name="category">
<option ></option>
  <option value="Abuvice">Abusive</option>
</select>&nbsp;&nbsp;&nbsp;</label><br/><br/>


<input type="submit" style="background-color:#EDBB99;color: white;"/><br/><br/>
<br/>
<br/>
<p style="color:#0089ff;">---------------</p><br/><br/>
</form>
<form action="AddAds" method="post"  enctype="multipart/form-data">
<label style="color:olive"> Image Upload:<br/><br/>
<input type="file" name="file">&nbsp;&nbsp;&nbsp;<input type="submit" style="background-color: #EDBB99;color: white;"/></label>
<br/><br/>
<%--<img alt="" src="images/load.gif" style="height: 50px;width: 50px">Video uploading...<br/>--%>
<%--<input type="submit" style="margin-left: 35px;width: 200px;height: 30px;border-radius:10px;background: mediumvioletred;color: white; " value="Post Advertisement">--%>
<br/><br/>
</form>      
</div>
<%--<div id="vm">--%>
<%--<%--%>
<%--if(request.getAttribute("notification")!=null){--%>
<%--	String msg=(String)request.getAttribute("notification");--%>
<%--%>--%>
<%--<div class="alert" style="width: 230px">--%>
<%--  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> --%>
<%-- <center> <strong><%=msg %></strong></center>--%>
<%--</div><p>&nbsp;</p><%}%>--%>
<%----%>
<%--<%--%>
<%--AdDao adDao=new AdDao();--%>
<%--List<AdPojo> list=adDao.loadAds("");--%>
<%--if(!list.isEmpty()){%>--%>
<%--<table style="width: 1000px;margin-left: -250px">--%>
<%--<thead>--%>
<%--<tr>--%>
<%--<th><center>S.No</center></th>--%>
<%--<th><center>Advertisement</center></th>--%>
<%--<th><center>Tags</center></th>--%>
<%--<th><center>Image</center></th>--%>
<%--<th><center>Website</center></th>--%>
<%--</tr>--%>
<%--</thead>--%>
<%--<% --%>
<%--int i=1;--%>
<%--for(AdPojo adPojo:list){--%>
<%--%>--%>
<%--<tbody>--%>
<%--<tr>--%>
<%--<td><center><%=i %>.</center></td>--%>
<%--<td><center><%=adPojo.getAdName() %></center></td>--%>
<%--<td><center><%=adPojo.getAdTags() %></center></td>--%>
<%--<td><center><img src="<%=adPojo.getAdImages() %>" style="height: 30px;width: 40px"></center></td>--%>
<%--<td><center><a href="<%=adPojo.getAdLink() %>"><%=adPojo.getAdLink() %></a></center></td>--%>
<%--</tr>--%>
<%--</tbody>--%>
<%--<%i++;} %>--%>
<%--</table>--%>
<%--<%}else{%>--%>
<%--<img alt="" src="images/sorry.gif">--%>
<%--<label style="color: red">No advertisements found</label>--%>
<%--<%}%>--%>
<%--<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>--%>
<%----%>
<%--</div>--%>
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
			<p> &copy; 2020 All rights reserved </a></p>
		</div>
		<!---End-copy-right---->
		<!---End-wrap---->
	</body>
</html>

