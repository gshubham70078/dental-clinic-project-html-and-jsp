<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<center><font color="#14569D" size="4">Treatment History</font><table border="2" >
<tr>
<td><font color="#14569D" size="4">Treatment Date</font></td>
<td><font color="#14569D" size="4">Appointment ID</font></td>
<td><font color="#14569D" size="4">category</font></td>
<td><font color="#14569D" size="4">diagnosis</font></td>
<td><font color="#14569D" size="4">treatment</font></td>
<td><font color="#14569D" size="4">Treatment Cost</font></td>
<td><font color="#14569D" size="4">Patient Id</font></td>
</tr>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dentalclinic","root","");
ResultSet rs;
String s=request.getParameter("a");
PreparedStatement ps1=con.prepareStatement("select * from currenttreatment where patid=?");
ps1.setString(1,s);
rs=ps1.executeQuery();
while(rs.next())
{ %>
<tr><td><input type="text" value="<%=rs.getString(1)%>"></td>
<td><input type="text" value="<%=rs.getString(2)%>"></td>
<td><input type="text" value="<%=rs.getString(3)%>"></td>
<td><input type="text" value="<%=rs.getString(4)%>"></td>
<td><input type="text" value="<%=rs.getString(5)%>"></td>
<td><input type="text" value="<%=rs.getString(6)%>"></td>
<td><input type="text" value="<%=rs.getString(7)%>"></td>
</tr>
<% } %>
</table></center>
</body>
</html>
