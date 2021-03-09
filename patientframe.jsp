<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script>
var count=0; function chkdate()
{
var selectedtext=document.getElementById('datepicker').value;
//var selecteddate=new Date(selectedtext);
/* var now=new Date(); var nn=now.getDate()+10;

var pp=selecteddate.getDate();

if(selecteddate.getDate() < now.getDate() && selecteddate.getMonth() <= now.getMonth() )

{
alert("date must be in the future ");
}
if(pp > nn)
{
alert("date must be within 10 days");
}*/

var q = new Date(); var m = q.getMonth(); var d = q.getDate()+10; var y = q.getFullYear();

var date = new Date(y,m,d); mydate=new Date(selectedtext);
 if(mydate < q)
{
alert("Date Must be select In Future"); count=1;
}
else if(mydate > date)
{
alert("Date Must be select within ten day from current date"); count=1;
}
else (mydate===date)
{
count=2
}
/*else
{
count=2;
}*/
}
function mno()
{
if(count==2)
{
return true;
}
else
{
return false;
}
}
</script>
<style>
ul {
list-style-type: none; margin: 0;
padding: 0; overflow: hidden;
background-color:#34C7EF	;
}

li {
float: left;
}

li a {
display: block; color: white;
text-align: center; padding: 14px 16px; text-decoration: none;
 }

li a:hover {
background-color: #1497F2;
}


.button {
background-color:#88D3ED; border: none;
color: white; padding: 14px 16px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px;
cursor: pointer;
}
.button2:hover {
background-color: #008CBA; color: white;
}
</style>
</head>
<body background="bg.jpg">

<font color="#14569D" size="5"> Dental Appointment</font>
<hr>
<br><br>
<form action="olapt.jsp" onsubmit="return mno()">

<table>


<tr><td><font color="#14569D">Patient Id:</font></td><td><input type="text" name="Reg_No" ></td></tr>

<tr><td><font color="#14569D">Patient Name</td><td><input type="text" name="fn" ></td>

<td><font color="#14569D">Patient Surname:</font></td><td><input type="text" name="ln" ></td></tr>

<tr><td><font color="#14569D">Current Phone no:</font></td><td><input type="text" name="contact"  readonly></td></tr>



<tr>
<td><font color="#14569D">Time:</font></td>
<td><select name="time">
<option>Morning</option>
<option>Afternoon</option>
<option>Evening</option>
</select>
</tr>

<tr>
<td><font color="#14569D">Chief Complaint:</font></td>
<td><select name="cc">
<option> Dental Cleaning</option>
<option>Dental Checkup</option>
<option>Tooth Pain</option>
<option>Gum Problem</option>
</select>
</tr>
<tr>
<td><font color="#14569D">Date:</font></td>
 
<td><input type="date" id="datepicker" name="d" onmouseout="chkdate()" required><div id="d2"></div>
</td>

</tr>
</table><br><br>
<table>
<tr><td><input type="submit" class="button button2"></td>
<td><input type="reset" class="button button2"></tr>
</table>
<br>
</form>



</body>
</html>



