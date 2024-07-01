<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Taxis</title>
</head>
<body bgcolor="#ffffcc">
<font size="+3" color="green"><br>Welcome to Taxi Management System!</font>

<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TMS?characterEncoding=latin1", "root", "tiger");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM taxis");
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<tr><th>Taxi ID</th><th>License Plate</th><th>Model</th><th>Color</th></tr>
<%
    while (rs.next()) {
%>
<tr>
    <td><%=rs.getInt(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(4)%></td>
</tr>
<%
    }
    rs.close();
    st.close();
    con.close();
} catch (Exception ex) {
%>
<font size="+3" color="red"><b>Unable to connect to database.</b></font>
<%
}
%>
</TABLE>
</body>
</html>
