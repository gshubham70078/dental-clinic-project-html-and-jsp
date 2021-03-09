
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
// PreparedStatement ps=con.prepareStatement("select * from appointment where Date=?");
PreparedStatement ps=con.prepareStatement("select * from currenttreatment,appointment where appointment.appointment_id=currenttreatment.aptid and Date=?" );
ps.setString(1,d);
// ps.setString(2,d);
rs=ps.executeQuery();
%>
<center><font color="#14569D"><h3>Current treatment with appointment</h3></font>
<table border="2">
<tr>
<td><font color="#14569D" size="4">TREATDATE</font></td>
<td><font color="#14569D" size="4">APTID</font></td>
<td><font color="#14569D" size="4">CATEGORY</font></td>
<td><font color="#14569D" size="4">DIAGNOSIS</font></td>
<td><font color="#14569D" size="4">TREATMENT</font></td>
<td><font color="#14569D" size="4">TREATCOST</font></td>
<td><font color="#14569D" size="4">PATID</font></td>
<td><font color="#14569D" size="4">PATIENTNAME</font></td>
<td><font color="#14569D" size="4">PATIENTSURNAME</font></td>
<td><font color="#14569D" size="4">PHONE NO</font></td>
<td><font color="#14569D" size="4">TIME</font></td>
<td><font color="#14569D" size="4">CC</font></td>
<td><font color="#14569D" size="4">DATE</font></td>
<td><font color="#14569D" size="4">STATUS</font></td>
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
<td><% out.println(rs.getString(6)); %></td>
<td><% out.println(rs.getString(7));%></td>
<td><%out.println(rs.getString(9));%></td>
<td><% out.println(rs.getString(10));%></td>
<td><% out.println(rs.getString(11)); %></td>
<td><% out.println(rs.getString(12));%></td>
<td><% out.println(rs.getString(13));%></td>
<td><% out.println(rs.getString(14));%></td>
<td><% out.println(rs.getString(15));%></td>
<% } %>
</tr>
</table>
</body>
</html>