<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Taxi</title>
</head>
<body bgcolor="#ffffcc">
<font size="+3" color="green"><br>Welcome to Taxi Management System!</font>
<FORM action="search_taxi.jsp" method="get">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%">
<TR>
<TH width="50%">License Plate:</TH>
<TD width="50%"><INPUT TYPE="text" NAME="license_plate"></TD>
</tr>
<TR>
<TH width="50%">Model:</TH>
<TD width="50%"><INPUT TYPE="text" NAME="model"></TD>
</tr>
<TR>
<TH></TH>
<TD width="50%"><INPUT TYPE="submit" VALUE="Search"></TD>
</tr>
</TABLE>
</FORM>

<%
String licensePlate = request.getParameter("license_plate");
String model = request.getParameter("model");
if (licensePlate != null || model != null) {
    try {
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TMS?characterEncoding=latin1", "root", "tiger");
        String query = "SELECT * FROM taxis WHERE 1=1";
        if (licensePlate != null && !licensePlate.trim().isEmpty()) {
            query += " AND license_plate LIKE '%" + licensePlate + "%'";
        }
        if (model != null && !model.trim().isEmpty()) {
            query += " AND model LIKE '%" + model + "%'";
        }
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
%>
<h2>Search Results</h2>
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
}
%>
</TABLE>
</body>
</html>
