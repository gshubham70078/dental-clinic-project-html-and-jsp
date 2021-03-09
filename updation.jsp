<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<style>
.button {
background-color:#88D3ED;
border: none;
color: white;
padding: 10px 40px;
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
request.getSession(false);
if(session!=null)
{
if(session.getAttribute("x")!=null){
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dentalclinic","root","");
// String query;
String s=session.getAttribute("x").toString();
// out.println("hello "+s);
String s1="select * from patient where password='"+s+"'";
PreparedStatement ps1=con.prepareStatement(s1);
ResultSet rs= ps1.executeQuery();
if(rs.next())
{
%>
<font color="#14569D" size="5">Update Profile</font>
<hr>
<form action="update.jsp">
<table>
<tr><td><font color="#14569D">Patient Name:</font></td><td><input type="text" name="fn" value="<%=rs.getString("fn")%>"></td></tr>
<tr><td><font color="#14569D">Age:</font></td><td><input type="text" name="age" value="<%=rs.getInt("age")%>"></td></tr>
<tr><td><font color="#14569D">Blood Group:</font></td><td><input type="text" name="bloodgroup" value="<%=rs.getString("bloodgroup")%>"></td></tr>
<tr><td><font color="#14569D">City:</font></td><td><input type="text" name="city" value="<%=rs.getString("city")%>"></td></tr>
<tr><td><font color="#14569D">Address:</font></td><td><input type="text" name="address" value="<%=rs.getString("address")%>"></td></tr>
<tr><td><font color="#14569D">Past Dental history:</font></td><td><input type="text" name="pastdental" value="<%=rs.getString("pastdental")%>"></td></tr>
<tr><td><font color="#14569D">Past medical history:</font></td><td><input type="text" name="pastmedical" value="<%=rs.getString("pastmedical")%>"></td></tr>
<tr><td><font color="#14569D">Medication used:</font></td><td><input type="text" name="medicationused" value="<%=rs.getString("medicationused")%>"></td></tr>
<tr><td><font color="#14569D">Username:</font></td><td><input type="text" name="username" value="<%=rs.getString("username")%>"></td></tr>
<tr><td><font color="#14569D">Password:</font></td><td><input type="password" name="password" value="<%=rs.getString("password")%>"></td></tr>
<tr><td><input type="submit" class="button button2"></td><td><input type="reset" class="button button2"></td></tr>
</table>
</form>
<%} }else
{
//out.println("disable");
//request.getRequestDispatcher("pat_login.html").forward(request, response);
}
} %>
</body>
</html>
