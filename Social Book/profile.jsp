<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.ObjectInputStream"%>
<%@ page import="java.io.ObjectOutputStream"%>
<%@ page import="com.logic.AllPoster"%>
<%@ page import="com.database.DatabaseConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.logic.Post"%>
<%@page import="com.logic.Friends"%>
<%@page import="org.codehaus.jettison.json.JSONArray"%>
<%@page import="org.codehaus.jettison.json.JSONObject"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script src="jquery/jquery.min.js">
</script>
		<script src="ajax/ajax.js">
</script>
		<script type="text/javascript" src="js/cufon-yui.js">
</script>
		<script type="text/javascript" src="js/arial.js">
</script>
		<script type="text/javascript" src="js/cuf_run.js">
</script>
		<script type="text/javascript" src="js/jquery.form.js">
</script>
		<script type="text/javascript" src="js/jquery.js">
</script>
		<script type="text/javascript" src="js/jquery.MetaData.js">
</script>
		<script type="text/javascript" src="js/jquery.rating.js">
</script>
<script type="text/javascript" src="js/jquery.rating.pack.js">
</script>
<link rel="stylesheet" type="text/css" href="css/jquery.rating.css">
<link rel="stylesheet" type="text/css" href="css/slide.css">
<script type="text/javascript" src="js.slide.js"></script>
<script type="text/javascript">
function callPost() {
	if (document.getElementById("textareaid").value == "") 
	{
	} 
	else 
	{	
		var url = "Post?posttext="
				+ document.getElementById("textareaid").value
				+ "&cmlink=postlink";
		makePostRequest(url);
		alert("Post Successfully Posted...");
	}
}

