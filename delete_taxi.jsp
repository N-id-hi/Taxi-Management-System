<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Taxi</title>
</head>
<body bgcolor="#ffffcc">
<font size="+3" color="green"><br>Welcome to Taxi Management System!</font>
<FORM action="delete_taxi.jsp" method="get">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%" >
<TR>
<TH width="50%">Taxi ID:</TH>
<TD width="50%"><INPUT TYPE="text" NAME="taxi_id"></TD>
</tr>
<TR>
<TH></TH>
<TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
</tr>
</TABLE> 
<%
String taxi_id = request.getParameter("taxi_id");
int i = 0;
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TMS?characterEncoding=latin1", "root", "tiger");
    Statement st = conn.createStatement();
    i = st.executeUpdate("DELETE FROM taxis WHERE taxi_id=" + taxi_id);
    conn.close();
    st.close();
} catch(Exception e) {
    // Handle exception
}
if (i != 0) {
%>
<br>
<TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
<tr><th>Taxi is deleted successfully from database.</th></tr>
</TABLE>
<%
} 
%>        
</FORM>    
</body>
</html>
