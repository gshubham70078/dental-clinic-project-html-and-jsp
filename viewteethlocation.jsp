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
<center><font color="#14569D"><h3>Teeth location details</h3></font>
<table border="2">
<tr>

<td><font color="#14569D" size="4">UL</font></td>
<td><font color="#14569D" size="4" >UR</font></td>
<td><font color="#14569D" size="4">LL</font></td>
<td><font color="#14569D" size="4">LR</font></td>
</tr>
<% try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dentalclinic","root","");
String id=request.getParameter("a");
// out.println(id);
String s1="select * from teethlocation where patient_id=?";
PreparedStatement ps1=con.prepareStatement(s1);
ps1.setString(1,id);
ResultSet rs=ps1.executeQuery();
while(rs.next())
{%>
<tr>
<td><input type="text" value="<%=rs.getString("ul")%>"></td>
<td><input type="text" value="<%=rs.getString("ur")%>"></td>
<td><input type="text" value="<%=rs.getString("ll")%>"></td>
<td><input type="text" value="<%=rs.getString("lr")%>"></td>
</tr>
<% }
// out.println(rs.getString("Time"));
%></table></center>
<% }
catch(Exception e)
{
out.println(e);
}
%>
</body>
</html>