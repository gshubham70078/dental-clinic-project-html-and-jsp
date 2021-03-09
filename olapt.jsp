<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script>
</script>
</head>
<body>
<%
if(session!=null)
{//out.println(session.getAttribute("x"));
if(session.getAttribute("x")!=null){
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0);
String patname,cn,time,c,date;
patname=request.getParameter("fn");
String patsurname=request.getParameter("ln");
cn=request.getParameter("contact");
time=request.getParameter("time");
c=request.getParameter("cc");
date=request.getParameter("d");
String patid=request.getParameter("Reg_No");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dentalclinic","root","");
// String query="insert into appointment values(?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement("insert into appointment values(?,?,?,?,?,?,?,?,?)");
ResultSet rs=ps.executeQuery("select appointment_id from appointment");
int id=0;
if(rs.last()){
id=rs.getInt("appointment_id")+1;
}
ps.setInt(1,id);
ps.setString(2,patname);
ps.setString(3,patsurname);
ps.setString(4,cn);
ps.setString(5,time);
ps.setString(6,c);
ps.setString(7,date);
ps.setString(8,"no");
ps.setString(9,patid);
out.println("data addes successfully");
ps.execute();
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0);
// out.println("ok");
request.getRequestDispatcher("pat.jsp").include(request, response);
// response.sendRedirect("");
// response.sendRedirect("pat.jsp");
}
else
{
out.println("disable");
request.getRequestDispatcher("pat_login.html").forward(request, response);
}
}
%>
</body>
</html>