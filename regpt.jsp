<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<%
 Reg_No=request.getParameter("Reg_No");       
String Reg_date=request.getParameter("Reg_date"); 
String t=request.getParameter("title");    
String fn=request.getParameter("pname");
String ln=request.getParameter("plname");
String dob=request.getParameter("dateofbirth");
String ag=request.getParameter("a");
out.println(dob);
out.println(ag);
String gn=request.getParameter("gender");
String b=request.getParameter("bg");
String occupation=request.getParameter("occupation");
String r=request.getParameter("ref");
String ad=request.getParameter("addr");
String c=request.getParameter("city");
String cont=request.getParameter("cn");
String image=request.getParameter("image");
String pm=request.getParameter("pm");
String ph=request.getParameter("pdh");
String mu=request.getParameter("mu");
String drugallergy=request.getParameter("drugallergy");
String un=request.getParameter("uname");
String pw=request.getParameter("pwd");
String anss=request.getParameter("ans");
String uu=request.getParameter("dddd1");
/*String rg=request.getParameter("reg");
String t=request.getParameter("title");
String ag=request.getParameter("a");
String dob=request.getParameter("dateofbirth");
String gn=request.getParameter("gender");
String ad=request.getParameter("addr");
String c=request.getParameter("city");
String r=request.getParameter("ref");
String cont=request.getParameter("cn");
out.println(dob);
out.println(ag);
String pm=request.getParameter("pm");
String ph=request.getParameter("pdh");
String mu=request.getParameter("mu");
String un=request.getParameter("uname");
String pw=request.getParameter("pwd");
/// String cp=request.getParameter("cpwd");
String uu=request.getParameter("dddd1");
String sqq=request.getParameter("sqq");
String anss=request.getParameter("ans");*/
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dentalclinic","root","");
PreparedStatement ps=con.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");


//out.println(id);
// PreparedStatement ps=con.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setInt(1,Reg_No);
ps.setString(2,Reg_date);
ps.setString(3,t);
ps.setString(4,fn);
ps.setString(5,ln);
ps.setString(6,dob);
ps.setString(7,ag);
ps.setString(8,gn);
ps.setString(9,b);
ps.setString(10,occupation);
ps.setString(11,r);
ps.setString(12,ad);
ps.setString(13,c);
ps.setString(14,cont);
ps.setString(15,image);
ps.setString(16,pm);
ps.setString(17,ph);
ps.setString(18,mu);
ps.setString(19,drugallergy);
ps.setString(20,un);
ps.setString(21,pw);
ps.setString(22,anss);
/*ps.setString(5,t);
ps.setString(6,dob);
ps.setString(7,ag);
ps.setString(8,gn);
ps.setString(9,b);
ps.setString(10,ad);
ps.setString(11,c);
ps.setString(12,r);
ps.setString(13,cont);
ps.setString(14,uu);
ps.setString(15,pm);
ps.setString(16,ph);
ps.setString(17,mu);
ps.setString(18,un);
ps.setString(19,pw);
ps.setString(20,sqq);
ps.setString(21,anss);*/
ps.executeUpdate();
ps.close();
String un1=request.getParameter("uname");
PreparedStatement ps1=con.prepareStatement("insert into login values(?,?,?,?)");
ps1.setString(1,un1);
ps1.setString(2,pw);
ps1.setString(3,"patient");
ps1.setString(4,"pat.jsp");
//ps1.setString(5,uu);
ps1.executeUpdate();
ps1.close();
out.println(" Your added successfully.....");
%>
</body>
</html>