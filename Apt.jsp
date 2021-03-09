Apt.jsp
<%--
Document : apt
Created on : Mar 11, 2017, 12:41:46 PM
Author : nikita
--%>
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
String d=request.getParameter("aa");
out.println(d);
// String d=request.getParameter("aptdate");
//out.println(d);
//Date d1=new Date();
//java.text.SimpleDateFormat sd=new java.text.SimpleDateFormat("yyyy-MM-dd");
// String sdf=sd.format(d);
// out.println(sdf);
//out.println(sdf);
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dentalclinic","root","");
ResultSet rs;

PreparedStatement ps=con.prepareStatement("select * from appointment where Date=?");
// PreparedStatement ps=con.prepareStatement("select * from currenttreatment,appointment where appointment.appointment_id=currenttreatment.aptid and Date=?" );
ps.setString(1,d);
// ps.setString(2,d);
rs=ps.executeQuery();
%><center><font color="#14569D"><h3>All appointment on date</h3></font>
<table border="2">
<tr>
<td>
<font color="#14569D" size="4">APPOINTMENT ID
</font></td>
<TD><font color="#14569D" size="4">PATIENT NAME </font></TD>
<TD><font color="#14569D" size="4">PATIENT SURNAME</font></TD>
<TD><font color="#14569D" size="4">PHONE NO</font></TD>
<TD><font color="#14569D" size="4">TIME</font></TD>
<TD><font color="#14569D" size="4">C/C</font></TD>
<TD><font color="#14569D" size="4">DATE</font></TD>
<TD><font color="#14569D" size="4">STATUS</font></TD>
<TD><font color="#14569D" size="4">PATIENT ID</font></TD>
</tr>
<%
while(rs.next()){
%>
<tr>
<td><% out.println(rs.getString(1));%></td>
<td><% out.println(rs.getString(2));%></td>
<td><% out.println(rs.getString(3));%></td>
<td><% out.println(rs.getString(4));%></td>
<td><% out.println(rs.getString(5));%></td>
<td><% out.println(rs.getString(6));%></td>
<td><% out.println(rs.getString(7));%></td>
<td><% out.println(rs.getString(8));%></td>
<td><% out.println(rs.getString(9));%></td>
<% } %>
</tr>
</table>
</center>
</body>
</html>