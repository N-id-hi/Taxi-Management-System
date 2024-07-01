<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Taxi</title>
</head>
<body bgcolor="#ffffcc">
<font size="+3" color="green"><br>Welcome to Taxi Management System!</font>
<FORM action="insert_taxi.jsp" method="get">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%" >
<TR>
<TH width="50%">License Plate:</TH>
<TD width="50%"><INPUT TYPE="text" NAME="license_plate"></TD>
</tr>
<TR>
<TH width="50%">Model</TH>
<TD width="50%"><INPUT TYPE="text" NAME="model"></TD>
</tr>
<tr>
<TH width="50%">Color</TH>
<TD width="50%"><INPUT TYPE="text" NAME="color"></TD>
</tr>
<TR>
<TH></TH>
<TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
</tr>
</TABLE>
<%
int uq = 0;
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TMS?characterEncoding=latin1", "root", "tiger");
    PreparedStatement pstatement = con.prepareStatement("INSERT INTO taxis (license_plate, model, color) VALUES (?, ?, ?)");
    pstatement.setString(1, request.getParameter("license_plate"));
    pstatement.setString(2, request.getParameter("model"));
    pstatement.setString(3, request.getParameter("color"));
    uq = pstatement.executeUpdate();
    pstatement.close();
    con.close();
} catch(Exception ex) {
    // Handle exception
}
if (uq != 0) {
%>
<br>
<TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
<tr><th>Taxi is inserted successfully in database.</th></tr>
</table>
<%
} 
%> 
</form> 
</body>
</html>
