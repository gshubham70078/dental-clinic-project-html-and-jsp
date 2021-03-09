<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dentalclinic","root","");
%>
<form action="dotreatment.jsp" >
<center><font color="#14569D" size="4"><u>ALL APPOINTMENT DETAILS</u></font><br><br><table border="2">
<tr>
<td><font color="#14569D" size="4">appointment_id</font></td>
<td><font color="#14569D" size="4">Patient Name</font></td>
<td><font color="#14569D" size="4">Patient Surname</font></td>
<td><font color="#14569D" size="4">phone no</font></td>
<td><font color="#14569D" size="4">Time</font></td>
<td><font color="#14569D" size="4">C/C </font></td>
<td><font color="#14569D" size="4">Patid </font></td>
<td><font color="#14569D" size="4">Status</font></td>
</tr>
<%
PreparedStatement ps=con.prepareStatement("select * from appointment where status='no' ");
// String patid=request.getParameter("");
//ps.setString(1,patid);
ResultSet rs=ps.executeQuery();
while(rs.next())
{%>
<tr><td><font color="#14569D" size="4"><input type="text" value="<%=rs.getString(1)%>" name="aptid" readonly maxlength="8"></font></td>
<td><font color="#14569D" size="4"><input type="text" value="<%=rs.getString(2)%>" name="pat" readonly></font></td>
<td><font color="#14569D" size="4"><input type="text" value="<%=rs.getString(3)%>" readonly></font></td>
<td><font color="#14569D" size="4"><input type="text" value="<%=rs.getString(4)%>" readonly></font></td>
<td><font color="#14569D" size="4"><input type="text" value="<%=rs.getString(5)%>" readonly></font></td>
<td><font color="#14569D" size="4"><input type="text" value="<%=rs.getString(6)%>" readonly></font></td>
<!-- <td><input type="radio" value="yes" name="status">Yes</td>
<td><input type="radio" value="no" name="status" checked>No</td>-->
<td><font color="#14569D" size="4"><input type="text" value="<%=rs.getString(8)%>"></font></td>
<%
String s1=request.getParameter("pat");
Cookie c=new Cookie("x",s1);
response.addCookie(c);
%>
<td><a href="patientdetails.jsp?a=<%=rs.getString(9)%>s=<%=rs.getString(8)%>">View details</a></td>
</tr>
<% }
%>
</table>
</center>
</form>
</body>
</html>