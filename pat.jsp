<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script>
if(!!window.performance && window.performance.navigation.type==2){
window.location.reload(true);
}
var count=0;
function chkdate()
{
var selectedtext=document.getElementById('datepicker').value;
//var selecteddate=new Date(selectedtext);
/* var now=new Date();
var nn=now.getDate()+10;
var pp=selecteddate.getDate();
if(selecteddate.getDate() < now.getDate() && selecteddate.getMonth() <= now.getMonth() )
{
alert("date must be in the future ");
}
if(pp > nn)
{
alert("date must be within 10 days");
}*/
var q = new Date();
var m = q.getMonth();
var d = q.getDate()+10;
var y = q.getFullYear();
var date = new Date(y,m,d);
mydate=new Date(selectedtext);
if(mydate < q)

{
alert("Date Must be select In Future");
count=1;
}
else if(mydate > date)
{
alert("Date Must be select within ten day from current date");
count=1;
}
else (mydate===date)
{
count=2
}
/*else
{
count=2;
}*/
}
function mno()
{
if(count==2)
{
return true;
}
else
{
return false;
}
}
</script>
<style>
ul {
list-style-type: none;
margin: 0;
padding: 0;
overflow: hidden;
background-color:#34C7EF ;
}
li {
float: left;
}
li a {
display: block;
color: white;
text-align: center;
padding: 14px 16px;

text-decoration: none;
}
li a:hover {
background-color: #1497F2;
}
.button {
background-color:#88D3ED;
border: none;
color: white;
padding: 14px 16px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 16px;
margin: 4px 2px;
cursor: pointer;
}
.button2:hover {
background-color: #008CBA;
color: white;
}
</style>
</head>
<body background="bg.jpg">
<%
//out.println("ssss");
request.getSession(false);
if(session!=null)
{
if(session.getAttribute("x")!=null)
{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dentalclinic","root","");
// String query;
String s=session.getAttribute("x").toString(); String s1="select * from patient where password='"+s+"'";
PreparedStatement ps1=con.prepareStatement(s1);
ResultSet rs= ps1.executeQuery();
if(rs.next()){
%>

<ul>
<li><a class="active" href="home.html">Home</a></li>
<li><a href="patientframe.jsp" target="f3">Take Appointment </a></li>
<li><a href="updation.jsp">Update</a></li>
<li><a href="viewapthistory.jsp?a=<%=rs.getInt("Reg_No")%>" target="f3" >View History</a></li>
<li><a href="viewteethlocation.jsp?a=<%=rs.getInt("Reg_No")%>" target="f3">View Teeth location</a></li>
<li><a href="viewtreatmenthistory.jsp?a=<%=rs.getInt("Reg_No")%>" target="f3">View Treatment History </a></li>
<li><a href="logout.jsp" target="_top">Logout</a></li>
</ul>
<%
}
}
else
{
//out.println("disable");
request.getRequestDispatcher("pat_login.html").forward(request, response);
}
}%>
</body>
</html>