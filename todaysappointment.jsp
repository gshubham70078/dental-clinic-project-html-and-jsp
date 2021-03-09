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
<body>
<% Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dentalclinic","root","");
%><%
PreparedStatement ps=con.prepareStatement("select * from appointment where status='no'and Date=curdate() ");
// String patid=request.getParameter("");

//ps.setString(1,patid);
ResultSet rs=ps.executeQuery();%>
<form action="dotreatment.jsp" >
<center><font color="#14569D" size="4"><u>TODAYS APPOINTMENT DETAILS</u></font><br><br>
<table border="2">
<tr>
<td><font color="#14569D" size="4">appointment_id</td>
<td><font color="#14569D" size="4">Patient Name</td>
<td><font color="#14569D" size="4">Patient Surname</td>
<td><font color="#14569D" size="4">phone no</td>
<td><font color="#14569D" size="4">Time</td>
<td><font color="#14569D" size="4">C/C </td>
<td><font color="#14569D" size="4">Patid </td>
<td><font color="#14569D" size="4">Status </td>
<td><font color="#14569D" size="4">Personal Details</td>
<td><font color="#14569D" size="4">Medical HIstory</td>
<td><font color="#14569D" size="4">Teeth Location</td>
</tr>
<% while(rs.next())
{%>
<tr><td><input type="text" value="<%=rs.getString(1)%>" name="aptid" readonly maxlength="8"></td>
<td><input type="text" value="<%=rs.getString(2)%>" name="pat" readonly></td>
<td><input type="text" value="<%=rs.getString(3)%>" readonly></td>
<td><input type="text" value="<%=rs.getString(4)%>" readonly></td>
<td><input type="text" value="<%=rs.getString(5)%>" readonly></td>
<td><input type="text" value="<%=rs.getString(6)%>" readonly></td>
<!-- <td><input type="radio" value="yes" name="status">Yes</td>
<td><input type="radio" value="no" name="status" checked>No</td>-->
<td><input type="text" value="<%=rs.getString(9)%>"></td>
<td><input type="text" value="<%=rs.getString(8)%>"></td>
<td>
<a href="patientdetails.jsp?a=<%=rs.getString(9)%>s=<%=rs.getString(8)%>"><input type="button" align="right" value="personaldetails" class="button button2" style="float: right;"></a></td>
<td><a href="treatmenthistory.jsp?a=<%=rs.getString(9)%>s=<%=rs.getString(8)%>"><input type="button" value="MedicalHistory" style="float: right;" class="button button2" ></a></td>
<td>
<a href="viewteethlocation.jsp?a=<%=rs.getString(9)%>s=<%=rs.getString(8)%>"><input type="button" value="TeethLocation" style="float: right;" class="button button2" ></a></td><%
String s1=request.getParameter("pat");
Cookie c=new Cookie("x",s1);
response.addCookie(c);
%>
</tr>
<% }
%>
</table></center></form>
</body>
</html>