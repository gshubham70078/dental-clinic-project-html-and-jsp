<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dentalclinic","root","");
ResultSet rs;
String p=request.getParameter("pat");
// out.println(p);
%>
<center><table border="2"><font color="#14569D" size="4">Personal details</font>
<tr><td><font color="#14569D" size="4">name </font></td>
<td><font color="#14569D" size="4">Last Name</font></td>
<td><font color="#14569D" size="4">Age</font></td>
<td><font color="#14569D" size="4">Blood group </font></td>
<td><font color="#14569D" size="4">Past Medial History</font></td>
<td><font color="#14569D" size="4">Past Dental History</font></td>
<td><font color="#14569D" size="4">Medication used</font></td>
</tr>
<% String s=request.getParameter("a");
String r=request.getParameter("b");
//out.println(r);
PreparedStatement ps=con.prepareStatement("select * from patient where Reg_No=?");
ps.setString(1,s);
rs=ps.executeQuery();
while(rs.next())
{%>
<tr>
<td><input type="text" value="<%=rs.getString(3)%>"></td>
<td><input type="text" value="<%=rs.getString(4)%>"></td>
<td><input type="text" value="<%=rs.getString(7)%>"></td>
<td><input type="text" value="<%=rs.getString(9)%>"></td>
<td><input type="text" value="<%=rs.getString(15)%>"></td>
<td><input type="text" value="<%=rs.getString(16)%>"></td>
<td><input type="text" value="<%=rs.getString(17)%>"></td>
</table></center>
<% }
ps.close();
%>
</body>
</html>