var request; 
function statusPost()
{
	var a=document.getElementById("textareaid").value;
	
var url = "Post?posttext="+ a + "&cmlink=postlink";
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
try{  
request.onreadystatechange=statusReponse;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function statusReponse(){  
if(request.readyState==4){  
var val=request.responseText;
if(val=='. Your account is blocked'){
	document.getElementById('closelab').click();
	document.getElementById('postResponse').innerHTML="Your account is blocked due to postnig spam content contineously"; 
	 setTimeout(
    function() {window.location="index.jsp";
     
    }, 2000);
	
}else{
	document.getElementById('closelab').click();
	document.getElementById('postResponse').innerHTML=val;  
   setTimeout(
    function() { location.reload();
  	}, 2000);	
}

} 
}

function commentfunc(ptext, a1, a2, a3, a4, a5, a6, a7, a8, sno) {
<%--	alert("ptext" + ptext,a1, a2, a3, a4, a5, a6, a7, a8, sno);--%>
	if (document.getElementById(a1).value == "") {
		
	} else {
		var url = "Post?posttext=" + ptext + "&commentpost="
				+ document.getElementById(a1).value + "&spid1=" + a2 + "&mail="
				+ a3 + "&datee=" + a4 + "&timee=" + a5
				+ "&cmlink=commentpostlink" + "&whocomment=" + a7 + "&ppic="
				+ a8;
		makeCommentPostRequest(url, a1, a6, sno);
	}
}
</script>

<script>
function likemethod(postowner, post, likdusr, lidd) {
	var status = "";
	if (document.getElementById(lidd).innerHTML == "Unlike") {
		status = "Unlike"
		document.getElementById(lidd).innerHTML = "Like"
	} else {
		status = "Like"
		document.getElementById(lidd).innerHTML = "Unlike"
	}
	var str = "Likhandler?pownr=" + postowner + "&post=" + post + "&likdusr="
			+ likdusr + "&status=" + status;
	makeLikePostRequest(str);
}

function callaccept(str1) {

	document.fname1.msg.value = str1;
	document.fname1.action = "Accept";
	document.fname1.submit();
}

function calldecline() {
	$("#inboxdiv").hide();
}
	function recievedpost()
	{		
		//var url ="ReceivedPost?name=post";
		//makerecPostRequest(url);
			document.fname.action = "ReceivedPost";
			document.fname.submit();
		
	}
	function recpostresponse(received)
	{
		var myfrndpost=received.toString();
		alert(myfrndpost);
		$("#mainpostdiv").hide();
		//$("#mainpostdivinside").hide();
		$("#recpostid").show();
		var lab=Document.getElementById("postlab");
		lab.innerHTML=myfrndpost;
	}
	function fakedetails()
	{
		document.fname.action = "GiveFakeMessage";
		document.fname.submit();
		
	}
function callLab(str) {
	$("#postdiv1").fadeToggle();
	document.fname.request.value = str;
	document.fname.action = "Friends";
	document.fname.submit();
}
function callLababout(str) {
	$("#postdiv1").fadeToggle();
	document.fabout.request.value = str;
	document.fabout.action = "Friends";
	document.fabout.submit();
}
function callShare(usr, postmsg,postedname) {
	document.fn1.postby.value = postedname;
	document.fn1.postmsg.value = postmsg;
	document.fn1.sharedby.value = usr;
	//document.fn1.action = "Time";	
	document.fn1.action = "Share";
	document.fn1.submit();
	//var url = "Share?postmsg=heloo";
	//	makeShareRequest(url);
}
function callfakemessage(usr, postmsg,postedname) {
	document.fn1.postby.value = postedname;
	document.fn1.postmsg.value = postmsg;
	document.fn1.sharedby.value = usr;
	//document.fn1.action = "Time";	
	document.fn1.action = "FakeMessage";
	document.fn1.submit();
	//var url = "Share?postmsg=heloo";
	//	makeShareRequest(url);
}

function callsh(str6, str7) {
	document.ff.names.value = str6;
	document.ff.share.value = str7;
	document.ff.action = "Sharing";
	document.ff.submit();
}

function Cal(r, p) {
	document.fn1.rate.value = r;
	document.fn1.info.value = p;
	document.fn1.action = "Rating";
	document.fn1.submit();
}

function callmsg(str4, str5) {
	var person = prompt("Enter TTL Hop Limit", "");
	document.fnn.name.value = str4;
	document.fnn.ques.value = str5;
	document.fnn.total.value = person;
	document.fnn.action = "Message";
	document.fnn.submit();
}

function callrep() {
	document.rep.action = "Reply";
	document.rep.submit();
}


function callfakepost()
{
	if (document.getElementById("ftextareaid").value == "") 
	{
	} 
	else
	{		
		var url = "FakeMessage?sharedby="
		         +document.getElementById("userfid").value
		         +"&postmsg="
				+ document.getElementById("ftextareaid").value;
		Fakemessage(url);	
		$("#fakediv").hide();
				
	}
}
function fakepostresponse(response)
{

}
function clearfunc() {
	document.getElementById("textareaid").value = "";
}
function fclearfunc() {
	document.getElementById("ftextareaid").value = "";
}
</script>
<script>
$(document).ready(function() {		
	$("#shortchatdiv").hide();
	$("#postdiv").hide();
	$("#postdiv1").hide();
	$("#groupdiv").hide();
	$("#inboxdiv").hide();
	$("#friendsdiv").hide();
	$("#replydiv").hide();
	$("#recpostid").hide();
	$("#fakemsgdiv").hide();
	$("#fakediv").hide();
	$("#fakerespdiv").hide();
	
<%--	$("#sharediv").hide();--%>
	
	$("#writelab").click(function() {
		$("#postdiv").show();
		document.getElementById("textareaid").value = "";
	});
	
	$("#grouplab").click(function() {
		$("#groupdiv").fadeToggle();
	});
	
	$("#inboxlab").click(function() {
		$("#inboxdiv").fadeToggle();
	});
	
	$("#friendslab").click(function() {
		$("#friendsdiv").fadeToggle();
	});
	
	$("#fakelab").click(function() {
		$("#fakemsgdiv").fadeToggle();
	});
	
	$("#fakepostlab").click(function()
		{
		$("#fakediv").fadeToggle();
		});
	$("#fakeresplab").click(function()
		{
		$("#fakerespdiv").fadeToggle();
		});
	
	$("#replyhead").click(function() {
		$("#replydiv").fadeToggle();
	});
	
<%--	$("#sharelab").click(function() {--%>
<%--		$("#sharediv").fadeToggle();--%>
<%--	});--%>
	
	$("#closelab").click(function() {
		$("#postdiv").hide();
		document.getElementById("textareaid").value = "";
	});
	
	$("#closelab1").click(function() {
		$("#groupdiv").hide();
	});
	$("#frndsidvclose").click(function() {
		$("#friendsdiv").hide();
	});
	$("#fakemsgidvclose").click(function() {
		$("#fakemsgdiv").hide();
	});
	$("#fakecloselab").click(function()
	{
		$("#fakediv").hide();
	});
	$("#fakerespcloselab").click(function()
	{
		$("#fakerespdiv").hide();
	});
	$("#inboxdivclose").click(function() {
		$("#inboxdiv").hide();
	});
	$("#sharelab").click(function() {
		$("#chathead2").show();
	});

	$("#chathead").click(function() {
		$("#shortchatdiv").show();
	});
	
	$("#chathead1").click(function() {
		$("inboxdiv").hide();
	});

	$("#shortchatdiv").click(function() {
		$("#chatdiv").show();
		$("#shortchatdiv").hide();
	});
	
	$("#commid0").click(function() {
		$("#commentme0").slideToggle("slow");
	});
	$("#commid1").click(function() {
		$("#commentme1").slideToggle("slow");
	});
	$("#commid2").click(function() {
		$("#commentme2").slideToggle("slow");
	});
	$("#commid3").click(function() {
		$("#commentme3").slideToggle("slow");
	});
	$("#commid4").click(function() {
		$("#commentme4").slideToggle("slow");
	});
	$("#commid5").click(function() {
		$("#commentme5").slideToggle("slow");
	});
	$("#commid6").click(function() {
		$("#commentme6").slideToggle("slow");
	});
	$("#commid7").click(function() {
		$("#commentme7").slideToggle("slow");
	});
	$("#commid8").click(function() {
		$("#commentme8").slideToggle("slow");
	});
	$("#commid9").click(function() {
		$("#commentme9").slideToggle("slow");
	});
	$("#commid10").click(function() {
		$("#commentme10").slideToggle("slow");
	});
});

function ajaxPostRequestUpdated() {	
	$("#postdiv").fadeOut(400);
}

function loginaction() {
	document.fo.action = "ImageUpload";
	document.fo.submit();
}
function getcommets(sno, id) {
	//alert("hello-->" + sno);
	//alert("hello-->" + id);
}

</script>
<%
HttpSession hss=request.getSession(false);
String email=(String)hss.getAttribute("email");
%>

	</head>
	<body onload="online()">
		<div id="container">
			<!--HEADER DIV-->
			<form name="fo" method="get">
			</form>
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
									<a href="javascript:void(0)" style="color: white;">Home</a>
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
			<!--BODY DIV-->
			<div id="bodydiv">
				<div id="contentdiv">
					<!--LEFT SIDE DIV-->
					<div id="leftsidediv">
						<div class="mainleftdiv">
							<table>
								<tr>
									<td>
										<img alt="" src="<%=session.getAttribute("url")%>"
											width="90px" height="90px;">
									</td>
								</tr>
								<tr>
									<td>
										<a href="upload.jsp" class="editlab" style="color: black;">Change profile picture</a><hr/>
										<a href="About.jsp" style="color: black;">Add Bio Info</a><hr/>
									</td>
								</tr>
							</table>
							<br />
							<br />
<%--							<div id="chathead2">--%>
<%--								&nbsp;&nbsp;Matched &nbsp;&nbsp;&nbsp;Friends--%>
<%--							</div>--%>
							<%
								String nn;
								Vector name = (Vector) request.getAttribute("name");
								if (request.getAttribute("post") != null) {
									String ques = request.getAttribute("post").toString();
									System.out.println("profile names============>" + name);
									System.out.println("post details=============>" + ques);
									if (name != null) {
										nn = name.toString().replace("[", "").replace("]", "");
										System.out.println("profile ============>" + nn);
							%>
							<label id="sharehead"
								style="color: black; font-size: 13px; font-family: sans-serif;"
								onclick="callmsg('<%=nn%>','<%=ques%>')">
								<p style="color: black; font-size: 15px; font-weight: bold;">
									&nbsp;&nbsp;&nbsp;&nbsp;<%=nn%></p>
							</label>
							<%
								} 
								else 
								{
									System.out.println("inside else in jsp");
									String wrong = "No Friends Name found";
								%>
								<label
									style="color: black; font-size: 13px; font-family: sans-serif;"><%=wrong%></label>
								<%
								}
							}
							%>
							<form name="fnn">
								<input type="hidden" name="name" />
								<input type="hidden" name="ques">
								<input type="hidden" name="total" />
							</form>

							<%
								String nn1;
								Vector<String> name1 = (Vector) request.getAttribute("name1");
								if (request.getAttribute("post1") != null) 
								{
									String ques1 = request.getAttribute("post1").toString();
									System.out.println("profile names1============>" + name1);
									System.out.println("post details1=============>" + ques1);
									if (!name1.equals("null"))
									{
										nn1 = name1.toString().replace("[", "").replace("]", "");
										System.out.println("profile1 ============>" + nn1);
										%>
										<p style="color: black; font-size: 12px; font-weight: bold;"><%=nn1%></p>
										<%
									} 
									else 
									{
										System.out.println("inside else");
										String error = "No Friends Name found";
										%>
										<label
											style="color: black; font-size: 13px; font-family: sans-serif;"><%=error%></label>
										<%
									}
								}
							%>
						</div>
					</div>


					<!--MIDDLE DIV-->
					<div id="middlediv">
						<div class="mainhead">
							<table id="tableid">
								<tr>
								<td><label  style="font-size: 18px;"><a href="ViewAbout?uname=<%=session.getAttribute("user")%>" style="color: black;">Profile</a></label></td>
									<%--<td><label id="writelab" onclick="callPost1()">check</label></td>--%>
									<td>
										<label id="writelab" style="font-size: 18px;">
											Status
										</label>
										<%
											String rqst = "", frnd = "",fakemsg="";
											Vector vec = new Vector();
											Vector vec1 = new Vector();											
											int count = 0, count1 = 0,fakecount=0;
											//System.out.println("TEST" +getServletContext()==null);
											Connection cone = (Connection) getServletContext().getAttribute(
													"connection");
																		
											DatabaseConnection databaseConnection = new DatabaseConnection();
											cone = databaseConnection.getConnection();
											//System.out.println("coneccton--*1*---"+cone);
											Statement stmet = cone.createStatement();
											String requ = "select request,friends from sosreg where firstname='"
													+ session.getAttribute("user") + "'";
											ResultSet rs = stmet.executeQuery(requ);
											while (rs.next())
											{
												rqst = rs.getString("request");
												frnd = rs.getString("friends");
											}
											if (!rqst.equals("null")) 
											{
												if(frnd.contains(","))
												{
													String rq[] = rqst.split(",");
													for (int r = 0; r < rq.length; r++)
													{
														//System.out.println("---request is----"+rq);
														vec.add(rq[r]);
														count = count + 1;
													}													
												}
												else
												{
													vec.add(rqst);
													count = count + 1;	
												}
																																		
											}											
											if (!frnd.equals("null"))
											{
												if(frnd.contains(","))
												{
													String fri[] = frnd.split(",");
													for (int f = 0; f < fri.length; f++)
													{
														vec1.add(fri[f]);
														count1 = count1 + 1;
													}
												}
												else
												{
													vec1.add(frnd);
													count1 = count1 + 1;
												}												
											}		
											
										
										%>
									</td>
									<td>
										<label id="inboxlab" style="font-size: 18px;">
											Friend Requests
										</label>
										<label style="color: red; font-size: 15px;">
											[<%=count%>]
										</label>
									</td>
									<td>
										<label id="friendslab" style="font-size: 18px;">
											Friends
										</label>
										<label style="color: red; font-size: 15px;">
											[<%=count1%>]
										</label>
									</td>
								</tr>
							</table>
							<center>
							<p style="color: blue;">
								<b id="postResponse">${Message}</b>
							</p>
							<%
							if(request.getAttribute("msgs")!=null){
							%>
							<p style="color: blue;">
								<b id="postResponses">${msgs}</b>
							</p>
							<script type="text/javascript">
							setInterval(function(){
								document.getElementById('postResponses').style.display='none';
							},2000)
							
							</script>
							<%}%>
							</center>
<%--							<div>--%>
<%--							<center><label id="statlabid" style="background-color:red;--%>
<%--							font-family:sans-serif;	font-size:16px;color:white;"></label></center></div>--%>
						</div>
						<hr />
						<!--MIDDLE DIV POST DIV-->
						<div id="mainpostdiv">
							<div>							
								<label>
									<%--Shared Message--%>
									<%
										String ra = null;
										String ra1[] = new String[100];
										int x;
										if (request.getAttribute("pnames") != null) {
											String pu = request.getAttribute("pnames").toString();
											String rec = request.getAttribute("postt").toString();
											String ima = request.getAttribute("image").toString();
											if (rec != null) {
												ra = rec.toString().replace("[", "").replace("]", "");
												System.out.println("SHARED Post IN -------"+ra);
											}
											String pn[] = pu.split(",");
											String d = "";
											for (x = 0; x < pn.length; x++) {
									%>
									<div style="float: left; padding-left: 4px;">
										<img src="<%=ima%>" width=38px; height=38px;></img>
									</div>
									&nbsp;&nbsp;
									<label style="color: #3B5999; font-weight: bold; font-size: 20px;"><%=pn[x]%></label>
									&nbsp;
									<label style="font-size: 15px; font-style: bold;">
										Shared a post
									</label>
									</br>
									<%
										d = pn[x];
												if (ra.contains(",")) {
													ra1 = ra.split(",");
												} else {
													ra1[0] = ra;
												}
									%>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label>
										|
									</label>
									<label id="spid1" style="color: #737373; font-size: 18px;"><%=ra1[x]%></label>
									<label id="sharelab" style="font-size: 15px; color: #3B5999"
										onclick="callsh('<%=pn[x]%>','<%=ra1[x]%>')">
										</br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share
										&nbsp;&nbsp;&nbsp;
									</label>
									<label id="replyhead" style="font-size: 15px; color: #3B5999">
										Reply
									</label>
									</br>
									</br>
									<%
										}
									%>
									<div id="replydiv">
										<form name="rep" action="" onsubmit="callrep()">
											<input type="text" cols="65" class="textcomment"
												placeholder="Write your Reply..." name="msg" value=""
												size="400" maxlength="50"
												style="margin-left: 7px; width: 400px;">
											<input type="hidden" name="nam" value="<%=d%>" />
											<input type="hidden" name="sm" value="<%=ra1[x]%>" />
										</form>
									</div>
								</label>
								<form name="ff">
									<input type="hidden" name="names" />
									<input type="hidden" name="share" />
								</form>
								<%
									}
								%>
								<%--End of Shared Message--%>
							</div>
							</br>
							<div>
								<label>
									<%--Reply Message--%>
									<%
										String raa1 = null;
										String pa1[] = new String[100];
										int y;
										if (request.getAttribute("rnames") != null) 
										{
											String rn = request.getAttribute("rnames").toString();
											String rept = request.getAttribute("reptxt").toString();
											if (request.getAttribute("image1") != null) 
											{
												String ima1 = request.getAttribute("image1").toString();
												if (!rept.equals("null")) 
												{
													raa1 = rept.toString().replace("[", "")
															.replace("]", "");
													String rn1[] = rn.split(",");
													for (y = 0; y < rn1.length; y++) 
													{
														%>
														<div style="float: left; padding-left: 5px;">
															<img src="<%=ima1%>" width=38px; height=38px;></img>
														</div>
														&nbsp;&nbsp;&nbsp;
														<labe lstyle="color: #3B5999; font-weight: bold; font-size: 20px;"><%=rn1[y]%></label>
														<label style="font-size: 15px; font-style: bold;">
															Replied for your message
														</label>
														</br>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<label>
															|
														</label>
														<%
															if (raa1.contains(",")) 
															{
																pa1 = raa1.split(",");
															}
															else {
																	pa1[0] = raa1;
																}
														%>
														&nbsp;
														<label id="spid1"
															style="color: #737373; font-size: 18px; font-weight: bold;"><%=pa1[y]%></label>
														</br>
														</br>
					
					
														<%
													}
												}
											}
										}
									%>
									<%--End of Reply Message--%>
								</label>								
							</div>
							<%
								System.out.println("checking,................");																
								Connection con = (Connection) getServletContext().getAttribute(
										"connection");
								DatabaseConnection databaseConnectionn = new DatabaseConnection();
								con = databaseConnectionn.getConnection();
								Statement stt = con.createStatement();
								//System.out.println("coneccton--*2*---"+con);
											Vector userfrndvec=new Vector();
												String sqll = "select friends from sosreg where firstname='"
														+(String)session.getAttribute("user") + "'";
												ResultSet rset = stt.executeQuery(sqll);
												if (rset.next())
												{
													String usrlist = rset.getString("friends")+","+(String)session.getAttribute("user");	
													if(usrlist!=null)
													{
														StringTokenizer st=new StringTokenizer(usrlist,",");
														while(st.hasMoreTokens())
														{
															userfrndvec.add(st.nextToken());
														}	
													}
												}
												System.out.println("USER LIST------"+userfrndvec);
								//AllPoster ap = new AllPoster();
								Post allpost=new Post();								
								Statement st = con.createStatement();								
								
								Vector<String> detail = allpost.friendspost(session.getAttribute("user").toString());
								
							%>
							<%		
								String fakeshare="",fakemessage="",username="";		
								Vector<String> fakemsgvec=new Vector<String>();
								Connection conect= (Connection) getServletContext().getAttribute("connection");								
								DatabaseConnection dbscn=new DatabaseConnection();
								conect=dbscn.getConnection();							
								
								for (int d = 0; d < detail.size(); d++)
								{
									String post = detail.get(d).toString();							
									StringTokenizer str=new StringTokenizer(post,"$");
									Vector singleidvec=new Vector();
									while(str.hasMoreTokens())
										{
											singleidvec.add(str.nextToken());
										}	
										for (int i = 0; i < singleidvec.size(); i++) 
										{
											if(!userfrndvec.isEmpty())
											{
															if(userfrndvec.contains(singleidvec.get(i)))
														{															
																	%>												
																			<div id="mainpostdivinside">
																			<div style="float: left; margin-left: 5px;">											
																				<div style="float: left;">							
																			<img src="<%=singleidvec.get(3)%>" width=38px; height=38px;></img>							
																		</div>
																		<%--			<div>--%>
																		<%--			<p style="color: red;">${questions}	</p>--%>
																		<%--			</div>--%>
																		<div id="mainsubdivcomment<%=d%>"
																			style="float: left; margin-left: 10px; width: 650px; color: black;">
																			<label
																				style="color: #3B5999; font-weight: bold; font-size: 13px;"><%=singleidvec.get(2)%></label>
																			updated a status
																			</br>
																			<table id="tablecommentid">
																				<tr>
																					<td>
																						<div style="border: 1px solid #737373; height: 12px;"></div>
																					</td>
																					<td>
																					<%
																					String sms=String.valueOf(singleidvec.get(4));
																					if(sms.contains(".png") || sms.contains(".jpg")){%>
																					<img  src="Status Images/<%=singleidvec.get(4)%>" style="height: 100px;width: 100px;">
																				  	<%}else{%>
																				   <label id="spid1" style="color: #737373; font-size: 13px;"><%=singleidvec.get(4)%></label>
																					<%}%>
																					</td>
																				</tr>
																			</table>
																
																	</br>
																	<%
																    String statup = "Like";
																	Connection conet= (Connection) getServletContext().getAttribute("connection");								
																	DatabaseConnection dbsc=new DatabaseConnection();
																	conect=dbscn.getConnection();	
																	PreparedStatement prd=conect.prepareStatement("select luser=? from sospost where username=?");
																		prd.setString(1,singleidvec.get(2).toString());	
																		prd.setString(2,singleidvec.get(4).toString());	
																		ResultSet rsa = prd.executeQuery();																	
																			while (rsa.next())
																			{
																				String usrlis = rsa.getString(1).toString();
																				System.out.println("like**************"+usrlis);
																				if(!usrlis.equals(""))
																				{
																					if (usrlis.contains((String)session.getAttribute("user"))) 
																					{
																						statup = "Unlike";
																					} 
																					else 
																					{
																						statup = "Like";
																					}
																				}
																			}
																			%>
																			<a href="javascript:void(0);" id="likeid<%=d%>"
																				style="font-size: 11px; color: #3B5999"
																				onclick="javascript:likemethod('<%=singleidvec.get(2)%>','<%=singleidvec.get(4)%>','<%=session.getAttribute("user")%>','likeid<%=d%>')"><%=statup%></a>
																			&nbsp;&nbsp;&nbsp;
																			<a href="javascript:void(0);" id="commid<%=d%>"
																				style="font-size: 11px; color: #3B5999"
																				onclick="Javascript:getcommets('<%=d%>','<%=singleidvec.get(0)%>')">Comment</a>
																			&nbsp;&nbsp;&nbsp;
																			<div id="commentme<%=d%>" style="display: none;">
																				Comment Me.......
																			</div>
																			<div id="commentmenow<%=d%>"></div>
																			<%!String str = "";
																			String userN = "";
																			String userPos = "";%>
																					<div id="maindivcommentdiv">
																				<div style="float: left; margin-left: 5px; padding: 5px;">
																					<div style="float: left;">
																						<img src="<%=session.getAttribute("url")%>" width=26px;
																							height=26px;></img>
																					</div>
																					<div id="commentdivtext"
																						style="float: left; margin-left: 7px; width: 350px;">
																						<textarea cols="63" class="textcomment"
																							id="commenttextid<%=d%>" name="commenttext"
																							placeholder="Write your comments..."
																							onKeydown="Javascript:if (event.keyCode==13)commentfunc('<%=singleidvec.get(2)%>','commenttextid<%=d%>','<%=singleidvec.get(0)%>','<%=singleidvec.get(4)%>','<%=singleidvec.get(5)%>','<%=singleidvec.get(6)%>','mainsubdivcomment<%=d%>','<%=session.getAttribute("user")%>','<%=session.getAttribute("url")%>',<%=d%>);"></textarea>
																				
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>											
																</div>	
																	<hr/>										
																<%}													
										
												}
											}
							%>							

							<!-- Rating Div -->
						
							<!-- Rating Div Ends-->
							<br />
							<%
								}												
							%>
							<form name="fn1">
								<input type="hidden" name="user">
								<input type="hidden" name="post">
								<input type="hidden" name="postby">
								<input type="hidden" name="sharedby">
								<input type="hidden" name="postmsg">
								<input type="hidden" name="rate">
								<input type="hidden" name="info">
							</form>								
						</div>
					</div>
							

					<!--RIGHT SIDE DIV-->
					<div id="rightsidediv">
						<div id="chatdiv" style="overflow: auto;">
							<div id="chathead">
								Recommended Friends
							</div>
							<div id="chatbody">
								<table>
									<%
										Connection conn = (Connection) getServletContext().getAttribute(
												"connection");
										DatabaseConnection databaseconnec = new DatabaseConnection();
										conn = databaseconnec.getConnection();
										ResultSet rsa;										
										//System.out.println("coneccton--*3*---"+conn);		
												String[] frnds=null;												
												PreparedStatement pstat=conn.prepareStatement("select friends from sosreg where firstname=?");
												pstat.setString(1,session.getAttribute("user").toString());
												//String que="select friends from sosreg where firstname='"+ usn + "'";
												rsa = pstat.executeQuery();		
												Vector<String> frndvec=new Vector<String>();
												if(rsa.next()) 
												{
													String frd=rsa.getString("friends");													
													if(!frd.equals("null"))
													{
														frnds=frd.split(",");												
														//System.out.println("array length-----"+frnds.length);
														if(frnds.length!=0)
														{
															for(int v=0;v<frnds.length;v++)
															{													
																frndvec.add(frnds[v]);
															}
														}
													}	
													
												}																								
												//System.out.println("vector friends list-----"+frndvec);
												int i = 1;												
												PreparedStatement pt=conn.prepareStatement("select firstname,url from sosreg");
												//Statement stmt = conn.createStatement();
												//String q = "select firstname,url from sosreg";
												 rsa = pt.executeQuery();
												while (rsa.next()) 
												{											
													String usn = rsa.getString("firstname");
													String imgurl = rsa.getString("url");
													//System.out.println("before if condition username---"+usn);													
													if (usn.equals(session.getAttribute("user")))
													{
													} 
													else 
													{	
														if(!frndvec.contains(usn))
														{
																
																	%>
																	<tr>
																		<td>
																			<img src="<%=imgurl%>" width="30px;" height="30px;">
																		</td>
																		<td>
																			<label id="chathead1"
																				style="color: black; font-size: 13px; font-family: sans-serif;"
																				onclick="callLab('<%=usn%>');"><%=usn%></label>
																		</td>
																		<td>
																			<img src="css/images/offpng.png" width="9px;" height="9px;">
																		</td>
																	</tr>
																	<%
																
															}
															else if(frndvec.isEmpty())
															{
																//System.out.println("else condition username---"+usn);	
																%>
																<tr>
																	<td>
																		<img src="<%=imgurl%>" width="30px;" height="30px;">
																	</td>
																	<td>
																		<label id="chathead1"
																			style="color: black; font-size: 13px; font-family: sans-serif;"
																			onclick="callLab('<%=usn%>');"><%=usn%></label>
																	</td>
																	<td>
																		<img src="css/images/offpng.png" width="9px;" height="9px;">
																	</td>
																</tr>
																<%
																
															}														
														i++;
													}
												}
									%>
								</table>
							</div>
							<form name="fname">
								<input type="hidden" name="request" />
							</form>
						</div>
<%--=============================================advertisement starts=====================================================						--%>
<%--						<%if(hss.getAttribute("ads")!=null) {--%>
<%--							JSONArray jsonArray=(JSONArray)hss.getAttribute("ads");--%>
<%--							if(!jsonArray.isNull(0)){--%>
<%--								JSONObject jsonObject=(JSONObject)jsonArray.get(0);--%>
<%--								String ad=(String)jsonObject.get("ad");--%>
<%--								String image=(String)jsonObject.get("image");--%>
<%--								String link=(String)jsonObject.get("link");--%>
<%--							%>--%>
<%--							<label>Click here to see Advertisements</label>--%>
<%--							<br/>--%>
<%--							<a href="<%=link %>"><img src="<%=image %>"/><br>&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--							--%>
<%--							<%=ad %></a><br/><br/>--%>
<%--							<a href="ads.jsp"><img alt="" src="Images/click.png" style="width: 270px;height: 70px"><br/>to see Advertisements</a>--%>
<%--							<%}--%>
<%--							else{%>--%>
<%--							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--							<img src="Images/sorry.gif" style="height: 200px;width: 150px"/><br/>--%>
<%--							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--							<label style="color: red">No advertisements found</label>--%>
<%--							<%}}%>--%>
					</div>
<%--=============================================advertisement ends=====================================================						--%>

<%--<%--%>
<%--if(ads!=null){--%>
<%--%>	--%>
<%--					--%>
<%--<div style="height: 300;width: 300; margin-left:900px; margin-top: 270;border: 1px solid;overflow: auto;">--%>
<%----%>
<%--<label>Advertisement Available</label>--%>
<%----%>
<%--</div>--%>
<%--<% --%>
<%--}--%>
<%--%>--%>

</div>
			<!-- BODY DIV ENDS -->
		</div>
		<!-- POST DIV -->
		<div id="postdiv"
			class="anon-vote-popup popup anon-vote-popup-4345356"
			style="position: absolute; top: 145px; left: 290px; display: block;">
			<div id="closediv">
				<label id="closelab">
					x
				</label>
			</div>

			<table id="posttable">
				<tr>
					<td>
						Write something...
					</td>
				</tr>
				<tr>
					<td>
						<textarea rows="4" cols="60" id="textareaid"></textarea>
						<img style="height: 50px;width: 50px"  id="blah" alt=""/>
						
					</td>
				</tr>
				<tr>
<%--			-----------------------------------image upload------------------------------------------------%>
					<td style="text-align: right;">
						<table align="right">
							<tr>
							<form action="ImageStatus" method="post" enctype="multipart/form-data">
								<td>
									<div>
									<input type="file" name="file" onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])"/>
									</div>
								</td>
								<td>
									<div>
									<input type="submit" value="upload" onclick="callIM()">
									</div>
								</td>
							</form>
							<script>
							function callIM(){
							var s=document.getElementById('blah').src;
							alert(s)
							}
							</script>
								<td>
									<div id="postdivinside" onclick="statusPost()">
										Post
									</div>
								</td>
								<td>
									<div id="postdivinside" onclick="clearfunc()">
										Clear
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>

		<!-- ---------------------------------------------------upload ends-------------------------->

		<div id="inboxdiv"
			class="anon-vote-popup2 popup2 anon-vote-popup2-4345356"
			style="position: absolute; top: 150px; left: 330px; display: block;">
			<div id="closediv">
				<label id="inboxdivclose">
					x
				</label>
			</div>
			<table id="posttable">

				<%--Friends Request shown--%>
				<%
					Connection co = (Connection) getServletContext().getAttribute(
							"connection");
					DatabaseConnection dataabaseConnection = new DatabaseConnection();
					co = dataabaseConnection.getConnection();
					//System.out.println("coneccton--*4*---"+co);
					Statement stm = co.createStatement();
					String r = "select request,firstname from sosreg where firstname='"
							+ session.getAttribute("user") + "'";
					ResultSet rss = stm.executeQuery(r);
					String req="";
					while (rss.next()) 
					{
						String user = rss.getString("firstname");
						req = rss.getString("request");	
						//System.out.println("my account req ----"+req);	
						if(req.equals("null"))
							{
							%>
							<tr>
								
								<td>
									<label
										style="color: black; font-size: 13px; font-family: sans-serif;">
										No friend Requests
									</label>
								</td>
							</tr>
							<%
							
							}
						String[] User = req.split(",");
						for (int j = 0; j < User.length; j++) 
						{
							String reqquerry="select url from sosreg where firstname='"
								+ User[j] + "'";
							 rss = stm.executeQuery(reqquerry);
							while(rss.next())
							{
								String url = rss.getString("url");
								//System.out.println("friend req url-*********---"+url);							
								if (User[j].equals("null"))
								{
									%>
									<tr>
										<td>
											<img src="<%=url%>" width="30px;" height="30px;">
										</td>
										<td>
											<label style="color: black; font-size: 13px; font-family: sans-serif;">
												No friend Requests
											</label>
										</td>
									</tr>
									<%
								} 
								else {
									%>
									<tr>
										<td>
											<img src="<%=url%>" width="30px;" height="30px;">
										</td>
										<td>
											<label
												style="color: black; font-size: 13px; font-family: sans-serif;"><%=User[j]%></label>
										</td>
										<td>
											<label id="chathead1"
												style="color: black; font-size: 13px; font-family: sans-serif;"
												onclick="callaccept('<%=User[j]%>');">
												Accept
											</label>
										</td>
										<td>
											<label id="chathead1"
												style="color: black; font-size: 13px; font-family: sans-serif;"
												onclick="calldecline();">
												Decline
											</label>
										</td>
									</tr>
									<%
									}
								}
							}
						}
				%>
				<%--End of Friends Request shown--%>
			</table>
			<form name="fname1">
				<input type="hidden" name="msg" />
			</form>
		</div>
		<!-- Inbox Div Ends-->

		<!-- Friends Div -->
		<div id="friendsdiv"
			class="anon-vote-popup3 popup3 anon-vote-popup3-4345356"
			style="position: absolute; top: 150px; left: 450px; display: block;">
			<div id="closediv">
				<label id="frndsidvclose">
					x
				</label>
			</div>
			<table id="posttable">
				<%--Freinds List shown--%>
				<%
					Connection com = (Connection) getServletContext().getAttribute(
							"connection");
					DatabaseConnection databaseConection = new DatabaseConnection();
					com = databaseConection.getConnection();
					Statement stmtt = com.createStatement();
					String que = "select friends from sosreg where firstname='"
							+ session.getAttribute("user") + "'";
					ResultSet result = stmtt.executeQuery(que);
					while (result.next()) 
					{
						String fr = result.getString("friends");					
						String User[] = fr.split(",");
						for (int l = 0; l < User.length; l++) 
						{
							String a = "select * from sosreg where firstname='"
									+ User[l] + "'";
							result = stmtt.executeQuery(a);
							while (result.next())
							{
								String img1 = result.getString("url");
								String names=result.getString("firstname");
								if (fr.equals("null")) 
								{
									%>
									<tr>
										<td>
											<img src="<%=img1%>" width="30px;" height="30px;">
										</td>
										<td>
											<label
												style="color: black; font-size: 13px; font-family: sans-serif;">
												No friends
											</label>
										</td>
									</tr>
									<%
								} 
								else
								{
									%>
									<tr>
										<td>
											<img src="<%=img1%>" width="30px;" height="30px;">
										</td>
										<td>
								<label id="chathead1" style="color: black; font-size: 13px; font-family: sans-serif;"><a href="ViewAbout?uname=<%=names %>" style="color: black;"><%=User[l]%></a></label>
										</td>										
									</tr>
									<%
									}
								}
							}
						}
				%>
				<%--End of Freinds List shown--%>
			</table>
		</div>

	</body>
</html>

